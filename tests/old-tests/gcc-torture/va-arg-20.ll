; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/va-arg-20.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

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

define void @foo(%struct.__va_list_tag* %v) nounwind uwtable {
entry:
  %v.addr = alloca %struct.__va_list_tag*, align 8
  %x = alloca i64, align 8
  store %struct.__va_list_tag* %v, %struct.__va_list_tag** %v.addr, align 8
  %tmp = load %struct.__va_list_tag** %v.addr, align 8
  %gp_offset_p = getelementptr inbounds %struct.__va_list_tag* %tmp, i32 0, i32 0
  %gp_offset = load i32* %gp_offset_p
  %fits_in_gp = icmp ule i32 %gp_offset, 40
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %entry
  %0 = getelementptr inbounds %struct.__va_list_tag* %tmp, i32 0, i32 3
  %reg_save_area = load i8** %0
  %1 = getelementptr i8* %reg_save_area, i32 %gp_offset
  %2 = bitcast i8* %1 to i64*
  %3 = add i32 %gp_offset, 8
  store i32 %3, i32* %gp_offset_p
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %entry
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag* %tmp, i32 0, i32 2
  %overflow_arg_area = load i8** %overflow_arg_area_p
  %4 = bitcast i8* %overflow_arg_area to i64*
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i32 8
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi i64* [ %2, %vaarg.in_reg ], [ %4, %vaarg.in_mem ]
  %5 = load i64* %vaarg.addr
  store i64 %5, i64* %x, align 8
  %tmp1 = load i64* %x, align 8
  %cmp = icmp ne i64 %tmp1, 16
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %vaarg.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %vaarg.end
  ret void
}

declare void @abort() noreturn nounwind

define void @bar(i8 signext %c, i8 signext %d, ...) nounwind uwtable {
entry:
  %c.addr = alloca i8, align 1
  %d.addr = alloca i8, align 1
  %v = alloca [1 x %struct.__va_list_tag], align 16
  store i8 %c, i8* %c.addr, align 1
  store i8 %d, i8* %d.addr, align 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %v, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %v, i32 0, i32 0
  call void @foo(%struct.__va_list_tag* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %v, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i8, i8, ...)* @bar(i8 signext 0, i8 signext 0, i64 16)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
