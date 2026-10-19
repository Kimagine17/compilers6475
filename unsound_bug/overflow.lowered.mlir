module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i128 = dense<128> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.mangling_mode" = "e", "dlti.legal_int_widths" = array<i32: 8, 16, 32, 64>, "dlti.stack_alignment" = 128 : i64>, llvm.module_asm = [], llvm.target_triple = "x86_64-redhat-linux-gnu"} {
  llvm.func @abort()
  llvm.func @puts(!llvm.ptr)
  llvm.mlir.global private constant @assert_msg(dense<[101, 120, 116, 45, 97, 110, 97, 108, 121, 115, 105, 115, 32, 101, 120, 112, 101, 99, 116, 101, 100, 32, 112, 111, 115, 105, 116, 105, 118, 101, 32, 118, 97, 108, 117, 101, 32, 97, 116, 32, 108, 111, 99, 40, 34, 114, 101, 100, 117, 99, 116, 105, 111, 110, 115, 47, 114, 101, 100, 117, 99, 101, 100, 51, 46, 109, 108, 105, 114, 34, 58, 52, 58, 49, 48, 41, 0]> : tensor<77xi8>) {addr_space = 0 : i32} : !llvm.array<77 x i8>
  llvm.func @sqlite3_db_status64() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.add %0, %0 : i32
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.icmp "slt" %1, %2 : i32
    llvm.cond_br %3, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.return %1 : i32
  ^bb2:  // pred: ^bb0
    %4 = llvm.mlir.addressof @assert_msg : !llvm.ptr
    %5 = llvm.getelementptr %4[0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<77 x i8>
    llvm.call @puts(%5) : (!llvm.ptr) -> ()
    llvm.call @abort() : () -> ()
    llvm.unreachable
  }
}

