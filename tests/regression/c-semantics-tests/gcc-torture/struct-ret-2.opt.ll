; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/struct-ret-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define zeroext i8 @f() nounwind uwtable readnone {
entry:
  ret i8 -85
}

define zeroext i16 @g() nounwind uwtable readnone {
entry:
  ret i16 4660
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
