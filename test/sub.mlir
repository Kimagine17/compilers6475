// Exhaustively exercises subtraction over the sign classes handled by ExtAnalysis.
module {
  llvm.func @sub_cases(%unknown: i32) {
    %neg = llvm.mlir.constant(-2 : i32) : i32
    %zero = llvm.mlir.constant(0 : i32) : i32
    %one = llvm.mlir.constant(1 : i32) : i32
    %pos = llvm.mlir.constant(2 : i32) : i32
    %nonpos = llvm.add %neg, %one : i32
    %nonneg = llvm.sub %zero, %nonpos : i32

    // Rows: neg, zero, one, pos, nonneg, nonpos, unknown.
    %sub_neg_neg = llvm.sub %neg, %neg : i32
    %sub_neg_zero = llvm.sub %neg, %zero : i32
    %sub_neg_one = llvm.sub %neg, %one : i32
    %sub_neg_pos = llvm.sub %neg, %pos : i32
    %sub_neg_nonneg = llvm.sub %neg, %nonneg : i32
    %sub_neg_nonpos = llvm.sub %neg, %nonpos : i32
    %sub_neg_unknown = llvm.sub %neg, %unknown : i32

    %sub_zero_neg = llvm.sub %zero, %neg : i32
    %sub_zero_zero = llvm.sub %zero, %zero : i32
    %sub_zero_one = llvm.sub %zero, %one : i32
    %sub_zero_pos = llvm.sub %zero, %pos : i32
    %sub_zero_nonneg = llvm.sub %zero, %nonneg : i32
    %sub_zero_nonpos = llvm.sub %zero, %nonpos : i32
    %sub_zero_unknown = llvm.sub %zero, %unknown : i32

    %sub_one_neg = llvm.sub %one, %neg : i32
    %sub_one_zero = llvm.sub %one, %zero : i32
    %sub_one_one = llvm.sub %one, %one : i32
    %sub_one_pos = llvm.sub %one, %pos : i32
    %sub_one_nonneg = llvm.sub %one, %nonneg : i32
    %sub_one_nonpos = llvm.sub %one, %nonpos : i32
    %sub_one_unknown = llvm.sub %one, %unknown : i32

    %sub_pos_neg = llvm.sub %pos, %neg : i32
    %sub_pos_zero = llvm.sub %pos, %zero : i32
    %sub_pos_one = llvm.sub %pos, %one : i32
    %sub_pos_pos = llvm.sub %pos, %pos : i32
    %sub_pos_nonneg = llvm.sub %pos, %nonneg : i32
    %sub_pos_nonpos = llvm.sub %pos, %nonpos : i32
    %sub_pos_unknown = llvm.sub %pos, %unknown : i32

    %sub_nonneg_neg = llvm.sub %nonneg, %neg : i32
    %sub_nonneg_zero = llvm.sub %nonneg, %zero : i32
    %sub_nonneg_one = llvm.sub %nonneg, %one : i32
    %sub_nonneg_pos = llvm.sub %nonneg, %pos : i32
    %sub_nonneg_nonneg = llvm.sub %nonneg, %nonneg : i32
    %sub_nonneg_nonpos = llvm.sub %nonneg, %nonpos : i32
    %sub_nonneg_unknown = llvm.sub %nonneg, %unknown : i32

    %sub_nonpos_neg = llvm.sub %nonpos, %neg : i32
    %sub_nonpos_zero = llvm.sub %nonpos, %zero : i32
    %sub_nonpos_one = llvm.sub %nonpos, %one : i32
    %sub_nonpos_pos = llvm.sub %nonpos, %pos : i32
    %sub_nonpos_nonneg = llvm.sub %nonpos, %nonneg : i32
    %sub_nonpos_nonpos = llvm.sub %nonpos, %nonpos : i32
    %sub_nonpos_unknown = llvm.sub %nonpos, %unknown : i32

    %sub_unknown_neg = llvm.sub %unknown, %neg : i32
    %sub_unknown_zero = llvm.sub %unknown, %zero : i32
    %sub_unknown_one = llvm.sub %unknown, %one : i32
    %sub_unknown_pos = llvm.sub %unknown, %pos : i32
    %sub_unknown_nonneg = llvm.sub %unknown, %nonneg : i32
    %sub_unknown_nonpos = llvm.sub %unknown, %nonpos : i32
    %sub_unknown_unknown = llvm.sub %unknown, %unknown : i32

    llvm.return
  }
}
