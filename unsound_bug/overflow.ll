; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-n8:16:32:64-S128-p270:32:32:32:32-p271:32:32:32:32-p272:64:64:64:64-i64:64-i128:128-f80:128-p0:64:64:64:64-i1:8-i8:8-i16:16-i32:32-f16:16-f64:64-f128:128"
target triple = "x86_64-redhat-linux-gnu"

@assert_msg = private constant [77 x i8] c"ext-analysis expected positive value at loc(\22reductions/reduced3.mlir\22:4:10)\00"

declare void @abort()

declare void @puts(ptr)

define i32 @sqlite3_db_status64() {
  br i1 false, label %1, label %2

1:                                                ; preds = %0
  ret i32 2

2:                                                ; preds = %0
  call void @puts(ptr @assert_msg)
  call void @abort()
  unreachable
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
