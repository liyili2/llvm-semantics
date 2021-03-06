; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-20-s714-h.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.f = internal global [17 x i8] c"Local error %d.\0A\00", align 16
@sec.s714er = internal global [11 x i8] c"s714,er%d\0A\00", align 1
@sec.qs714 = internal global [8 x i8] c"s714   \00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

define i64 @pow2(i64 %n) nounwind uwtable {
entry:
  %n.addr = alloca i64, align 8
  %s = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  store i64 1, i64* %s, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i64* %n.addr, align 8
  %dec = add nsw i64 %0, -1
  store i64 %dec, i64* %n.addr, align 8
  %tobool = icmp ne i64 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i64* %s, align 8
  %mul = mul nsw i64 %1, 2
  store i64 %mul, i64* %s, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %2 = load i64* %s, align 8
  ret i64 %2
}

define void @zerofill(i8* %x) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %j = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %j, align 4
  %cmp = icmp slt i32 %0, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i8** %x.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %1, i32 1
  store i8* %incdec.ptr, i8** %x.addr, align 8
  store i8 0, i8* %1, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %j, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @sumof(i8* %x) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %p = alloca i8*, align 8
  %total = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  %0 = load i8** %x.addr, align 8
  store i8* %0, i8** %p, align 8
  store i32 0, i32* %total, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %j, align 4
  %cmp = icmp slt i32 %1, 256
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %total, align 4
  %3 = load i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8* %3, i32 1
  store i8* %incdec.ptr, i8** %p, align 8
  %4 = load i8* %3, align 1
  %conv = sext i8 %4 to i32
  %add = add nsw i32 %2, %conv
  store i32 %add, i32* %total, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %j, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = load i32* %total, align 4
  ret i32 %6
}

define i32 @setupTable(%struct.defs* %pd0) nounwind uwtable {
entry:
  %pd0.addr = alloca %struct.defs*, align 8
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %c0 = alloca i8, align 1
  %c1 = alloca i8, align 1
  %temp = alloca float, align 4
  %one = alloca float, align 4
  %delta = alloca float, align 4
  %tempd = alloca double, align 8
  %oned = alloca double, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @setupTable.qs26, i32 0, i32 0), i8** %ps, align 8
  %0 = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %0, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %1, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %2 = load i8* %1, align 1
  %3 = load i8** %pt, align 8
  %incdec.ptr1 = getelementptr inbounds i8* %3, i32 1
  store i8* %incdec.ptr1, i8** %pt, align 8
  store i8 %2, i8* %3, align 1
  %tobool = icmp ne i8 %2, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %4 = load %struct.defs** %pd0.addr, align 8
  %cbits = getelementptr inbounds %struct.defs* %4, i32 0, i32 0
  store i32 0, i32* %cbits, align 4
  store i8 0, i8* %c0, align 1
  store i8 1, i8* %c1, align 1
  br label %while.cond2

while.cond2:                                      ; preds = %while.body5, %while.end
  %5 = load i8* %c0, align 1
  %conv = zext i8 %5 to i32
  %6 = load i8* %c1, align 1
  %conv3 = zext i8 %6 to i32
  %cmp = icmp ne i32 %conv, %conv3
  br i1 %cmp, label %while.body5, label %while.end10

while.body5:                                      ; preds = %while.cond2
  %7 = load i8* %c1, align 1
  %conv6 = zext i8 %7 to i32
  %shl = shl i32 %conv6, 1
  %conv7 = trunc i32 %shl to i8
  store i8 %conv7, i8* %c1, align 1
  %8 = load %struct.defs** %pd0.addr, align 8
  %cbits8 = getelementptr inbounds %struct.defs* %8, i32 0, i32 0
  %9 = load i32* %cbits8, align 4
  %add = add nsw i32 %9, 1
  %10 = load %struct.defs** %pd0.addr, align 8
  %cbits9 = getelementptr inbounds %struct.defs* %10, i32 0, i32 0
  store i32 %add, i32* %cbits9, align 4
  br label %while.cond2

while.end10:                                      ; preds = %while.cond2
  %11 = load %struct.defs** %pd0.addr, align 8
  %cbits11 = getelementptr inbounds %struct.defs* %11, i32 0, i32 0
  %12 = load i32* %cbits11, align 4
  %conv12 = sext i32 %12 to i64
  %mul = mul i64 %conv12, 4
  %conv13 = trunc i64 %mul to i32
  %13 = load %struct.defs** %pd0.addr, align 8
  %ibits = getelementptr inbounds %struct.defs* %13, i32 0, i32 1
  store i32 %conv13, i32* %ibits, align 4
  %14 = load %struct.defs** %pd0.addr, align 8
  %cbits14 = getelementptr inbounds %struct.defs* %14, i32 0, i32 0
  %15 = load i32* %cbits14, align 4
  %conv15 = sext i32 %15 to i64
  %mul16 = mul i64 %conv15, 2
  %conv17 = trunc i64 %mul16 to i32
  %16 = load %struct.defs** %pd0.addr, align 8
  %sbits = getelementptr inbounds %struct.defs* %16, i32 0, i32 2
  store i32 %conv17, i32* %sbits, align 4
  %17 = load %struct.defs** %pd0.addr, align 8
  %cbits18 = getelementptr inbounds %struct.defs* %17, i32 0, i32 0
  %18 = load i32* %cbits18, align 4
  %conv19 = sext i32 %18 to i64
  %mul20 = mul i64 %conv19, 8
  %conv21 = trunc i64 %mul20 to i32
  %19 = load %struct.defs** %pd0.addr, align 8
  %lbits = getelementptr inbounds %struct.defs* %19, i32 0, i32 3
  store i32 %conv21, i32* %lbits, align 4
  %20 = load %struct.defs** %pd0.addr, align 8
  %cbits22 = getelementptr inbounds %struct.defs* %20, i32 0, i32 0
  %21 = load i32* %cbits22, align 4
  %conv23 = sext i32 %21 to i64
  %mul24 = mul i64 %conv23, 4
  %conv25 = trunc i64 %mul24 to i32
  %22 = load %struct.defs** %pd0.addr, align 8
  %ubits = getelementptr inbounds %struct.defs* %22, i32 0, i32 4
  store i32 %conv25, i32* %ubits, align 4
  %23 = load %struct.defs** %pd0.addr, align 8
  %cbits26 = getelementptr inbounds %struct.defs* %23, i32 0, i32 0
  %24 = load i32* %cbits26, align 4
  %conv27 = sext i32 %24 to i64
  %mul28 = mul i64 %conv27, 4
  %conv29 = trunc i64 %mul28 to i32
  %25 = load %struct.defs** %pd0.addr, align 8
  %fbits = getelementptr inbounds %struct.defs* %25, i32 0, i32 5
  store i32 %conv29, i32* %fbits, align 4
  %26 = load %struct.defs** %pd0.addr, align 8
  %cbits30 = getelementptr inbounds %struct.defs* %26, i32 0, i32 0
  %27 = load i32* %cbits30, align 4
  %conv31 = sext i32 %27 to i64
  %mul32 = mul i64 %conv31, 8
  %conv33 = trunc i64 %mul32 to i32
  %28 = load %struct.defs** %pd0.addr, align 8
  %dbits = getelementptr inbounds %struct.defs* %28, i32 0, i32 6
  store i32 %conv33, i32* %dbits, align 4
  store float 1.000000e+00, float* %one, align 4
  store float 1.000000e+00, float* %delta, align 4
  store float 0.000000e+00, float* %temp, align 4
  br label %while.cond34

while.cond34:                                     ; preds = %while.body37, %while.end10
  %29 = load float* %temp, align 4
  %30 = load float* %one, align 4
  %cmp35 = fcmp une float %29, %30
  br i1 %cmp35, label %while.body37, label %while.end41

while.body37:                                     ; preds = %while.cond34
  %31 = load float* %one, align 4
  %32 = load float* %delta, align 4
  %add38 = fadd float %31, %32
  store float %add38, float* %temp, align 4
  %33 = load float* %delta, align 4
  %conv39 = fpext float %33 to double
  %div = fdiv double %conv39, 2.000000e+00
  %conv40 = fptrunc double %div to float
  store float %conv40, float* %delta, align 4
  br label %while.cond34

while.end41:                                      ; preds = %while.cond34
  %34 = load float* %delta, align 4
  %conv42 = fpext float %34 to double
  %mul43 = fmul double %conv42, 4.000000e+00
  %conv44 = fptrunc double %mul43 to float
  %35 = load %struct.defs** %pd0.addr, align 8
  %fprec = getelementptr inbounds %struct.defs* %35, i32 0, i32 7
  store float %conv44, float* %fprec, align 4
  store double 1.000000e+00, double* %oned, align 8
  store float 1.000000e+00, float* %delta, align 4
  store double 0.000000e+00, double* %tempd, align 8
  br label %while.cond45

while.cond45:                                     ; preds = %while.body48, %while.end41
  %36 = load double* %tempd, align 8
  %37 = load double* %oned, align 8
  %cmp46 = fcmp une double %36, %37
  br i1 %cmp46, label %while.body48, label %while.end54

while.body48:                                     ; preds = %while.cond45
  %38 = load double* %oned, align 8
  %39 = load float* %delta, align 4
  %conv49 = fpext float %39 to double
  %add50 = fadd double %38, %conv49
  store double %add50, double* %tempd, align 8
  %40 = load float* %delta, align 4
  %conv51 = fpext float %40 to double
  %div52 = fdiv double %conv51, 2.000000e+00
  %conv53 = fptrunc double %div52 to float
  store float %conv53, float* %delta, align 4
  br label %while.cond45

while.end54:                                      ; preds = %while.cond45
  %41 = load float* %delta, align 4
  %conv55 = fpext float %41 to double
  %mul56 = fmul double %conv55, 4.000000e+00
  %conv57 = fptrunc double %mul56 to float
  %42 = load %struct.defs** %pd0.addr, align 8
  %dprec = getelementptr inbounds %struct.defs* %42, i32 0, i32 8
  store float %conv57, float* %dprec, align 4
  ret i32 0
}

define i32 @svtest(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %rc = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32* %n.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry
  store i32 1978, i32* @svtest.k, align 4
  store i32 0, i32* %rc, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %1 = load i32* @svtest.k, align 4
  %cmp = icmp ne i32 %1, 1978
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %sw.bb1
  store i32 1, i32* %rc, align 4
  br label %if.end

if.else:                                          ; preds = %sw.bb1
  store i32 1929, i32* @svtest.k, align 4
  store i32 0, i32* %rc, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %2 = load i32* @svtest.k, align 4
  %cmp3 = icmp ne i32 %2, 1929
  br i1 %cmp3, label %if.then4, label %if.else5

if.then4:                                         ; preds = %sw.bb2
  store i32 1, i32* %rc, align 4
  br label %if.end6

if.else5:                                         ; preds = %sw.bb2
  store i32 0, i32* %rc, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %if.end6, %if.end, %sw.bb
  %3 = load i32* %rc, align 4
  ret i32 %3
}

define i32 @zero() nounwind uwtable {
entry:
  %rc = alloca i32, align 4
  store i32 2, i32* @zero.k, align 4
  store i32 0, i32* %rc, align 4
  %0 = load i32* %rc, align 4
  ret i32 %0
}

define i32 @testev() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %0 = load i32* @extvar, align 4
  %cmp = icmp ne i32 %0, 1066
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %1 = load i32* %retval
  ret i32 %1
}

define void @setev() nounwind uwtable {
entry:
  store i32 1066, i32* @extvar, align 4
  ret void
}

define i32 @McCarthy(i32 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %cmp = icmp sgt i32 %0, 100
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %x.addr, align 4
  %sub = sub nsw i32 %1, 10
  store i32 %sub, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32* %x.addr, align 4
  %add = add nsw i32 %2, 11
  %call = call i32 (...)* bitcast (i32 (i32)* @McCarthy to i32 (...)*)(i32 %add)
  %call1 = call i32 (...)* bitcast (i32 (i32)* @McCarthy to i32 (...)*)(i32 %call)
  store i32 %call1, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load i32* %retval
  ret i32 %3
}

define i32 @clobber(i32 %x, i32* %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32*, align 8
  store i32 %x, i32* %x.addr, align 4
  store i32* %y, i32** %y.addr, align 8
  store i32 3, i32* %x.addr, align 4
  %0 = load i32** %y.addr, align 8
  store i32 2, i32* %0, align 4
  ret i32 0
}

define i32 @sec(%struct.defs* %pd0) nounwind uwtable {
entry:
  %pd0.addr = alloca %struct.defs*, align 8
  %prlc = alloca i32, align 4
  %lrc = alloca i32, align 4
  %rc = alloca i32, align 4
  %cl = alloca i8, align 1
  %cr = alloca i8, align 1
  %sl = alloca i16, align 2
  %sr = alloca i16, align 2
  %il = alloca i32, align 4
  %ir = alloca i32, align 4
  %ll = alloca i64, align 8
  %lr = alloca i64, align 8
  %ul = alloca i32, align 4
  %ur = alloca i32, align 4
  %fl = alloca float, align 4
  %fr = alloca float, align 4
  %dl = alloca double, align 8
  %dr = alloca double, align 8
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  store %struct.defs* %pd0, %struct.defs** %pd0.addr, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs714, i32 0, i32 0), i8** %ps, align 8
  %0 = load %struct.defs** %pd0.addr, align 8
  %rfs = getelementptr inbounds %struct.defs* %0, i32 0, i32 15
  %arraydecay = getelementptr inbounds [8 x i8]* %rfs, i32 0, i32 0
  store i8* %arraydecay, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  store i32 0, i32* %lrc, align 4
  %1 = load %struct.defs** %pd0.addr, align 8
  %flgl = getelementptr inbounds %struct.defs* %1, i32 0, i32 12
  %2 = load i32* %flgl, align 4
  store i32 %2, i32* %prlc, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %3 = load i8** %ps, align 8
  %incdec.ptr = getelementptr inbounds i8* %3, i32 1
  store i8* %incdec.ptr, i8** %ps, align 8
  %4 = load i8* %3, align 1
  %5 = load i8** %pt, align 8
  %incdec.ptr1 = getelementptr inbounds i8* %5, i32 1
  store i8* %incdec.ptr1, i8** %pt, align 8
  store i8 %4, i8* %5, align 1
  %tobool = icmp ne i8 %4, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i16 12, i16* %sl, align 2
  store i8 10, i8* %cr, align 1
  %6 = load i8* %cr, align 1
  %conv = sext i8 %6 to i32
  %7 = load i16* %sl, align 2
  %conv2 = sext i16 %7 to i32
  %xor = xor i32 %conv2, %conv
  %conv3 = trunc i32 %xor to i16
  store i16 %conv3, i16* %sl, align 2
  %8 = load i16* %sl, align 2
  %conv4 = sext i16 %8 to i32
  %cmp = icmp ne i32 %conv4, 6
  br i1 %cmp, label %if.then, label %if.end8

if.then:                                          ; preds = %while.end
  store i32 351, i32* %lrc, align 4
  %9 = load i32* %prlc, align 4
  %tobool6 = icmp ne i32 %9, 0
  br i1 %tobool6, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then
  %10 = load i32* %lrc, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %10)
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.then
  br label %if.end8

if.end8:                                          ; preds = %if.end, %while.end
  store i16 12, i16* %sl, align 2
  store i16 10, i16* %sr, align 2
  %11 = load i16* %sr, align 2
  %conv9 = sext i16 %11 to i32
  %12 = load i16* %sl, align 2
  %conv10 = sext i16 %12 to i32
  %xor11 = xor i32 %conv10, %conv9
  %conv12 = trunc i32 %xor11 to i16
  store i16 %conv12, i16* %sl, align 2
  %13 = load i16* %sl, align 2
  %conv13 = sext i16 %13 to i32
  %cmp14 = icmp ne i32 %conv13, 6
  br i1 %cmp14, label %if.then16, label %if.end21

if.then16:                                        ; preds = %if.end8
  store i32 352, i32* %lrc, align 4
  %14 = load i32* %prlc, align 4
  %tobool17 = icmp ne i32 %14, 0
  br i1 %tobool17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %if.then16
  %15 = load i32* %lrc, align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %15)
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.then16
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.end8
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ir, align 4
  %16 = load i32* %ir, align 4
  %17 = load i16* %sl, align 2
  %conv22 = sext i16 %17 to i32
  %xor23 = xor i32 %conv22, %16
  %conv24 = trunc i32 %xor23 to i16
  store i16 %conv24, i16* %sl, align 2
  %18 = load i16* %sl, align 2
  %conv25 = sext i16 %18 to i32
  %cmp26 = icmp ne i32 %conv25, 6
  br i1 %cmp26, label %if.then28, label %if.end33

if.then28:                                        ; preds = %if.end21
  store i32 353, i32* %lrc, align 4
  %19 = load i32* %prlc, align 4
  %tobool29 = icmp ne i32 %19, 0
  br i1 %tobool29, label %if.then30, label %if.end32

if.then30:                                        ; preds = %if.then28
  %20 = load i32* %lrc, align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %20)
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %if.then28
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.end21
  store i16 12, i16* %sl, align 2
  store i64 10, i64* %lr, align 8
  %21 = load i64* %lr, align 8
  %22 = load i16* %sl, align 2
  %conv34 = sext i16 %22 to i64
  %xor35 = xor i64 %conv34, %21
  %conv36 = trunc i64 %xor35 to i16
  store i16 %conv36, i16* %sl, align 2
  %23 = load i16* %sl, align 2
  %conv37 = sext i16 %23 to i32
  %cmp38 = icmp ne i32 %conv37, 6
  br i1 %cmp38, label %if.then40, label %if.end45

if.then40:                                        ; preds = %if.end33
  store i32 354, i32* %lrc, align 4
  %24 = load i32* %prlc, align 4
  %tobool41 = icmp ne i32 %24, 0
  br i1 %tobool41, label %if.then42, label %if.end44

if.then42:                                        ; preds = %if.then40
  %25 = load i32* %lrc, align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %25)
  br label %if.end44

if.end44:                                         ; preds = %if.then42, %if.then40
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.end33
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ur, align 4
  %26 = load i32* %ur, align 4
  %27 = load i16* %sl, align 2
  %conv46 = sext i16 %27 to i32
  %xor47 = xor i32 %conv46, %26
  %conv48 = trunc i32 %xor47 to i16
  store i16 %conv48, i16* %sl, align 2
  %28 = load i16* %sl, align 2
  %conv49 = sext i16 %28 to i32
  %cmp50 = icmp ne i32 %conv49, 6
  br i1 %cmp50, label %if.then52, label %if.end57

if.then52:                                        ; preds = %if.end45
  store i32 355, i32* %lrc, align 4
  %29 = load i32* %prlc, align 4
  %tobool53 = icmp ne i32 %29, 0
  br i1 %tobool53, label %if.then54, label %if.end56

if.then54:                                        ; preds = %if.then52
  %30 = load i32* %lrc, align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %30)
  br label %if.end56

if.end56:                                         ; preds = %if.then54, %if.then52
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.end45
  store i32 12, i32* %il, align 4
  store i8 10, i8* %cr, align 1
  %31 = load i8* %cr, align 1
  %conv58 = sext i8 %31 to i32
  %32 = load i32* %il, align 4
  %xor59 = xor i32 %32, %conv58
  store i32 %xor59, i32* %il, align 4
  %33 = load i32* %il, align 4
  %cmp60 = icmp ne i32 %33, 6
  br i1 %cmp60, label %if.then62, label %if.end67

if.then62:                                        ; preds = %if.end57
  store i32 356, i32* %lrc, align 4
  %34 = load i32* %prlc, align 4
  %tobool63 = icmp ne i32 %34, 0
  br i1 %tobool63, label %if.then64, label %if.end66

if.then64:                                        ; preds = %if.then62
  %35 = load i32* %lrc, align 4
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %35)
  br label %if.end66

if.end66:                                         ; preds = %if.then64, %if.then62
  br label %if.end67

if.end67:                                         ; preds = %if.end66, %if.end57
  store i32 12, i32* %il, align 4
  store i16 10, i16* %sr, align 2
  %36 = load i16* %sr, align 2
  %conv68 = sext i16 %36 to i32
  %37 = load i32* %il, align 4
  %xor69 = xor i32 %37, %conv68
  store i32 %xor69, i32* %il, align 4
  %38 = load i32* %il, align 4
  %cmp70 = icmp ne i32 %38, 6
  br i1 %cmp70, label %if.then72, label %if.end77

if.then72:                                        ; preds = %if.end67
  store i32 357, i32* %lrc, align 4
  %39 = load i32* %prlc, align 4
  %tobool73 = icmp ne i32 %39, 0
  br i1 %tobool73, label %if.then74, label %if.end76

if.then74:                                        ; preds = %if.then72
  %40 = load i32* %lrc, align 4
  %call75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %40)
  br label %if.end76

if.end76:                                         ; preds = %if.then74, %if.then72
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %if.end67
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ir, align 4
  %41 = load i32* %ir, align 4
  %42 = load i32* %il, align 4
  %xor78 = xor i32 %42, %41
  store i32 %xor78, i32* %il, align 4
  %43 = load i32* %il, align 4
  %cmp79 = icmp ne i32 %43, 6
  br i1 %cmp79, label %if.then81, label %if.end86

if.then81:                                        ; preds = %if.end77
  store i32 358, i32* %lrc, align 4
  %44 = load i32* %prlc, align 4
  %tobool82 = icmp ne i32 %44, 0
  br i1 %tobool82, label %if.then83, label %if.end85

if.then83:                                        ; preds = %if.then81
  %45 = load i32* %lrc, align 4
  %call84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %45)
  br label %if.end85

if.end85:                                         ; preds = %if.then83, %if.then81
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %if.end77
  store i32 12, i32* %il, align 4
  store i64 10, i64* %lr, align 8
  %46 = load i64* %lr, align 8
  %47 = load i32* %il, align 4
  %conv87 = sext i32 %47 to i64
  %xor88 = xor i64 %conv87, %46
  %conv89 = trunc i64 %xor88 to i32
  store i32 %conv89, i32* %il, align 4
  %48 = load i32* %il, align 4
  %cmp90 = icmp ne i32 %48, 6
  br i1 %cmp90, label %if.then92, label %if.end97

if.then92:                                        ; preds = %if.end86
  store i32 359, i32* %lrc, align 4
  %49 = load i32* %prlc, align 4
  %tobool93 = icmp ne i32 %49, 0
  br i1 %tobool93, label %if.then94, label %if.end96

if.then94:                                        ; preds = %if.then92
  %50 = load i32* %lrc, align 4
  %call95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %50)
  br label %if.end96

if.end96:                                         ; preds = %if.then94, %if.then92
  br label %if.end97

if.end97:                                         ; preds = %if.end96, %if.end86
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ur, align 4
  %51 = load i32* %ur, align 4
  %52 = load i32* %il, align 4
  %xor98 = xor i32 %52, %51
  store i32 %xor98, i32* %il, align 4
  %53 = load i32* %il, align 4
  %cmp99 = icmp ne i32 %53, 6
  br i1 %cmp99, label %if.then101, label %if.end106

if.then101:                                       ; preds = %if.end97
  store i32 360, i32* %lrc, align 4
  %54 = load i32* %prlc, align 4
  %tobool102 = icmp ne i32 %54, 0
  br i1 %tobool102, label %if.then103, label %if.end105

if.then103:                                       ; preds = %if.then101
  %55 = load i32* %lrc, align 4
  %call104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %55)
  br label %if.end105

if.end105:                                        ; preds = %if.then103, %if.then101
  br label %if.end106

if.end106:                                        ; preds = %if.end105, %if.end97
  store i64 12, i64* %ll, align 8
  store i8 10, i8* %cr, align 1
  %56 = load i8* %cr, align 1
  %conv107 = sext i8 %56 to i64
  %57 = load i64* %ll, align 8
  %xor108 = xor i64 %57, %conv107
  store i64 %xor108, i64* %ll, align 8
  %58 = load i64* %ll, align 8
  %cmp109 = icmp ne i64 %58, 6
  br i1 %cmp109, label %if.then111, label %if.end116

if.then111:                                       ; preds = %if.end106
  store i32 361, i32* %lrc, align 4
  %59 = load i32* %prlc, align 4
  %tobool112 = icmp ne i32 %59, 0
  br i1 %tobool112, label %if.then113, label %if.end115

if.then113:                                       ; preds = %if.then111
  %60 = load i32* %lrc, align 4
  %call114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %60)
  br label %if.end115

if.end115:                                        ; preds = %if.then113, %if.then111
  br label %if.end116

if.end116:                                        ; preds = %if.end115, %if.end106
  store i64 12, i64* %ll, align 8
  store i16 10, i16* %sr, align 2
  %61 = load i16* %sr, align 2
  %conv117 = sext i16 %61 to i64
  %62 = load i64* %ll, align 8
  %xor118 = xor i64 %62, %conv117
  store i64 %xor118, i64* %ll, align 8
  %63 = load i64* %ll, align 8
  %cmp119 = icmp ne i64 %63, 6
  br i1 %cmp119, label %if.then121, label %if.end126

if.then121:                                       ; preds = %if.end116
  store i32 362, i32* %lrc, align 4
  %64 = load i32* %prlc, align 4
  %tobool122 = icmp ne i32 %64, 0
  br i1 %tobool122, label %if.then123, label %if.end125

if.then123:                                       ; preds = %if.then121
  %65 = load i32* %lrc, align 4
  %call124 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %65)
  br label %if.end125

if.end125:                                        ; preds = %if.then123, %if.then121
  br label %if.end126

if.end126:                                        ; preds = %if.end125, %if.end116
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ir, align 4
  %66 = load i32* %ir, align 4
  %conv127 = sext i32 %66 to i64
  %67 = load i64* %ll, align 8
  %xor128 = xor i64 %67, %conv127
  store i64 %xor128, i64* %ll, align 8
  %68 = load i64* %ll, align 8
  %cmp129 = icmp ne i64 %68, 6
  br i1 %cmp129, label %if.then131, label %if.end136

if.then131:                                       ; preds = %if.end126
  store i32 363, i32* %lrc, align 4
  %69 = load i32* %prlc, align 4
  %tobool132 = icmp ne i32 %69, 0
  br i1 %tobool132, label %if.then133, label %if.end135

if.then133:                                       ; preds = %if.then131
  %70 = load i32* %lrc, align 4
  %call134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %70)
  br label %if.end135

if.end135:                                        ; preds = %if.then133, %if.then131
  br label %if.end136

if.end136:                                        ; preds = %if.end135, %if.end126
  store i64 12, i64* %ll, align 8
  store i64 10, i64* %lr, align 8
  %71 = load i64* %lr, align 8
  %72 = load i64* %ll, align 8
  %xor137 = xor i64 %72, %71
  store i64 %xor137, i64* %ll, align 8
  %73 = load i64* %ll, align 8
  %cmp138 = icmp ne i64 %73, 6
  br i1 %cmp138, label %if.then140, label %if.end145

if.then140:                                       ; preds = %if.end136
  store i32 364, i32* %lrc, align 4
  %74 = load i32* %prlc, align 4
  %tobool141 = icmp ne i32 %74, 0
  br i1 %tobool141, label %if.then142, label %if.end144

if.then142:                                       ; preds = %if.then140
  %75 = load i32* %lrc, align 4
  %call143 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %75)
  br label %if.end144

if.end144:                                        ; preds = %if.then142, %if.then140
  br label %if.end145

if.end145:                                        ; preds = %if.end144, %if.end136
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ur, align 4
  %76 = load i32* %ur, align 4
  %conv146 = zext i32 %76 to i64
  %77 = load i64* %ll, align 8
  %xor147 = xor i64 %77, %conv146
  store i64 %xor147, i64* %ll, align 8
  %78 = load i64* %ll, align 8
  %cmp148 = icmp ne i64 %78, 6
  br i1 %cmp148, label %if.then150, label %if.end155

if.then150:                                       ; preds = %if.end145
  store i32 365, i32* %lrc, align 4
  %79 = load i32* %prlc, align 4
  %tobool151 = icmp ne i32 %79, 0
  br i1 %tobool151, label %if.then152, label %if.end154

if.then152:                                       ; preds = %if.then150
  %80 = load i32* %lrc, align 4
  %call153 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %80)
  br label %if.end154

if.end154:                                        ; preds = %if.then152, %if.then150
  br label %if.end155

if.end155:                                        ; preds = %if.end154, %if.end145
  store i32 12, i32* %ul, align 4
  store i8 10, i8* %cr, align 1
  %81 = load i8* %cr, align 1
  %conv156 = sext i8 %81 to i32
  %82 = load i32* %ul, align 4
  %xor157 = xor i32 %82, %conv156
  store i32 %xor157, i32* %ul, align 4
  %83 = load i32* %ul, align 4
  %cmp158 = icmp ne i32 %83, 6
  br i1 %cmp158, label %if.then160, label %if.end165

if.then160:                                       ; preds = %if.end155
  store i32 366, i32* %lrc, align 4
  %84 = load i32* %prlc, align 4
  %tobool161 = icmp ne i32 %84, 0
  br i1 %tobool161, label %if.then162, label %if.end164

if.then162:                                       ; preds = %if.then160
  %85 = load i32* %lrc, align 4
  %call163 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %85)
  br label %if.end164

if.end164:                                        ; preds = %if.then162, %if.then160
  br label %if.end165

if.end165:                                        ; preds = %if.end164, %if.end155
  store i32 12, i32* %ul, align 4
  store i16 10, i16* %sr, align 2
  %86 = load i16* %sr, align 2
  %conv166 = sext i16 %86 to i32
  %87 = load i32* %ul, align 4
  %xor167 = xor i32 %87, %conv166
  store i32 %xor167, i32* %ul, align 4
  %88 = load i32* %ul, align 4
  %cmp168 = icmp ne i32 %88, 6
  br i1 %cmp168, label %if.then170, label %if.end175

if.then170:                                       ; preds = %if.end165
  store i32 367, i32* %lrc, align 4
  %89 = load i32* %prlc, align 4
  %tobool171 = icmp ne i32 %89, 0
  br i1 %tobool171, label %if.then172, label %if.end174

if.then172:                                       ; preds = %if.then170
  %90 = load i32* %lrc, align 4
  %call173 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %90)
  br label %if.end174

if.end174:                                        ; preds = %if.then172, %if.then170
  br label %if.end175

if.end175:                                        ; preds = %if.end174, %if.end165
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ir, align 4
  %91 = load i32* %ir, align 4
  %92 = load i32* %ul, align 4
  %xor176 = xor i32 %92, %91
  store i32 %xor176, i32* %ul, align 4
  %93 = load i32* %ul, align 4
  %cmp177 = icmp ne i32 %93, 6
  br i1 %cmp177, label %if.then179, label %if.end184

if.then179:                                       ; preds = %if.end175
  store i32 368, i32* %lrc, align 4
  %94 = load i32* %prlc, align 4
  %tobool180 = icmp ne i32 %94, 0
  br i1 %tobool180, label %if.then181, label %if.end183

if.then181:                                       ; preds = %if.then179
  %95 = load i32* %lrc, align 4
  %call182 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %95)
  br label %if.end183

if.end183:                                        ; preds = %if.then181, %if.then179
  br label %if.end184

if.end184:                                        ; preds = %if.end183, %if.end175
  store i32 12, i32* %ul, align 4
  store i64 10, i64* %lr, align 8
  %96 = load i64* %lr, align 8
  %97 = load i32* %ul, align 4
  %conv185 = zext i32 %97 to i64
  %xor186 = xor i64 %conv185, %96
  %conv187 = trunc i64 %xor186 to i32
  store i32 %conv187, i32* %ul, align 4
  %98 = load i32* %ul, align 4
  %cmp188 = icmp ne i32 %98, 6
  br i1 %cmp188, label %if.then190, label %if.end195

if.then190:                                       ; preds = %if.end184
  store i32 369, i32* %lrc, align 4
  %99 = load i32* %prlc, align 4
  %tobool191 = icmp ne i32 %99, 0
  br i1 %tobool191, label %if.then192, label %if.end194

if.then192:                                       ; preds = %if.then190
  %100 = load i32* %lrc, align 4
  %call193 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %100)
  br label %if.end194

if.end194:                                        ; preds = %if.then192, %if.then190
  br label %if.end195

if.end195:                                        ; preds = %if.end194, %if.end184
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ur, align 4
  %101 = load i32* %ur, align 4
  %102 = load i32* %ul, align 4
  %xor196 = xor i32 %102, %101
  store i32 %xor196, i32* %ul, align 4
  %103 = load i32* %ul, align 4
  %cmp197 = icmp ne i32 %103, 6
  br i1 %cmp197, label %if.then199, label %if.end204

if.then199:                                       ; preds = %if.end195
  store i32 370, i32* %lrc, align 4
  %104 = load i32* %prlc, align 4
  %tobool200 = icmp ne i32 %104, 0
  br i1 %tobool200, label %if.then201, label %if.end203

if.then201:                                       ; preds = %if.then199
  %105 = load i32* %lrc, align 4
  %call202 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %105)
  br label %if.end203

if.end203:                                        ; preds = %if.then201, %if.then199
  br label %if.end204

if.end204:                                        ; preds = %if.end203, %if.end195
  store i8 12, i8* %cl, align 1
  store i8 10, i8* %cr, align 1
  %106 = load i8* %cr, align 1
  %conv205 = sext i8 %106 to i32
  %107 = load i8* %cl, align 1
  %conv206 = sext i8 %107 to i32
  %or = or i32 %conv206, %conv205
  %conv207 = trunc i32 %or to i8
  store i8 %conv207, i8* %cl, align 1
  %108 = load i8* %cl, align 1
  %conv208 = sext i8 %108 to i32
  %cmp209 = icmp ne i32 %conv208, 14
  br i1 %cmp209, label %if.then211, label %if.end216

if.then211:                                       ; preds = %if.end204
  store i32 371, i32* %lrc, align 4
  %109 = load i32* %prlc, align 4
  %tobool212 = icmp ne i32 %109, 0
  br i1 %tobool212, label %if.then213, label %if.end215

if.then213:                                       ; preds = %if.then211
  %110 = load i32* %lrc, align 4
  %call214 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %110)
  br label %if.end215

if.end215:                                        ; preds = %if.then213, %if.then211
  br label %if.end216

if.end216:                                        ; preds = %if.end215, %if.end204
  store i8 12, i8* %cl, align 1
  store i16 10, i16* %sr, align 2
  %111 = load i16* %sr, align 2
  %conv217 = sext i16 %111 to i32
  %112 = load i8* %cl, align 1
  %conv218 = sext i8 %112 to i32
  %or219 = or i32 %conv218, %conv217
  %conv220 = trunc i32 %or219 to i8
  store i8 %conv220, i8* %cl, align 1
  %113 = load i8* %cl, align 1
  %conv221 = sext i8 %113 to i32
  %cmp222 = icmp ne i32 %conv221, 14
  br i1 %cmp222, label %if.then224, label %if.end229

if.then224:                                       ; preds = %if.end216
  store i32 372, i32* %lrc, align 4
  %114 = load i32* %prlc, align 4
  %tobool225 = icmp ne i32 %114, 0
  br i1 %tobool225, label %if.then226, label %if.end228

if.then226:                                       ; preds = %if.then224
  %115 = load i32* %lrc, align 4
  %call227 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %115)
  br label %if.end228

if.end228:                                        ; preds = %if.then226, %if.then224
  br label %if.end229

if.end229:                                        ; preds = %if.end228, %if.end216
  store i8 12, i8* %cl, align 1
  store i32 10, i32* %ir, align 4
  %116 = load i32* %ir, align 4
  %117 = load i8* %cl, align 1
  %conv230 = sext i8 %117 to i32
  %or231 = or i32 %conv230, %116
  %conv232 = trunc i32 %or231 to i8
  store i8 %conv232, i8* %cl, align 1
  %118 = load i8* %cl, align 1
  %conv233 = sext i8 %118 to i32
  %cmp234 = icmp ne i32 %conv233, 14
  br i1 %cmp234, label %if.then236, label %if.end241

if.then236:                                       ; preds = %if.end229
  store i32 373, i32* %lrc, align 4
  %119 = load i32* %prlc, align 4
  %tobool237 = icmp ne i32 %119, 0
  br i1 %tobool237, label %if.then238, label %if.end240

if.then238:                                       ; preds = %if.then236
  %120 = load i32* %lrc, align 4
  %call239 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %120)
  br label %if.end240

if.end240:                                        ; preds = %if.then238, %if.then236
  br label %if.end241

if.end241:                                        ; preds = %if.end240, %if.end229
  store i8 12, i8* %cl, align 1
  store i64 10, i64* %lr, align 8
  %121 = load i64* %lr, align 8
  %122 = load i8* %cl, align 1
  %conv242 = sext i8 %122 to i64
  %or243 = or i64 %conv242, %121
  %conv244 = trunc i64 %or243 to i8
  store i8 %conv244, i8* %cl, align 1
  %123 = load i8* %cl, align 1
  %conv245 = sext i8 %123 to i32
  %cmp246 = icmp ne i32 %conv245, 14
  br i1 %cmp246, label %if.then248, label %if.end253

if.then248:                                       ; preds = %if.end241
  store i32 374, i32* %lrc, align 4
  %124 = load i32* %prlc, align 4
  %tobool249 = icmp ne i32 %124, 0
  br i1 %tobool249, label %if.then250, label %if.end252

if.then250:                                       ; preds = %if.then248
  %125 = load i32* %lrc, align 4
  %call251 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %125)
  br label %if.end252

if.end252:                                        ; preds = %if.then250, %if.then248
  br label %if.end253

if.end253:                                        ; preds = %if.end252, %if.end241
  store i8 12, i8* %cl, align 1
  store i32 10, i32* %ur, align 4
  %126 = load i32* %ur, align 4
  %127 = load i8* %cl, align 1
  %conv254 = sext i8 %127 to i32
  %or255 = or i32 %conv254, %126
  %conv256 = trunc i32 %or255 to i8
  store i8 %conv256, i8* %cl, align 1
  %128 = load i8* %cl, align 1
  %conv257 = sext i8 %128 to i32
  %cmp258 = icmp ne i32 %conv257, 14
  br i1 %cmp258, label %if.then260, label %if.end265

if.then260:                                       ; preds = %if.end253
  store i32 375, i32* %lrc, align 4
  %129 = load i32* %prlc, align 4
  %tobool261 = icmp ne i32 %129, 0
  br i1 %tobool261, label %if.then262, label %if.end264

if.then262:                                       ; preds = %if.then260
  %130 = load i32* %lrc, align 4
  %call263 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %130)
  br label %if.end264

if.end264:                                        ; preds = %if.then262, %if.then260
  br label %if.end265

if.end265:                                        ; preds = %if.end264, %if.end253
  store i16 12, i16* %sl, align 2
  store i8 10, i8* %cr, align 1
  %131 = load i8* %cr, align 1
  %conv266 = sext i8 %131 to i32
  %132 = load i16* %sl, align 2
  %conv267 = sext i16 %132 to i32
  %or268 = or i32 %conv267, %conv266
  %conv269 = trunc i32 %or268 to i16
  store i16 %conv269, i16* %sl, align 2
  %133 = load i16* %sl, align 2
  %conv270 = sext i16 %133 to i32
  %cmp271 = icmp ne i32 %conv270, 14
  br i1 %cmp271, label %if.then273, label %if.end278

if.then273:                                       ; preds = %if.end265
  store i32 376, i32* %lrc, align 4
  %134 = load i32* %prlc, align 4
  %tobool274 = icmp ne i32 %134, 0
  br i1 %tobool274, label %if.then275, label %if.end277

if.then275:                                       ; preds = %if.then273
  %135 = load i32* %lrc, align 4
  %call276 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %135)
  br label %if.end277

if.end277:                                        ; preds = %if.then275, %if.then273
  br label %if.end278

if.end278:                                        ; preds = %if.end277, %if.end265
  store i16 12, i16* %sl, align 2
  store i16 10, i16* %sr, align 2
  %136 = load i16* %sr, align 2
  %conv279 = sext i16 %136 to i32
  %137 = load i16* %sl, align 2
  %conv280 = sext i16 %137 to i32
  %or281 = or i32 %conv280, %conv279
  %conv282 = trunc i32 %or281 to i16
  store i16 %conv282, i16* %sl, align 2
  %138 = load i16* %sl, align 2
  %conv283 = sext i16 %138 to i32
  %cmp284 = icmp ne i32 %conv283, 14
  br i1 %cmp284, label %if.then286, label %if.end291

if.then286:                                       ; preds = %if.end278
  store i32 377, i32* %lrc, align 4
  %139 = load i32* %prlc, align 4
  %tobool287 = icmp ne i32 %139, 0
  br i1 %tobool287, label %if.then288, label %if.end290

if.then288:                                       ; preds = %if.then286
  %140 = load i32* %lrc, align 4
  %call289 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %140)
  br label %if.end290

if.end290:                                        ; preds = %if.then288, %if.then286
  br label %if.end291

if.end291:                                        ; preds = %if.end290, %if.end278
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ir, align 4
  %141 = load i32* %ir, align 4
  %142 = load i16* %sl, align 2
  %conv292 = sext i16 %142 to i32
  %or293 = or i32 %conv292, %141
  %conv294 = trunc i32 %or293 to i16
  store i16 %conv294, i16* %sl, align 2
  %143 = load i16* %sl, align 2
  %conv295 = sext i16 %143 to i32
  %cmp296 = icmp ne i32 %conv295, 14
  br i1 %cmp296, label %if.then298, label %if.end303

if.then298:                                       ; preds = %if.end291
  store i32 378, i32* %lrc, align 4
  %144 = load i32* %prlc, align 4
  %tobool299 = icmp ne i32 %144, 0
  br i1 %tobool299, label %if.then300, label %if.end302

if.then300:                                       ; preds = %if.then298
  %145 = load i32* %lrc, align 4
  %call301 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %145)
  br label %if.end302

if.end302:                                        ; preds = %if.then300, %if.then298
  br label %if.end303

if.end303:                                        ; preds = %if.end302, %if.end291
  store i16 12, i16* %sl, align 2
  store i64 10, i64* %lr, align 8
  %146 = load i64* %lr, align 8
  %147 = load i16* %sl, align 2
  %conv304 = sext i16 %147 to i64
  %or305 = or i64 %conv304, %146
  %conv306 = trunc i64 %or305 to i16
  store i16 %conv306, i16* %sl, align 2
  %148 = load i16* %sl, align 2
  %conv307 = sext i16 %148 to i32
  %cmp308 = icmp ne i32 %conv307, 14
  br i1 %cmp308, label %if.then310, label %if.end315

if.then310:                                       ; preds = %if.end303
  store i32 379, i32* %lrc, align 4
  %149 = load i32* %prlc, align 4
  %tobool311 = icmp ne i32 %149, 0
  br i1 %tobool311, label %if.then312, label %if.end314

if.then312:                                       ; preds = %if.then310
  %150 = load i32* %lrc, align 4
  %call313 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %150)
  br label %if.end314

if.end314:                                        ; preds = %if.then312, %if.then310
  br label %if.end315

if.end315:                                        ; preds = %if.end314, %if.end303
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ur, align 4
  %151 = load i32* %ur, align 4
  %152 = load i16* %sl, align 2
  %conv316 = sext i16 %152 to i32
  %or317 = or i32 %conv316, %151
  %conv318 = trunc i32 %or317 to i16
  store i16 %conv318, i16* %sl, align 2
  %153 = load i16* %sl, align 2
  %conv319 = sext i16 %153 to i32
  %cmp320 = icmp ne i32 %conv319, 14
  br i1 %cmp320, label %if.then322, label %if.end327

if.then322:                                       ; preds = %if.end315
  store i32 380, i32* %lrc, align 4
  %154 = load i32* %prlc, align 4
  %tobool323 = icmp ne i32 %154, 0
  br i1 %tobool323, label %if.then324, label %if.end326

if.then324:                                       ; preds = %if.then322
  %155 = load i32* %lrc, align 4
  %call325 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %155)
  br label %if.end326

if.end326:                                        ; preds = %if.then324, %if.then322
  br label %if.end327

if.end327:                                        ; preds = %if.end326, %if.end315
  store i32 12, i32* %il, align 4
  store i8 10, i8* %cr, align 1
  %156 = load i8* %cr, align 1
  %conv328 = sext i8 %156 to i32
  %157 = load i32* %il, align 4
  %or329 = or i32 %157, %conv328
  store i32 %or329, i32* %il, align 4
  %158 = load i32* %il, align 4
  %cmp330 = icmp ne i32 %158, 14
  br i1 %cmp330, label %if.then332, label %if.end337

if.then332:                                       ; preds = %if.end327
  store i32 381, i32* %lrc, align 4
  %159 = load i32* %prlc, align 4
  %tobool333 = icmp ne i32 %159, 0
  br i1 %tobool333, label %if.then334, label %if.end336

if.then334:                                       ; preds = %if.then332
  %160 = load i32* %lrc, align 4
  %call335 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %160)
  br label %if.end336

if.end336:                                        ; preds = %if.then334, %if.then332
  br label %if.end337

if.end337:                                        ; preds = %if.end336, %if.end327
  store i32 12, i32* %il, align 4
  store i16 10, i16* %sr, align 2
  %161 = load i16* %sr, align 2
  %conv338 = sext i16 %161 to i32
  %162 = load i32* %il, align 4
  %or339 = or i32 %162, %conv338
  store i32 %or339, i32* %il, align 4
  %163 = load i32* %il, align 4
  %cmp340 = icmp ne i32 %163, 14
  br i1 %cmp340, label %if.then342, label %if.end347

if.then342:                                       ; preds = %if.end337
  store i32 382, i32* %lrc, align 4
  %164 = load i32* %prlc, align 4
  %tobool343 = icmp ne i32 %164, 0
  br i1 %tobool343, label %if.then344, label %if.end346

if.then344:                                       ; preds = %if.then342
  %165 = load i32* %lrc, align 4
  %call345 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %165)
  br label %if.end346

if.end346:                                        ; preds = %if.then344, %if.then342
  br label %if.end347

if.end347:                                        ; preds = %if.end346, %if.end337
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ir, align 4
  %166 = load i32* %ir, align 4
  %167 = load i32* %il, align 4
  %or348 = or i32 %167, %166
  store i32 %or348, i32* %il, align 4
  %168 = load i32* %il, align 4
  %cmp349 = icmp ne i32 %168, 14
  br i1 %cmp349, label %if.then351, label %if.end356

if.then351:                                       ; preds = %if.end347
  store i32 383, i32* %lrc, align 4
  %169 = load i32* %prlc, align 4
  %tobool352 = icmp ne i32 %169, 0
  br i1 %tobool352, label %if.then353, label %if.end355

if.then353:                                       ; preds = %if.then351
  %170 = load i32* %lrc, align 4
  %call354 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %170)
  br label %if.end355

if.end355:                                        ; preds = %if.then353, %if.then351
  br label %if.end356

if.end356:                                        ; preds = %if.end355, %if.end347
  store i32 12, i32* %il, align 4
  store i64 10, i64* %lr, align 8
  %171 = load i64* %lr, align 8
  %172 = load i32* %il, align 4
  %conv357 = sext i32 %172 to i64
  %or358 = or i64 %conv357, %171
  %conv359 = trunc i64 %or358 to i32
  store i32 %conv359, i32* %il, align 4
  %173 = load i32* %il, align 4
  %cmp360 = icmp ne i32 %173, 14
  br i1 %cmp360, label %if.then362, label %if.end367

if.then362:                                       ; preds = %if.end356
  store i32 384, i32* %lrc, align 4
  %174 = load i32* %prlc, align 4
  %tobool363 = icmp ne i32 %174, 0
  br i1 %tobool363, label %if.then364, label %if.end366

if.then364:                                       ; preds = %if.then362
  %175 = load i32* %lrc, align 4
  %call365 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %175)
  br label %if.end366

if.end366:                                        ; preds = %if.then364, %if.then362
  br label %if.end367

if.end367:                                        ; preds = %if.end366, %if.end356
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ur, align 4
  %176 = load i32* %ur, align 4
  %177 = load i32* %il, align 4
  %or368 = or i32 %177, %176
  store i32 %or368, i32* %il, align 4
  %178 = load i32* %il, align 4
  %cmp369 = icmp ne i32 %178, 14
  br i1 %cmp369, label %if.then371, label %if.end376

if.then371:                                       ; preds = %if.end367
  store i32 385, i32* %lrc, align 4
  %179 = load i32* %prlc, align 4
  %tobool372 = icmp ne i32 %179, 0
  br i1 %tobool372, label %if.then373, label %if.end375

if.then373:                                       ; preds = %if.then371
  %180 = load i32* %lrc, align 4
  %call374 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %180)
  br label %if.end375

if.end375:                                        ; preds = %if.then373, %if.then371
  br label %if.end376

if.end376:                                        ; preds = %if.end375, %if.end367
  store i64 12, i64* %ll, align 8
  store i8 10, i8* %cr, align 1
  %181 = load i8* %cr, align 1
  %conv377 = sext i8 %181 to i64
  %182 = load i64* %ll, align 8
  %or378 = or i64 %182, %conv377
  store i64 %or378, i64* %ll, align 8
  %183 = load i64* %ll, align 8
  %cmp379 = icmp ne i64 %183, 14
  br i1 %cmp379, label %if.then381, label %if.end386

if.then381:                                       ; preds = %if.end376
  store i32 386, i32* %lrc, align 4
  %184 = load i32* %prlc, align 4
  %tobool382 = icmp ne i32 %184, 0
  br i1 %tobool382, label %if.then383, label %if.end385

if.then383:                                       ; preds = %if.then381
  %185 = load i32* %lrc, align 4
  %call384 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %185)
  br label %if.end385

if.end385:                                        ; preds = %if.then383, %if.then381
  br label %if.end386

if.end386:                                        ; preds = %if.end385, %if.end376
  store i64 12, i64* %ll, align 8
  store i16 10, i16* %sr, align 2
  %186 = load i16* %sr, align 2
  %conv387 = sext i16 %186 to i64
  %187 = load i64* %ll, align 8
  %or388 = or i64 %187, %conv387
  store i64 %or388, i64* %ll, align 8
  %188 = load i64* %ll, align 8
  %cmp389 = icmp ne i64 %188, 14
  br i1 %cmp389, label %if.then391, label %if.end396

if.then391:                                       ; preds = %if.end386
  store i32 387, i32* %lrc, align 4
  %189 = load i32* %prlc, align 4
  %tobool392 = icmp ne i32 %189, 0
  br i1 %tobool392, label %if.then393, label %if.end395

if.then393:                                       ; preds = %if.then391
  %190 = load i32* %lrc, align 4
  %call394 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %190)
  br label %if.end395

if.end395:                                        ; preds = %if.then393, %if.then391
  br label %if.end396

if.end396:                                        ; preds = %if.end395, %if.end386
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ir, align 4
  %191 = load i32* %ir, align 4
  %conv397 = sext i32 %191 to i64
  %192 = load i64* %ll, align 8
  %or398 = or i64 %192, %conv397
  store i64 %or398, i64* %ll, align 8
  %193 = load i64* %ll, align 8
  %cmp399 = icmp ne i64 %193, 14
  br i1 %cmp399, label %if.then401, label %if.end406

if.then401:                                       ; preds = %if.end396
  store i32 388, i32* %lrc, align 4
  %194 = load i32* %prlc, align 4
  %tobool402 = icmp ne i32 %194, 0
  br i1 %tobool402, label %if.then403, label %if.end405

if.then403:                                       ; preds = %if.then401
  %195 = load i32* %lrc, align 4
  %call404 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %195)
  br label %if.end405

if.end405:                                        ; preds = %if.then403, %if.then401
  br label %if.end406

if.end406:                                        ; preds = %if.end405, %if.end396
  store i64 12, i64* %ll, align 8
  store i64 10, i64* %lr, align 8
  %196 = load i64* %lr, align 8
  %197 = load i64* %ll, align 8
  %or407 = or i64 %197, %196
  store i64 %or407, i64* %ll, align 8
  %198 = load i64* %ll, align 8
  %cmp408 = icmp ne i64 %198, 14
  br i1 %cmp408, label %if.then410, label %if.end415

if.then410:                                       ; preds = %if.end406
  store i32 389, i32* %lrc, align 4
  %199 = load i32* %prlc, align 4
  %tobool411 = icmp ne i32 %199, 0
  br i1 %tobool411, label %if.then412, label %if.end414

if.then412:                                       ; preds = %if.then410
  %200 = load i32* %lrc, align 4
  %call413 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %200)
  br label %if.end414

if.end414:                                        ; preds = %if.then412, %if.then410
  br label %if.end415

if.end415:                                        ; preds = %if.end414, %if.end406
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ur, align 4
  %201 = load i32* %ur, align 4
  %conv416 = zext i32 %201 to i64
  %202 = load i64* %ll, align 8
  %or417 = or i64 %202, %conv416
  store i64 %or417, i64* %ll, align 8
  %203 = load i64* %ll, align 8
  %cmp418 = icmp ne i64 %203, 14
  br i1 %cmp418, label %if.then420, label %if.end425

if.then420:                                       ; preds = %if.end415
  store i32 390, i32* %lrc, align 4
  %204 = load i32* %prlc, align 4
  %tobool421 = icmp ne i32 %204, 0
  br i1 %tobool421, label %if.then422, label %if.end424

if.then422:                                       ; preds = %if.then420
  %205 = load i32* %lrc, align 4
  %call423 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %205)
  br label %if.end424

if.end424:                                        ; preds = %if.then422, %if.then420
  br label %if.end425

if.end425:                                        ; preds = %if.end424, %if.end415
  store i32 12, i32* %ul, align 4
  store i8 10, i8* %cr, align 1
  %206 = load i8* %cr, align 1
  %conv426 = sext i8 %206 to i32
  %207 = load i32* %ul, align 4
  %or427 = or i32 %207, %conv426
  store i32 %or427, i32* %ul, align 4
  %208 = load i32* %ul, align 4
  %cmp428 = icmp ne i32 %208, 14
  br i1 %cmp428, label %if.then430, label %if.end435

if.then430:                                       ; preds = %if.end425
  store i32 391, i32* %lrc, align 4
  %209 = load i32* %prlc, align 4
  %tobool431 = icmp ne i32 %209, 0
  br i1 %tobool431, label %if.then432, label %if.end434

if.then432:                                       ; preds = %if.then430
  %210 = load i32* %lrc, align 4
  %call433 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %210)
  br label %if.end434

if.end434:                                        ; preds = %if.then432, %if.then430
  br label %if.end435

if.end435:                                        ; preds = %if.end434, %if.end425
  store i32 12, i32* %ul, align 4
  store i16 10, i16* %sr, align 2
  %211 = load i16* %sr, align 2
  %conv436 = sext i16 %211 to i32
  %212 = load i32* %ul, align 4
  %or437 = or i32 %212, %conv436
  store i32 %or437, i32* %ul, align 4
  %213 = load i32* %ul, align 4
  %cmp438 = icmp ne i32 %213, 14
  br i1 %cmp438, label %if.then440, label %if.end445

if.then440:                                       ; preds = %if.end435
  store i32 392, i32* %lrc, align 4
  %214 = load i32* %prlc, align 4
  %tobool441 = icmp ne i32 %214, 0
  br i1 %tobool441, label %if.then442, label %if.end444

if.then442:                                       ; preds = %if.then440
  %215 = load i32* %lrc, align 4
  %call443 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %215)
  br label %if.end444

if.end444:                                        ; preds = %if.then442, %if.then440
  br label %if.end445

if.end445:                                        ; preds = %if.end444, %if.end435
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ir, align 4
  %216 = load i32* %ir, align 4
  %217 = load i32* %ul, align 4
  %or446 = or i32 %217, %216
  store i32 %or446, i32* %ul, align 4
  %218 = load i32* %ul, align 4
  %cmp447 = icmp ne i32 %218, 14
  br i1 %cmp447, label %if.then449, label %if.end454

if.then449:                                       ; preds = %if.end445
  store i32 393, i32* %lrc, align 4
  %219 = load i32* %prlc, align 4
  %tobool450 = icmp ne i32 %219, 0
  br i1 %tobool450, label %if.then451, label %if.end453

if.then451:                                       ; preds = %if.then449
  %220 = load i32* %lrc, align 4
  %call452 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %220)
  br label %if.end453

if.end453:                                        ; preds = %if.then451, %if.then449
  br label %if.end454

if.end454:                                        ; preds = %if.end453, %if.end445
  store i32 12, i32* %ul, align 4
  store i64 10, i64* %lr, align 8
  %221 = load i64* %lr, align 8
  %222 = load i32* %ul, align 4
  %conv455 = zext i32 %222 to i64
  %or456 = or i64 %conv455, %221
  %conv457 = trunc i64 %or456 to i32
  store i32 %conv457, i32* %ul, align 4
  %223 = load i32* %ul, align 4
  %cmp458 = icmp ne i32 %223, 14
  br i1 %cmp458, label %if.then460, label %if.end465

if.then460:                                       ; preds = %if.end454
  store i32 394, i32* %lrc, align 4
  %224 = load i32* %prlc, align 4
  %tobool461 = icmp ne i32 %224, 0
  br i1 %tobool461, label %if.then462, label %if.end464

if.then462:                                       ; preds = %if.then460
  %225 = load i32* %lrc, align 4
  %call463 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %225)
  br label %if.end464

if.end464:                                        ; preds = %if.then462, %if.then460
  br label %if.end465

if.end465:                                        ; preds = %if.end464, %if.end454
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ur, align 4
  %226 = load i32* %ur, align 4
  %227 = load i32* %ul, align 4
  %or466 = or i32 %227, %226
  store i32 %or466, i32* %ul, align 4
  %228 = load i32* %ul, align 4
  %cmp467 = icmp ne i32 %228, 14
  br i1 %cmp467, label %if.then469, label %if.end474

if.then469:                                       ; preds = %if.end465
  store i32 395, i32* %lrc, align 4
  %229 = load i32* %prlc, align 4
  %tobool470 = icmp ne i32 %229, 0
  br i1 %tobool470, label %if.then471, label %if.end473

if.then471:                                       ; preds = %if.then469
  %230 = load i32* %lrc, align 4
  %call472 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %230)
  br label %if.end473

if.end473:                                        ; preds = %if.then471, %if.then469
  br label %if.end474

if.end474:                                        ; preds = %if.end473, %if.end465
  %231 = load i32* %lrc, align 4
  %cmp475 = icmp ne i32 %231, 0
  br i1 %cmp475, label %if.then477, label %if.end483

if.then477:                                       ; preds = %if.end474
  store i32 1, i32* %rc, align 4
  %232 = load %struct.defs** %pd0.addr, align 8
  %flgd = getelementptr inbounds %struct.defs* %232, i32 0, i32 11
  %233 = load i32* %flgd, align 4
  %cmp478 = icmp ne i32 %233, 0
  br i1 %cmp478, label %if.then480, label %if.end482

if.then480:                                       ; preds = %if.then477
  %call481 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %if.end482

if.end482:                                        ; preds = %if.then480, %if.then477
  br label %if.end483

if.end483:                                        ; preds = %if.end482, %if.end474
  %234 = load i32* %rc, align 4
  ret i32 %234
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 9), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 10), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 11), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 12), align 4
  store %struct.defs* @main.d0, %struct.defs** @main.pd0, align 8
  %0 = load %struct.defs** @main.pd0, align 8
  %call = call i32 (...)* bitcast (i32 (%struct.defs*)* @sec to i32 (...)*)(%struct.defs* %0)
  store i32 %call, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 13), align 4
  %1 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %2 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 13), align 4
  %add = add nsw i32 %1, %2
  store i32 %add, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %3 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 9), align 4
  %cmp = icmp ne i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 13), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %cmp2 = icmp eq i32 %5, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  br label %if.end6

if.else:                                          ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  ret i32 0
}
