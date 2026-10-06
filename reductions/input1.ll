; ModuleID = 'kilo.ll'
source_filename = "inputkilo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

%struct.editorConfig = type { i32, i32, i32, i32, i32, i32, i32, i32, ptr, i32, ptr, [80 x i8], i64, ptr }
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%struct.winsize = type { i16, i16, i16, i16 }
%struct.erow = type { i32, i32, i32, ptr, ptr, ptr, i32 }
%struct.editorSyntax = type { ptr, ptr, [2 x i8], [3 x i8], [3 x i8], i32 }
%struct.__va_list_tag = type { i32, i32, ptr, ptr }
%struct.abuf = type { ptr, i32 }

@.str = private unnamed_addr constant [3 x i8] c".c\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c".h\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c".cpp\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c".hpp\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c".cc\00", align 1
@C_HL_extensions = dso_local global [6 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4, ptr null], align 16
@.str.5 = private unnamed_addr constant [5 x i8] c"auto\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"break\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"case\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"continue\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"default\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"do\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"enum\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"extern\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"for\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"goto\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@.str.17 = private unnamed_addr constant [9 x i8] c"register\00", align 1
@.str.18 = private unnamed_addr constant [7 x i8] c"return\00", align 1
@.str.19 = private unnamed_addr constant [7 x i8] c"sizeof\00", align 1
@.str.20 = private unnamed_addr constant [7 x i8] c"static\00", align 1
@.str.21 = private unnamed_addr constant [7 x i8] c"struct\00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c"switch\00", align 1
@.str.23 = private unnamed_addr constant [8 x i8] c"typedef\00", align 1
@.str.24 = private unnamed_addr constant [6 x i8] c"union\00", align 1
@.str.25 = private unnamed_addr constant [9 x i8] c"volatile\00", align 1
@.str.26 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@.str.27 = private unnamed_addr constant [5 x i8] c"NULL\00", align 1
@.str.28 = private unnamed_addr constant [8 x i8] c"alignas\00", align 1
@.str.29 = private unnamed_addr constant [8 x i8] c"alignof\00", align 1
@.str.30 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@.str.31 = private unnamed_addr constant [7 x i8] c"and_eq\00", align 1
@.str.32 = private unnamed_addr constant [4 x i8] c"asm\00", align 1
@.str.33 = private unnamed_addr constant [7 x i8] c"bitand\00", align 1
@.str.34 = private unnamed_addr constant [6 x i8] c"bitor\00", align 1
@.str.35 = private unnamed_addr constant [6 x i8] c"class\00", align 1
@.str.36 = private unnamed_addr constant [6 x i8] c"compl\00", align 1
@.str.37 = private unnamed_addr constant [10 x i8] c"constexpr\00", align 1
@.str.38 = private unnamed_addr constant [11 x i8] c"const_cast\00", align 1
@.str.39 = private unnamed_addr constant [8 x i8] c"deltype\00", align 1
@.str.40 = private unnamed_addr constant [7 x i8] c"delete\00", align 1
@.str.41 = private unnamed_addr constant [13 x i8] c"dynamic_cast\00", align 1
@.str.42 = private unnamed_addr constant [9 x i8] c"explicit\00", align 1
@.str.43 = private unnamed_addr constant [7 x i8] c"export\00", align 1
@.str.44 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@.str.45 = private unnamed_addr constant [7 x i8] c"friend\00", align 1
@.str.46 = private unnamed_addr constant [7 x i8] c"inline\00", align 1
@.str.47 = private unnamed_addr constant [8 x i8] c"mutable\00", align 1
@.str.48 = private unnamed_addr constant [10 x i8] c"namespace\00", align 1
@.str.49 = private unnamed_addr constant [4 x i8] c"new\00", align 1
@.str.50 = private unnamed_addr constant [9 x i8] c"noexcept\00", align 1
@.str.51 = private unnamed_addr constant [4 x i8] c"not\00", align 1
@.str.52 = private unnamed_addr constant [7 x i8] c"not_eq\00", align 1
@.str.53 = private unnamed_addr constant [8 x i8] c"nullptr\00", align 1
@.str.54 = private unnamed_addr constant [9 x i8] c"operator\00", align 1
@.str.55 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@.str.56 = private unnamed_addr constant [6 x i8] c"or_eq\00", align 1
@.str.57 = private unnamed_addr constant [8 x i8] c"private\00", align 1
@.str.58 = private unnamed_addr constant [10 x i8] c"protected\00", align 1
@.str.59 = private unnamed_addr constant [7 x i8] c"public\00", align 1
@.str.60 = private unnamed_addr constant [17 x i8] c"reinterpret_cast\00", align 1
@.str.61 = private unnamed_addr constant [14 x i8] c"static_assert\00", align 1
@.str.62 = private unnamed_addr constant [12 x i8] c"static_cast\00", align 1
@.str.63 = private unnamed_addr constant [9 x i8] c"template\00", align 1
@.str.64 = private unnamed_addr constant [5 x i8] c"this\00", align 1
@.str.65 = private unnamed_addr constant [13 x i8] c"thread_local\00", align 1
@.str.66 = private unnamed_addr constant [6 x i8] c"throw\00", align 1
@.str.67 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.68 = private unnamed_addr constant [4 x i8] c"try\00", align 1
@.str.69 = private unnamed_addr constant [7 x i8] c"typeid\00", align 1
@.str.70 = private unnamed_addr constant [9 x i8] c"typename\00", align 1
@.str.71 = private unnamed_addr constant [8 x i8] c"virtual\00", align 1
@.str.72 = private unnamed_addr constant [4 x i8] c"xor\00", align 1
@.str.73 = private unnamed_addr constant [7 x i8] c"xor_eq\00", align 1
@.str.74 = private unnamed_addr constant [5 x i8] c"int|\00", align 1
@.str.75 = private unnamed_addr constant [6 x i8] c"long|\00", align 1
@.str.76 = private unnamed_addr constant [8 x i8] c"double|\00", align 1
@.str.77 = private unnamed_addr constant [7 x i8] c"float|\00", align 1
@.str.78 = private unnamed_addr constant [6 x i8] c"char|\00", align 1
@.str.79 = private unnamed_addr constant [10 x i8] c"unsigned|\00", align 1
@.str.80 = private unnamed_addr constant [8 x i8] c"signed|\00", align 1
@.str.81 = private unnamed_addr constant [6 x i8] c"void|\00", align 1
@.str.82 = private unnamed_addr constant [7 x i8] c"short|\00", align 1
@.str.83 = private unnamed_addr constant [6 x i8] c"auto|\00", align 1
@.str.84 = private unnamed_addr constant [7 x i8] c"const|\00", align 1
@.str.85 = private unnamed_addr constant [6 x i8] c"bool|\00", align 1
@C_HL_keywords = dso_local global [82 x ptr] [ptr @.str.5, ptr @.str.6, ptr @.str.7, ptr @.str.8, ptr @.str.9, ptr @.str.10, ptr @.str.11, ptr @.str.12, ptr @.str.13, ptr @.str.14, ptr @.str.15, ptr @.str.16, ptr @.str.17, ptr @.str.18, ptr @.str.19, ptr @.str.20, ptr @.str.21, ptr @.str.22, ptr @.str.23, ptr @.str.24, ptr @.str.25, ptr @.str.26, ptr @.str.27, ptr @.str.28, ptr @.str.29, ptr @.str.30, ptr @.str.31, ptr @.str.32, ptr @.str.33, ptr @.str.34, ptr @.str.35, ptr @.str.36, ptr @.str.37, ptr @.str.38, ptr @.str.39, ptr @.str.40, ptr @.str.41, ptr @.str.42, ptr @.str.43, ptr @.str.44, ptr @.str.45, ptr @.str.46, ptr @.str.47, ptr @.str.48, ptr @.str.49, ptr @.str.50, ptr @.str.51, ptr @.str.52, ptr @.str.53, ptr @.str.54, ptr @.str.55, ptr @.str.56, ptr @.str.57, ptr @.str.58, ptr @.str.59, ptr @.str.60, ptr @.str.61, ptr @.str.62, ptr @.str.63, ptr @.str.64, ptr @.str.65, ptr @.str.66, ptr @.str.67, ptr @.str.68, ptr @.str.69, ptr @.str.70, ptr @.str.71, ptr @.str.72, ptr @.str.73, ptr @.str.74, ptr @.str.75, ptr @.str.76, ptr @.str.77, ptr @.str.78, ptr @.str.79, ptr @.str.80, ptr @.str.81, ptr @.str.82, ptr @.str.83, ptr @.str.84, ptr @.str.85, ptr null], align 16
@HLDB = dso_local global [1 x { ptr, ptr, [2 x i8], [3 x i8], [3 x i8], i32, [4 x i8] }] [{ ptr, ptr, [2 x i8], [3 x i8], [3 x i8], i32, [4 x i8] } { ptr @C_HL_extensions, ptr @C_HL_keywords, [2 x i8] c"//", [3 x i8] c"/*\00", [3 x i8] c"*/\00", i32 3, [4 x i8] zeroinitializer }], align 16
@E = internal global %struct.editorConfig zeroinitializer, align 8
@orig_termios = internal global %struct.termios zeroinitializer, align 4
@.str.86 = private unnamed_addr constant [5 x i8] c"\1B[6n\00", align 1
@.str.87 = private unnamed_addr constant [6 x i8] c"%d;%d\00", align 1
@.str.88 = private unnamed_addr constant [13 x i8] c"\1B[999C\1B[999B\00", align 1
@.str.89 = private unnamed_addr constant [9 x i8] c"\1B[%d;%dH\00", align 1
@.str.90 = private unnamed_addr constant [15 x i8] c",.()+-/*=~%[];\00", align 1
@.str.91 = private unnamed_addr constant [51 x i8] c"Some line of the edited file is too long for kilo\0A\00", align 1
@.str.92 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.93 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.94 = private unnamed_addr constant [13 x i8] c"Opening file\00", align 1
@.str.95 = private unnamed_addr constant [25 x i8] c"%d bytes written on disk\00", align 1
@.str.96 = private unnamed_addr constant [26 x i8] c"Can't save! I/O error: %s\00", align 1
@.str.97 = private unnamed_addr constant [7 x i8] c"\1B[?25l\00", align 1
@.str.98 = private unnamed_addr constant [4 x i8] c"\1B[H\00", align 1
@.str.99 = private unnamed_addr constant [32 x i8] c"Kilo editor -- verison %s\1B[0K\0D\0A\00", align 1
@.str.100 = private unnamed_addr constant [6 x i8] c"0.0.1\00", align 1
@.str.101 = private unnamed_addr constant [2 x i8] c"~\00", align 1
@.str.102 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.103 = private unnamed_addr constant [8 x i8] c"~\1B[0K\0D\0A\00", align 1
@.str.104 = private unnamed_addr constant [5 x i8] c"\1B[7m\00", align 1
@.str.105 = private unnamed_addr constant [5 x i8] c"\1B[0m\00", align 1
@.str.106 = private unnamed_addr constant [6 x i8] c"\1B[39m\00", align 1
@.str.107 = private unnamed_addr constant [6 x i8] c"\1B[%dm\00", align 1
@.str.108 = private unnamed_addr constant [5 x i8] c"\1B[0K\00", align 1
@.str.109 = private unnamed_addr constant [3 x i8] c"\0D\0A\00", align 1
@.str.110 = private unnamed_addr constant [20 x i8] c"%.20s - %d lines %s\00", align 1
@.str.111 = private unnamed_addr constant [11 x i8] c"(modified)\00", align 1
@.str.112 = private unnamed_addr constant [6 x i8] c"%d/%d\00", align 1
@.str.113 = private unnamed_addr constant [7 x i8] c"\1B[0m\0D\0A\00", align 1
@.str.114 = private unnamed_addr constant [7 x i8] c"\1B[?25h\00", align 1
@.str.115 = private unnamed_addr constant [34 x i8] c"Search: %s (Use ESC/Arrows/Enter)\00", align 1
@editorProcessKeypress.quit_times = internal global i32 3, align 4
@.str.116 = private unnamed_addr constant [73 x i8] c"WARNING!!! File has unsaved changes. Press Ctrl-Q %d more times to quit.\00", align 1
@.str.117 = private unnamed_addr constant [53 x i8] c"Unable to query the screen for size (columns / rows)\00", align 1
@stderr = external dso_local global ptr, align 8
@.str.118 = private unnamed_addr constant [24 x i8] c"Usage: kilo <filename>\0A\00", align 1
@.str.119 = private unnamed_addr constant [52 x i8] c"HELP: Ctrl-S = save | Ctrl-Q = quit | Ctrl-F = find\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @disableRawMode(i32 noundef %0) #0 {
  %2 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 7), align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = call i32 @tcsetattr(i32 noundef %0, i32 noundef 2, ptr noundef @orig_termios) #11
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 7), align 4
  br label %6

6:                                                ; preds = %4, %1
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @tcsetattr(i32 noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorAtExit() #0 {
  call void @disableRawMode(i32 noundef 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @enableRawMode(i32 noundef %0) #0 {
  %2 = alloca %struct.termios, align 4
  %3 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 7), align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %38

6:                                                ; preds = %1
  %7 = call i32 @isatty(i32 noundef 0) #11
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %6
  br label %36

10:                                               ; preds = %6
  %11 = call i32 @atexit(ptr noundef @editorAtExit) #11
  %12 = call i32 @tcgetattr(i32 noundef %0, ptr noundef @orig_termios) #11
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %15

14:                                               ; preds = %10
  br label %36

15:                                               ; preds = %10
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 @orig_termios, i64 60, i1 false)
  %16 = getelementptr inbounds nuw %struct.termios, ptr %2, i32 0, i32 0
  %17 = load i32, ptr %16, align 4
  %18 = and i32 %17, -1331
  store i32 %18, ptr %16, align 4
  %19 = getelementptr inbounds nuw %struct.termios, ptr %2, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = and i32 %20, -2
  store i32 %21, ptr %19, align 4
  %22 = getelementptr inbounds nuw %struct.termios, ptr %2, i32 0, i32 2
  %23 = load i32, ptr %22, align 4
  %24 = or i32 %23, 48
  store i32 %24, ptr %22, align 4
  %25 = getelementptr inbounds nuw %struct.termios, ptr %2, i32 0, i32 3
  %26 = load i32, ptr %25, align 4
  %27 = and i32 %26, -32780
  store i32 %27, ptr %25, align 4
  %28 = getelementptr inbounds nuw %struct.termios, ptr %2, i32 0, i32 5
  %29 = getelementptr inbounds [32 x i8], ptr %28, i64 0, i64 6
  store i8 0, ptr %29, align 1
  %30 = getelementptr inbounds nuw %struct.termios, ptr %2, i32 0, i32 5
  %31 = getelementptr inbounds [32 x i8], ptr %30, i64 0, i64 5
  store i8 1, ptr %31, align 1
  %32 = call i32 @tcsetattr(i32 noundef %0, i32 noundef 2, ptr noundef %2) #11
  %33 = icmp slt i32 %32, 0
  br i1 %33, label %34, label %35

34:                                               ; preds = %15
  br label %36

35:                                               ; preds = %15
  store i32 1, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 7), align 4
  br label %38

36:                                               ; preds = %34, %14, %9
  %37 = call ptr @__errno_location() #12
  store i32 25, ptr %37, align 4
  br label %38

38:                                               ; preds = %36, %35, %5
  %.0 = phi i32 [ 0, %5 ], [ -1, %36 ], [ 0, %35 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare dso_local i32 @isatty(i32 noundef) #1

; Function Attrs: nounwind
declare dso_local i32 @atexit(ptr noundef) #1

; Function Attrs: nounwind
declare dso_local i32 @tcgetattr(i32 noundef, ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #2

; Function Attrs: nounwind willreturn memory(none)
declare dso_local ptr @__errno_location() #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @editorReadKey(i32 noundef %0) #0 {
  %2 = alloca i8, align 1
  %3 = alloca [3 x i8], align 1
  br label %4

4:                                                ; preds = %8, %1
  %5 = call i64 @read(i32 noundef %0, ptr noundef %2, i64 noundef 1)
  %6 = trunc i64 %5 to i32
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  br label %4, !llvm.loop !5

9:                                                ; preds = %4
  %10 = icmp eq i32 %6, -1
  br i1 %10, label %11, label %12

11:                                               ; preds = %9
  call void @exit(i32 noundef 1) #13
  unreachable

12:                                               ; preds = %9
  br label %13

13:                                               ; preds = %91, %12
  %14 = load i8, ptr %2, align 1
  %15 = sext i8 %14 to i32
  switch i32 %15, label %88 [
    i32 27, label %16
  ]

16:                                               ; preds = %13
  %17 = getelementptr inbounds [3 x i8], ptr %3, i64 0, i64 0
  %18 = call i64 @read(i32 noundef %0, ptr noundef %17, i64 noundef 1)
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %16
  br label %92

21:                                               ; preds = %16
  %22 = getelementptr inbounds [3 x i8], ptr %3, i64 0, i64 0
  %23 = getelementptr inbounds i8, ptr %22, i64 1
  %24 = call i64 @read(i32 noundef %0, ptr noundef %23, i64 noundef 1)
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %21
  br label %92

27:                                               ; preds = %21
  %28 = getelementptr inbounds [3 x i8], ptr %3, i64 0, i64 0
  %29 = load i8, ptr %28, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp eq i32 %30, 91
  br i1 %31, label %32, label %74

32:                                               ; preds = %27
  %33 = getelementptr inbounds [3 x i8], ptr %3, i64 0, i64 1
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp sge i32 %35, 48
  br i1 %36, label %37, label %62

37:                                               ; preds = %32
  %38 = getelementptr inbounds [3 x i8], ptr %3, i64 0, i64 1
  %39 = load i8, ptr %38, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp sle i32 %40, 57
  br i1 %41, label %42, label %62

42:                                               ; preds = %37
  %43 = getelementptr inbounds [3 x i8], ptr %3, i64 0, i64 0
  %44 = getelementptr inbounds i8, ptr %43, i64 2
  %45 = call i64 @read(i32 noundef %0, ptr noundef %44, i64 noundef 1)
  %46 = icmp eq i64 %45, 0
  br i1 %46, label %47, label %48

47:                                               ; preds = %42
  br label %92

48:                                               ; preds = %42
  %49 = getelementptr inbounds [3 x i8], ptr %3, i64 0, i64 2
  %50 = load i8, ptr %49, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp eq i32 %51, 126
  br i1 %52, label %53, label %61

53:                                               ; preds = %48
  %54 = getelementptr inbounds [3 x i8], ptr %3, i64 0, i64 1
  %55 = load i8, ptr %54, align 1
  %56 = sext i8 %55 to i32
  switch i32 %56, label %60 [
    i32 51, label %57
    i32 53, label %58
    i32 54, label %59
  ]

57:                                               ; preds = %53
  br label %92

58:                                               ; preds = %53
  br label %92

59:                                               ; preds = %53
  br label %92

60:                                               ; preds = %53
  br label %61

61:                                               ; preds = %60, %48
  br label %73

62:                                               ; preds = %37, %32
  %63 = getelementptr inbounds [3 x i8], ptr %3, i64 0, i64 1
  %64 = load i8, ptr %63, align 1
  %65 = sext i8 %64 to i32
  switch i32 %65, label %72 [
    i32 65, label %66
    i32 66, label %67
    i32 67, label %68
    i32 68, label %69
    i32 72, label %70
    i32 70, label %71
  ]

66:                                               ; preds = %62
  br label %92

67:                                               ; preds = %62
  br label %92

68:                                               ; preds = %62
  br label %92

69:                                               ; preds = %62
  br label %92

70:                                               ; preds = %62
  br label %92

71:                                               ; preds = %62
  br label %92

72:                                               ; preds = %62
  br label %73

73:                                               ; preds = %72, %61
  br label %87

74:                                               ; preds = %27
  %75 = getelementptr inbounds [3 x i8], ptr %3, i64 0, i64 0
  %76 = load i8, ptr %75, align 1
  %77 = sext i8 %76 to i32
  %78 = icmp eq i32 %77, 79
  br i1 %78, label %79, label %86

79:                                               ; preds = %74
  %80 = getelementptr inbounds [3 x i8], ptr %3, i64 0, i64 1
  %81 = load i8, ptr %80, align 1
  %82 = sext i8 %81 to i32
  switch i32 %82, label %85 [
    i32 72, label %83
    i32 70, label %84
  ]

83:                                               ; preds = %79
  br label %92

84:                                               ; preds = %79
  br label %92

85:                                               ; preds = %79
  br label %86

86:                                               ; preds = %85, %74
  br label %87

87:                                               ; preds = %86, %73
  br label %91

88:                                               ; preds = %13
  %89 = load i8, ptr %2, align 1
  %90 = sext i8 %89 to i32
  br label %92

91:                                               ; preds = %87
  br label %13

92:                                               ; preds = %88, %84, %83, %71, %70, %69, %68, %67, %66, %59, %58, %57, %47, %26, %20
  %.0 = phi i32 [ %90, %88 ], [ 27, %20 ], [ 27, %26 ], [ 27, %47 ], [ 1004, %57 ], [ 1007, %58 ], [ 1008, %59 ], [ 1002, %66 ], [ 1003, %67 ], [ 1001, %68 ], [ 1000, %69 ], [ 1005, %70 ], [ 1006, %71 ], [ 1005, %83 ], [ 1006, %84 ]
  ret i32 %.0
}

declare dso_local i64 @read(i32 noundef, ptr noundef, i64 noundef) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @getCursorPosition(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca [32 x i8], align 16
  %6 = call i64 @write(i32 noundef %1, ptr noundef @.str.86, i64 noundef 4)
  %7 = icmp ne i64 %6, 4
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  br label %49

9:                                                ; preds = %4
  br label %10

10:                                               ; preds = %27, %9
  %.01 = phi i32 [ 0, %9 ], [ %28, %27 ]
  %11 = zext i32 %.01 to i64
  %12 = icmp ult i64 %11, 31
  br i1 %12, label %13, label %29

13:                                               ; preds = %10
  %14 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 0
  %15 = zext i32 %.01 to i64
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 %15
  %17 = call i64 @read(i32 noundef %0, ptr noundef %16, i64 noundef 1)
  %18 = icmp ne i64 %17, 1
  br i1 %18, label %19, label %20

19:                                               ; preds = %13
  br label %29

20:                                               ; preds = %13
  %21 = zext i32 %.01 to i64
  %22 = getelementptr inbounds nuw [32 x i8], ptr %5, i64 0, i64 %21
  %23 = load i8, ptr %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %24, 82
  br i1 %25, label %26, label %27

26:                                               ; preds = %20
  br label %29

27:                                               ; preds = %20
  %28 = add i32 %.01, 1
  br label %10, !llvm.loop !7

29:                                               ; preds = %26, %19, %10
  %30 = zext i32 %.01 to i64
  %31 = getelementptr inbounds nuw [32 x i8], ptr %5, i64 0, i64 %30
  store i8 0, ptr %31, align 1
  %32 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 0
  %33 = load i8, ptr %32, align 16
  %34 = sext i8 %33 to i32
  %35 = icmp ne i32 %34, 27
  br i1 %35, label %41, label %36

36:                                               ; preds = %29
  %37 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 1
  %38 = load i8, ptr %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp ne i32 %39, 91
  br i1 %40, label %41, label %42

41:                                               ; preds = %36, %29
  br label %49

42:                                               ; preds = %36
  %43 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 0
  %44 = getelementptr inbounds i8, ptr %43, i64 2
  %45 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef %44, ptr noundef @.str.87, ptr noundef %2, ptr noundef %3) #11
  %46 = icmp ne i32 %45, 2
  br i1 %46, label %47, label %48

47:                                               ; preds = %42
  br label %49

48:                                               ; preds = %42
  br label %49

49:                                               ; preds = %48, %47, %41, %8
  %.0 = phi i32 [ -1, %8 ], [ -1, %41 ], [ -1, %47 ], [ 0, %48 ]
  ret i32 %.0
}

declare dso_local i64 @write(i32 noundef, ptr noundef, i64 noundef) #4

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @getWindowSize(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca %struct.winsize, align 2
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [32 x i8], align 16
  %9 = call i32 (i32, i64, ...) @ioctl(i32 noundef 1, i64 noundef 21523, ptr noundef %5) #11
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %16, label %11

11:                                               ; preds = %4
  %12 = getelementptr inbounds nuw %struct.winsize, ptr %5, i32 0, i32 1
  %13 = load i16, ptr %12, align 2
  %14 = zext i16 %13 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %40

16:                                               ; preds = %11, %4
  %17 = call i32 @getCursorPosition(i32 noundef %0, i32 noundef %1, ptr noundef %6, ptr noundef %7)
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  br label %47

20:                                               ; preds = %16
  %21 = call i64 @write(i32 noundef %1, ptr noundef @.str.88, i64 noundef 12)
  %22 = icmp ne i64 %21, 12
  br i1 %22, label %23, label %24

23:                                               ; preds = %20
  br label %47

24:                                               ; preds = %20
  %25 = call i32 @getCursorPosition(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3)
  %26 = icmp eq i32 %25, -1
  br i1 %26, label %27, label %28

27:                                               ; preds = %24
  br label %47

28:                                               ; preds = %24
  %29 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0
  %30 = load i32, ptr %6, align 4
  %31 = load i32, ptr %7, align 4
  %32 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %29, i64 noundef 32, ptr noundef @.str.89, i32 noundef %30, i32 noundef %31) #11
  %33 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0
  %34 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0
  %35 = call i64 @strlen(ptr noundef %34) #14
  %36 = call i64 @write(i32 noundef %1, ptr noundef %33, i64 noundef %35)
  %37 = icmp eq i64 %36, -1
  br i1 %37, label %38, label %39

38:                                               ; preds = %28
  br label %39

39:                                               ; preds = %38, %28
  br label %48

40:                                               ; preds = %11
  %41 = getelementptr inbounds nuw %struct.winsize, ptr %5, i32 0, i32 1
  %42 = load i16, ptr %41, align 2
  %43 = zext i16 %42 to i32
  store i32 %43, ptr %3, align 4
  %44 = getelementptr inbounds nuw %struct.winsize, ptr %5, i32 0, i32 0
  %45 = load i16, ptr %44, align 2
  %46 = zext i16 %45 to i32
  store i32 %46, ptr %2, align 4
  br label %48

47:                                               ; preds = %27, %23, %19
  br label %48

48:                                               ; preds = %47, %40, %39
  %.0 = phi i32 [ -1, %47 ], [ 0, %39 ], [ 0, %40 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare dso_local i32 @ioctl(i32 noundef, i64 noundef, ...) #1

; Function Attrs: nounwind
declare dso_local i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare dso_local i64 @strlen(ptr noundef) #6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_separator(i32 noundef %0) #0 {
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %15, label %3

3:                                                ; preds = %1
  %4 = call ptr @__ctype_b_loc() #12
  %5 = load ptr, ptr %4, align 8
  %6 = sext i32 %0 to i64
  %7 = getelementptr inbounds i16, ptr %5, i64 %6
  %8 = load i16, ptr %7, align 2
  %9 = zext i16 %8 to i32
  %10 = and i32 %9, 8192
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %15, label %12

12:                                               ; preds = %3
  %13 = call ptr @strchr(ptr noundef @.str.90, i32 noundef %0) #14
  %14 = icmp ne ptr %13, null
  br label %15

15:                                               ; preds = %12, %3, %1
  %16 = phi i1 [ true, %3 ], [ true, %1 ], [ %14, %12 ]
  %17 = zext i1 %16 to i32
  ret i32 %17
}

; Function Attrs: nounwind willreturn memory(none)
declare dso_local ptr @__ctype_b_loc() #3

; Function Attrs: nounwind willreturn memory(read)
declare dso_local ptr @strchr(ptr noundef, i32 noundef) #6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @editorRowHasOpenComment(ptr noundef %0) #0 {
  %2 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %47

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 2
  %7 = load i32, ptr %6, align 8
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %47

9:                                                ; preds = %5
  %10 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 2
  %13 = load i32, ptr %12, align 8
  %14 = sub nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, ptr %11, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, 3
  br i1 %19, label %20, label %47

20:                                               ; preds = %9
  %21 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 2
  %22 = load i32, ptr %21, align 8
  %23 = icmp slt i32 %22, 2
  br i1 %23, label %46, label %24

24:                                               ; preds = %20
  %25 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 4
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 2
  %28 = load i32, ptr %27, align 8
  %29 = sub nsw i32 %28, 2
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, ptr %26, i64 %30
  %32 = load i8, ptr %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp ne i32 %33, 42
  br i1 %34, label %46, label %35

35:                                               ; preds = %24
  %36 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 4
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 2
  %39 = load i32, ptr %38, align 8
  %40 = sub nsw i32 %39, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, ptr %37, i64 %41
  %43 = load i8, ptr %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp ne i32 %44, 47
  br i1 %45, label %46, label %47

46:                                               ; preds = %35, %24, %20
  br label %48

47:                                               ; preds = %35, %9, %5, %1
  br label %48

48:                                               ; preds = %47, %46
  %.0 = phi i32 [ 1, %46 ], [ 0, %47 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorUpdateSyntax(ptr noundef %0) #0 {
  %2 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 2
  %5 = load i32, ptr %4, align 8
  %6 = sext i32 %5 to i64
  %7 = call ptr @realloc(ptr noundef %3, i64 noundef %6) #15
  %8 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  store ptr %7, ptr %8, align 8
  %9 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 2
  %12 = load i32, ptr %11, align 8
  %13 = sext i32 %12 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %10, i8 0, i64 %13, i1 false)
  %14 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 13), align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %1
  br label %352

17:                                               ; preds = %1
  %18 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 13), align 8
  %19 = getelementptr inbounds nuw %struct.editorSyntax, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 13), align 8
  %22 = getelementptr inbounds nuw %struct.editorSyntax, ptr %21, i32 0, i32 2
  %23 = getelementptr inbounds [2 x i8], ptr %22, i64 0, i64 0
  %24 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 13), align 8
  %25 = getelementptr inbounds nuw %struct.editorSyntax, ptr %24, i32 0, i32 3
  %26 = getelementptr inbounds [3 x i8], ptr %25, i64 0, i64 0
  %27 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 13), align 8
  %28 = getelementptr inbounds nuw %struct.editorSyntax, ptr %27, i32 0, i32 4
  %29 = getelementptr inbounds [3 x i8], ptr %28, i64 0, i64 0
  %30 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 4
  %31 = load ptr, ptr %30, align 8
  br label %32

32:                                               ; preds = %49, %17
  %.07 = phi ptr [ %31, %17 ], [ %50, %49 ]
  %.01 = phi i32 [ 0, %17 ], [ %51, %49 ]
  %33 = load i8, ptr %.07, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %47

36:                                               ; preds = %32
  %37 = call ptr @__ctype_b_loc() #12
  %38 = load ptr, ptr %37, align 8
  %39 = load i8, ptr %.07, align 1
  %40 = sext i8 %39 to i32
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i16, ptr %38, i64 %41
  %43 = load i16, ptr %42, align 2
  %44 = zext i16 %43 to i32
  %45 = and i32 %44, 8192
  %46 = icmp ne i32 %45, 0
  br label %47

47:                                               ; preds = %36, %32
  %48 = phi i1 [ false, %32 ], [ %46, %36 ]
  br i1 %48, label %49, label %52

49:                                               ; preds = %47
  %50 = getelementptr inbounds nuw i8, ptr %.07, i32 1
  %51 = add nsw i32 %.01, 1
  br label %32, !llvm.loop !8

52:                                               ; preds = %47
  %53 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 0
  %54 = load i32, ptr %53, align 8
  %55 = icmp sgt i32 %54, 0
  br i1 %55, label %56, label %66

56:                                               ; preds = %52
  %57 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %58 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 0
  %59 = load i32, ptr %58, align 8
  %60 = sub nsw i32 %59, 1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds %struct.erow, ptr %57, i64 %61
  %63 = call i32 @editorRowHasOpenComment(ptr noundef %62)
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %66

65:                                               ; preds = %56
  br label %66

66:                                               ; preds = %65, %56, %52
  %.05 = phi i32 [ 1, %65 ], [ 0, %56 ], [ 0, %52 ]
  br label %67

67:                                               ; preds = %326, %324, %255, %211, %190, %179, %166, %143, %125, %117, %66
  %.18 = phi ptr [ %.07, %66 ], [ %123, %117 ], [ %126, %125 ], [ %153, %143 ], [ %172, %166 ], [ %180, %179 ], [ %197, %190 ], [ %260, %255 ], [ %.310, %324 ], [ %330, %326 ], [ %216, %211 ]
  %.16 = phi i32 [ %.05, %66 ], [ 0, %117 ], [ %.16, %125 ], [ 1, %143 ], [ %.16, %166 ], [ %.16, %179 ], [ %.16, %190 ], [ %.16, %255 ], [ %.16, %324 ], [ %.16, %326 ], [ %.16, %211 ]
  %.03 = phi i32 [ 0, %66 ], [ %.03, %117 ], [ %.03, %125 ], [ %.03, %143 ], [ %.03, %166 ], [ %.14, %179 ], [ %192, %190 ], [ %.03, %255 ], [ %.03, %324 ], [ %.03, %326 ], [ %.03, %211 ]
  %.02 = phi i32 [ 1, %66 ], [ 1, %117 ], [ 0, %125 ], [ 0, %143 ], [ 0, %166 ], [ %.02, %179 ], [ 0, %190 ], [ 0, %255 ], [ 0, %324 ], [ %329, %326 ], [ 0, %211 ]
  %.1 = phi i32 [ %.01, %66 ], [ %124, %117 ], [ %127, %125 ], [ %154, %143 ], [ %173, %166 ], [ %181, %179 ], [ %198, %190 ], [ %261, %255 ], [ %.3, %324 ], [ %331, %326 ], [ %217, %211 ]
  %68 = load i8, ptr %.18, align 1
  %69 = icmp ne i8 %68, 0
  br i1 %69, label %70, label %332

70:                                               ; preds = %67
  %71 = icmp ne i32 %.02, 0
  br i1 %71, label %72, label %96

72:                                               ; preds = %70
  %73 = load i8, ptr %.18, align 1
  %74 = sext i8 %73 to i32
  %75 = getelementptr inbounds i8, ptr %23, i64 0
  %76 = load i8, ptr %75, align 1
  %77 = sext i8 %76 to i32
  %78 = icmp eq i32 %74, %77
  br i1 %78, label %79, label %96

79:                                               ; preds = %72
  %80 = getelementptr inbounds i8, ptr %.18, i64 1
  %81 = load i8, ptr %80, align 1
  %82 = sext i8 %81 to i32
  %83 = getelementptr inbounds i8, ptr %23, i64 1
  %84 = load i8, ptr %83, align 1
  %85 = sext i8 %84 to i32
  %86 = icmp eq i32 %82, %85
  br i1 %86, label %87, label %96

87:                                               ; preds = %79
  %88 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %89 = load ptr, ptr %88, align 8
  %90 = sext i32 %.1 to i64
  %91 = getelementptr inbounds i8, ptr %89, i64 %90
  %92 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %93 = load i32, ptr %92, align 4
  %94 = sub nsw i32 %93, %.1
  %95 = sext i32 %94 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %91, i8 2, i64 %95, i1 false)
  br label %352

96:                                               ; preds = %79, %72, %70
  %97 = icmp ne i32 %.16, 0
  br i1 %97, label %98, label %128

98:                                               ; preds = %96
  %99 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %100 = load ptr, ptr %99, align 8
  %101 = sext i32 %.1 to i64
  %102 = getelementptr inbounds i8, ptr %100, i64 %101
  store i8 3, ptr %102, align 1
  %103 = load i8, ptr %.18, align 1
  %104 = sext i8 %103 to i32
  %105 = getelementptr inbounds i8, ptr %29, i64 0
  %106 = load i8, ptr %105, align 1
  %107 = sext i8 %106 to i32
  %108 = icmp eq i32 %104, %107
  br i1 %108, label %109, label %125

109:                                              ; preds = %98
  %110 = getelementptr inbounds i8, ptr %.18, i64 1
  %111 = load i8, ptr %110, align 1
  %112 = sext i8 %111 to i32
  %113 = getelementptr inbounds i8, ptr %29, i64 1
  %114 = load i8, ptr %113, align 1
  %115 = sext i8 %114 to i32
  %116 = icmp eq i32 %112, %115
  br i1 %116, label %117, label %125

117:                                              ; preds = %109
  %118 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %119 = load ptr, ptr %118, align 8
  %120 = add nsw i32 %.1, 1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i8, ptr %119, i64 %121
  store i8 3, ptr %122, align 1
  %123 = getelementptr inbounds i8, ptr %.18, i64 2
  %124 = add nsw i32 %.1, 2
  br label %67, !llvm.loop !9

125:                                              ; preds = %109, %98
  %126 = getelementptr inbounds nuw i8, ptr %.18, i32 1
  %127 = add nsw i32 %.1, 1
  br label %67, !llvm.loop !9

128:                                              ; preds = %96
  %129 = load i8, ptr %.18, align 1
  %130 = sext i8 %129 to i32
  %131 = getelementptr inbounds i8, ptr %26, i64 0
  %132 = load i8, ptr %131, align 1
  %133 = sext i8 %132 to i32
  %134 = icmp eq i32 %130, %133
  br i1 %134, label %135, label %155

135:                                              ; preds = %128
  %136 = getelementptr inbounds i8, ptr %.18, i64 1
  %137 = load i8, ptr %136, align 1
  %138 = sext i8 %137 to i32
  %139 = getelementptr inbounds i8, ptr %26, i64 1
  %140 = load i8, ptr %139, align 1
  %141 = sext i8 %140 to i32
  %142 = icmp eq i32 %138, %141
  br i1 %142, label %143, label %155

143:                                              ; preds = %135
  %144 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %145 = load ptr, ptr %144, align 8
  %146 = sext i32 %.1 to i64
  %147 = getelementptr inbounds i8, ptr %145, i64 %146
  store i8 3, ptr %147, align 1
  %148 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %149 = load ptr, ptr %148, align 8
  %150 = add nsw i32 %.1, 1
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i8, ptr %149, i64 %151
  store i8 3, ptr %152, align 1
  %153 = getelementptr inbounds i8, ptr %.18, i64 2
  %154 = add nsw i32 %.1, 2
  br label %67, !llvm.loop !9

155:                                              ; preds = %135, %128
  br label %156

156:                                              ; preds = %155
  %157 = icmp ne i32 %.03, 0
  br i1 %157, label %158, label %182

158:                                              ; preds = %156
  %159 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %160 = load ptr, ptr %159, align 8
  %161 = sext i32 %.1 to i64
  %162 = getelementptr inbounds i8, ptr %160, i64 %161
  store i8 6, ptr %162, align 1
  %163 = load i8, ptr %.18, align 1
  %164 = sext i8 %163 to i32
  %165 = icmp eq i32 %164, 92
  br i1 %165, label %166, label %174

166:                                              ; preds = %158
  %167 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %168 = load ptr, ptr %167, align 8
  %169 = add nsw i32 %.1, 1
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i8, ptr %168, i64 %170
  store i8 6, ptr %171, align 1
  %172 = getelementptr inbounds i8, ptr %.18, i64 2
  %173 = add nsw i32 %.1, 2
  br label %67, !llvm.loop !9

174:                                              ; preds = %158
  %175 = load i8, ptr %.18, align 1
  %176 = sext i8 %175 to i32
  %177 = icmp eq i32 %176, %.03
  br i1 %177, label %178, label %179

178:                                              ; preds = %174
  br label %179

179:                                              ; preds = %178, %174
  %.14 = phi i32 [ 0, %178 ], [ %.03, %174 ]
  %180 = getelementptr inbounds nuw i8, ptr %.18, i32 1
  %181 = add nsw i32 %.1, 1
  br label %67, !llvm.loop !9

182:                                              ; preds = %156
  %183 = load i8, ptr %.18, align 1
  %184 = sext i8 %183 to i32
  %185 = icmp eq i32 %184, 34
  br i1 %185, label %190, label %186

186:                                              ; preds = %182
  %187 = load i8, ptr %.18, align 1
  %188 = sext i8 %187 to i32
  %189 = icmp eq i32 %188, 39
  br i1 %189, label %190, label %199

190:                                              ; preds = %186, %182
  %191 = load i8, ptr %.18, align 1
  %192 = sext i8 %191 to i32
  %193 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %194 = load ptr, ptr %193, align 8
  %195 = sext i32 %.1 to i64
  %196 = getelementptr inbounds i8, ptr %194, i64 %195
  store i8 6, ptr %196, align 1
  %197 = getelementptr inbounds nuw i8, ptr %.18, i32 1
  %198 = add nsw i32 %.1, 1
  br label %67, !llvm.loop !9

199:                                              ; preds = %186
  br label %200

200:                                              ; preds = %199
  %201 = call ptr @__ctype_b_loc() #12
  %202 = load ptr, ptr %201, align 8
  %203 = load i8, ptr %.18, align 1
  %204 = sext i8 %203 to i32
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i16, ptr %202, i64 %205
  %207 = load i16, ptr %206, align 2
  %208 = zext i16 %207 to i32
  %209 = and i32 %208, 16384
  %210 = icmp ne i32 %209, 0
  br i1 %210, label %218, label %211

211:                                              ; preds = %200
  %212 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %213 = load ptr, ptr %212, align 8
  %214 = sext i32 %.1 to i64
  %215 = getelementptr inbounds i8, ptr %213, i64 %214
  store i8 1, ptr %215, align 1
  %216 = getelementptr inbounds nuw i8, ptr %.18, i32 1
  %217 = add nsw i32 %.1, 1
  br label %67, !llvm.loop !9

218:                                              ; preds = %200
  %219 = call ptr @__ctype_b_loc() #12
  %220 = load ptr, ptr %219, align 8
  %221 = load i8, ptr %.18, align 1
  %222 = sext i8 %221 to i32
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds i16, ptr %220, i64 %223
  %225 = load i16, ptr %224, align 2
  %226 = zext i16 %225 to i32
  %227 = and i32 %226, 2048
  %228 = icmp ne i32 %227, 0
  br i1 %228, label %229, label %240

229:                                              ; preds = %218
  %230 = icmp ne i32 %.02, 0
  br i1 %230, label %255, label %231

231:                                              ; preds = %229
  %232 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %233 = load ptr, ptr %232, align 8
  %234 = sub nsw i32 %.1, 1
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds i8, ptr %233, i64 %235
  %237 = load i8, ptr %236, align 1
  %238 = zext i8 %237 to i32
  %239 = icmp eq i32 %238, 7
  br i1 %239, label %255, label %240

240:                                              ; preds = %231, %218
  %241 = load i8, ptr %.18, align 1
  %242 = sext i8 %241 to i32
  %243 = icmp eq i32 %242, 46
  br i1 %243, label %244, label %262

244:                                              ; preds = %240
  %245 = icmp sgt i32 %.1, 0
  br i1 %245, label %246, label %262

246:                                              ; preds = %244
  %247 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %248 = load ptr, ptr %247, align 8
  %249 = sub nsw i32 %.1, 1
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i8, ptr %248, i64 %250
  %252 = load i8, ptr %251, align 1
  %253 = zext i8 %252 to i32
  %254 = icmp eq i32 %253, 7
  br i1 %254, label %255, label %262

255:                                              ; preds = %246, %231, %229
  %256 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %257 = load ptr, ptr %256, align 8
  %258 = sext i32 %.1 to i64
  %259 = getelementptr inbounds i8, ptr %257, i64 %258
  store i8 7, ptr %259, align 1
  %260 = getelementptr inbounds nuw i8, ptr %.18, i32 1
  %261 = add nsw i32 %.1, 1
  br label %67, !llvm.loop !9

262:                                              ; preds = %246, %244, %240
  %263 = icmp ne i32 %.02, 0
  br i1 %263, label %264, label %326

264:                                              ; preds = %262
  br label %265

265:                                              ; preds = %317, %264
  %.011 = phi i32 [ 0, %264 ], [ %318, %317 ]
  %266 = sext i32 %.011 to i64
  %267 = getelementptr inbounds ptr, ptr %20, i64 %266
  %268 = load ptr, ptr %267, align 8
  %269 = icmp ne ptr %268, null
  br i1 %269, label %270, label %319

270:                                              ; preds = %265
  %271 = sext i32 %.011 to i64
  %272 = getelementptr inbounds ptr, ptr %20, i64 %271
  %273 = load ptr, ptr %272, align 8
  %274 = call i64 @strlen(ptr noundef %273) #14
  %275 = trunc i64 %274 to i32
  %276 = sext i32 %.011 to i64
  %277 = getelementptr inbounds ptr, ptr %20, i64 %276
  %278 = load ptr, ptr %277, align 8
  %279 = sub nsw i32 %275, 1
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds i8, ptr %278, i64 %280
  %282 = load i8, ptr %281, align 1
  %283 = sext i8 %282 to i32
  %284 = icmp eq i32 %283, 124
  %285 = zext i1 %284 to i32
  %286 = icmp ne i32 %285, 0
  br i1 %286, label %287, label %289

287:                                              ; preds = %270
  %288 = add nsw i32 %275, -1
  br label %289

289:                                              ; preds = %287, %270
  %.0 = phi i32 [ %288, %287 ], [ %275, %270 ]
  %290 = sext i32 %.011 to i64
  %291 = getelementptr inbounds ptr, ptr %20, i64 %290
  %292 = load ptr, ptr %291, align 8
  %293 = sext i32 %.0 to i64
  %294 = call i32 @memcmp(ptr noundef %.18, ptr noundef %292, i64 noundef %293) #14
  %295 = icmp ne i32 %294, 0
  br i1 %295, label %316, label %296

296:                                              ; preds = %289
  %297 = sext i32 %.0 to i64
  %298 = getelementptr inbounds i8, ptr %.18, i64 %297
  %299 = load i8, ptr %298, align 1
  %300 = sext i8 %299 to i32
  %301 = call i32 @is_separator(i32 noundef %300)
  %302 = icmp ne i32 %301, 0
  br i1 %302, label %303, label %316

303:                                              ; preds = %296
  %304 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %305 = load ptr, ptr %304, align 8
  %306 = sext i32 %.1 to i64
  %307 = getelementptr inbounds i8, ptr %305, i64 %306
  %308 = icmp ne i32 %285, 0
  %309 = zext i1 %308 to i64
  %310 = select i1 %308, i32 5, i32 4
  %311 = trunc i32 %310 to i8
  %312 = sext i32 %.0 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %307, i8 %311, i64 %312, i1 false)
  %313 = sext i32 %.0 to i64
  %314 = getelementptr inbounds i8, ptr %.18, i64 %313
  %315 = add nsw i32 %.1, %.0
  br label %319

316:                                              ; preds = %296, %289
  br label %317

317:                                              ; preds = %316
  %318 = add nsw i32 %.011, 1
  br label %265, !llvm.loop !10

319:                                              ; preds = %303, %265
  %.310 = phi ptr [ %314, %303 ], [ %.18, %265 ]
  %.3 = phi i32 [ %315, %303 ], [ %.1, %265 ]
  %320 = sext i32 %.011 to i64
  %321 = getelementptr inbounds ptr, ptr %20, i64 %320
  %322 = load ptr, ptr %321, align 8
  %323 = icmp ne ptr %322, null
  br i1 %323, label %324, label %325

324:                                              ; preds = %319
  br label %67, !llvm.loop !9

325:                                              ; preds = %319
  br label %326

326:                                              ; preds = %325, %262
  %.29 = phi ptr [ %.310, %325 ], [ %.18, %262 ]
  %.2 = phi i32 [ %.3, %325 ], [ %.1, %262 ]
  %327 = load i8, ptr %.29, align 1
  %328 = sext i8 %327 to i32
  %329 = call i32 @is_separator(i32 noundef %328)
  %330 = getelementptr inbounds nuw i8, ptr %.29, i32 1
  %331 = add nsw i32 %.2, 1
  br label %67, !llvm.loop !9

332:                                              ; preds = %67
  %333 = call i32 @editorRowHasOpenComment(ptr noundef %0)
  %334 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 6
  %335 = load i32, ptr %334, align 8
  %336 = icmp ne i32 %335, %333
  br i1 %336, label %337, label %350

337:                                              ; preds = %332
  %338 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 0
  %339 = load i32, ptr %338, align 8
  %340 = add nsw i32 %339, 1
  %341 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %342 = icmp slt i32 %340, %341
  br i1 %342, label %343, label %350

343:                                              ; preds = %337
  %344 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %345 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 0
  %346 = load i32, ptr %345, align 8
  %347 = add nsw i32 %346, 1
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds %struct.erow, ptr %344, i64 %348
  call void @editorUpdateSyntax(ptr noundef %349)
  br label %350

350:                                              ; preds = %343, %337, %332
  %351 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 6
  store i32 %333, ptr %351, align 8
  br label %352

352:                                              ; preds = %350, %87, %16
  ret void
}

; Function Attrs: nounwind allocsize(1)
declare dso_local ptr @realloc(ptr noundef, i64 noundef) #7

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #8

; Function Attrs: nounwind willreturn memory(read)
declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @editorSyntaxToColor(i32 noundef %0) #0 {
  switch i32 %0, label %8 [
    i32 2, label %2
    i32 3, label %2
    i32 4, label %3
    i32 5, label %4
    i32 6, label %5
    i32 7, label %6
    i32 8, label %7
  ]

2:                                                ; preds = %1, %1
  br label %9

3:                                                ; preds = %1
  br label %9

4:                                                ; preds = %1
  br label %9

5:                                                ; preds = %1
  br label %9

6:                                                ; preds = %1
  br label %9

7:                                                ; preds = %1
  br label %9

8:                                                ; preds = %1
  br label %9

9:                                                ; preds = %8, %7, %6, %5, %4, %3, %2
  %.0 = phi i32 [ 37, %8 ], [ 36, %2 ], [ 33, %3 ], [ 32, %4 ], [ 35, %5 ], [ 31, %6 ], [ 34, %7 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorSelectSyntaxHighlight(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %51, %1
  %.01 = phi i32 [ 0, %1 ], [ %52, %51 ]
  %3 = zext i32 %.01 to i64
  %4 = icmp ult i64 %3, 1
  br i1 %4, label %5, label %53

5:                                                ; preds = %2
  %6 = zext i32 %.01 to i64
  %7 = getelementptr inbounds nuw %struct.editorSyntax, ptr @HLDB, i64 %6
  br label %8

8:                                                ; preds = %48, %5
  %.0 = phi i32 [ 0, %5 ], [ %49, %48 ]
  %9 = getelementptr inbounds nuw %struct.editorSyntax, ptr %7, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = zext i32 %.0 to i64
  %12 = getelementptr inbounds nuw ptr, ptr %10, i64 %11
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %50

15:                                               ; preds = %8
  %16 = getelementptr inbounds nuw %struct.editorSyntax, ptr %7, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = zext i32 %.0 to i64
  %19 = getelementptr inbounds nuw ptr, ptr %17, i64 %18
  %20 = load ptr, ptr %19, align 8
  %21 = call i64 @strlen(ptr noundef %20) #14
  %22 = trunc i64 %21 to i32
  %23 = getelementptr inbounds nuw %struct.editorSyntax, ptr %7, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = zext i32 %.0 to i64
  %26 = getelementptr inbounds nuw ptr, ptr %24, i64 %25
  %27 = load ptr, ptr %26, align 8
  %28 = call ptr @strstr(ptr noundef %0, ptr noundef %27) #14
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %48

30:                                               ; preds = %15
  %31 = getelementptr inbounds nuw %struct.editorSyntax, ptr %7, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = zext i32 %.0 to i64
  %34 = getelementptr inbounds nuw ptr, ptr %32, i64 %33
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr inbounds i8, ptr %35, i64 0
  %37 = load i8, ptr %36, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp ne i32 %38, 46
  br i1 %39, label %46, label %40

40:                                               ; preds = %30
  %41 = sext i32 %22 to i64
  %42 = getelementptr inbounds i8, ptr %28, i64 %41
  %43 = load i8, ptr %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %47

46:                                               ; preds = %40, %30
  store ptr %7, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 13), align 8
  br label %53

47:                                               ; preds = %40
  br label %48

48:                                               ; preds = %47, %15
  %49 = add i32 %.0, 1
  br label %8, !llvm.loop !11

50:                                               ; preds = %8
  br label %51

51:                                               ; preds = %50
  %52 = add i32 %.01, 1
  br label %2, !llvm.loop !12

53:                                               ; preds = %46, %2
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare dso_local ptr @strstr(ptr noundef, ptr noundef) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorUpdateRow(ptr noundef %0) #0 {
  %2 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 4
  %3 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %3) #11
  br label %4

4:                                                ; preds = %19, %1
  %.03 = phi i32 [ 0, %1 ], [ %20, %19 ]
  %.01 = phi i32 [ 0, %1 ], [ %.12, %19 ]
  %5 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp slt i32 %.03, %6
  br i1 %7, label %8, label %21

8:                                                ; preds = %4
  %9 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %10 = load ptr, ptr %9, align 8
  %11 = sext i32 %.03 to i64
  %12 = getelementptr inbounds i8, ptr %10, i64 %11
  %13 = load i8, ptr %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp eq i32 %14, 9
  br i1 %15, label %16, label %18

16:                                               ; preds = %8
  %17 = add i32 %.01, 1
  br label %18

18:                                               ; preds = %16, %8
  %.12 = phi i32 [ %17, %16 ], [ %.01, %8 ]
  br label %19

19:                                               ; preds = %18
  %20 = add nsw i32 %.03, 1
  br label %4, !llvm.loop !13

21:                                               ; preds = %4
  %22 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = sext i32 %23 to i64
  %25 = mul i32 %.01, 8
  %26 = zext i32 %25 to i64
  %27 = add i64 %24, %26
  %28 = mul i32 0, 9
  %29 = zext i32 %28 to i64
  %30 = add i64 %27, %29
  %31 = add i64 %30, 1
  %32 = icmp ugt i64 %31, 4294967295
  br i1 %32, label %33, label %35

33:                                               ; preds = %21
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.91)
  call void @exit(i32 noundef 1) #13
  unreachable

35:                                               ; preds = %21
  %36 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %37 = load i32, ptr %36, align 4
  %38 = mul i32 %.01, 8
  %39 = add i32 %37, %38
  %40 = mul i32 0, 9
  %41 = add i32 %39, %40
  %42 = add i32 %41, 1
  %43 = zext i32 %42 to i64
  %44 = call noalias ptr @malloc(i64 noundef %43) #16
  %45 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 4
  store ptr %44, ptr %45, align 8
  br label %46

46:                                               ; preds = %87, %35
  %.14 = phi i32 [ 0, %35 ], [ %88, %87 ]
  %.0 = phi i32 [ 0, %35 ], [ %.2, %87 ]
  %47 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %48 = load i32, ptr %47, align 4
  %49 = icmp slt i32 %.14, %48
  br i1 %49, label %50, label %89

50:                                               ; preds = %46
  %51 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %52 = load ptr, ptr %51, align 8
  %53 = sext i32 %.14 to i64
  %54 = getelementptr inbounds i8, ptr %52, i64 %53
  %55 = load i8, ptr %54, align 1
  %56 = sext i8 %55 to i32
  %57 = icmp eq i32 %56, 9
  br i1 %57, label %58, label %75

58:                                               ; preds = %50
  %59 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 4
  %60 = load ptr, ptr %59, align 8
  %61 = add nsw i32 %.0, 1
  %62 = sext i32 %.0 to i64
  %63 = getelementptr inbounds i8, ptr %60, i64 %62
  store i8 32, ptr %63, align 1
  br label %64

64:                                               ; preds = %68, %58
  %.1 = phi i32 [ %61, %58 ], [ %71, %68 ]
  %65 = add nsw i32 %.1, 1
  %66 = srem i32 %65, 8
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %74

68:                                               ; preds = %64
  %69 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 4
  %70 = load ptr, ptr %69, align 8
  %71 = add nsw i32 %.1, 1
  %72 = sext i32 %.1 to i64
  %73 = getelementptr inbounds i8, ptr %70, i64 %72
  store i8 32, ptr %73, align 1
  br label %64, !llvm.loop !14

74:                                               ; preds = %64
  br label %86

75:                                               ; preds = %50
  %76 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %77 = load ptr, ptr %76, align 8
  %78 = sext i32 %.14 to i64
  %79 = getelementptr inbounds i8, ptr %77, i64 %78
  %80 = load i8, ptr %79, align 1
  %81 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 4
  %82 = load ptr, ptr %81, align 8
  %83 = add nsw i32 %.0, 1
  %84 = sext i32 %.0 to i64
  %85 = getelementptr inbounds i8, ptr %82, i64 %84
  store i8 %80, ptr %85, align 1
  br label %86

86:                                               ; preds = %75, %74
  %.2 = phi i32 [ %.1, %74 ], [ %83, %75 ]
  br label %87

87:                                               ; preds = %86
  %88 = add nsw i32 %.14, 1
  br label %46, !llvm.loop !15

89:                                               ; preds = %46
  %90 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 2
  store i32 %.0, ptr %90, align 8
  %91 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 4
  %92 = load ptr, ptr %91, align 8
  %93 = sext i32 %.0 to i64
  %94 = getelementptr inbounds i8, ptr %92, i64 %93
  store i8 0, ptr %94, align 1
  call void @editorUpdateSyntax(ptr noundef %0)
  ret void
}

; Function Attrs: nounwind
declare dso_local void @free(ptr noundef) #1

declare dso_local i32 @printf(ptr noundef, ...) #4

; Function Attrs: nounwind allocsize(0)
declare dso_local noalias ptr @malloc(i64 noundef) #9

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorInsertRow(i32 noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %5 = icmp sgt i32 %0, %4
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  br label %87

7:                                                ; preds = %3
  %8 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %9 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %10 = add nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = mul i64 48, %11
  %13 = call ptr @realloc(ptr noundef %8, i64 noundef %12) #15
  store ptr %13, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %14 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %15 = icmp ne i32 %0, %14
  br i1 %15, label %16, label %42

16:                                               ; preds = %7
  %17 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %18 = sext i32 %0 to i64
  %19 = getelementptr inbounds %struct.erow, ptr %17, i64 %18
  %20 = getelementptr inbounds %struct.erow, ptr %19, i64 1
  %21 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %22 = sext i32 %0 to i64
  %23 = getelementptr inbounds %struct.erow, ptr %21, i64 %22
  %24 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %25 = sub nsw i32 %24, %0
  %26 = sext i32 %25 to i64
  %27 = mul i64 48, %26
  call void @llvm.memmove.p0.p0.i64(ptr align 8 %20, ptr align 8 %23, i64 %27, i1 false)
  %28 = add nsw i32 %0, 1
  br label %29

29:                                               ; preds = %39, %16
  %.0 = phi i32 [ %28, %16 ], [ %40, %39 ]
  %30 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %31 = icmp sle i32 %.0, %30
  br i1 %31, label %32, label %41

32:                                               ; preds = %29
  %33 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %34 = sext i32 %.0 to i64
  %35 = getelementptr inbounds %struct.erow, ptr %33, i64 %34
  %36 = getelementptr inbounds nuw %struct.erow, ptr %35, i32 0, i32 0
  %37 = load i32, ptr %36, align 8
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %36, align 8
  br label %39

39:                                               ; preds = %32
  %40 = add nsw i32 %.0, 1
  br label %29, !llvm.loop !16

41:                                               ; preds = %29
  br label %42

42:                                               ; preds = %41, %7
  %43 = trunc i64 %2 to i32
  %44 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %45 = sext i32 %0 to i64
  %46 = getelementptr inbounds %struct.erow, ptr %44, i64 %45
  %47 = getelementptr inbounds nuw %struct.erow, ptr %46, i32 0, i32 1
  store i32 %43, ptr %47, align 4
  %48 = add i64 %2, 1
  %49 = call noalias ptr @malloc(i64 noundef %48) #16
  %50 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %51 = sext i32 %0 to i64
  %52 = getelementptr inbounds %struct.erow, ptr %50, i64 %51
  %53 = getelementptr inbounds nuw %struct.erow, ptr %52, i32 0, i32 3
  store ptr %49, ptr %53, align 8
  %54 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %55 = sext i32 %0 to i64
  %56 = getelementptr inbounds %struct.erow, ptr %54, i64 %55
  %57 = getelementptr inbounds nuw %struct.erow, ptr %56, i32 0, i32 3
  %58 = load ptr, ptr %57, align 8
  %59 = add i64 %2, 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %58, ptr align 1 %1, i64 %59, i1 false)
  %60 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %61 = sext i32 %0 to i64
  %62 = getelementptr inbounds %struct.erow, ptr %60, i64 %61
  %63 = getelementptr inbounds nuw %struct.erow, ptr %62, i32 0, i32 5
  store ptr null, ptr %63, align 8
  %64 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %65 = sext i32 %0 to i64
  %66 = getelementptr inbounds %struct.erow, ptr %64, i64 %65
  %67 = getelementptr inbounds nuw %struct.erow, ptr %66, i32 0, i32 6
  store i32 0, ptr %67, align 8
  %68 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %69 = sext i32 %0 to i64
  %70 = getelementptr inbounds %struct.erow, ptr %68, i64 %69
  %71 = getelementptr inbounds nuw %struct.erow, ptr %70, i32 0, i32 4
  store ptr null, ptr %71, align 8
  %72 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %73 = sext i32 %0 to i64
  %74 = getelementptr inbounds %struct.erow, ptr %72, i64 %73
  %75 = getelementptr inbounds nuw %struct.erow, ptr %74, i32 0, i32 2
  store i32 0, ptr %75, align 8
  %76 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %77 = sext i32 %0 to i64
  %78 = getelementptr inbounds %struct.erow, ptr %76, i64 %77
  %79 = getelementptr inbounds nuw %struct.erow, ptr %78, i32 0, i32 0
  store i32 %0, ptr %79, align 8
  %80 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %81 = sext i32 %0 to i64
  %82 = getelementptr inbounds %struct.erow, ptr %80, i64 %81
  call void @editorUpdateRow(ptr noundef %82)
  %83 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %84 = add nsw i32 %83, 1
  store i32 %84, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %85 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  br label %87

87:                                               ; preds = %42, %6
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr writeonly captures(none), ptr readonly captures(none), i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorFreeRow(ptr noundef %0) #0 {
  %2 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 4
  %3 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %3) #11
  %4 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %5 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %5) #11
  %6 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 5
  %7 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %7) #11
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorDelRow(i32 noundef %0) #0 {
  %2 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %3 = icmp sge i32 %0, %2
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  br label %39

5:                                                ; preds = %1
  %6 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %7 = sext i32 %0 to i64
  %8 = getelementptr inbounds %struct.erow, ptr %6, i64 %7
  call void @editorFreeRow(ptr noundef %8)
  %9 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %10 = sext i32 %0 to i64
  %11 = getelementptr inbounds %struct.erow, ptr %9, i64 %10
  %12 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %13 = sext i32 %0 to i64
  %14 = getelementptr inbounds %struct.erow, ptr %12, i64 %13
  %15 = getelementptr inbounds %struct.erow, ptr %14, i64 1
  %16 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %17 = sub nsw i32 %16, %0
  %18 = sub nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = mul i64 48, %19
  call void @llvm.memmove.p0.p0.i64(ptr align 8 %11, ptr align 8 %15, i64 %20, i1 false)
  br label %21

21:                                               ; preds = %32, %5
  %.0 = phi i32 [ %0, %5 ], [ %33, %32 ]
  %22 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %23 = sub nsw i32 %22, 1
  %24 = icmp slt i32 %.0, %23
  br i1 %24, label %25, label %34

25:                                               ; preds = %21
  %26 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %27 = sext i32 %.0 to i64
  %28 = getelementptr inbounds %struct.erow, ptr %26, i64 %27
  %29 = getelementptr inbounds nuw %struct.erow, ptr %28, i32 0, i32 0
  %30 = load i32, ptr %29, align 8
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %29, align 8
  br label %32

32:                                               ; preds = %25
  %33 = add nsw i32 %.0, 1
  br label %21, !llvm.loop !17

34:                                               ; preds = %21
  %35 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %36 = add nsw i32 %35, -1
  store i32 %36, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %37 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  br label %39

39:                                               ; preds = %34, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @editorRowsToString(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %13, %1
  %.02 = phi i32 [ 0, %1 ], [ %12, %13 ]
  %.0 = phi i32 [ 0, %1 ], [ %14, %13 ]
  %3 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %4 = icmp slt i32 %.0, %3
  br i1 %4, label %5, label %15

5:                                                ; preds = %2
  %6 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds %struct.erow, ptr %6, i64 %7
  %9 = getelementptr inbounds nuw %struct.erow, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = add nsw i32 %10, 1
  %12 = add nsw i32 %.02, %11
  br label %13

13:                                               ; preds = %5
  %14 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !18

15:                                               ; preds = %2
  store i32 %.02, ptr %0, align 4
  %16 = add nsw i32 %.02, 1
  %17 = sext i32 %16 to i64
  %18 = call noalias ptr @malloc(i64 noundef %17) #16
  br label %19

19:                                               ; preds = %42, %15
  %.01 = phi ptr [ %18, %15 ], [ %41, %42 ]
  %.1 = phi i32 [ 0, %15 ], [ %43, %42 ]
  %20 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %21 = icmp slt i32 %.1, %20
  br i1 %21, label %22, label %44

22:                                               ; preds = %19
  %23 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %24 = sext i32 %.1 to i64
  %25 = getelementptr inbounds %struct.erow, ptr %23, i64 %24
  %26 = getelementptr inbounds nuw %struct.erow, ptr %25, i32 0, i32 3
  %27 = load ptr, ptr %26, align 8
  %28 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %29 = sext i32 %.1 to i64
  %30 = getelementptr inbounds %struct.erow, ptr %28, i64 %29
  %31 = getelementptr inbounds nuw %struct.erow, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 4
  %33 = sext i32 %32 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %.01, ptr align 1 %27, i64 %33, i1 false)
  %34 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %35 = sext i32 %.1 to i64
  %36 = getelementptr inbounds %struct.erow, ptr %34, i64 %35
  %37 = getelementptr inbounds nuw %struct.erow, ptr %36, i32 0, i32 1
  %38 = load i32, ptr %37, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, ptr %.01, i64 %39
  store i8 10, ptr %40, align 1
  %41 = getelementptr inbounds nuw i8, ptr %40, i32 1
  br label %42

42:                                               ; preds = %22
  %43 = add nsw i32 %.1, 1
  br label %19, !llvm.loop !19

44:                                               ; preds = %19
  store i8 0, ptr %.01, align 1
  ret ptr %18
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorRowInsertChar(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %1, %5
  br i1 %6, label %7, label %39

7:                                                ; preds = %3
  %8 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = sub nsw i32 %1, %9
  %11 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, %10
  %16 = add nsw i32 %15, 2
  %17 = sext i32 %16 to i64
  %18 = call ptr @realloc(ptr noundef %12, i64 noundef %17) #15
  %19 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  store ptr %18, ptr %19, align 8
  %20 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i8, ptr %21, i64 %24
  %26 = sext i32 %10 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %25, i8 32, i64 %26, i1 false)
  %27 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = add nsw i32 %30, %10
  %32 = add nsw i32 %31, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, ptr %28, i64 %33
  store i8 0, ptr %34, align 1
  %35 = add nsw i32 %10, 1
  %36 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %37 = load i32, ptr %36, align 4
  %38 = add nsw i32 %37, %35
  store i32 %38, ptr %36, align 4
  br label %65

39:                                               ; preds = %3
  %40 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %41 = load ptr, ptr %40, align 8
  %42 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %43 = load i32, ptr %42, align 4
  %44 = add nsw i32 %43, 2
  %45 = sext i32 %44 to i64
  %46 = call ptr @realloc(ptr noundef %41, i64 noundef %45) #15
  %47 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  store ptr %46, ptr %47, align 8
  %48 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %49 = load ptr, ptr %48, align 8
  %50 = sext i32 %1 to i64
  %51 = getelementptr inbounds i8, ptr %49, i64 %50
  %52 = getelementptr inbounds i8, ptr %51, i64 1
  %53 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %54 = load ptr, ptr %53, align 8
  %55 = sext i32 %1 to i64
  %56 = getelementptr inbounds i8, ptr %54, i64 %55
  %57 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %58 = load i32, ptr %57, align 4
  %59 = sub nsw i32 %58, %1
  %60 = add nsw i32 %59, 1
  %61 = sext i32 %60 to i64
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %52, ptr align 1 %56, i64 %61, i1 false)
  %62 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %63 = load i32, ptr %62, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, ptr %62, align 4
  br label %65

65:                                               ; preds = %39, %7
  %66 = trunc i32 %2 to i8
  %67 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %68 = load ptr, ptr %67, align 8
  %69 = sext i32 %1 to i64
  %70 = getelementptr inbounds i8, ptr %68, i64 %69
  store i8 %66, ptr %70, align 1
  call void @editorUpdateRow(ptr noundef %0)
  %71 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorRowAppendString(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = sext i32 %7 to i64
  %9 = add i64 %8, %2
  %10 = add i64 %9, 1
  %11 = call ptr @realloc(ptr noundef %5, i64 noundef %10) #15
  %12 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  store ptr %11, ptr %12, align 8
  %13 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %16 = load i32, ptr %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, ptr %14, i64 %17
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %18, ptr align 1 %1, i64 %2, i1 false)
  %19 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = sext i32 %20 to i64
  %22 = add i64 %21, %2
  %23 = trunc i64 %22 to i32
  store i32 %23, ptr %19, align 4
  %24 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, ptr %25, i64 %28
  store i8 0, ptr %29, align 1
  call void @editorUpdateRow(ptr noundef %0)
  %30 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorRowDelChar(ptr noundef %0, i32 noundef %1) #0 {
  %3 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  %5 = icmp sle i32 %4, %1
  br i1 %5, label %6, label %7

6:                                                ; preds = %2
  br label %26

7:                                                ; preds = %2
  %8 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %9 = load ptr, ptr %8, align 8
  %10 = sext i32 %1 to i64
  %11 = getelementptr inbounds i8, ptr %9, i64 %10
  %12 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 3
  %13 = load ptr, ptr %12, align 8
  %14 = sext i32 %1 to i64
  %15 = getelementptr inbounds i8, ptr %13, i64 %14
  %16 = getelementptr inbounds i8, ptr %15, i64 1
  %17 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = sub nsw i32 %18, %1
  %20 = sext i32 %19 to i64
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %11, ptr align 1 %16, i64 %20, i1 false)
  call void @editorUpdateRow(ptr noundef %0)
  %21 = getelementptr inbounds nuw %struct.erow, ptr %0, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = add nsw i32 %22, -1
  store i32 %23, ptr %21, align 4
  %24 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  br label %26

26:                                               ; preds = %7, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorInsertChar(i32 noundef %0) #0 {
  %2 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %3 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %4 = add nsw i32 %2, %3
  %5 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %6 = load i32, ptr @E, align 8
  %7 = add nsw i32 %5, %6
  %8 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %9 = icmp sge i32 %4, %8
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  br label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %13 = sext i32 %4 to i64
  %14 = getelementptr inbounds %struct.erow, ptr %12, i64 %13
  br label %15

15:                                               ; preds = %11, %10
  %16 = phi ptr [ null, %10 ], [ %14, %11 ]
  %17 = icmp ne ptr %16, null
  br i1 %17, label %25, label %18

18:                                               ; preds = %15
  br label %19

19:                                               ; preds = %22, %18
  %20 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %21 = icmp sle i32 %20, %4
  br i1 %21, label %22, label %24

22:                                               ; preds = %19
  %23 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  call void @editorInsertRow(i32 noundef %23, ptr noundef @.str.92, i64 noundef 0)
  br label %19, !llvm.loop !20

24:                                               ; preds = %19
  br label %25

25:                                               ; preds = %24, %15
  %26 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %27 = sext i32 %4 to i64
  %28 = getelementptr inbounds %struct.erow, ptr %26, i64 %27
  call void @editorRowInsertChar(ptr noundef %28, i32 noundef %7, i32 noundef %0)
  %29 = load i32, ptr @E, align 8
  %30 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %31 = sub nsw i32 %30, 1
  %32 = icmp eq i32 %29, %31
  br i1 %32, label %33, label %36

33:                                               ; preds = %25
  %34 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  br label %39

36:                                               ; preds = %25
  %37 = load i32, ptr @E, align 8
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr @E, align 8
  br label %39

39:                                               ; preds = %36, %33
  %40 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorInsertNewline() #0 {
  %1 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %2 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %3 = add nsw i32 %1, %2
  %4 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %5 = load i32, ptr @E, align 8
  %6 = add nsw i32 %4, %5
  %7 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %8 = icmp sge i32 %3, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %0
  br label %14

10:                                               ; preds = %0
  %11 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %12 = sext i32 %3 to i64
  %13 = getelementptr inbounds %struct.erow, ptr %11, i64 %12
  br label %14

14:                                               ; preds = %10, %9
  %15 = phi ptr [ null, %9 ], [ %13, %10 ]
  %16 = icmp ne ptr %15, null
  br i1 %16, label %22, label %17

17:                                               ; preds = %14
  %18 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %19 = icmp eq i32 %3, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  call void @editorInsertRow(i32 noundef %3, ptr noundef @.str.92, i64 noundef 0)
  br label %51

21:                                               ; preds = %17
  br label %63

22:                                               ; preds = %14
  %23 = getelementptr inbounds nuw %struct.erow, ptr %15, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = icmp sge i32 %6, %24
  br i1 %25, label %26, label %29

26:                                               ; preds = %22
  %27 = getelementptr inbounds nuw %struct.erow, ptr %15, i32 0, i32 1
  %28 = load i32, ptr %27, align 4
  br label %29

29:                                               ; preds = %26, %22
  %.0 = phi i32 [ %28, %26 ], [ %6, %22 ]
  %30 = icmp eq i32 %.0, 0
  br i1 %30, label %31, label %32

31:                                               ; preds = %29
  call void @editorInsertRow(i32 noundef %3, ptr noundef @.str.92, i64 noundef 0)
  br label %50

32:                                               ; preds = %29
  %33 = add nsw i32 %3, 1
  %34 = getelementptr inbounds nuw %struct.erow, ptr %15, i32 0, i32 3
  %35 = load ptr, ptr %34, align 8
  %36 = sext i32 %.0 to i64
  %37 = getelementptr inbounds i8, ptr %35, i64 %36
  %38 = getelementptr inbounds nuw %struct.erow, ptr %15, i32 0, i32 1
  %39 = load i32, ptr %38, align 4
  %40 = sub nsw i32 %39, %.0
  %41 = sext i32 %40 to i64
  call void @editorInsertRow(i32 noundef %33, ptr noundef %37, i64 noundef %41)
  %42 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %43 = sext i32 %3 to i64
  %44 = getelementptr inbounds %struct.erow, ptr %42, i64 %43
  %45 = getelementptr inbounds nuw %struct.erow, ptr %44, i32 0, i32 3
  %46 = load ptr, ptr %45, align 8
  %47 = sext i32 %.0 to i64
  %48 = getelementptr inbounds i8, ptr %46, i64 %47
  store i8 0, ptr %48, align 1
  %49 = getelementptr inbounds nuw %struct.erow, ptr %44, i32 0, i32 1
  store i32 %.0, ptr %49, align 4
  call void @editorUpdateRow(ptr noundef %44)
  br label %50

50:                                               ; preds = %32, %31
  br label %51

51:                                               ; preds = %50, %20
  %52 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %53 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), align 8
  %54 = sub nsw i32 %53, 1
  %55 = icmp eq i32 %52, %54
  br i1 %55, label %56, label %59

56:                                               ; preds = %51
  %57 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  br label %62

59:                                               ; preds = %51
  %60 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  br label %62

62:                                               ; preds = %59, %56
  store i32 0, ptr @E, align 8
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  br label %63

63:                                               ; preds = %62, %21
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorDelChar() #0 {
  %1 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %2 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %3 = add nsw i32 %1, %2
  %4 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %5 = load i32, ptr @E, align 8
  %6 = add nsw i32 %4, %5
  %7 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %8 = icmp sge i32 %3, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %0
  br label %14

10:                                               ; preds = %0
  %11 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %12 = sext i32 %3 to i64
  %13 = getelementptr inbounds %struct.erow, ptr %11, i64 %12
  br label %14

14:                                               ; preds = %10, %9
  %15 = phi ptr [ null, %9 ], [ %13, %10 ]
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %21

17:                                               ; preds = %14
  %18 = icmp eq i32 %6, 0
  br i1 %18, label %19, label %22

19:                                               ; preds = %17
  %20 = icmp eq i32 %3, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %19, %14
  br label %82

22:                                               ; preds = %19, %17
  %23 = icmp eq i32 %6, 0
  br i1 %23, label %24, label %62

24:                                               ; preds = %22
  %25 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %26 = sub nsw i32 %3, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.erow, ptr %25, i64 %27
  %29 = getelementptr inbounds nuw %struct.erow, ptr %28, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %32 = sub nsw i32 %3, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.erow, ptr %31, i64 %33
  %35 = getelementptr inbounds nuw %struct.erow, ptr %15, i32 0, i32 3
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds nuw %struct.erow, ptr %15, i32 0, i32 1
  %38 = load i32, ptr %37, align 4
  %39 = sext i32 %38 to i64
  call void @editorRowAppendString(ptr noundef %34, ptr noundef %36, i64 noundef %39)
  call void @editorDelRow(i32 noundef %3)
  %40 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %45

42:                                               ; preds = %24
  %43 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %44 = add nsw i32 %43, -1
  store i32 %44, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  br label %48

45:                                               ; preds = %24
  %46 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %47 = add nsw i32 %46, -1
  store i32 %47, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  br label %48

48:                                               ; preds = %45, %42
  store i32 %30, ptr @E, align 8
  %49 = load i32, ptr @E, align 8
  %50 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %51 = icmp sge i32 %49, %50
  br i1 %51, label %52, label %61

52:                                               ; preds = %48
  %53 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %54 = load i32, ptr @E, align 8
  %55 = sub nsw i32 %53, %54
  %56 = add nsw i32 %55, 1
  %57 = load i32, ptr @E, align 8
  %58 = sub nsw i32 %57, %56
  store i32 %58, ptr @E, align 8
  %59 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %60 = add nsw i32 %59, %56
  store i32 %60, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  br label %61

61:                                               ; preds = %52, %48
  br label %76

62:                                               ; preds = %22
  %63 = sub nsw i32 %6, 1
  call void @editorRowDelChar(ptr noundef %15, i32 noundef %63)
  %64 = load i32, ptr @E, align 8
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %72

66:                                               ; preds = %62
  %67 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %72

69:                                               ; preds = %66
  %70 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %71 = add nsw i32 %70, -1
  store i32 %71, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  br label %75

72:                                               ; preds = %66, %62
  %73 = load i32, ptr @E, align 8
  %74 = add nsw i32 %73, -1
  store i32 %74, ptr @E, align 8
  br label %75

75:                                               ; preds = %72, %69
  br label %76

76:                                               ; preds = %75, %61
  %.0 = phi ptr [ null, %61 ], [ %15, %75 ]
  %77 = icmp ne ptr %.0, null
  br i1 %77, label %78, label %79

78:                                               ; preds = %76
  call void @editorUpdateRow(ptr noundef %.0)
  br label %79

79:                                               ; preds = %78, %76
  %80 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  br label %82

82:                                               ; preds = %79, %21
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @editorOpen(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  %4 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 10), align 8
  call void @free(ptr noundef %4) #11
  %5 = call i64 @strlen(ptr noundef %0) #14
  %6 = add i64 %5, 1
  %7 = call noalias ptr @malloc(i64 noundef %6) #16
  store ptr %7, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 10), align 8
  %8 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 10), align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %8, ptr align 1 %0, i64 %6, i1 false)
  %9 = call ptr @fopen(ptr noundef %0, ptr noundef @.str.93)
  %10 = icmp ne ptr %9, null
  br i1 %10, label %17, label %11

11:                                               ; preds = %1
  %12 = call ptr @__errno_location() #12
  %13 = load i32, ptr %12, align 4
  %14 = icmp ne i32 %13, 2
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  call void @perror(ptr noundef @.str.94)
  call void @exit(i32 noundef 1) #13
  unreachable

16:                                               ; preds = %11
  br label %47

17:                                               ; preds = %1
  store ptr null, ptr %2, align 8
  store i64 0, ptr %3, align 8
  br label %18

18:                                               ; preds = %41, %17
  %19 = call i64 @getline(ptr noundef %2, ptr noundef %3, ptr noundef %9)
  %20 = icmp ne i64 %19, -1
  br i1 %20, label %21, label %44

21:                                               ; preds = %18
  %22 = icmp ne i64 %19, 0
  br i1 %22, label %23, label %41

23:                                               ; preds = %21
  %24 = load ptr, ptr %2, align 8
  %25 = sub nsw i64 %19, 1
  %26 = getelementptr inbounds i8, ptr %24, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp eq i32 %28, 10
  br i1 %29, label %37, label %30

30:                                               ; preds = %23
  %31 = load ptr, ptr %2, align 8
  %32 = sub nsw i64 %19, 1
  %33 = getelementptr inbounds i8, ptr %31, i64 %32
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp eq i32 %35, 13
  br i1 %36, label %37, label %41

37:                                               ; preds = %30, %23
  %38 = load ptr, ptr %2, align 8
  %39 = add nsw i64 %19, -1
  %40 = getelementptr inbounds i8, ptr %38, i64 %39
  store i8 0, ptr %40, align 1
  br label %41

41:                                               ; preds = %37, %30, %21
  %.01 = phi i64 [ %39, %37 ], [ %19, %30 ], [ %19, %21 ]
  %42 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %43 = load ptr, ptr %2, align 8
  call void @editorInsertRow(i32 noundef %42, ptr noundef %43, i64 noundef %.01)
  br label %18, !llvm.loop !21

44:                                               ; preds = %18
  %45 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %45) #11
  %46 = call i32 @fclose(ptr noundef %9)
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  br label %47

47:                                               ; preds = %44, %16
  %.0 = phi i32 [ 0, %44 ], [ 1, %16 ]
  ret i32 %.0
}

declare dso_local ptr @fopen(ptr noundef, ptr noundef) #4

declare dso_local void @perror(ptr noundef) #4

declare dso_local i64 @getline(ptr noundef, ptr noundef, ptr noundef) #4

declare dso_local i32 @fclose(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @editorSave() #0 {
  %1 = alloca i32, align 4
  %2 = call ptr @editorRowsToString(ptr noundef %1)
  %3 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 10), align 8
  %4 = call i32 (ptr, i32, ...) @open(ptr noundef %3, i32 noundef 66, i32 noundef 420)
  %5 = icmp eq i32 %4, -1
  br i1 %5, label %6, label %7

6:                                                ; preds = %0
  br label %24

7:                                                ; preds = %0
  %8 = load i32, ptr %1, align 4
  %9 = sext i32 %8 to i64
  %10 = call i32 @ftruncate(i32 noundef %4, i64 noundef %9) #11
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %12, label %13

12:                                               ; preds = %7
  br label %24

13:                                               ; preds = %7
  %14 = load i32, ptr %1, align 4
  %15 = sext i32 %14 to i64
  %16 = call i64 @write(i32 noundef %4, ptr noundef %2, i64 noundef %15)
  %17 = load i32, ptr %1, align 4
  %18 = sext i32 %17 to i64
  %19 = icmp ne i64 %16, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %13
  br label %24

21:                                               ; preds = %13
  %22 = call i32 @close(i32 noundef %4)
  call void @free(ptr noundef %2) #11
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  %23 = load i32, ptr %1, align 4
  call void (ptr, ...) @editorSetStatusMessage(ptr noundef @.str.95, i32 noundef %23)
  br label %32

24:                                               ; preds = %20, %12, %6
  call void @free(ptr noundef %2) #11
  %25 = icmp ne i32 %4, -1
  br i1 %25, label %26, label %28

26:                                               ; preds = %24
  %27 = call i32 @close(i32 noundef %4)
  br label %28

28:                                               ; preds = %26, %24
  %29 = call ptr @__errno_location() #12
  %30 = load i32, ptr %29, align 4
  %31 = call ptr @strerror(i32 noundef %30) #11
  call void (ptr, ...) @editorSetStatusMessage(ptr noundef @.str.96, ptr noundef %31)
  br label %32

32:                                               ; preds = %28, %21
  %.0 = phi i32 [ 1, %28 ], [ 0, %21 ]
  ret i32 %.0
}

declare dso_local i32 @open(ptr noundef, i32 noundef, ...) #4

; Function Attrs: nounwind
declare dso_local i32 @ftruncate(i32 noundef, i64 noundef) #1

declare dso_local i32 @close(i32 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorSetStatusMessage(ptr noundef %0, ...) #0 {
  %2 = alloca [1 x %struct.__va_list_tag], align 16
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %2, i64 0, i64 0
  call void @llvm.va_start.p0(ptr %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %2, i64 0, i64 0
  %5 = call i32 @vsnprintf(ptr noundef getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 11), i64 noundef 80, ptr noundef %0, ptr noundef %4) #11
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %2, i64 0, i64 0
  call void @llvm.va_end.p0(ptr %6)
  %7 = call i64 @time(ptr noundef null) #11
  store i64 %7, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 12), align 8
  ret void
}

; Function Attrs: nounwind
declare dso_local ptr @strerror(i32 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @abAppend(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = getelementptr inbounds nuw %struct.abuf, ptr %0, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds nuw %struct.abuf, ptr %0, i32 0, i32 1
  %7 = load i32, ptr %6, align 8
  %8 = add nsw i32 %7, %2
  %9 = sext i32 %8 to i64
  %10 = call ptr @realloc(ptr noundef %5, i64 noundef %9) #15
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %3
  br label %23

13:                                               ; preds = %3
  %14 = getelementptr inbounds nuw %struct.abuf, ptr %0, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, ptr %10, i64 %16
  %18 = sext i32 %2 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %17, ptr align 1 %1, i64 %18, i1 false)
  %19 = getelementptr inbounds nuw %struct.abuf, ptr %0, i32 0, i32 0
  store ptr %10, ptr %19, align 8
  %20 = getelementptr inbounds nuw %struct.abuf, ptr %0, i32 0, i32 1
  %21 = load i32, ptr %20, align 8
  %22 = add nsw i32 %21, %2
  store i32 %22, ptr %20, align 8
  br label %23

23:                                               ; preds = %13, %12
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @abFree(ptr noundef %0) #0 {
  %2 = getelementptr inbounds nuw %struct.abuf, ptr %0, i32 0, i32 0
  %3 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %3) #11
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorRefreshScreen() #0 {
  %1 = alloca [32 x i8], align 16
  %2 = alloca %struct.abuf, align 8
  %3 = alloca [80 x i8], align 16
  %4 = alloca i8, align 1
  %5 = alloca [16 x i8], align 16
  %6 = alloca [80 x i8], align 16
  %7 = alloca [80 x i8], align 16
  call void @llvm.memset.p0.i64(ptr align 8 %2, i8 0, i64 16, i1 false)
  call void @abAppend(ptr noundef %2, ptr noundef @.str.97, i32 noundef 6)
  call void @abAppend(ptr noundef %2, ptr noundef @.str.98, i32 noundef 3)
  br label %8

8:                                                ; preds = %121, %0
  %.0 = phi i32 [ 0, %0 ], [ %122, %121 ]
  %9 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), align 8
  %10 = icmp slt i32 %.0, %9
  br i1 %10, label %11, label %123

11:                                               ; preds = %8
  %12 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %13 = add nsw i32 %12, %.0
  %14 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %15 = icmp sge i32 %13, %14
  br i1 %15, label %16, label %41

16:                                               ; preds = %11
  %17 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %39

19:                                               ; preds = %16
  %20 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), align 8
  %21 = sdiv i32 %20, 3
  %22 = icmp eq i32 %.0, %21
  br i1 %22, label %23, label %39

23:                                               ; preds = %19
  %24 = getelementptr inbounds [80 x i8], ptr %3, i64 0, i64 0
  %25 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %24, i64 noundef 80, ptr noundef @.str.99, ptr noundef @.str.100) #11
  %26 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %27 = sub nsw i32 %26, %25
  %28 = sdiv i32 %27, 2
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %23
  call void @abAppend(ptr noundef %2, ptr noundef @.str.101, i32 noundef 1)
  %31 = add nsw i32 %28, -1
  br label %32

32:                                               ; preds = %30, %23
  %.05 = phi i32 [ %31, %30 ], [ %28, %23 ]
  br label %33

33:                                               ; preds = %36, %32
  %.16 = phi i32 [ %.05, %32 ], [ %34, %36 ]
  %34 = add nsw i32 %.16, -1
  %35 = icmp ne i32 %.16, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %33
  call void @abAppend(ptr noundef %2, ptr noundef @.str.102, i32 noundef 1)
  br label %33, !llvm.loop !22

37:                                               ; preds = %33
  %38 = getelementptr inbounds [80 x i8], ptr %3, i64 0, i64 0
  call void @abAppend(ptr noundef %2, ptr noundef %38, i32 noundef %25)
  br label %40

39:                                               ; preds = %19, %16
  call void @abAppend(ptr noundef %2, ptr noundef @.str.103, i32 noundef 7)
  br label %40

40:                                               ; preds = %39, %37
  br label %121

41:                                               ; preds = %11
  %42 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %43 = sext i32 %13 to i64
  %44 = getelementptr inbounds %struct.erow, ptr %42, i64 %43
  %45 = getelementptr inbounds nuw %struct.erow, ptr %44, i32 0, i32 2
  %46 = load i32, ptr %45, align 8
  %47 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %48 = sub nsw i32 %46, %47
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %50, label %120

50:                                               ; preds = %41
  %51 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %52 = icmp sgt i32 %48, %51
  br i1 %52, label %53, label %55

53:                                               ; preds = %50
  %54 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  br label %55

55:                                               ; preds = %53, %50
  %.07 = phi i32 [ %54, %53 ], [ %48, %50 ]
  %56 = getelementptr inbounds nuw %struct.erow, ptr %44, i32 0, i32 4
  %57 = load ptr, ptr %56, align 8
  %58 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, ptr %57, i64 %59
  %61 = getelementptr inbounds nuw %struct.erow, ptr %44, i32 0, i32 5
  %62 = load ptr, ptr %61, align 8
  %63 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i8, ptr %62, i64 %64
  br label %66

66:                                               ; preds = %117, %55
  %.011 = phi i32 [ 0, %55 ], [ %118, %117 ]
  %.08 = phi i32 [ -1, %55 ], [ %.19, %117 ]
  %67 = icmp slt i32 %.011, %.07
  br i1 %67, label %68, label %119

68:                                               ; preds = %66
  %69 = sext i32 %.011 to i64
  %70 = getelementptr inbounds i8, ptr %65, i64 %69
  %71 = load i8, ptr %70, align 1
  %72 = zext i8 %71 to i32
  %73 = icmp eq i32 %72, 1
  br i1 %73, label %74, label %89

74:                                               ; preds = %68
  call void @abAppend(ptr noundef %2, ptr noundef @.str.104, i32 noundef 4)
  %75 = sext i32 %.011 to i64
  %76 = getelementptr inbounds i8, ptr %60, i64 %75
  %77 = load i8, ptr %76, align 1
  %78 = sext i8 %77 to i32
  %79 = icmp sle i32 %78, 26
  br i1 %79, label %80, label %87

80:                                               ; preds = %74
  %81 = sext i32 %.011 to i64
  %82 = getelementptr inbounds i8, ptr %60, i64 %81
  %83 = load i8, ptr %82, align 1
  %84 = sext i8 %83 to i32
  %85 = add nsw i32 64, %84
  %86 = trunc i32 %85 to i8
  store i8 %86, ptr %4, align 1
  br label %88

87:                                               ; preds = %74
  store i8 63, ptr %4, align 1
  br label %88

88:                                               ; preds = %87, %80
  call void @abAppend(ptr noundef %2, ptr noundef %4, i32 noundef 1)
  call void @abAppend(ptr noundef %2, ptr noundef @.str.105, i32 noundef 4)
  br label %116

89:                                               ; preds = %68
  %90 = sext i32 %.011 to i64
  %91 = getelementptr inbounds i8, ptr %65, i64 %90
  %92 = load i8, ptr %91, align 1
  %93 = zext i8 %92 to i32
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %101

95:                                               ; preds = %89
  %96 = icmp ne i32 %.08, -1
  br i1 %96, label %97, label %98

97:                                               ; preds = %95
  call void @abAppend(ptr noundef %2, ptr noundef @.str.106, i32 noundef 5)
  br label %98

98:                                               ; preds = %97, %95
  %.210 = phi i32 [ -1, %97 ], [ %.08, %95 ]
  %99 = sext i32 %.011 to i64
  %100 = getelementptr inbounds i8, ptr %60, i64 %99
  call void @abAppend(ptr noundef %2, ptr noundef %100, i32 noundef 1)
  br label %115

101:                                              ; preds = %89
  %102 = sext i32 %.011 to i64
  %103 = getelementptr inbounds i8, ptr %65, i64 %102
  %104 = load i8, ptr %103, align 1
  %105 = zext i8 %104 to i32
  %106 = call i32 @editorSyntaxToColor(i32 noundef %105)
  %107 = icmp ne i32 %106, %.08
  br i1 %107, label %108, label %112

108:                                              ; preds = %101
  %109 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0
  %110 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %109, i64 noundef 16, ptr noundef @.str.107, i32 noundef %106) #11
  %111 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0
  call void @abAppend(ptr noundef %2, ptr noundef %111, i32 noundef %110)
  br label %112

112:                                              ; preds = %108, %101
  %.4 = phi i32 [ %106, %108 ], [ %.08, %101 ]
  %113 = sext i32 %.011 to i64
  %114 = getelementptr inbounds i8, ptr %60, i64 %113
  call void @abAppend(ptr noundef %2, ptr noundef %114, i32 noundef 1)
  br label %115

115:                                              ; preds = %112, %98
  %.3 = phi i32 [ %.210, %98 ], [ %.4, %112 ]
  br label %116

116:                                              ; preds = %115, %88
  %.19 = phi i32 [ %.08, %88 ], [ %.3, %115 ]
  br label %117

117:                                              ; preds = %116
  %118 = add nsw i32 %.011, 1
  br label %66, !llvm.loop !23

119:                                              ; preds = %66
  br label %120

120:                                              ; preds = %119, %41
  call void @abAppend(ptr noundef %2, ptr noundef @.str.106, i32 noundef 5)
  call void @abAppend(ptr noundef %2, ptr noundef @.str.108, i32 noundef 4)
  call void @abAppend(ptr noundef %2, ptr noundef @.str.109, i32 noundef 2)
  br label %121

121:                                              ; preds = %120, %40
  %122 = add nsw i32 %.0, 1
  br label %8, !llvm.loop !24

123:                                              ; preds = %8
  call void @abAppend(ptr noundef %2, ptr noundef @.str.108, i32 noundef 4)
  call void @abAppend(ptr noundef %2, ptr noundef @.str.104, i32 noundef 4)
  %124 = getelementptr inbounds [80 x i8], ptr %6, i64 0, i64 0
  %125 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 10), align 8
  %126 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %127 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  %128 = icmp ne i32 %127, 0
  %129 = zext i1 %128 to i64
  %130 = select i1 %128, ptr @.str.111, ptr @.str.92
  %131 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %124, i64 noundef 80, ptr noundef @.str.110, ptr noundef %125, i32 noundef %126, ptr noundef %130) #11
  %132 = getelementptr inbounds [80 x i8], ptr %7, i64 0, i64 0
  %133 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %134 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %135 = add nsw i32 %133, %134
  %136 = add nsw i32 %135, 1
  %137 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %138 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %132, i64 noundef 80, ptr noundef @.str.112, i32 noundef %136, i32 noundef %137) #11
  %139 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %140 = icmp sgt i32 %131, %139
  br i1 %140, label %141, label %143

141:                                              ; preds = %123
  %142 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  br label %143

143:                                              ; preds = %141, %123
  %.03 = phi i32 [ %142, %141 ], [ %131, %123 ]
  %144 = getelementptr inbounds [80 x i8], ptr %6, i64 0, i64 0
  call void @abAppend(ptr noundef %2, ptr noundef %144, i32 noundef %.03)
  br label %145

145:                                              ; preds = %156, %143
  %.14 = phi i32 [ %.03, %143 ], [ %155, %156 ]
  %146 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %147 = icmp slt i32 %.14, %146
  br i1 %147, label %148, label %157

148:                                              ; preds = %145
  %149 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %150 = sub nsw i32 %149, %.14
  %151 = icmp eq i32 %150, %138
  br i1 %151, label %152, label %154

152:                                              ; preds = %148
  %153 = getelementptr inbounds [80 x i8], ptr %7, i64 0, i64 0
  call void @abAppend(ptr noundef %2, ptr noundef %153, i32 noundef %138)
  br label %157

154:                                              ; preds = %148
  call void @abAppend(ptr noundef %2, ptr noundef @.str.102, i32 noundef 1)
  %155 = add nsw i32 %.14, 1
  br label %156

156:                                              ; preds = %154
  br label %145, !llvm.loop !25

157:                                              ; preds = %152, %145
  call void @abAppend(ptr noundef %2, ptr noundef @.str.113, i32 noundef 6)
  call void @abAppend(ptr noundef %2, ptr noundef @.str.108, i32 noundef 4)
  %158 = call i64 @strlen(ptr noundef getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 11)) #14
  %159 = trunc i64 %158 to i32
  %160 = icmp ne i32 %159, 0
  br i1 %160, label %161, label %174

161:                                              ; preds = %157
  %162 = call i64 @time(ptr noundef null) #11
  %163 = load i64, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 12), align 8
  %164 = sub nsw i64 %162, %163
  %165 = icmp slt i64 %164, 5
  br i1 %165, label %166, label %174

166:                                              ; preds = %161
  %167 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %168 = icmp sle i32 %159, %167
  br i1 %168, label %169, label %170

169:                                              ; preds = %166
  br label %172

170:                                              ; preds = %166
  %171 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  br label %172

172:                                              ; preds = %170, %169
  %173 = phi i32 [ %159, %169 ], [ %171, %170 ]
  call void @abAppend(ptr noundef %2, ptr noundef getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 11), i32 noundef %173)
  br label %174

174:                                              ; preds = %172, %161, %157
  %175 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %176 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %177 = add nsw i32 %175, %176
  %178 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %179 = icmp sge i32 %177, %178
  br i1 %179, label %180, label %181

180:                                              ; preds = %174
  br label %185

181:                                              ; preds = %174
  %182 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %183 = sext i32 %177 to i64
  %184 = getelementptr inbounds %struct.erow, ptr %182, i64 %183
  br label %185

185:                                              ; preds = %181, %180
  %186 = phi ptr [ null, %180 ], [ %184, %181 ]
  %187 = icmp ne ptr %186, null
  br i1 %187, label %188, label %216

188:                                              ; preds = %185
  %189 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  br label %190

190:                                              ; preds = %213, %188
  %.02 = phi i32 [ %189, %188 ], [ %214, %213 ]
  %.1 = phi i32 [ 1, %188 ], [ %212, %213 ]
  %191 = load i32, ptr @E, align 8
  %192 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %193 = add nsw i32 %191, %192
  %194 = icmp slt i32 %.02, %193
  br i1 %194, label %195, label %215

195:                                              ; preds = %190
  %196 = getelementptr inbounds nuw %struct.erow, ptr %186, i32 0, i32 1
  %197 = load i32, ptr %196, align 4
  %198 = icmp slt i32 %.02, %197
  br i1 %198, label %199, label %211

199:                                              ; preds = %195
  %200 = getelementptr inbounds nuw %struct.erow, ptr %186, i32 0, i32 3
  %201 = load ptr, ptr %200, align 8
  %202 = sext i32 %.02 to i64
  %203 = getelementptr inbounds i8, ptr %201, i64 %202
  %204 = load i8, ptr %203, align 1
  %205 = sext i8 %204 to i32
  %206 = icmp eq i32 %205, 9
  br i1 %206, label %207, label %211

207:                                              ; preds = %199
  %208 = srem i32 %.1, 8
  %209 = sub nsw i32 7, %208
  %210 = add nsw i32 %.1, %209
  br label %211

211:                                              ; preds = %207, %199, %195
  %.2 = phi i32 [ %210, %207 ], [ %.1, %199 ], [ %.1, %195 ]
  %212 = add nsw i32 %.2, 1
  br label %213

213:                                              ; preds = %211
  %214 = add nsw i32 %.02, 1
  br label %190, !llvm.loop !26

215:                                              ; preds = %190
  br label %216

216:                                              ; preds = %215, %185
  %.01 = phi i32 [ %.1, %215 ], [ 1, %185 ]
  %217 = getelementptr inbounds [32 x i8], ptr %1, i64 0, i64 0
  %218 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %219 = add nsw i32 %218, 1
  %220 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %217, i64 noundef 32, ptr noundef @.str.89, i32 noundef %219, i32 noundef %.01) #11
  %221 = getelementptr inbounds [32 x i8], ptr %1, i64 0, i64 0
  %222 = getelementptr inbounds [32 x i8], ptr %1, i64 0, i64 0
  %223 = call i64 @strlen(ptr noundef %222) #14
  %224 = trunc i64 %223 to i32
  call void @abAppend(ptr noundef %2, ptr noundef %221, i32 noundef %224)
  call void @abAppend(ptr noundef %2, ptr noundef @.str.114, i32 noundef 6)
  %225 = getelementptr inbounds nuw %struct.abuf, ptr %2, i32 0, i32 0
  %226 = load ptr, ptr %225, align 8
  %227 = getelementptr inbounds nuw %struct.abuf, ptr %2, i32 0, i32 1
  %228 = load i32, ptr %227, align 8
  %229 = sext i32 %228 to i64
  %230 = call i64 @write(i32 noundef 1, ptr noundef %226, i64 noundef %229)
  call void @abFree(ptr noundef %2)
  ret void
}

; Function Attrs: nounwind
declare dso_local i64 @time(ptr noundef) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start.p0(ptr) #10

; Function Attrs: nounwind
declare dso_local i32 @vsnprintf(ptr noundef, i64 noundef, ptr noundef, ptr noundef) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end.p0(ptr) #10

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorFind(i32 noundef %0) #0 {
  %2 = alloca [257 x i8], align 16
  call void @llvm.memset.p0.i64(ptr align 16 %2, i8 0, i64 257, i1 false)
  %3 = load i32, ptr @E, align 8
  %4 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %5 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %6 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  br label %7

7:                                                ; preds = %175, %1
  %.022 = phi ptr [ null, %1 ], [ %.123, %175 ]
  %.018 = phi i32 [ -1, %1 ], [ %.119, %175 ]
  %.012 = phi i32 [ 0, %1 ], [ %.517, %175 ]
  %.05 = phi i32 [ -1, %1 ], [ %.611, %175 ]
  %.01 = phi i32 [ 0, %1 ], [ %.23, %175 ]
  %8 = getelementptr inbounds [257 x i8], ptr %2, i64 0, i64 0
  call void (ptr, ...) @editorSetStatusMessage(ptr noundef @.str.115, ptr noundef %8)
  call void @editorRefreshScreen()
  %9 = call i32 @editorReadKey(i32 noundef %0)
  %10 = icmp eq i32 %9, 1004
  br i1 %10, label %15, label %11

11:                                               ; preds = %7
  %12 = icmp eq i32 %9, 8
  br i1 %12, label %15, label %13

13:                                               ; preds = %11
  %14 = icmp eq i32 %9, 127
  br i1 %14, label %15, label %22

15:                                               ; preds = %13, %11, %7
  %16 = icmp ne i32 %.01, 0
  br i1 %16, label %17, label %21

17:                                               ; preds = %15
  %18 = add nsw i32 %.01, -1
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [257 x i8], ptr %2, i64 0, i64 %19
  store i8 0, ptr %20, align 1
  br label %21

21:                                               ; preds = %17, %15
  %.12 = phi i32 [ %18, %17 ], [ %.01, %15 ]
  br label %79

22:                                               ; preds = %13
  %23 = icmp eq i32 %9, 27
  br i1 %23, label %26, label %24

24:                                               ; preds = %22
  %25 = icmp eq i32 %9, 13
  br i1 %25, label %26, label %46

26:                                               ; preds = %24, %22
  %27 = icmp eq i32 %9, 27
  br i1 %27, label %28, label %29

28:                                               ; preds = %26
  store i32 %3, ptr @E, align 8
  store i32 %4, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  store i32 %5, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  store i32 %6, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  br label %29

29:                                               ; preds = %28, %26
  br label %30

30:                                               ; preds = %29
  %31 = icmp ne ptr %.022, null
  br i1 %31, label %32, label %44

32:                                               ; preds = %30
  %33 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %34 = sext i32 %.018 to i64
  %35 = getelementptr inbounds %struct.erow, ptr %33, i64 %34
  %36 = getelementptr inbounds nuw %struct.erow, ptr %35, i32 0, i32 5
  %37 = load ptr, ptr %36, align 8
  %38 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %39 = sext i32 %.018 to i64
  %40 = getelementptr inbounds %struct.erow, ptr %38, i64 %39
  %41 = getelementptr inbounds nuw %struct.erow, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %41, align 8
  %43 = sext i32 %42 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %37, ptr align 1 %.022, i64 %43, i1 false)
  call void @free(ptr noundef %.022) #11
  br label %44

44:                                               ; preds = %32, %30
  br label %45

45:                                               ; preds = %44
  call void (ptr, ...) @editorSetStatusMessage(ptr noundef @.str.92)
  ret void

46:                                               ; preds = %24
  %47 = icmp eq i32 %9, 1001
  br i1 %47, label %50, label %48

48:                                               ; preds = %46
  %49 = icmp eq i32 %9, 1003
  br i1 %49, label %50, label %51

50:                                               ; preds = %48, %46
  br label %77

51:                                               ; preds = %48
  %52 = icmp eq i32 %9, 1000
  br i1 %52, label %55, label %53

53:                                               ; preds = %51
  %54 = icmp eq i32 %9, 1002
  br i1 %54, label %55, label %56

55:                                               ; preds = %53, %51
  br label %76

56:                                               ; preds = %53
  %57 = call ptr @__ctype_b_loc() #12
  %58 = load ptr, ptr %57, align 8
  %59 = sext i32 %9 to i64
  %60 = getelementptr inbounds i16, ptr %58, i64 %59
  %61 = load i16, ptr %60, align 2
  %62 = zext i16 %61 to i32
  %63 = and i32 %62, 16384
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %75

65:                                               ; preds = %56
  %66 = icmp slt i32 %.01, 256
  br i1 %66, label %67, label %74

67:                                               ; preds = %65
  %68 = trunc i32 %9 to i8
  %69 = add nsw i32 %.01, 1
  %70 = sext i32 %.01 to i64
  %71 = getelementptr inbounds [257 x i8], ptr %2, i64 0, i64 %70
  store i8 %68, ptr %71, align 1
  %72 = sext i32 %69 to i64
  %73 = getelementptr inbounds [257 x i8], ptr %2, i64 0, i64 %72
  store i8 0, ptr %73, align 1
  br label %74

74:                                               ; preds = %67, %65
  %.510 = phi i32 [ -1, %67 ], [ %.05, %65 ]
  %.6 = phi i32 [ %69, %67 ], [ %.01, %65 ]
  br label %75

75:                                               ; preds = %74, %56
  %.49 = phi i32 [ %.510, %74 ], [ %.05, %56 ]
  %.5 = phi i32 [ %.6, %74 ], [ %.01, %56 ]
  br label %76

76:                                               ; preds = %75, %55
  %.315 = phi i32 [ -1, %55 ], [ %.012, %75 ]
  %.38 = phi i32 [ %.05, %55 ], [ %.49, %75 ]
  %.4 = phi i32 [ %.01, %55 ], [ %.5, %75 ]
  br label %77

77:                                               ; preds = %76, %50
  %.214 = phi i32 [ 1, %50 ], [ %.315, %76 ]
  %.27 = phi i32 [ %.05, %50 ], [ %.38, %76 ]
  %.34 = phi i32 [ %.01, %50 ], [ %.4, %76 ]
  br label %78

78:                                               ; preds = %77
  br label %79

79:                                               ; preds = %78, %21
  %.113 = phi i32 [ %.012, %21 ], [ %.214, %78 ]
  %.16 = phi i32 [ -1, %21 ], [ %.27, %78 ]
  %.23 = phi i32 [ %.12, %21 ], [ %.34, %78 ]
  %80 = icmp eq i32 %.16, -1
  br i1 %80, label %81, label %82

81:                                               ; preds = %79
  br label %82

82:                                               ; preds = %81, %79
  %.416 = phi i32 [ 1, %81 ], [ %.113, %79 ]
  %83 = icmp ne i32 %.416, 0
  br i1 %83, label %84, label %175

84:                                               ; preds = %82
  br label %85

85:                                               ; preds = %119, %84
  %.029 = phi ptr [ null, %84 ], [ %106, %119 ]
  %.027 = phi i32 [ 0, %84 ], [ %120, %119 ]
  %.0 = phi i32 [ %.16, %84 ], [ %.2, %119 ]
  %86 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %87 = icmp slt i32 %.027, %86
  br i1 %87, label %88, label %121

88:                                               ; preds = %85
  %89 = add nsw i32 %.0, %.416
  %90 = icmp eq i32 %89, -1
  br i1 %90, label %91, label %94

91:                                               ; preds = %88
  %92 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %93 = sub nsw i32 %92, 1
  br label %99

94:                                               ; preds = %88
  %95 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %96 = icmp eq i32 %89, %95
  br i1 %96, label %97, label %98

97:                                               ; preds = %94
  br label %98

98:                                               ; preds = %97, %94
  %.3 = phi i32 [ 0, %97 ], [ %89, %94 ]
  br label %99

99:                                               ; preds = %98, %91
  %.2 = phi i32 [ %93, %91 ], [ %.3, %98 ]
  %100 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %101 = sext i32 %.2 to i64
  %102 = getelementptr inbounds %struct.erow, ptr %100, i64 %101
  %103 = getelementptr inbounds nuw %struct.erow, ptr %102, i32 0, i32 4
  %104 = load ptr, ptr %103, align 8
  %105 = getelementptr inbounds [257 x i8], ptr %2, i64 0, i64 0
  %106 = call ptr @strstr(ptr noundef %104, ptr noundef %105) #14
  %107 = icmp ne ptr %106, null
  br i1 %107, label %108, label %118

108:                                              ; preds = %99
  %109 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %110 = sext i32 %.2 to i64
  %111 = getelementptr inbounds %struct.erow, ptr %109, i64 %110
  %112 = getelementptr inbounds nuw %struct.erow, ptr %111, i32 0, i32 4
  %113 = load ptr, ptr %112, align 8
  %114 = ptrtoint ptr %106 to i64
  %115 = ptrtoint ptr %113 to i64
  %116 = sub i64 %114, %115
  %117 = trunc i64 %116 to i32
  br label %121

118:                                              ; preds = %99
  br label %119

119:                                              ; preds = %118
  %120 = add nsw i32 %.027, 1
  br label %85, !llvm.loop !27

121:                                              ; preds = %108, %85
  %.130 = phi ptr [ %106, %108 ], [ %.029, %85 ]
  %.028 = phi i32 [ %117, %108 ], [ 0, %85 ]
  %.1 = phi i32 [ %.2, %108 ], [ %.0, %85 ]
  br label %122

122:                                              ; preds = %121
  %123 = icmp ne ptr %.022, null
  br i1 %123, label %124, label %136

124:                                              ; preds = %122
  %125 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %126 = sext i32 %.018 to i64
  %127 = getelementptr inbounds %struct.erow, ptr %125, i64 %126
  %128 = getelementptr inbounds nuw %struct.erow, ptr %127, i32 0, i32 5
  %129 = load ptr, ptr %128, align 8
  %130 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %131 = sext i32 %.018 to i64
  %132 = getelementptr inbounds %struct.erow, ptr %130, i64 %131
  %133 = getelementptr inbounds nuw %struct.erow, ptr %132, i32 0, i32 2
  %134 = load i32, ptr %133, align 8
  %135 = sext i32 %134 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %129, ptr align 1 %.022, i64 %135, i1 false)
  call void @free(ptr noundef %.022) #11
  br label %136

136:                                              ; preds = %124, %122
  %.224 = phi ptr [ null, %124 ], [ %.022, %122 ]
  br label %137

137:                                              ; preds = %136
  %138 = icmp ne ptr %.130, null
  br i1 %138, label %139, label %174

139:                                              ; preds = %137
  %140 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %141 = sext i32 %.1 to i64
  %142 = getelementptr inbounds %struct.erow, ptr %140, i64 %141
  %143 = getelementptr inbounds nuw %struct.erow, ptr %142, i32 0, i32 5
  %144 = load ptr, ptr %143, align 8
  %145 = icmp ne ptr %144, null
  br i1 %145, label %146, label %161

146:                                              ; preds = %139
  %147 = getelementptr inbounds nuw %struct.erow, ptr %142, i32 0, i32 2
  %148 = load i32, ptr %147, align 8
  %149 = sext i32 %148 to i64
  %150 = call noalias ptr @malloc(i64 noundef %149) #16
  %151 = getelementptr inbounds nuw %struct.erow, ptr %142, i32 0, i32 5
  %152 = load ptr, ptr %151, align 8
  %153 = getelementptr inbounds nuw %struct.erow, ptr %142, i32 0, i32 2
  %154 = load i32, ptr %153, align 8
  %155 = sext i32 %154 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %150, ptr align 1 %152, i64 %155, i1 false)
  %156 = getelementptr inbounds nuw %struct.erow, ptr %142, i32 0, i32 5
  %157 = load ptr, ptr %156, align 8
  %158 = sext i32 %.028 to i64
  %159 = getelementptr inbounds i8, ptr %157, i64 %158
  %160 = sext i32 %.23 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %159, i8 8, i64 %160, i1 false)
  br label %161

161:                                              ; preds = %146, %139
  %.426 = phi ptr [ %150, %146 ], [ %.224, %139 ]
  %.321 = phi i32 [ %.1, %146 ], [ %.018, %139 ]
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  store i32 %.028, ptr @E, align 8
  store i32 %.1, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %162 = load i32, ptr @E, align 8
  %163 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %164 = icmp sgt i32 %162, %163
  br i1 %164, label %165, label %173

165:                                              ; preds = %161
  %166 = load i32, ptr @E, align 8
  %167 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %168 = sub nsw i32 %166, %167
  %169 = load i32, ptr @E, align 8
  %170 = sub nsw i32 %169, %168
  store i32 %170, ptr @E, align 8
  %171 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %172 = add nsw i32 %171, %168
  store i32 %172, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  br label %173

173:                                              ; preds = %165, %161
  br label %174

174:                                              ; preds = %173, %137
  %.325 = phi ptr [ %.426, %173 ], [ %.224, %137 ]
  %.220 = phi i32 [ %.321, %173 ], [ %.018, %137 ]
  %.7 = phi i32 [ %.1, %173 ], [ %.16, %137 ]
  br label %175

175:                                              ; preds = %174, %82
  %.123 = phi ptr [ %.325, %174 ], [ %.022, %82 ]
  %.119 = phi i32 [ %.220, %174 ], [ %.018, %82 ]
  %.517 = phi i32 [ 0, %174 ], [ %.416, %82 ]
  %.611 = phi i32 [ %.7, %174 ], [ %.16, %82 ]
  br label %7
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorMoveCursor(i32 noundef %0) #0 {
  %2 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %3 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %4 = add nsw i32 %2, %3
  %5 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %6 = load i32, ptr @E, align 8
  %7 = add nsw i32 %5, %6
  %8 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %9 = icmp sge i32 %4, %8
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  br label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %13 = sext i32 %4 to i64
  %14 = getelementptr inbounds %struct.erow, ptr %12, i64 %13
  br label %15

15:                                               ; preds = %11, %10
  %16 = phi ptr [ null, %10 ], [ %14, %11 ]
  switch i32 %0, label %123 [
    i32 1000, label %17
    i32 1001, label %55
    i32 1002, label %93
    i32 1003, label %107
  ]

17:                                               ; preds = %15
  %18 = load i32, ptr @E, align 8
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %51

20:                                               ; preds = %17
  %21 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %26

23:                                               ; preds = %20
  %24 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %25 = add nsw i32 %24, -1
  store i32 %25, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  br label %50

26:                                               ; preds = %20
  %27 = icmp sgt i32 %4, 0
  br i1 %27, label %28, label %49

28:                                               ; preds = %26
  %29 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %30 = add nsw i32 %29, -1
  store i32 %30, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %31 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %32 = sub nsw i32 %4, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.erow, ptr %31, i64 %33
  %35 = getelementptr inbounds nuw %struct.erow, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 4
  store i32 %36, ptr @E, align 8
  %37 = load i32, ptr @E, align 8
  %38 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %39 = sub nsw i32 %38, 1
  %40 = icmp sgt i32 %37, %39
  br i1 %40, label %41, label %48

41:                                               ; preds = %28
  %42 = load i32, ptr @E, align 8
  %43 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %44 = sub nsw i32 %42, %43
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %46 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %47 = sub nsw i32 %46, 1
  store i32 %47, ptr @E, align 8
  br label %48

48:                                               ; preds = %41, %28
  br label %49

49:                                               ; preds = %48, %26
  br label %50

50:                                               ; preds = %49, %23
  br label %54

51:                                               ; preds = %17
  %52 = load i32, ptr @E, align 8
  %53 = sub nsw i32 %52, 1
  store i32 %53, ptr @E, align 8
  br label %54

54:                                               ; preds = %51, %50
  br label %123

55:                                               ; preds = %15
  %56 = icmp ne ptr %16, null
  br i1 %56, label %57, label %73

57:                                               ; preds = %55
  %58 = getelementptr inbounds nuw %struct.erow, ptr %16, i32 0, i32 1
  %59 = load i32, ptr %58, align 4
  %60 = icmp slt i32 %7, %59
  br i1 %60, label %61, label %73

61:                                               ; preds = %57
  %62 = load i32, ptr @E, align 8
  %63 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %64 = sub nsw i32 %63, 1
  %65 = icmp eq i32 %62, %64
  br i1 %65, label %66, label %69

66:                                               ; preds = %61
  %67 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  br label %72

69:                                               ; preds = %61
  %70 = load i32, ptr @E, align 8
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr @E, align 8
  br label %72

72:                                               ; preds = %69, %66
  br label %92

73:                                               ; preds = %57, %55
  %74 = icmp ne ptr %16, null
  br i1 %74, label %75, label %91

75:                                               ; preds = %73
  %76 = getelementptr inbounds nuw %struct.erow, ptr %16, i32 0, i32 1
  %77 = load i32, ptr %76, align 4
  %78 = icmp eq i32 %7, %77
  br i1 %78, label %79, label %91

79:                                               ; preds = %75
  store i32 0, ptr @E, align 8
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %80 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %81 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), align 8
  %82 = sub nsw i32 %81, 1
  %83 = icmp eq i32 %80, %82
  br i1 %83, label %84, label %87

84:                                               ; preds = %79
  %85 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  br label %90

87:                                               ; preds = %79
  %88 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  br label %90

90:                                               ; preds = %87, %84
  br label %91

91:                                               ; preds = %90, %75, %73
  br label %92

92:                                               ; preds = %91, %72
  br label %123

93:                                               ; preds = %15
  %94 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %103

96:                                               ; preds = %93
  %97 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %99, label %102

99:                                               ; preds = %96
  %100 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %101 = add nsw i32 %100, -1
  store i32 %101, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  br label %102

102:                                              ; preds = %99, %96
  br label %106

103:                                              ; preds = %93
  %104 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %105 = sub nsw i32 %104, 1
  store i32 %105, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  br label %106

106:                                              ; preds = %103, %102
  br label %123

107:                                              ; preds = %15
  %108 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %109 = icmp slt i32 %4, %108
  br i1 %109, label %110, label %122

110:                                              ; preds = %107
  %111 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %112 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), align 8
  %113 = sub nsw i32 %112, 1
  %114 = icmp eq i32 %111, %113
  br i1 %114, label %115, label %118

115:                                              ; preds = %110
  %116 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  br label %121

118:                                              ; preds = %110
  %119 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  br label %121

121:                                              ; preds = %118, %115
  br label %122

122:                                              ; preds = %121, %107
  br label %123

123:                                              ; preds = %122, %106, %92, %54, %15
  %124 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  %125 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %126 = add nsw i32 %124, %125
  %127 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %128 = load i32, ptr @E, align 8
  %129 = add nsw i32 %127, %128
  %130 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  %131 = icmp sge i32 %126, %130
  br i1 %131, label %132, label %133

132:                                              ; preds = %123
  br label %137

133:                                              ; preds = %123
  %134 = load ptr, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  %135 = sext i32 %126 to i64
  %136 = getelementptr inbounds %struct.erow, ptr %134, i64 %135
  br label %137

137:                                              ; preds = %133, %132
  %138 = phi ptr [ null, %132 ], [ %136, %133 ]
  %139 = icmp ne ptr %138, null
  br i1 %139, label %140, label %143

140:                                              ; preds = %137
  %141 = getelementptr inbounds nuw %struct.erow, ptr %138, i32 0, i32 1
  %142 = load i32, ptr %141, align 4
  br label %144

143:                                              ; preds = %137
  br label %144

144:                                              ; preds = %143, %140
  %145 = phi i32 [ %142, %140 ], [ 0, %143 ]
  %146 = icmp sgt i32 %129, %145
  br i1 %146, label %147, label %158

147:                                              ; preds = %144
  %148 = sub nsw i32 %129, %145
  %149 = load i32, ptr @E, align 8
  %150 = sub nsw i32 %149, %148
  store i32 %150, ptr @E, align 8
  %151 = load i32, ptr @E, align 8
  %152 = icmp slt i32 %151, 0
  br i1 %152, label %153, label %157

153:                                              ; preds = %147
  %154 = load i32, ptr @E, align 8
  %155 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  %156 = add nsw i32 %155, %154
  store i32 %156, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  store i32 0, ptr @E, align 8
  br label %157

157:                                              ; preds = %153, %147
  br label %158

158:                                              ; preds = %157, %144
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @editorProcessKeypress(i32 noundef %0) #0 {
  %2 = call i32 @editorReadKey(i32 noundef %0)
  switch i32 %2, label %50 [
    i32 13, label %3
    i32 3, label %4
    i32 17, label %5
    i32 19, label %16
    i32 6, label %18
    i32 127, label %19
    i32 8, label %19
    i32 1004, label %19
    i32 1007, label %20
    i32 1008, label %20
    i32 1002, label %47
    i32 1003, label %47
    i32 1000, label %47
    i32 1001, label %47
    i32 12, label %48
    i32 27, label %49
  ]

3:                                                ; preds = %1
  call void @editorInsertNewline()
  br label %51

4:                                                ; preds = %1
  br label %51

5:                                                ; preds = %1
  %6 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %15

8:                                                ; preds = %5
  %9 = load i32, ptr @editorProcessKeypress.quit_times, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %8
  %12 = load i32, ptr @editorProcessKeypress.quit_times, align 4
  call void (ptr, ...) @editorSetStatusMessage(ptr noundef @.str.116, i32 noundef %12)
  %13 = load i32, ptr @editorProcessKeypress.quit_times, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, ptr @editorProcessKeypress.quit_times, align 4
  br label %52

15:                                               ; preds = %8, %5
  call void @exit(i32 noundef 0) #13
  unreachable

16:                                               ; preds = %1
  %17 = call i32 @editorSave()
  br label %51

18:                                               ; preds = %1
  call void @editorFind(i32 noundef %0)
  br label %51

19:                                               ; preds = %1, %1, %1
  call void @editorDelChar()
  br label %51

20:                                               ; preds = %1, %1
  %21 = icmp eq i32 %2, 1007
  br i1 %21, label %22, label %26

22:                                               ; preds = %20
  %23 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %22
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  br label %37

26:                                               ; preds = %22, %20
  %27 = icmp eq i32 %2, 1008
  br i1 %27, label %28, label %36

28:                                               ; preds = %26
  %29 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %30 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), align 8
  %31 = sub nsw i32 %30, 1
  %32 = icmp ne i32 %29, %31
  br i1 %32, label %33, label %36

33:                                               ; preds = %28
  %34 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), align 8
  %35 = sub nsw i32 %34, 1
  store i32 %35, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  br label %36

36:                                               ; preds = %33, %28, %26
  br label %37

37:                                               ; preds = %36, %25
  %38 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), align 8
  br label %39

39:                                               ; preds = %42, %37
  %.0 = phi i32 [ %38, %37 ], [ %40, %42 ]
  %40 = add nsw i32 %.0, -1
  %41 = icmp ne i32 %.0, 0
  br i1 %41, label %42, label %46

42:                                               ; preds = %39
  %43 = icmp eq i32 %2, 1007
  %44 = zext i1 %43 to i64
  %45 = select i1 %43, i32 1002, i32 1003
  call void @editorMoveCursor(i32 noundef %45)
  br label %39, !llvm.loop !28

46:                                               ; preds = %39
  br label %51

47:                                               ; preds = %1, %1, %1, %1
  call void @editorMoveCursor(i32 noundef %2)
  br label %51

48:                                               ; preds = %1
  br label %51

49:                                               ; preds = %1
  br label %51

50:                                               ; preds = %1
  call void @editorInsertChar(i32 noundef %2)
  br label %51

51:                                               ; preds = %50, %49, %48, %47, %46, %19, %18, %16, %4, %3
  store i32 3, ptr @editorProcessKeypress.quit_times, align 4
  br label %52

52:                                               ; preds = %51, %11
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @editorFileWasModified() #0 {
  %1 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @updateWindowSize() #0 {
  %1 = call i32 @getWindowSize(i32 noundef 0, i32 noundef 1, ptr noundef getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), ptr noundef getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5))
  %2 = icmp eq i32 %1, -1
  br i1 %2, label %3, label %4

3:                                                ; preds = %0
  call void @perror(ptr noundef @.str.117)
  call void @exit(i32 noundef 1) #13
  unreachable

4:                                                ; preds = %0
  %5 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), align 8
  %6 = sub nsw i32 %5, 2
  store i32 %6, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @handleSigWinCh(i32 noundef %0) #0 {
  call void @updateWindowSize()
  %2 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  %3 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), align 8
  %4 = icmp sgt i32 %2, %3
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 4), align 8
  %7 = sub nsw i32 %6, 1
  store i32 %7, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  br label %8

8:                                                ; preds = %5, %1
  %9 = load i32, ptr @E, align 8
  %10 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %11 = icmp sgt i32 %9, %10
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  %13 = load i32, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 5), align 4
  %14 = sub nsw i32 %13, 1
  store i32 %14, ptr @E, align 8
  br label %15

15:                                               ; preds = %12, %8
  call void @editorRefreshScreen()
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @initEditor() #0 {
  store i32 0, ptr @E, align 8
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 1), align 4
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 2), align 8
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 3), align 4
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 6), align 8
  store ptr null, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 8), align 8
  store i32 0, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 9), align 8
  store ptr null, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 10), align 8
  store ptr null, ptr getelementptr inbounds nuw (%struct.editorConfig, ptr @E, i32 0, i32 13), align 8
  call void @updateWindowSize()
  %1 = call ptr @__sysv_signal(i32 noundef 28, ptr noundef @handleSigWinCh) #11
  ret void
}

; Function Attrs: nounwind
declare dso_local ptr @__sysv_signal(i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp ne i32 %0, 2
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  %5 = load ptr, ptr @stderr, align 8
  %6 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.118) #11
  call void @exit(i32 noundef 1) #13
  unreachable

7:                                                ; preds = %2
  call void @initEditor()
  %8 = getelementptr inbounds ptr, ptr %1, i64 1
  %9 = load ptr, ptr %8, align 8
  call void @editorSelectSyntaxHighlight(ptr noundef %9)
  %10 = getelementptr inbounds ptr, ptr %1, i64 1
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 @editorOpen(ptr noundef %11)
  %13 = call i32 @enableRawMode(i32 noundef 0)
  call void (ptr, ...) @editorSetStatusMessage(ptr noundef @.str.119)
  br label %14

14:                                               ; preds = %14, %7
  call void @editorRefreshScreen()
  call void @editorProcessKeypress(i32 noundef 0)
  br label %14
}

; Function Attrs: nounwind
declare dso_local i32 @fprintf(ptr noundef, ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #9 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nocallback nofree nosync nounwind willreturn }
attributes #11 = { nounwind }
attributes #12 = { nounwind willreturn memory(none) }
attributes #13 = { noreturn nounwind }
attributes #14 = { nounwind willreturn memory(read) }
attributes #15 = { nounwind allocsize(1) }
attributes #16 = { nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 7, !"Dwarf Version", i32 4}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 21.1.8 (RESF 21.1.8-1.module+el8.10.0+40180+8e26bdb3)"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
!18 = distinct !{!18, !6}
!19 = distinct !{!19, !6}
!20 = distinct !{!20, !6}
!21 = distinct !{!21, !6}
!22 = distinct !{!22, !6}
!23 = distinct !{!23, !6}
!24 = distinct !{!24, !6}
!25 = distinct !{!25, !6}
!26 = distinct !{!26, !6}
!27 = distinct !{!27, !6}
!28 = distinct !{!28, !6}
