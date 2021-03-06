; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20021015-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_list = global [1 x i8] c"1", align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define void @g(i8* %p, i8* %list, i32 %length, i8** %elementPtr, i8** %nextPtr) nounwind uwtable {
entry:
  %p.addr = alloca i8*, align 8
  %list.addr = alloca i8*, align 8
  %length.addr = alloca i32, align 4
  %elementPtr.addr = alloca i8**, align 8
  %nextPtr.addr = alloca i8**, align 8
  store i8* %p, i8** %p.addr, align 8
  store i8* %list, i8** %list.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i8** %elementPtr, i8*** %elementPtr.addr, align 8
  store i8** %nextPtr, i8*** %nextPtr.addr, align 8
  %tmp = load i8*** %nextPtr.addr, align 8
  %tmp1 = load i8** %tmp
  %cmp = icmp ne i8* %tmp1, getelementptr inbounds ([1 x i8]* @g_list, i32 0, i32 0)
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp2 = load i8*** %nextPtr.addr, align 8
  %tmp3 = load i8** %tmp2
  store i8 0, i8* %tmp3
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %list = alloca i8*, align 8
  %element = alloca i8*, align 8
  %i = alloca i32, align 4
  %length = alloca i32, align 4
  %prevList = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([1 x i8]* @g_list, i32 0, i32 0), i8** %list, align 8
  store i32 100, i32* %length, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i8** %list, align 8
  %tmp1 = load i8* %tmp
  %conv = sext i8 %tmp1 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp4 = load i8** %list, align 8
  store i8* %tmp4, i8** %prevList, align 8
  %tmp5 = load i8** %list, align 8
  %tmp6 = load i32* %length, align 4
  call void @g(i8* null, i8* %tmp5, i32 %tmp6, i8** %element, i8** %list)
  %tmp7 = load i8** %list, align 8
  %tmp8 = load i8** %prevList, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %tmp7 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %tmp8 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %tmp9 = load i32* %length, align 4
  %conv10 = sext i32 %tmp9 to i64
  %sub = sub nsw i64 %conv10, %sub.ptr.sub
  %conv11 = trunc i64 %sub to i32
  store i32 %conv11, i32* %length, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp12 = load i32* %i, align 4
  %inc = add nsw i32 %tmp12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}
