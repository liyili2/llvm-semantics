; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foobar(i32 %x, i32 %y, i32 %z) noreturn nounwind uwtable {
entry:
  %bf.value = and i32 %x, 1
  %bf.clear = and i32 %y, 3
  %cmp = icmp eq i32 %bf.value, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %sub = sub nsw i32 %bf.clear, %bf.value
  %mul = mul nsw i32 %sub, %bf.clear
  %add = add nsw i32 %mul, %z
  %bf.clear11 = and i32 %add, 7
  %cmp12 = icmp eq i32 %bf.clear11, 5
  br i1 %cmp12, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @foobar(i32 1, i32 2, i32 3)
  unreachable
}
