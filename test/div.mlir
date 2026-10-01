// Exhaustively exercises signed division over the sign classes handled by ExtAnalysis.
module {
  llvm.func @div_cases(%unknown: i32) {
    %neg = llvm.mlir.constant(-2 : i32) : i32
    %zero = llvm.mlir.constant(0 : i32) : i32
    %one = llvm.mlir.constant(1 : i32) : i32
    %pos = llvm.mlir.constant(2 : i32) : i32
    %nonpos = llvm.add %neg, %one : i32
    %nonneg = llvm.sub %zero, %nonpos : i32

    // Rows: neg, zero, one, pos, nonneg, nonpos, unknown.
    %div_neg_neg = llvm.sdiv %neg, %neg : i32
    %div_neg_zero = llvm.sdiv %neg, %zero : i32
    %div_neg_one = llvm.sdiv %neg, %one : i32
    %div_neg_pos = llvm.sdiv %neg, %pos : i32
    %div_neg_nonneg = llvm.sdiv %neg, %nonneg : i32
    %div_neg_nonpos = llvm.sdiv %neg, %nonpos : i32
    %div_neg_unknown = llvm.sdiv %neg, %unknown : i32

    %div_zero_neg = llvm.sdiv %zero, %neg : i32
    %div_zero_zero = llvm.sdiv %zero, %zero : i32
    %div_zero_one = llvm.sdiv %zero, %one : i32
    %div_zero_pos = llvm.sdiv %zero, %pos : i32
    %div_zero_nonneg = llvm.sdiv %zero, %nonneg : i32
    %div_zero_nonpos = llvm.sdiv %zero, %nonpos : i32
    %div_zero_unknown = llvm.sdiv %zero, %unknown : i32

    %div_one_neg = llvm.sdiv %one, %neg : i32
    %div_one_zero = llvm.sdiv %one, %zero : i32
    %div_one_one = llvm.sdiv %one, %one : i32
    %div_one_pos = llvm.sdiv %one, %pos : i32
    %div_one_nonneg = llvm.sdiv %one, %nonneg : i32
    %div_one_nonpos = llvm.sdiv %one, %nonpos : i32
    %div_one_unknown = llvm.sdiv %one, %unknown : i32

    %div_pos_neg = llvm.sdiv %pos, %neg : i32
    %div_pos_zero = llvm.sdiv %pos, %zero : i32
    %div_pos_one = llvm.sdiv %pos, %one : i32
    %div_pos_pos = llvm.sdiv %pos, %pos : i32
    %div_pos_nonneg = llvm.sdiv %pos, %nonneg : i32
    %div_pos_nonpos = llvm.sdiv %pos, %nonpos : i32
    %div_pos_unknown = llvm.sdiv %pos, %unknown : i32

    %div_nonneg_neg = llvm.sdiv %nonneg, %neg : i32
    %div_nonneg_zero = llvm.sdiv %nonneg, %zero : i32
    %div_nonneg_one = llvm.sdiv %nonneg, %one : i32
    %div_nonneg_pos = llvm.sdiv %nonneg, %pos : i32
    %div_nonneg_nonneg = llvm.sdiv %nonneg, %nonneg : i32
    %div_nonneg_nonpos = llvm.sdiv %nonneg, %nonpos : i32
    %div_nonneg_unknown = llvm.sdiv %nonneg, %unknown : i32

    %div_nonpos_neg = llvm.sdiv %nonpos, %neg : i32
    %div_nonpos_zero = llvm.sdiv %nonpos, %zero : i32
    %div_nonpos_one = llvm.sdiv %nonpos, %one : i32
    %div_nonpos_pos = llvm.sdiv %nonpos, %pos : i32
    %div_nonpos_nonneg = llvm.sdiv %nonpos, %nonneg : i32
    %div_nonpos_nonpos = llvm.sdiv %nonpos, %nonpos : i32
    %div_nonpos_unknown = llvm.sdiv %nonpos, %unknown : i32

    %div_unknown_neg = llvm.sdiv %unknown, %neg : i32
    %div_unknown_zero = llvm.sdiv %unknown, %zero : i32
    %div_unknown_one = llvm.sdiv %unknown, %one : i32
    %div_unknown_pos = llvm.sdiv %unknown, %pos : i32
    %div_unknown_nonneg = llvm.sdiv %unknown, %nonneg : i32
    %div_unknown_nonpos = llvm.sdiv %unknown, %nonpos : i32
    %div_unknown_unknown = llvm.sdiv %unknown, %unknown : i32

    llvm.return
  }
}
