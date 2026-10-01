// Exhaustively exercises addition over the sign classes handled by ExtAnalysis.
module {
  llvm.func @add_cases(%unknown: i32) {
    %neg = llvm.mlir.constant(-2 : i32) : i32
    %zero = llvm.mlir.constant(0 : i32) : i32
    %one = llvm.mlir.constant(1 : i32) : i32
    %pos = llvm.mlir.constant(2 : i32) : i32
    %nonpos = llvm.add %neg, %one : i32
    %nonneg = llvm.sub %zero, %nonpos : i32

    // Rows: neg, zero, one, pos, nonneg, nonpos, unknown.
    %add_neg_neg = llvm.add %neg, %neg : i32
    %add_neg_zero = llvm.add %neg, %zero : i32
    %add_neg_one = llvm.add %neg, %one : i32
    %add_neg_pos = llvm.add %neg, %pos : i32
    %add_neg_nonneg = llvm.add %neg, %nonneg : i32
    %add_neg_nonpos = llvm.add %neg, %nonpos : i32
    %add_neg_unknown = llvm.add %neg, %unknown : i32

    %add_zero_neg = llvm.add %zero, %neg : i32
    %add_zero_zero = llvm.add %zero, %zero : i32
    %add_zero_one = llvm.add %zero, %one : i32
    %add_zero_pos = llvm.add %zero, %pos : i32
    %add_zero_nonneg = llvm.add %zero, %nonneg : i32
    %add_zero_nonpos = llvm.add %zero, %nonpos : i32
    %add_zero_unknown = llvm.add %zero, %unknown : i32

    %add_one_neg = llvm.add %one, %neg : i32
    %add_one_zero = llvm.add %one, %zero : i32
    %add_one_one = llvm.add %one, %one : i32
    %add_one_pos = llvm.add %one, %pos : i32
    %add_one_nonneg = llvm.add %one, %nonneg : i32
    %add_one_nonpos = llvm.add %one, %nonpos : i32
    %add_one_unknown = llvm.add %one, %unknown : i32

    %add_pos_neg = llvm.add %pos, %neg : i32
    %add_pos_zero = llvm.add %pos, %zero : i32
    %add_pos_one = llvm.add %pos, %one : i32
    %add_pos_pos = llvm.add %pos, %pos : i32
    %add_pos_nonneg = llvm.add %pos, %nonneg : i32
    %add_pos_nonpos = llvm.add %pos, %nonpos : i32
    %add_pos_unknown = llvm.add %pos, %unknown : i32

    %add_nonneg_neg = llvm.add %nonneg, %neg : i32
    %add_nonneg_zero = llvm.add %nonneg, %zero : i32
    %add_nonneg_one = llvm.add %nonneg, %one : i32
    %add_nonneg_pos = llvm.add %nonneg, %pos : i32
    %add_nonneg_nonneg = llvm.add %nonneg, %nonneg : i32
    %add_nonneg_nonpos = llvm.add %nonneg, %nonpos : i32
    %add_nonneg_unknown = llvm.add %nonneg, %unknown : i32

    %add_nonpos_neg = llvm.add %nonpos, %neg : i32
    %add_nonpos_zero = llvm.add %nonpos, %zero : i32
    %add_nonpos_one = llvm.add %nonpos, %one : i32
    %add_nonpos_pos = llvm.add %nonpos, %pos : i32
    %add_nonpos_nonneg = llvm.add %nonpos, %nonneg : i32
    %add_nonpos_nonpos = llvm.add %nonpos, %nonpos : i32
    %add_nonpos_unknown = llvm.add %nonpos, %unknown : i32

    %add_unknown_neg = llvm.add %unknown, %neg : i32
    %add_unknown_zero = llvm.add %unknown, %zero : i32
    %add_unknown_one = llvm.add %unknown, %one : i32
    %add_unknown_pos = llvm.add %unknown, %pos : i32
    %add_unknown_nonneg = llvm.add %unknown, %nonneg : i32
    %add_unknown_nonpos = llvm.add %unknown, %nonpos : i32
    %add_unknown_unknown = llvm.add %unknown, %unknown : i32

    llvm.return
  }
}
