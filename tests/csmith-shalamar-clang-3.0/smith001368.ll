; ModuleID = '/home/david/src/c-semantics/tests/csmith/smith001368.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [4 x i32] [i32 -447125152, i32 -447125152, i32 -447125152, i32 -447125152], align 16
@g_2 = global i32* bitcast (i8* getelementptr (i8* bitcast ([4 x i32]* @g_3 to i8*), i64 8) to i32*), align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_3[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_3[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_3[3] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
  %1 = load volatile i32** @g_2, align 8
  store volatile i32* %1, i32** @g_2, align 8
  %2 = load i32* getelementptr inbounds ([4 x i32]* @g_3, i32 0, i64 2), align 4
  %3 = trunc i32 %2 to i16
  ret i16 %3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call signext i16 @func_1()
  %5 = load i32* getelementptr inbounds ([4 x i32]* @g_3, i32 0, i64 0), align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load i32* getelementptr inbounds ([4 x i32]* @g_3, i32 0, i64 1), align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7)
  %9 = load i32* getelementptr inbounds ([4 x i32]* @g_3, i32 0, i64 2), align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %9)
  %11 = load i32* getelementptr inbounds ([4 x i32]* @g_3, i32 0, i64 3), align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %13 = load i32* getelementptr inbounds ([4 x i32]* @g_3, i32 0, i64 2), align 4
  %14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %13)
  %15 = load i32* %1
  ret i32 %15
}

declare i32 @printf(i8*, ...)