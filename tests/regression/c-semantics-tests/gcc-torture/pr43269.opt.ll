; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr43269.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_261 = common global i32 0, align 4
@g_21 = common global i32 0, align 4
@g_211 = common global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  tail call fastcc void @func_32()
  %0 = load i32* @g_261, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal fastcc void @func_32() nounwind uwtable noinline {
entry:
  store i32 -1, i32* @g_261, align 4, !tbaa !0
  %0 = load i32* @g_211, align 4, !tbaa !0
  %tobool11 = icmp eq i32 %0, -1
  br i1 %tobool11, label %if.else, label %for.end

if.else:                                          ; preds = %if.else, %entry
  br label %if.else

for.end:                                          ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
