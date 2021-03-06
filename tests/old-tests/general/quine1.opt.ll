; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/quine1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"    \22\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"\5C\5C\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"\5C\22\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"\5Cn\00", align 1
@.str5 = private unnamed_addr constant [8 x i8] c"\22\0A    \22\00", align 1
@progdata = constant [1932 x i8] c"/* A simple quine (self-printing program), in standard C. */\0A\0A/* Note: in designing this quine, we have tried to make the code clear\0A * and readable, not concise and obscure as many quines are, so that\0A * the general principle can be made clear at the expense of length.\0A * In a nutshell: use the same data structure (called \22progdata\22\0A * below) to output the program code (which it represents) and its own\0A * textual representation. */\0A\0A#include <stdio.h>\0A\0Avoid quote(const char *s)\0A     /* This function takes a character string s and prints the\0A      * textual representation of s as it might appear formatted\0A      * in C code. */\0A{\0A    int i;\0A\0A    printf(\22    \5C\22\22);\0A    for (i=0; s[i]; ++i) {\0A        /* Certain characters are quoted. */\0A        if (s[i] == '\5C\5C')\0A            printf(\22\5C\5C\5C\5C\22);\0A        else if (s[i] == '\22')\0A            printf(\22\5C\5C\5C\22\22);\0A        else if (s[i] == '\5Cn')\0A            printf(\22\5C\5Cn\22);\0A        /* Others are just printed as such. */\0A        else\0A            printf(\22%c\22, s[i]);\0A        /* Also insert occasional line breaks. */\0A        if (i % 48 == 47)\0A            printf(\22\5C\22\5Cn    \5C\22\22);\0A    }\0A    printf(\22\5C\22\22);\0A}\0A\0A/* What follows is a string representation of the program code,\0A * from beginning to end (formatted as per the quote() function\0A * above), except that the string _itself_ is coded as two\0A * consecutive '@' characters. */\0Aconst char progdata[] =\0A@@;\0A\0Aint main(void)\0A     /* The program itself... */\0A{\0A    int i;\0A\0A    /* Print the program code, character by character. */\0A    for (i=0; progdata[i]; ++i) {\0A        if (progdata[i] == '@' && progdata[i+1] == '@')\0A            /* We encounter two '@' signs, so we must print the quoted\0A             * form of the program code. */\0A        {\0A            quote(progdata);    /* Quote all. */\0A            i++;                /* Skip second '@'. */\0A        } else\0A            printf(\22%c\22, progdata[i]);  /* Print character. */\0A    }\0A    return 0;\0A}\0A\00", align 16

define void @quote(i8* %s) nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) nounwind
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar to i32
  %arrayidx = getelementptr i8* %s, i64 %indvar
  %tmp2 = load i8* %arrayidx, align 1
  switch i8 %tmp2, label %if.else31 [
    i8 0, label %for.end
    i8 92, label %if.then
    i8 34, label %if.then18
    i8 10, label %if.then29
  ]

if.then:                                          ; preds = %for.cond
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end40

if.then18:                                        ; preds = %for.cond
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str2, i64 0, i64 0)) nounwind
  br label %if.end40

if.then29:                                        ; preds = %for.cond
  %call30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str3, i64 0, i64 0)) nounwind
  br label %if.end40

if.else31:                                        ; preds = %for.cond
  %conv37 = sext i8 %tmp2 to i32
  %putchar = tail call i32 @putchar(i32 %conv37) nounwind
  br label %if.end40

if.end40:                                         ; preds = %if.then18, %if.else31, %if.then29, %if.then
  %rem = srem i32 %storemerge, 48
  %cmp42 = icmp eq i32 %rem, 47
  br i1 %cmp42, label %if.then44, label %for.inc

if.then44:                                        ; preds = %if.end40
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str5, i64 0, i64 0)) nounwind
  br label %for.inc

for.inc:                                          ; preds = %if.end40, %if.then44
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %putchar1 = tail call i32 @putchar(i32 34) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %storemerge = phi i32 [ 0, %entry ], [ %inc21, %for.inc ]
  %idxprom = sext i32 %storemerge to i64
  %arrayidx = getelementptr inbounds [1932 x i8]* @progdata, i64 0, i64 %idxprom
  %tmp1 = load i8* %arrayidx, align 1
  switch i8 %tmp1, label %if.else [
    i8 0, label %for.end
    i8 64, label %land.lhs.true
  ]

land.lhs.true:                                    ; preds = %for.cond
  %add = add nsw i32 %storemerge, 1
  %idxprom8 = sext i32 %add to i64
  %arrayidx9 = getelementptr inbounds [1932 x i8]* @progdata, i64 0, i64 %idxprom8
  %tmp10 = load i8* %arrayidx9, align 1
  %cmp12 = icmp eq i8 %tmp10, 64
  br i1 %cmp12, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  tail call void @quote(i8* getelementptr inbounds ([1932 x i8]* @progdata, i64 0, i64 0))
  br label %for.inc

if.else:                                          ; preds = %for.cond, %land.lhs.true
  %conv19 = sext i8 %tmp1 to i32
  %putchar = tail call i32 @putchar(i32 %conv19) nounwind
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %storemerge1 = phi i32 [ %add, %if.then ], [ %storemerge, %if.else ]
  %inc21 = add nsw i32 %storemerge1, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare i32 @putchar(i32)
