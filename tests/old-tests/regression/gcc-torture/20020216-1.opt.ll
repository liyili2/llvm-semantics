; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020216-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@c = global i8 -1, align 1

define i32 @foo() nounwind uwtable readonly {
entry:
  %tmp = load i8* @c, align 1
  %conv = sext i8 %tmp to i32
  %conv1 = and i32 %conv, 65535
  %xor = xor i32 %conv1, -103
  ret i32 %xor
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp.i = load i8* @c, align 1
  %conv.i = sext i8 %tmp.i to i32
  %conv1.i = and i32 %conv.i, 65535
  %cmp = icmp eq i32 %conv1.i, 65535
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
