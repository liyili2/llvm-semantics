; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr44828.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 274686410, align 4

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @a, align 4, !tbaa !0
  %conv1 = trunc i32 %0 to i8
  %mul.i = mul i8 %conv1, -56
  %cmp = icmp sgt i8 %mul.i, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
