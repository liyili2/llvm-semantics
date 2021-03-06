; ModuleID = '/home/david/src/c-semantics/tests/unitTests/passUnion.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.U = type { i8 }

@u = global %union.U { i8 5 }, align 1

define zeroext i8 @f(i8 %x.coerce) nounwind uwtable {
entry:
  %x = alloca %union.U, align 1
  %coerce.dive = getelementptr %union.U* %x, i32 0, i32 0
  store i8 %x.coerce, i8* %coerce.dive
  %f0 = bitcast %union.U* %x to i8*
  %0 = load i8* %f0, align 1
  ret i8 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i8* getelementptr inbounds (%union.U* @u, i32 0, i32 0)
  %call = call zeroext i8 @f(i8 %0)
  %conv = zext i8 %call to i32
  ret i32 %conv
}
