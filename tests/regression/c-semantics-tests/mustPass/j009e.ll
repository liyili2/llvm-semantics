; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j009e.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32* @f(i32 %z) nounwind uwtable {
entry:
  %z.addr = alloca i32, align 4
  store i32 %z, i32* %z.addr, align 4
  ret i32* %z.addr
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32* @f(i32 5)
  store i32 0, i32* %y, align 4
  ret i32 0
}
