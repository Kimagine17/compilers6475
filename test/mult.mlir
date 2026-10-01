// Exhaustively exercises multiplication over the sign classes handled by ExtAnalysis.
module {
  llvm.func @mult_cases(%unknown: i32) {
    %neg = llvm.mlir.constant(-2 : i32) : i32
    %zero = llvm.mlir.constant(0 : i32) : i32
    %one = llvm.mlir.constant(1 : i32) : i32
    %pos = llvm.mlir.constant(2 : i32) : i32
    %nonpos = llvm.add %neg, %one : i32
    %nonneg = llvm.sub %zero, %nonpos : i32

    // Rows: neg, zero, one, pos, nonneg, nonpos, unknown.
    %mul_neg_neg = llvm.mul %neg, %neg : i32
    %mul_neg_zero = llvm.mul %neg, %zero : i32
    %mul_neg_one = llvm.mul %neg, %one : i32
    %mul_neg_pos = llvm.mul %neg, %pos : i32
    %mul_neg_nonneg = llvm.mul %neg, %nonneg : i32
    %mul_neg_nonpos = llvm.mul %neg, %nonpos : i32
    %mul_neg_unknown = llvm.mul %neg, %unknown : i32

    %mul_zero_neg = llvm.mul %zero, %neg : i32
    %mul_zero_zero = llvm.mul %zero, %zero : i32
    %mul_zero_one = llvm.mul %zero, %one : i32
    %mul_zero_pos = llvm.mul %zero, %pos : i32
    %mul_zero_nonneg = llvm.mul %zero, %nonneg : i32
    %mul_zero_nonpos = llvm.mul %zero, %nonpos : i32
    %mul_zero_unknown = llvm.mul %zero, %unknown : i32

    %mul_one_neg = llvm.mul %one, %neg : i32
    %mul_one_zero = llvm.mul %one, %zero : i32
    %mul_one_one = llvm.mul %one, %one : i32
    %mul_one_pos = llvm.mul %one, %pos : i32
    %mul_one_nonneg = llvm.mul %one, %nonneg : i32
    %mul_one_nonpos = llvm.mul %one, %nonpos : i32
    %mul_one_unknown = llvm.mul %one, %unknown : i32

    %mul_pos_neg = llvm.mul %pos, %neg : i32
    %mul_pos_zero = llvm.mul %pos, %zero : i32
    %mul_pos_one = llvm.mul %pos, %one : i32
    %mul_pos_pos = llvm.mul %pos, %pos : i32
    %mul_pos_nonneg = llvm.mul %pos, %nonneg : i32
    %mul_pos_nonpos = llvm.mul %pos, %nonpos : i32
    %mul_pos_unknown = llvm.mul %pos, %unknown : i32

    %mul_nonneg_neg = llvm.mul %nonneg, %neg : i32
    %mul_nonneg_zero = llvm.mul %nonneg, %zero : i32
    %mul_nonneg_one = llvm.mul %nonneg, %one : i32
    %mul_nonneg_pos = llvm.mul %nonneg, %pos : i32
    %mul_nonneg_nonneg = llvm.mul %nonneg, %nonneg : i32
    %mul_nonneg_nonpos = llvm.mul %nonneg, %nonpos : i32
    %mul_nonneg_unknown = llvm.mul %nonneg, %unknown : i32

    %mul_nonpos_neg = llvm.mul %nonpos, %neg : i32
    %mul_nonpos_zero = llvm.mul %nonpos, %zero : i32
    %mul_nonpos_one = llvm.mul %nonpos, %one : i32
    %mul_nonpos_pos = llvm.mul %nonpos, %pos : i32
    %mul_nonpos_nonneg = llvm.mul %nonpos, %nonneg : i32
    %mul_nonpos_nonpos = llvm.mul %nonpos, %nonpos : i32
    %mul_nonpos_unknown = llvm.mul %nonpos, %unknown : i32

    %mul_unknown_neg = llvm.mul %unknown, %neg : i32
    %mul_unknown_zero = llvm.mul %unknown, %zero : i32
    %mul_unknown_one = llvm.mul %unknown, %one : i32
    %mul_unknown_pos = llvm.mul %unknown, %pos : i32
    %mul_unknown_nonneg = llvm.mul %unknown, %nonneg : i32
    %mul_unknown_nonpos = llvm.mul %unknown, %nonpos : i32
    %mul_unknown_unknown = llvm.mul %unknown, %unknown : i32

    llvm.return
  }
}
