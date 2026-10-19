//===- Plugin.cpp - Pass definition and plugin entry point ----------------===//
//
// Scaffolding: wires the analysis into a pass and exposes it to mlir-opt.
//
//===----------------------------------------------------------------------===//

#include "Annotate.h"
#include "ExtAnalysis.h"
#include "ZeroAnalysis.h"

#include "mlir/Analysis/DataFlow/ConstantPropagationAnalysis.h"
#include "mlir/Analysis/DataFlow/DeadCodeAnalysis.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/IR/AsmState.h"
#include "mlir/IR/BuiltinOps.h"
#include "llvm/ADT/SmallVector.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Pass/PassRegistry.h"
#include "mlir/Tools/Plugins/PassPlugin.h"
#include "llvm/Config/llvm-config.h"
#include "llvm/Support/Compiler.h"
#include "llvm/Support/raw_ostream.h"

using namespace mlir;

namespace {

struct ZeroAnalysisPass
    : PassWrapper<ZeroAnalysisPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(ZeroAnalysisPass)

  StringRef getArgument() const final { return "zero-analysis"; }

  StringRef getDescription() const final {
    return "Determine which integer values are known zero or known nonzero";
  }

  void runOnOperation() override {
    DataFlowConfig config;
    config.setInterprocedural(false);

    DataFlowSolver solver(config);
    // DeadCodeAnalysis supplies reachability, without which the solver must
    // assume every branch is taken; SparseConstantPropagation resolves branch
    // conditions for it.  Both are prerequisites, not extras.
    solver.load<dataflow::DeadCodeAnalysis>();
    solver.load<dataflow::SparseConstantPropagation>();
    solver.load<zero::ZeroAnalysis>();

    if (failed(solver.initializeAndRun(getOperation()))) {
      getOperation().emitError("zero analysis failed to reach a fixed point");
      return signalPassFailure();
    }

    // Query states only now that the solver has converged.
    auto describe = [&](Value value, AsmState &asmState) -> std::string {
      const auto *lattice = solver.lookupState<zero::ZeroLattice>(value);
      if (!lattice)
        return {};
      zero::Kind kind = lattice->getValue().kind;
      // Top and bottom say nothing; printing them would bury the real facts.
      if (kind == zero::Kind::Top || kind == zero::Kind::Bottom)
        return {};
      std::string description;
      llvm::raw_string_ostream os(description);
      value.printAsOperand(os, asmState);
      os << " is " << zero::name(kind);
      return description;
    };

    // stderr, so that mlir-opt's stdout stays the unmodified IR and the two can
    // be redirected independently.
    zero::printAnnotated(getOperation(), describe, llvm::errs());

    // This pass only reads.
    markAllAnalysesPreserved();
  }
};

struct ExtAnalysisPass
    : PassWrapper<ExtAnalysisPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(ExtAnalysisPass)

  StringRef getArgument() const final { return "ext-analysis"; }

  StringRef getDescription() const final {
    return "Determine the extended sign of integer values";
  }

  void getDependentDialects(DialectRegistry &registry) const override {
    registry.insert<cf::ControlFlowDialect>();
  }

  void add_asserts(ArrayRef<std::pair<Value, Operation *>> values,
                   LLVM::ICmpPredicate predicate, int64_t expected,
                   StringRef message) {
    for (auto [value, definingOp] : values) {
      OpBuilder builder(definingOp);
      builder.setInsertionPointAfter(definingOp);
      Location loc = definingOp->getLoc();
      Value expectedValue =
          LLVM::ConstantOp::create(builder, loc, value.getType(), expected);
      Value condition =
          LLVM::ICmpOp::create(builder, loc, predicate, value, expectedValue);

      std::string location;
      llvm::raw_string_ostream locationStream(location);
      loc.print(locationStream);
      locationStream.flush();
      cf::AssertOp::create(builder, loc, condition,
                           (message + " " + location).str());
    }
  }

  void runOnOperation() override {
    DataFlowConfig config;
    config.setInterprocedural(false);

    DataFlowSolver solver(config);
    solver.load<dataflow::DeadCodeAnalysis>();
    solver.load<dataflow::SparseConstantPropagation>();
    solver.load<ext::ExtAnalysis>();

    if (failed(solver.initializeAndRun(getOperation()))) {
      getOperation().emitError(
          "extended sign analysis failed to reach a fixed point");
      return signalPassFailure();
    }

    auto describe = [&](Value value, AsmState &asmState) -> std::string {
      const auto *lattice = solver.lookupState<ext::ExtLattice>(value);
      if (!lattice)
        return {};
      const ext::ExtState &state = lattice->getValue();
      const char *fact = nullptr;
      if (state.boolKind == ext::BoolKind::False ||
          state.boolKind == ext::BoolKind::True) {
        fact = ext::name(state.boolKind);
      } else if (state.kind != ext::Kind::Top &&
                 state.kind != ext::Kind::Bottom) {
        fact = ext::name(state.kind);
      }
      if (!fact)
        return {};
      std::string description;
      llvm::raw_string_ostream os(description);
      value.printAsOperand(os, asmState);
      os << " is " << fact;
      return description;
    };

    zero::printAnnotated(getOperation(), describe, llvm::errs());

    SmallVector<std::pair<Value, Operation *>> zeroValues;
    SmallVector<std::pair<Value, Operation *>> oneValues;
    SmallVector<std::pair<Value, Operation *>> positiveValues;
    SmallVector<std::pair<Value, Operation *>> negativeValues;
    SmallVector<std::pair<Value, Operation *>> nonnegValues;
    SmallVector<std::pair<Value, Operation *>> nonposValues;
    getOperation().walk([&](Operation *op) {
      if (!op->getParentOfType<LLVM::LLVMFuncOp>())
        return;
      //TODO KIM OPTIONAL: get mlir to make mini functions to test static values that are invalid
      for (Value result : op->getResults()) {
        const auto *lattice = solver.lookupState<ext::ExtLattice>(result);
        auto intType = dyn_cast<IntegerType>(result.getType());
        if (lattice) {
          auto kind = lattice->getValue().kind;
          if (kind == ext::Kind::Zero && intType && intType.getWidth() > 1) {
            zeroValues.emplace_back(result, op);
          }
          if (kind == ext::Kind::One && intType && intType.getWidth() > 1) {
            oneValues.emplace_back(result, op);
          }
          if (kind == ext::Kind::Pos && intType && intType.getWidth() > 1) {
            positiveValues.emplace_back(result, op);
          }
          if (kind == ext::Kind::Neg && intType && intType.getWidth() > 1) {
            negativeValues.emplace_back(result, op);
          }
          if (kind == ext::Kind::NonPos && intType && intType.getWidth() > 1) {
            nonposValues.emplace_back(result, op);
          }
          if (kind == ext::Kind::NonNeg && intType && intType.getWidth() > 1) {
            nonnegValues.emplace_back(result, op);
          }
        }
      }
    });

    add_asserts(zeroValues, LLVM::ICmpPredicate::eq, 0,
                "ext-analysis expected zero at");
    add_asserts(oneValues, LLVM::ICmpPredicate::eq, 1,
                "ext-analysis expected one at");
    add_asserts(positiveValues, LLVM::ICmpPredicate::sgt, 0,
                "ext-analysis expected positive value at");
    add_asserts(negativeValues, LLVM::ICmpPredicate::slt, 0,
                "ext-analysis expected negative value at");
    add_asserts(nonnegValues, LLVM::ICmpPredicate::sge, 0,
                "ext-analysis expected nonnegative value at");
    add_asserts(nonposValues, LLVM::ICmpPredicate::sle, 0,
                "ext-analysis expected nonpositive value at");
  }
};

} // namespace

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo mlirGetPassPluginInfo() {
  // LLVM_VERSION_STRING is baked in at compile time and checked by mlir-opt at
  // load time, which is what turns an ABI mismatch into a clear diagnostic.
  return {MLIR_PLUGIN_API_VERSION, "ZeroAnalysis", LLVM_VERSION_STRING,
          []() {
            PassRegistration<ZeroAnalysisPass>();
            PassRegistration<ExtAnalysisPass>();
          }};
}
