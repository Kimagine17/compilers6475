//===- ExtAnalysis.cpp - Transfer functions ------------------------------===//
//
// The transfer function: given what is known about an operation's operands,
// state what is known about its results.  This file and ExtDomain.h are the
// two to replace when building a different analysis; the rest of the project
// is scaffolding.
//
// There are deliberately only two rules here, one of each kind an analysis
// needs: one that introduces facts out of nothing (constants), and one that
// propagates facts it was given (`and`).  Everything else is unknown.  Adding
// a third rule should be a matter of adding a third `if`.
//
//===----------------------------------------------------------------------===//

#include "ExtAnalysis.h"

#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/IR/Matchers.h"

using namespace mlir;

namespace ext {

void ExtAnalysis::setToEntryState(ExtLattice *lattice) {
  propagateIfChanged(lattice, lattice->join(ZeroState::top()));
}

LogicalResult
ExtAnalysis::visitOperation(Operation *op,
                             ArrayRef<const ExtLattice *> operands,
                             ArrayRef<ExtLattice *> results) {
  // Raising a result to top says "this operation could produce anything",
  // which is always a sound answer and is what every unhandled case does.
  auto unknown = [&] {
    setAllToEntryStates(results);
    return success();
  };

  // Only single-result integer operations are interesting here.  Calls, loads,
  // floats, and vectors all land in `unknown`.
  if (op->getNumResults() != 1 || !op->getResult(0).getType().isIntOrIndex())
    return unknown();
  ExtLattice *result = results[0];

  // Rule 1: a constant is negative, zero or one according to what it says.
  // This is the only rule that does not consult its operands, and without some
  // rule of this kind the analysis would have no facts to propagate at all.
  IntegerAttr value;
  if (matchPattern(op, m_Constant(&value))) {
    APInt intValue = value.getValue();
    Kind k;
    if (intValue.isNegative())
      k = Kind::Neg;
    else if (intValue.isZero())
      k = Kind::Zero;
    else if (intValue.isOne())
      k = Kind::One;
    else
      k = Kind::Pos;
    ExtState constant(k);
    if (auto intType = dyn_cast<IntegerType>(op->getResult(0).getType());
        intType && intType.getWidth() == 1 && intValue.getBitWidth() == 1) {
      constant.boolKind =
          intValue.isZero() ? BoolKind::False : BoolKind::True;
    }
    propagateIfChanged(result, result->join(constant));
    return success();
    // ExtState state = value.getValue().isZero() ? Kind::Zero : Kind::NonZero;
    // propagateIfChanged(result, result->join(state));
    // return success();
  }

  // Signed greater-than uses integer signs as input facts and produces a
  // separate boolean fact. The i1 integer component records false as zero and
  // true as negative, matching signed interpretation of LLVM i1 values.
  if (auto cmp = dyn_cast<LLVM::ICmpOp>(op)) {
    if (cmp.getPredicate() != LLVM::ICmpPredicate::sgt)
      return unknown();

    ExtState lhs = operands[0]->getValue();
    ExtState rhs = operands[1]->getValue();
    if (lhs.isBottom() || rhs.isBottom())
      return success();

    bool known = true;
    bool isTrue = false;
    switch (lhs.kind) {
    case Kind::Neg:
      if (rhs.kind == Kind::Zero || rhs.kind == Kind::One ||
          rhs.kind == Kind::Pos || rhs.kind == Kind::NonNeg) {
        isTrue = false;
      } else {
        known = false;
      }
      break;
    case Kind::Zero:
      if (rhs.kind == Kind::Neg) {
        isTrue = true;
      } else if (rhs.kind == Kind::Zero || rhs.kind == Kind::One ||
                 rhs.kind == Kind::Pos || rhs.kind == Kind::NonNeg) {
        isTrue = false;
      } else {
        known = false;
      }
      break;
    case Kind::One:
      if (rhs.kind == Kind::Neg || rhs.kind == Kind::Zero ||
          rhs.kind == Kind::NonPos) {
        isTrue = true;
      } else if (rhs.kind == Kind::One || rhs.kind == Kind::Pos) {
        isTrue = false;
      } else {
        known = false;
      }
      break;
    case Kind::Pos:
      if (rhs.kind == Kind::Neg || rhs.kind == Kind::Zero ||
          rhs.kind == Kind::NonPos) {
        isTrue = true;
      } else {
        known = false;
      }
      break;
    case Kind::NonNeg:
      if (rhs.kind == Kind::Neg) {
        isTrue = true;
      } else {
        known = false;
      }
      break;
    case Kind::NonPos:
      if (rhs.kind == Kind::Zero || rhs.kind == Kind::One ||
          rhs.kind == Kind::Pos || rhs.kind == Kind::NonNeg) {
        isTrue = false;
      } else {
        known = false;
      }
      break;
    case Kind::Bottom:
    case Kind::Top:
      known = false;
      break;
    }

    if (!known) {
      propagateIfChanged(result, result->join(ExtState::top()));
      return success();
    }

    ExtState comparison(isTrue ? Kind::Neg : Kind::Zero,
                        isTrue ? BoolKind::True : BoolKind::False);
    propagateIfChanged(result, result->join(comparison));
    return success();
  }

  // Rule 2: `x + y` 
    if (isa<LLVM::AddOp>(op)) {
      ExtState lhs = operands[0]->getValue();
      ExtState rhs = operands[1]->getValue();

      // Bottom means the solver has not yet proved anything reaches this
      // operand.  Leaving the result alone keeps the analysis optimistic; the
      // solver will call back here once the operand moves up the lattice.
      if (lhs.isBottom() || rhs.isBottom())
        return success();

      if (lhs.kind == Kind::Top || rhs.kind == Kind::Top) {
        propagateIfChanged(result, result->join(ExtState(Kind::Top)));
        return success();
      }
      if (lhs.kind == Kind::Neg) {
        if (rhs.kind == Kind::Neg || rhs.kind == Kind::Zero ||
            rhs.kind == Kind::NonPos) {
          propagateIfChanged(result, result->join(ExtState(Kind::Neg)));
          return success();
        }
        if (rhs.kind == Kind::One) { // added: matches One + Neg
          propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
          return success();
        }
        if (rhs.kind == Kind::Pos || rhs.kind == Kind::NonNeg) {
          propagateIfChanged(result, result->join(ExtState(Kind::Top)));
          return success();
        }
      }
      if (lhs.kind == Kind::Zero) {
        if (rhs.kind == Kind::Neg) {
          propagateIfChanged(result, result->join(ExtState(Kind::Neg)));
          return success();
        }
        if (rhs.kind == Kind::Zero) {
          propagateIfChanged(result, result->join(ExtState(Kind::Zero)));
          return success();
        }
        if (rhs.kind == Kind::One) { // added: matches One + Zero
          propagateIfChanged(result, result->join(ExtState(Kind::One)));
          return success();
        }
        if (rhs.kind == Kind::Pos) {
          propagateIfChanged(result, result->join(ExtState(Kind::Pos)));
          return success();
        }
        if (rhs.kind == Kind::NonNeg) {
          propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
          return success();
        }
        if (rhs.kind == Kind::NonPos) {
          propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
          return success();
        }
      }
      if (lhs.kind == Kind::One) {
        if (rhs.kind == Kind::Neg) {
          propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
          return success();
        }
        if (rhs.kind == Kind::Zero) {
          propagateIfChanged(result, result->join(ExtState(Kind::One)));
          return success();
        }
        if (rhs.kind == Kind::One || rhs.kind == Kind::Pos ||
            rhs.kind == Kind::NonNeg) {
          propagateIfChanged(result, result->join(ExtState(Kind::Pos)));
          return success();
        }
        if (rhs.kind == Kind::NonPos) {
          propagateIfChanged(result, result->join(ExtState(Kind::Top)));
          return success();
        }
      }
      if (lhs.kind == Kind::Pos) {
        if (rhs.kind == Kind::Neg || rhs.kind == Kind::NonPos) {
          propagateIfChanged(result, result->join(ExtState(Kind::Top)));
          return success();
        }
        if (rhs.kind == Kind::Zero || rhs.kind == Kind::One ||
            rhs.kind == Kind::Pos || rhs.kind == Kind::NonNeg) {
          propagateIfChanged(result, result->join(ExtState(Kind::Pos)));
          return success();
        }
      }
      if (lhs.kind == Kind::NonNeg) {
        if (rhs.kind == Kind::Neg || rhs.kind == Kind::NonPos) {
          propagateIfChanged(result, result->join(ExtState(Kind::Top)));
          return success();
        }
        if (rhs.kind == Kind::Zero || rhs.kind == Kind::NonNeg) {
          propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
          return success();
        }
        if (rhs.kind == Kind::One || rhs.kind == Kind::Pos) {
          propagateIfChanged(result, result->join(ExtState(Kind::Pos)));
          return success();
        }
      }
      if (lhs.kind == Kind::NonPos) {
        if (rhs.kind == Kind::Neg) { // fixed: was an empty block
          propagateIfChanged(result, result->join(ExtState(Kind::Neg)));
          return success();
        }
        if (rhs.kind == Kind::Zero || rhs.kind == Kind::NonPos) {
          propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
          return success();
        }
        if (rhs.kind == Kind::One || rhs.kind == Kind::Pos ||
            rhs.kind == Kind::NonNeg) {
          // fixed: this was NonNeg, which is unsound: -5 + 2 = -3
          propagateIfChanged(result, result->join(ExtState(Kind::Top)));
          return success();
        }
      }
    }

    // Rule 3: `x - y`.  Same layout as `add`, but for subtraction
  if (isa<LLVM::SubOp>(op)) {
    ExtState lhs = operands[0]->getValue();
    ExtState rhs = operands[1]->getValue();

    if (lhs.isBottom() || rhs.isBottom())
      return success();

    if (lhs.kind == Kind::Top || rhs.kind == Kind::Top) {
      propagateIfChanged(result, result->join(ExtState(Kind::Top)));
      return success();
    }
    if (lhs.kind == Kind::Neg) {
      if (rhs.kind == Kind::Zero || rhs.kind == Kind::One ||
          rhs.kind == Kind::Pos || rhs.kind == Kind::NonNeg) {
        propagateIfChanged(result, result->join(ExtState(Kind::Neg)));
        return success();
      }
      if (rhs.kind == Kind::Neg || rhs.kind == Kind::NonPos) {
        propagateIfChanged(result, result->join(ExtState(Kind::Top)));
        return success();
      }
    }
    if (lhs.kind == Kind::Zero) {
      if (rhs.kind == Kind::Neg) {
        propagateIfChanged(result, result->join(ExtState(Kind::Pos)));
        return success();
      }
      if (rhs.kind == Kind::Zero) {
        propagateIfChanged(result, result->join(ExtState(Kind::Zero)));
        return success();
      }
      if (rhs.kind == Kind::One || rhs.kind == Kind::Pos) {
        propagateIfChanged(result, result->join(ExtState(Kind::Neg)));
        return success();
      }
      if (rhs.kind == Kind::NonNeg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
      if (rhs.kind == Kind::NonPos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
    }
    if (lhs.kind == Kind::One) {
      if (rhs.kind == Kind::Neg || rhs.kind == Kind::NonPos) {
        propagateIfChanged(result, result->join(ExtState(Kind::Pos)));
        return success();
      }
      if (rhs.kind == Kind::Zero) {
        propagateIfChanged(result, result->join(ExtState(Kind::One)));
        return success();
      }
      if (rhs.kind == Kind::One) {
        propagateIfChanged(result, result->join(ExtState(Kind::Zero)));
        return success();
      }
      if (rhs.kind == Kind::Pos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
      if (rhs.kind == Kind::NonNeg) {
        propagateIfChanged(result, result->join(ExtState(Kind::Top)));
        return success();
      }
    }
    if (lhs.kind == Kind::Pos) {
      if (rhs.kind == Kind::Neg || rhs.kind == Kind::Zero ||
          rhs.kind == Kind::NonPos) {
        propagateIfChanged(result, result->join(ExtState(Kind::Pos)));
        return success();
      }
      if (rhs.kind == Kind::One) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
      if (rhs.kind == Kind::Pos || rhs.kind == Kind::NonNeg) {
        propagateIfChanged(result, result->join(ExtState(Kind::Top)));
        return success();
      }
    }
    if (lhs.kind == Kind::NonNeg) {
      if (rhs.kind == Kind::Neg) {
        propagateIfChanged(result, result->join(ExtState(Kind::Pos)));
        return success();
      }
      if (rhs.kind == Kind::Zero || rhs.kind == Kind::NonPos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
      if (rhs.kind == Kind::One || rhs.kind == Kind::Pos ||
          rhs.kind == Kind::NonNeg) {
        propagateIfChanged(result, result->join(ExtState(Kind::Top)));
        return success();
      }
    }
    if (lhs.kind == Kind::NonPos) {
      if (rhs.kind == Kind::Zero || rhs.kind == Kind::NonNeg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
      if (rhs.kind == Kind::One || rhs.kind == Kind::Pos) {
        propagateIfChanged(result, result->join(ExtState(Kind::Neg)));
        return success();
      }
      if (rhs.kind == Kind::Neg || rhs.kind == Kind::NonPos) {
        propagateIfChanged(result, result->join(ExtState(Kind::Top)));
        return success();
      }
    }
  }
  // Rule 4: `x * y`.  Multiplication preserves the sign when both
  // operands are strictly positive/negative, and zero dominates when
  // one operand is known to be zero.
  if (isa<LLVM::MulOp>(op)) {
    ExtState lhs = operands[0]->getValue();
    ExtState rhs = operands[1]->getValue();

    if (lhs.isBottom() || rhs.isBottom())
      return success();

    if (lhs.kind == Kind::Top || rhs.kind == Kind::Top) {
      propagateIfChanged(result, result->join(ExtState(Kind::Top)));
      return success();
    }

    if (lhs.kind == Kind::Neg) {
      if (rhs.kind == Kind::Neg) {
        propagateIfChanged(result, result->join(ExtState(Kind::Pos)));
        return success();
      }
      if (rhs.kind == Kind::Zero) {
        propagateIfChanged(result, result->join(ExtState(Kind::Zero)));
        return success();
      }
      if (rhs.kind == Kind::One || rhs.kind == Kind::Pos) {
        propagateIfChanged(result, result->join(ExtState(Kind::Neg)));
        return success();
      }
      if (rhs.kind == Kind::NonNeg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
      if (rhs.kind == Kind::NonPos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
    }

    if (lhs.kind == Kind::Zero) {
      propagateIfChanged(result, result->join(ExtState(Kind::Zero)));
      return success();
    }

    if (lhs.kind == Kind::One) {
      if (rhs.kind == Kind::Neg) {
        propagateIfChanged(result, result->join(ExtState(Kind::Neg)));
        return success();
      }
      if (rhs.kind == Kind::Zero) {
        propagateIfChanged(result, result->join(ExtState(Kind::Zero)));
        return success();
      }
      if (rhs.kind == Kind::One || rhs.kind == Kind::Pos) {
        propagateIfChanged(result, result->join(ExtState(Kind::Pos)));
        return success();
      }
      if (rhs.kind == Kind::NonNeg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
      if (rhs.kind == Kind::NonPos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
    }

    if (lhs.kind == Kind::Pos) {
      if (rhs.kind == Kind::Neg) {
        propagateIfChanged(result, result->join(ExtState(Kind::Neg)));
        return success();
      }
      if (rhs.kind == Kind::Zero) {
        propagateIfChanged(result, result->join(ExtState(Kind::Zero)));
        return success();
      }
      if (rhs.kind == Kind::One || rhs.kind == Kind::Pos) {
        propagateIfChanged(result, result->join(ExtState(Kind::Pos)));
        return success();
      }
      if (rhs.kind == Kind::NonNeg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
      if (rhs.kind == Kind::NonPos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
    }

    if (lhs.kind == Kind::NonNeg) {
      if (rhs.kind == Kind::Neg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
      if (rhs.kind == Kind::Zero) {
        propagateIfChanged(result, result->join(ExtState(Kind::Zero)));
        return success();
      }
      if (rhs.kind == Kind::One || rhs.kind == Kind::Pos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
      if (rhs.kind == Kind::NonNeg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
      if (rhs.kind == Kind::NonPos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
    }

    if (lhs.kind == Kind::NonPos) {
      if (rhs.kind == Kind::Neg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
      if (rhs.kind == Kind::Zero) {
        propagateIfChanged(result, result->join(ExtState(Kind::Zero)));
        return success();
      }
      if (rhs.kind == Kind::One || rhs.kind == Kind::Pos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
      if (rhs.kind == Kind::NonNeg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
      if (rhs.kind == Kind::NonPos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
    }
  }

  // Rule 5: `x / y`.  Division is sign-preserving like multiplication,
  // but integer division can truncate a nonzero result to zero.  Division
  // by zero is represented conservatively as Top.
  if (isa<LLVM::SDivOp>(op)) {
    ExtState lhs = operands[0]->getValue();
    ExtState rhs = operands[1]->getValue();

    if (lhs.isBottom() || rhs.isBottom())
      return success();

    if (lhs.kind == Kind::Top || rhs.kind == Kind::Top) {
      propagateIfChanged(result, result->join(ExtState(Kind::Top)));
      return success();
    }

    // A zero denominator makes the operation potentially undefined.
    if (rhs.kind == Kind::Zero || rhs.kind == Kind::NonNeg ||
        rhs.kind == Kind::NonPos) {
      propagateIfChanged(result, result->join(ExtState(Kind::Top)));
      return success();
    }

    if (lhs.kind == Kind::Zero) {
      propagateIfChanged(result, result->join(ExtState(Kind::Zero)));
      return success();
    }

    if (lhs.kind == Kind::Neg) {
      if (rhs.kind == Kind::Neg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
      if (rhs.kind == Kind::One) {
        propagateIfChanged(result, result->join(ExtState(Kind::Neg)));
        return success();
      }
      if (rhs.kind == Kind::Pos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
    }

    if (lhs.kind == Kind::One) {
      if (rhs.kind == Kind::Neg) {
        propagateIfChanged(result, result->join(ExtState(Kind::Neg)));
        return success();
      }
      if (rhs.kind == Kind::One) {
        propagateIfChanged(result, result->join(ExtState(Kind::One)));
        return success();
      }
      if (rhs.kind == Kind::Pos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
    }

    if (lhs.kind == Kind::Pos) {
      if (rhs.kind == Kind::Neg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
      if (rhs.kind == Kind::One) {
        propagateIfChanged(result, result->join(ExtState(Kind::Pos)));
        return success();
      }
      if (rhs.kind == Kind::Pos) {
        // Integer division may truncate to zero: e.g. 1 / 2 = 0.
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
    }

    if (lhs.kind == Kind::NonNeg) {
      if (rhs.kind == Kind::Neg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
      if (rhs.kind == Kind::One) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
      if (rhs.kind == Kind::Pos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
    }

    if (lhs.kind == Kind::NonPos) {
      if (rhs.kind == Kind::Neg) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonNeg)));
        return success();
      }
      if (rhs.kind == Kind::One) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
      if (rhs.kind == Kind::Pos) {
        propagateIfChanged(result, result->join(ExtState(Kind::NonPos)));
        return success();
      }
    }
  }
  return unknown();
}

} // namespace ext
