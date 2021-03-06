; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931004-10.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiny = type { i8, i8 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @f(i32 %n, ...) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca %struct.tiny, align 1
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %x11 = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %2 = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 3
  %reg_save_area = load i8** %2
  %3 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %4 = bitcast i8* %3 to %struct.tiny*
  %5 = add i32 %gp_offset, 8
  store i32 %5, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %arraydecay2, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %6 = bitcast i8* %overflow_arg_area to %struct.tiny*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi %struct.tiny* [ %4, %vaarg.in_reg ], [ %6, %vaarg.in_mem ]
  %7 = bitcast %struct.tiny* %x to i8*
  %8 = bitcast %struct.tiny* %vaarg.addr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 2, i32 1, i1 false)
  %c = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %9 = load i8* %c, align 1
  %conv = sext i8 %9 to i32
  %10 = load i32* %i, align 4
  %add = add nsw i32 %10, 10
  %cmp3 = icmp ne i32 %conv, %add
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  %d = getelementptr inbounds %struct.tiny* %x, i32 0, i32 1
  %11 = load i8* %d, align 1
  %conv5 = sext i8 %11 to i32
  %12 = load i32* %i, align 4
  %add6 = add nsw i32 %12, 20
  %cmp7 = icmp ne i32 %conv5, %add6
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end10
  %13 = load i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %14 = va_arg %struct.__va_list_tag* %arraydecay12, i64
  store i64 %14, i64* %x11, align 8
  %15 = load i64* %x11, align 8
  %cmp13 = icmp ne i64 %15, 123
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %for.end
  %arraydecay17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1718 = bitcast %struct.__va_list_tag* %arraydecay17 to i8*
  call void @llvm.va_end(i8* %arraydecay1718)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 1
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %c = getelementptr inbounds %struct.tiny* %arrayidx, i32 0, i32 0
  store i8 10, i8* %c, align 1
  %arrayidx1 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %c2 = getelementptr inbounds %struct.tiny* %arrayidx1, i32 0, i32 0
  store i8 11, i8* %c2, align 1
  %arrayidx3 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %c4 = getelementptr inbounds %struct.tiny* %arrayidx3, i32 0, i32 0
  store i8 12, i8* %c4, align 1
  %arrayidx5 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %d = getelementptr inbounds %struct.tiny* %arrayidx5, i32 0, i32 1
  store i8 20, i8* %d, align 1
  %arrayidx6 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %d7 = getelementptr inbounds %struct.tiny* %arrayidx6, i32 0, i32 1
  store i8 21, i8* %d7, align 1
  %arrayidx8 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %d9 = getelementptr inbounds %struct.tiny* %arrayidx8, i32 0, i32 1
  store i8 22, i8* %d9, align 1
  %arrayidx10 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %arrayidx11 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx12 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %0 = bitcast %struct.tiny* %arrayidx10 to i16*
  %1 = load i16* %0, align 1
  %2 = bitcast %struct.tiny* %arrayidx11 to i16*
  %3 = load i16* %2, align 1
  %4 = bitcast %struct.tiny* %arrayidx12 to i16*
  %5 = load i16* %4, align 1
  call void (i32, ...)* @f(i32 3, i16 %1, i16 %3, i16 %5, i64 123)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @exit(i32) noreturn nounwind
