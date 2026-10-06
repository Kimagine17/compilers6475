target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

define i32 @sqlite3_db_status64() {
  br label %1

1:                                                ; preds = %1, %0
  %.010 = phi i32 [ 0, %0 ], [ 1, %1 ]
  br label %1
}
