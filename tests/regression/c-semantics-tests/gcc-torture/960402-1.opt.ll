; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960402-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i64 %x) nounwind uwtable readnone {
entry:
  %x.off = add i64 %x, 2147483648
  %0 = icmp ugt i64 %x.off, 6442450943
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
