; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr19606.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = global i8 -4, align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @foo() nounwind uwtable readonly {
entry:
  %tmp = load i8* @a, align 1
  %conv = sext i8 %tmp to i64
  %conv1 = lshr i64 %conv, 1
  %conv1.tr = trunc i64 %conv1 to i32
  %conv2 = and i32 %conv1.tr, 2147483647
  ret i32 %conv2
}

define i32 @bar() nounwind uwtable readonly {
entry:
  %tmp = load i8* @a, align 1
  %conv = sext i8 %tmp to i32
  %rem = urem i32 %conv, 5
  ret i32 %rem
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp.i = load i8* @a, align 1
  %conv.i = sext i8 %tmp.i to i64
  %conv2.i = and i64 %conv.i, 4294967294
  %cmp = icmp eq i64 %conv2.i, 4294967292
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %conv.i2 = sext i8 %tmp.i to i32
  %rem.i = urem i32 %conv.i2, 5
  %cmp5 = icmp eq i32 %rem.i, 2
  br i1 %cmp5, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
