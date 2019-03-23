source_filename = "aes-128.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"
@RC = dso_local global [10 x i32] [i32 1, i32 2, i32 4, i32 8, i32 16, i32 32, i32 64, i32 128, i32 27, i32 54], align 16
@.str = private unnamed_addr constant [33 x i8] c"0f1571c947d9e8590cb7add6af7f6798\00", align 1
@S_BOX = internal constant [16 x [16 x i32]] [[16 x i32] [i32 99, i32 124, i32 119, i32 123, i32 242, i32 107, i32 111, i32 197, i32 48, i32 1, i32 103, i32 43, i32 254, i32 215, i32 171, i32 118], [16 x i32] [i32 202, i32 130, i32 201, i32 125, i32 250, i32 89, i32 71, i32 240, i32 173, i32 212, i32 162, i32 175, i32 156, i32 164, i32 114, i32 192], [16 x i32] [i32 183, i32 253, i32 147, i32 38, i32 54, i32 63, i32 247, i32 204, i32 52, i32 165, i32 229, i32 241, i32 113, i32 216, i32 49, i32 21], [16 x i32] [i32 4, i32 199, i32 35, i32 195, i32 24, i32 150, i32 5, i32 154, i32 7, i32 18, i32 128, i32 226, i32 235, i32 39, i32 178, i32 117], [16 x i32] [i32 9, i32 131, i32 44, i32 26, i32 27, i32 110, i32 90, i32 160, i32 82, i32 59, i32 214, i32 179, i32 41, i32 227, i32 47, i32 132], [16 x i32] [i32 83, i32 209, i32 0, i32 237, i32 32, i32 252, i32 177, i32 91, i32 106, i32 203, i32 190, i32 57, i32 74, i32 76, i32 88, i32 207], [16 x i32] [i32 208, i32 239, i32 170, i32 251, i32 67, i32 77, i32 51, i32 133, i32 69, i32 249, i32 2, i32 127, i32 80, i32 60, i32 159, i32 168], [16 x i32] [i32 81, i32 163, i32 64, i32 143, i32 146, i32 157, i32 56, i32 245, i32 188, i32 182, i32 218, i32 33, i32 16, i32 255, i32 243, i32 210], [16 x i32] [i32 205, i32 12, i32 19, i32 236, i32 95, i32 151, i32 68, i32 23, i32 196, i32 167, i32 126, i32 61, i32 100, i32 93, i32 25, i32 115], [16 x i32] [i32 96, i32 129, i32 79, i32 220, i32 34, i32 42, i32 144, i32 136, i32 70, i32 238, i32 184, i32 20, i32 222, i32 94, i32 11, i32 219], [16 x i32] [i32 224, i32 50, i32 58, i32 10, i32 73, i32 6, i32 36, i32 92, i32 194, i32 211, i32 172, i32 98, i32 145, i32 149, i32 228, i32 121], [16 x i32] [i32 231, i32 200, i32 55, i32 109, i32 141, i32 213, i32 78, i32 169, i32 108, i32 86, i32 244, i32 234, i32 101, i32 122, i32 174, i32 8], [16 x i32] [i32 186, i32 120, i32 37, i32 46, i32 28, i32 166, i32 180, i32 198, i32 232, i32 221, i32 116, i32 31, i32 75, i32 189, i32 139, i32 138], [16 x i32] [i32 112, i32 62, i32 181, i32 102, i32 72, i32 3, i32 246, i32 14, i32 97, i32 53, i32 87, i32 185, i32 134, i32 193, i32 29, i32 158], [16 x i32] [i32 225, i32 248, i32 152, i32 17, i32 105, i32 217, i32 142, i32 148, i32 155, i32 30, i32 135, i32 233, i32 206, i32 85, i32 40, i32 223], [16 x i32] [i32 140, i32 161, i32 137, i32 13, i32 191, i32 230, i32 66, i32 104, i32 65, i32 153, i32 45, i32 15, i32 176, i32 84, i32 187, i32 22]], align 16
@INVERSE_S_BOX = internal constant [16 x [16 x i32]] [[16 x i32] [i32 82, i32 9, i32 106, i32 213, i32 48, i32 54, i32 165, i32 56, i32 191, i32 64, i32 163, i32 158, i32 129, i32 243, i32 215, i32 251], [16 x i32] [i32 124, i32 227, i32 57, i32 130, i32 155, i32 47, i32 255, i32 135, i32 52, i32 142, i32 67, i32 68, i32 196, i32 222, i32 233, i32 203], [16 x i32] [i32 84, i32 123, i32 148, i32 50, i32 166, i32 194, i32 35, i32 61, i32 238, i32 76, i32 149, i32 11, i32 66, i32 250, i32 195, i32 78], [16 x i32] [i32 8, i32 46, i32 161, i32 102, i32 40, i32 217, i32 36, i32 178, i32 118, i32 91, i32 162, i32 73, i32 109, i32 139, i32 209, i32 37], [16 x i32] [i32 114, i32 248, i32 246, i32 100, i32 134, i32 104, i32 152, i32 22, i32 212, i32 164, i32 92, i32 204, i32 93, i32 101, i32 182, i32 146], [16 x i32] [i32 108, i32 112, i32 72, i32 80, i32 253, i32 237, i32 185, i32 218, i32 94, i32 21, i32 70, i32 87, i32 167, i32 141, i32 157, i32 132], [16 x i32] [i32 144, i32 216, i32 171, i32 0, i32 140, i32 188, i32 211, i32 10, i32 247, i32 228, i32 88, i32 5, i32 184, i32 179, i32 69, i32 6], [16 x i32] [i32 208, i32 44, i32 30, i32 143, i32 202, i32 63, i32 15, i32 2, i32 193, i32 175, i32 189, i32 3, i32 1, i32 19, i32 138, i32 107], [16 x i32] [i32 58, i32 145, i32 17, i32 65, i32 79, i32 103, i32 220, i32 234, i32 151, i32 242, i32 207, i32 206, i32 240, i32 180, i32 230, i32 115], [16 x i32] [i32 150, i32 172, i32 116, i32 34, i32 231, i32 173, i32 53, i32 133, i32 226, i32 249, i32 55, i32 232, i32 28, i32 117, i32 223, i32 110], [16 x i32] [i32 71, i32 241, i32 26, i32 113, i32 29, i32 41, i32 197, i32 137, i32 111, i32 183, i32 98, i32 14, i32 170, i32 24, i32 190, i32 27], [16 x i32] [i32 252, i32 86, i32 62, i32 75, i32 198, i32 210, i32 121, i32 32, i32 154, i32 219, i32 192, i32 254, i32 120, i32 205, i32 90, i32 244], [16 x i32] [i32 31, i32 221, i32 168, i32 51, i32 136, i32 7, i32 199, i32 49, i32 177, i32 18, i32 16, i32 89, i32 39, i32 128, i32 236, i32 95], [16 x i32] [i32 96, i32 81, i32 127, i32 169, i32 25, i32 181, i32 74, i32 13, i32 45, i32 229, i32 122, i32 159, i32 147, i32 201, i32 156, i32 239], [16 x i32] [i32 160, i32 224, i32 59, i32 77, i32 174, i32 42, i32 245, i32 176, i32 200, i32 235, i32 187, i32 60, i32 131, i32 83, i32 153, i32 97], [16 x i32] [i32 23, i32 43, i32 4, i32 126, i32 186, i32 119, i32 214, i32 38, i32 225, i32 105, i32 20, i32 99, i32 85, i32 33, i32 12, i32 125]], align 16
declare dso_local void @jump(i32, i32) #1
define dso_local i32 @aes(i8* %source_path, i8* %des_path, i32 %len, i32 %method) #0 {
entry:
  %nfv.jmp2.loop = alloca i32, align 4
  store i32 -1, i32* %nfv.jmp2.loop, align 4
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %nfv.cond.pointer2 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer2, align 4
  %source_path.addr = alloca i8*, align 8
  %des_path.addr = alloca i8*, align 8
  %len.addr = alloca i32, align 4
  %method.addr = alloca i32, align 4
  %password = alloca i8*, align 8
  %p = alloca [4 x [4 x i32]], align 16
  %m = alloca i32, align 4
  %i = alloca i32, align 4
  %indx = alloca i32, align 4
  %size = alloca i32, align 4
  %saved_stack = alloca i8*, align 8
  %__vla_expr = alloca i64, align 8
  %j = alloca i32, align 4
  %__vla_expr30 = alloca i64, align 8
  %i31 = alloca i32, align 4
  %content_to_int = alloca [4 x [4 x i32]], align 16
  %j37 = alloca i32, align 4
  %k = alloca i32, align 4
  %j64 = alloca i32, align 4
  %k69 = alloca i32, align 4
  store i8* %source_path, i8** %source_path.addr, align 8
  store i8* %des_path, i8** %des_path.addr, align 8
  store i32 %len, i32* %len.addr, align 4
  store i32 %method, i32* %method.addr, align 4
  store i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str, i32 0, i32 0), i8** %password, align 8
  store i32 0, i32* %m, align 4
  br label %nfv.jmp0
 
for.cond:
  %0 = load i32, i32* %m, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  store i32 0, i32* %i, align 4
  br label %for.cond1
 
for.cond1:
  %1 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %1, 4
  br i1 %cmp2, label %for.body3, label %for.end
 
for.body3:
  %2 = load i32, i32* %i, align 4
  %mul = mul nsw i32 4, %2
  %3 = load i32, i32* %m, align 4
  %add = add nsw i32 %mul, %3
  store i32 %add, i32* %indx, align 4
  %4 = load i8*, i8** %password, align 8
  %5 = load i32, i32* %indx, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %idxprom
  %6 = load i8, i8* %arrayidx, align 1
  %call = call i32 @c2i(i8 signext %6)
  %mul4 = mul nsw i32 16, %call
  %7 = load i8*, i8** %password, align 8
  %8 = load i32, i32* %indx, align 4
  %add5 = add nsw i32 %8, 1
  %idxprom6 = sext i32 %add5 to i64
  %arrayidx7 = getelementptr inbounds i8, i8* %7, i64 %idxprom6
  %9 = load i8, i8* %arrayidx7, align 1
  %call8 = call i32 @c2i1(i8 signext %9)
  %add9 = add nsw i32 %mul4, %call8
  %10 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %10 to i64
  %arrayidx11 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %p, i64 0, i64 %idxprom10
  %11 = load i32, i32* %m, align 4
  %idxprom12 = sext i32 %11 to i64
  %arrayidx13 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx11, i64 0, i64 %idxprom12
  store i32 %add9, i32* %arrayidx13, align 4
  br label %for.inc
 
for.inc:
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1
 
for.end:
  br label %for.inc14
 
for.inc14:
  %13 = load i32, i32* %m, align 4
  %inc15 = add nsw i32 %13, 1
  store i32 %inc15, i32* %m, align 4
  br label %nfv.jmp0
 
for.end16:
  %14 = load i32, i32* %len.addr, align 4
  store i32 %14, i32* %size, align 4
  %15 = load i32, i32* %len.addr, align 4
  %rem = srem i32 %15, 16
  %cmp17 = icmp ne i32 %rem, 0
  br i1 %cmp17, label %if.then, label %if.end
 
if.then:
  %16 = load i32, i32* %len.addr, align 4
  %div = sdiv i32 %16, 16
  %add18 = add nsw i32 %div, 1
  %mul19 = mul nsw i32 %add18, 16
  store i32 %mul19, i32* %size, align 4
  br label %if.end
 
if.end:
  %17 = load i32, i32* %size, align 4
  %18 = zext i32 %17 to i64
  %19 = call i8* @llvm.stacksave()
  store i8* %19, i8** %saved_stack, align 8
  %vla = alloca i8, i64 %18, align 16
  store i64 %18, i64* %__vla_expr, align 8
  %20 = load i8*, i8** %source_path.addr, align 8
  %21 = load i32, i32* %len.addr, align 4
  %conv = sext i32 %21 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %vla, i8* align 1 %20, i64 %conv, i1 false)
  %22 = load i32, i32* %len.addr, align 4
  store i32 %22, i32* %j, align 4
  br label %nfv.jmp1
 
for.cond20:
  %23 = load i32, i32* %j, align 4
  %24 = load i32, i32* %size, align 4
  %cmp21 = icmp slt i32 %23, %24
  br i1 %cmp21, label %for.body23, label %nfv.jmp10
 
for.body23:
  %25 = load i32, i32* %j, align 4
  %idxprom24 = sext i32 %25 to i64
  %arrayidx25 = getelementptr inbounds i8, i8* %vla, i64 %idxprom24
  store i8 0, i8* %arrayidx25, align 1
  br label %for.inc26
 
for.inc26:
  %26 = load i32, i32* %j, align 4
  %inc27 = add nsw i32 %26, 1
  store i32 %inc27, i32* %j, align 4
  br label %nfv.jmp1
 
for.end28:
  %27 = load i32, i32* %size, align 4
  %28 = zext i32 %27 to i64
  %vla29 = alloca i8, i64 %28, align 16
  store i64 %28, i64* %__vla_expr30, align 8
  store i32 0, i32* %i31, align 4
  br label %nfv.jmp2
 
for.cond32:
  %29 = load i32, i32* %i31, align 4
  %30 = load i32, i32* %size, align 4
  %div33 = sdiv i32 %30, 16
  %cmp34 = icmp slt i32 %29, %div33
  br i1 %cmp34, label %for.body36, label %nfv.jmp20
 
for.body36:
  store i32 0, i32* %j37, align 4
  br label %for.cond38
 
for.cond38:
  %31 = load i32, i32* %j37, align 4
  %cmp39 = icmp slt i32 %31, 4
  br i1 %cmp39, label %for.body41, label %for.end62
 
for.body41:
  store i32 0, i32* %k, align 4
  br label %for.cond42
 
for.cond42:
  %32 = load i32, i32* %k, align 4
  %cmp43 = icmp slt i32 %32, 4
  br i1 %cmp43, label %for.body45, label %for.end59
 
for.body45:
  %33 = load i32, i32* %j37, align 4
  %mul46 = mul nsw i32 %33, 4
  %34 = load i32, i32* %k, align 4
  %add47 = add nsw i32 %mul46, %34
  %35 = load i32, i32* %i31, align 4
  %mul48 = mul nsw i32 16, %35
  %add49 = add nsw i32 %add47, %mul48
  %idxprom50 = sext i32 %add49 to i64
  %arrayidx51 = getelementptr inbounds i8, i8* %vla, i64 %idxprom50
  %36 = load i8, i8* %arrayidx51, align 1
  %conv52 = zext i8 %36 to i32
  %37 = load i32, i32* %j37, align 4
  %idxprom53 = sext i32 %37 to i64
  %arrayidx54 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %content_to_int, i64 0, i64 %idxprom53
  %38 = load i32, i32* %k, align 4
  %idxprom55 = sext i32 %38 to i64
  %arrayidx56 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx54, i64 0, i64 %idxprom55
  store i32 %conv52, i32* %arrayidx56, align 4
  br label %for.inc57
 
for.inc57:
  %39 = load i32, i32* %k, align 4
  %inc58 = add nsw i32 %39, 1
  store i32 %inc58, i32* %k, align 4
  br label %for.cond42
 
for.end59:
  br label %for.inc60
 
for.inc60:
  %40 = load i32, i32* %j37, align 4
  %inc61 = add nsw i32 %40, 1
  store i32 %inc61, i32* %j37, align 4
  br label %for.cond38
 
for.end62:
  %arraydecay = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %content_to_int, i32 0, i32 0
  %arraydecay63 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %p, i32 0, i32 0
  %41 = load i32, i32* %method.addr, align 4
  call void @aes_detail([4 x i32]* %arraydecay, [4 x i32]* %arraydecay63, i32 %41)
  store i32 0, i32* %j64, align 4
  br label %for.cond65
 
for.cond65:
  %42 = load i32, i32* %j64, align 4
  %cmp66 = icmp slt i32 %42, 4
  br i1 %cmp66, label %for.body68, label %for.end90
 
for.body68:
  store i32 0, i32* %k69, align 4
  br label %for.cond70
 
for.cond70:
  %43 = load i32, i32* %k69, align 4
  %cmp71 = icmp slt i32 %43, 4
  br i1 %cmp71, label %for.body73, label %for.end87
 
for.body73:
  %44 = load i32, i32* %j64, align 4
  %idxprom74 = sext i32 %44 to i64
  %arrayidx75 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %content_to_int, i64 0, i64 %idxprom74
  %45 = load i32, i32* %k69, align 4
  %idxprom76 = sext i32 %45 to i64
  %arrayidx77 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx75, i64 0, i64 %idxprom76
  %46 = load i32, i32* %arrayidx77, align 4
  %conv78 = trunc i32 %46 to i8
  %47 = load i32, i32* %j64, align 4
  %mul79 = mul nsw i32 %47, 4
  %48 = load i32, i32* %k69, align 4
  %add80 = add nsw i32 %mul79, %48
  %49 = load i32, i32* %i31, align 4
  %mul81 = mul nsw i32 16, %49
  %add82 = add nsw i32 %add80, %mul81
  %idxprom83 = sext i32 %add82 to i64
  %arrayidx84 = getelementptr inbounds i8, i8* %vla29, i64 %idxprom83
  store i8 %conv78, i8* %arrayidx84, align 1
  br label %for.inc85
 
for.inc85:
  %50 = load i32, i32* %k69, align 4
  %inc86 = add nsw i32 %50, 1
  store i32 %inc86, i32* %k69, align 4
  br label %for.cond70
 
for.end87:
  br label %for.inc88
 
for.inc88:
  %51 = load i32, i32* %j64, align 4
  %inc89 = add nsw i32 %51, 1
  store i32 %inc89, i32* %j64, align 4
  br label %for.cond65
 
for.end90:
  br label %for.inc91
 
for.inc91:
  %52 = load i32, i32* %i31, align 4
  %inc92 = add nsw i32 %52, 1
  store i32 %inc92, i32* %i31, align 4
  br label %nfv.jmp2
 
for.end93:
  %53 = load i8*, i8** %des_path.addr, align 8
  %54 = load i32, i32* %size, align 4
  %conv94 = sext i32 %54 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %53, i8* align 16 %vla29, i64 %conv94, i1 false)
  %55 = load i32, i32* %size, align 4
  %56 = load i8*, i8** %saved_stack, align 8
  call void @llvm.stackrestore(i8* %56)
  ret i32 %55
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end16 ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond20 [ i32 1, label %for.end28 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
 
nfv.jmp2:
  %nfv.cond2 = load i32, i32* %nfv.cond.pointer2, align 4
  %nfv.jmp2.loop.address = load i32, i32* %nfv.jmp2.loop, align 4
  %nfv.jmp2.loop.inc = add nsw i32 %nfv.jmp2.loop.address, 1
  store i32 %nfv.jmp2.loop.inc, i32* %nfv.jmp2.loop, align 4
  %nfv.jmp2.loop.comp = load i32, i32* %nfv.jmp2.loop, align 4
  call void @jump(i32 3, i32 %nfv.jmp2.loop.comp)
  switch i32 %nfv.cond2, label %for.cond32 [ i32 1, label %for.end93 ]
 
nfv.jmp20:
  store i32 1, i32* %nfv.cond.pointer2, align 4
  br label %nfv.jmp2
}
define dso_local i32 @c2i(i8 signext %ch) #0 {
entry:
  %retval = alloca i32, align 4
  %ch.addr = alloca i8, align 1
  store i8 %ch, i8* %ch.addr, align 1
  %call = call i16** @__ctype_b_loc() #4
  %0 = load i16*, i16** %call, align 8
  %1 = load i8, i8* %ch.addr, align 1
  %conv = sext i8 %1 to i32
  %idxprom = sext i32 %conv to i64
  %arrayidx = getelementptr inbounds i16, i16* %0, i64 %idxprom
  %2 = load i16, i16* %arrayidx, align 2
  %conv1 = zext i16 %2 to i32
  %and = and i32 %conv1, 2048
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end
 
if.then:
  %3 = load i8, i8* %ch.addr, align 1
  %conv2 = sext i8 %3 to i32
  %sub = sub nsw i32 %conv2, 48
  store i32 %sub, i32* %retval, align 4
  br label %return
 
if.end:
  %4 = load i8, i8* %ch.addr, align 1
  %conv3 = sext i8 %4 to i32
  %cmp = icmp slt i32 %conv3, 65
  br i1 %cmp, label %if.then15, label %lor.lhs.false
 
lor.lhs.false:
  %5 = load i8, i8* %ch.addr, align 1
  %conv5 = sext i8 %5 to i32
  %cmp6 = icmp sgt i32 %conv5, 70
  br i1 %cmp6, label %land.lhs.true, label %lor.lhs.false11
 
land.lhs.true:
  %6 = load i8, i8* %ch.addr, align 1
  %conv8 = sext i8 %6 to i32
  %cmp9 = icmp slt i32 %conv8, 97
  br i1 %cmp9, label %if.then15, label %lor.lhs.false11
 
lor.lhs.false11:
  %7 = load i8, i8* %ch.addr, align 1
  %conv12 = sext i8 %7 to i32
  %cmp13 = icmp sgt i32 %conv12, 122
  br i1 %cmp13, label %if.then15, label %if.end16
 
if.then15:
  store i32 -1, i32* %retval, align 4
  br label %return
 
if.end16:
  %call17 = call i16** @__ctype_b_loc() #4
  %8 = load i16*, i16** %call17, align 8
  %9 = load i8, i8* %ch.addr, align 1
  %conv18 = sext i8 %9 to i32
  %idxprom19 = sext i32 %conv18 to i64
  %arrayidx20 = getelementptr inbounds i16, i16* %8, i64 %idxprom19
  %10 = load i16, i16* %arrayidx20, align 2
  %conv21 = zext i16 %10 to i32
  %and22 = and i32 %conv21, 1024
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %if.then24, label %if.end36
 
if.then24:
  %call25 = call i16** @__ctype_b_loc() #4
  %11 = load i16*, i16** %call25, align 8
  %12 = load i8, i8* %ch.addr, align 1
  %conv26 = sext i8 %12 to i32
  %idxprom27 = sext i32 %conv26 to i64
  %arrayidx28 = getelementptr inbounds i16, i16* %11, i64 %idxprom27
  %13 = load i16, i16* %arrayidx28, align 2
  %conv29 = zext i16 %13 to i32
  %and30 = and i32 %conv29, 256
  %tobool31 = icmp ne i32 %and30, 0
  br i1 %tobool31, label %cond.true, label %cond.false
 
cond.true:
  %14 = load i8, i8* %ch.addr, align 1
  %conv32 = sext i8 %14 to i32
  %sub33 = sub nsw i32 %conv32, 55
  br label %cond.end
 
cond.false:
  %15 = load i8, i8* %ch.addr, align 1
  %conv34 = sext i8 %15 to i32
  %sub35 = sub nsw i32 %conv34, 87
  br label %cond.end
 
cond.end:
  %cond = phi i32 [ %sub33, %cond.true ], [ %sub35, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return
 
if.end36:
  store i32 -1, i32* %retval, align 4
  br label %return
 
return:
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}
define dso_local void @aes_detail([4 x i32]* %content, [4 x i32]* %password, i32 %encode) #0 {
 
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %content.addr = alloca [4 x i32]*, align 8
  %password.addr = alloca [4 x i32]*, align 8
  %encode.addr = alloca i32, align 4
  %p = alloca [11 x [4 x [4 x i32]]], align 16
  %i = alloca i32, align 4
  %i8 = alloca i32, align 4
  store [4 x i32]* %content, [4 x i32]** %content.addr, align 8
  store [4 x i32]* %password, [4 x i32]** %password.addr, align 8
  store i32 %encode, i32* %encode.addr, align 4
  %0 = load [4 x i32]*, [4 x i32]** %password.addr, align 8
  %arraydecay = getelementptr inbounds [11 x [4 x [4 x i32]]], [11 x [4 x [4 x i32]]]* %p, i32 0, i32 0
  call void @keyExpansion([4 x i32]* %0, [4 x [4 x i32]]* %arraydecay)
  %1 = load i32, i32* %encode.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.else
 
if.then:
  %2 = load [4 x i32]*, [4 x i32]** %content.addr, align 8
  %arrayidx = getelementptr inbounds [11 x [4 x [4 x i32]]], [11 x [4 x [4 x i32]]]* %p, i64 0, i64 0
  %arraydecay1 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx, i32 0, i32 0
  call void @addRoundKey([4 x i32]* %2, [4 x i32]* %arraydecay1)
  store i32 1, i32* %i, align 4
  br label %nfv.jmp1
 
for.cond:
  %3 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %3, 10
  br i1 %cmp, label %for.body, label %nfv.jmp10
 
for.body:
  %4 = load [4 x i32]*, [4 x i32]** %content.addr, align 8
  %5 = load i32, i32* %encode.addr, align 4
  call void @subBytes([4 x i32]* %4, i32 %5)
  %6 = load [4 x i32]*, [4 x i32]** %content.addr, align 8
  %7 = load i32, i32* %encode.addr, align 4
  call void @shiftRows([4 x i32]* %6, i32 %7)
  %8 = load i32, i32* %i, align 4
  %cmp2 = icmp ne i32 %8, 10
  br i1 %cmp2, label %if.then3, label %if.end
 
if.then3:
  %9 = load [4 x i32]*, [4 x i32]** %content.addr, align 8
  %10 = load i32, i32* %encode.addr, align 4
  call void @mixColumns([4 x i32]* %9, i32 %10)
  br label %if.end
 
if.end:
  %11 = load [4 x i32]*, [4 x i32]** %content.addr, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx4 = getelementptr inbounds [11 x [4 x [4 x i32]]], [11 x [4 x [4 x i32]]]* %p, i64 0, i64 %idxprom
  %arraydecay5 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx4, i32 0, i32 0
  call void @addRoundKey1([4 x i32]* %11, [4 x i32]* %arraydecay5)
  br label %for.inc
 
for.inc:
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp1
 
for.end:
  br label %if.end20
 
if.else:
  %14 = load [4 x i32]*, [4 x i32]** %content.addr, align 8
  %arrayidx6 = getelementptr inbounds [11 x [4 x [4 x i32]]], [11 x [4 x [4 x i32]]]* %p, i64 0, i64 10
  %arraydecay7 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx6, i32 0, i32 0
  call void @addRoundKey2([4 x i32]* %14, [4 x i32]* %arraydecay7)
  store i32 9, i32* %i8, align 4
  br label %nfv.jmp0
 
for.cond9:
  %15 = load i32, i32* %i8, align 4
  %cmp10 = icmp sge i32 %15, 0
  br i1 %cmp10, label %for.body11, label %nfv.jmp00
 
for.body11:
  %16 = load [4 x i32]*, [4 x i32]** %content.addr, align 8
  %17 = load i32, i32* %encode.addr, align 4
  call void @shiftRows1([4 x i32]* %16, i32 %17)
  %18 = load [4 x i32]*, [4 x i32]** %content.addr, align 8
  %19 = load i32, i32* %encode.addr, align 4
  call void @subBytes1([4 x i32]* %18, i32 %19)
  %20 = load [4 x i32]*, [4 x i32]** %content.addr, align 8
  %21 = load i32, i32* %i8, align 4
  %idxprom12 = sext i32 %21 to i64
  %arrayidx13 = getelementptr inbounds [11 x [4 x [4 x i32]]], [11 x [4 x [4 x i32]]]* %p, i64 0, i64 %idxprom12
  %arraydecay14 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx13, i32 0, i32 0
  call void @addRoundKey3([4 x i32]* %20, [4 x i32]* %arraydecay14)
  %22 = load i32, i32* %i8, align 4
  %cmp15 = icmp ne i32 %22, 0
  br i1 %cmp15, label %if.then16, label %if.end17
 
if.then16:
  %23 = load [4 x i32]*, [4 x i32]** %content.addr, align 8
  %24 = load i32, i32* %encode.addr, align 4
  call void @mixColumns1([4 x i32]* %23, i32 %24)
  br label %if.end17
 
if.end17:
  br label %for.inc18
 
for.inc18:
  %25 = load i32, i32* %i8, align 4
  %dec = add nsw i32 %25, -1
  store i32 %dec, i32* %i8, align 4
  br label %nfv.jmp0
 
for.end19:
  br label %if.end20
 
if.end20:
  ret void
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond9 [ i32 1, label %for.end19 ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local void @keyExpansion([4 x i32]* %key, [4 x [4 x i32]]* %w) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %key.addr = alloca [4 x i32]*, align 8
  %w.addr = alloca [4 x [4 x i32]]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %i14 = alloca i32, align 4
  %j18 = alloca i32, align 4
  %temp = alloca [4 x i32], align 16
  %k = alloca i32, align 4
  %m = alloca i32, align 4
  %row = alloca i32, align 4
  %column = alloca i32, align 4
  %l = alloca i32, align 4
  store [4 x i32]* %key, [4 x i32]** %key.addr, align 8
  store [4 x [4 x i32]]* %w, [4 x [4 x i32]]** %w.addr, align 8
  store i32 0, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  store i32 0, i32* %j, align 4
  br label %for.cond1
 
for.cond1:
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 4
  br i1 %cmp2, label %for.body3, label %for.end
 
for.body3:
  %2 = load [4 x i32]*, [4 x i32]** %key.addr, align 8
  %3 = load i32, i32* %j, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 %idxprom
  %4 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom4
  %5 = load i32, i32* %arrayidx5, align 4
  %6 = load [4 x [4 x i32]]*, [4 x [4 x i32]]** %w.addr, align 8
  %arrayidx6 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %6, i64 0
  %7 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %7 to i64
  %arrayidx8 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx6, i64 0, i64 %idxprom7
  %8 = load i32, i32* %j, align 4
  %idxprom9 = sext i32 %8 to i64
  %arrayidx10 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx8, i64 0, i64 %idxprom9
  store i32 %5, i32* %arrayidx10, align 4
  br label %for.inc
 
for.inc:
  %9 = load i32, i32* %j, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1
 
for.end:
  br label %for.inc11
 
for.inc11:
  %10 = load i32, i32* %i, align 4
  %inc12 = add nsw i32 %10, 1
  store i32 %inc12, i32* %i, align 4
  br label %nfv.jmp0
 
for.end13:
  store i32 1, i32* %i14, align 4
  br label %nfv.jmp1
 
for.cond15:
  %11 = load i32, i32* %i14, align 4
  %cmp16 = icmp slt i32 %11, 11
  br i1 %cmp16, label %for.body17, label %nfv.jmp10
 
for.body17:
  store i32 0, i32* %j18, align 4
  br label %for.cond19
 
for.cond19:
  %12 = load i32, i32* %j18, align 4
  %cmp20 = icmp slt i32 %12, 4
  br i1 %cmp20, label %for.body21, label %for.end122
 
for.body21:
  %13 = load i32, i32* %j18, align 4
  %cmp22 = icmp eq i32 %13, 0
  br i1 %cmp22, label %if.then, label %if.else
 
if.then:
  %14 = load [4 x [4 x i32]]*, [4 x [4 x i32]]** %w.addr, align 8
  %15 = load i32, i32* %i14, align 4
  %sub = sub nsw i32 %15, 1
  %idxprom23 = sext i32 %sub to i64
  %arrayidx24 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %14, i64 %idxprom23
  %arrayidx25 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx24, i64 0, i64 3
  %arrayidx26 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx25, i64 0, i64 1
  %16 = load i32, i32* %arrayidx26, align 4
  %arrayidx27 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 0
  store i32 %16, i32* %arrayidx27, align 16
  %17 = load [4 x [4 x i32]]*, [4 x [4 x i32]]** %w.addr, align 8
  %18 = load i32, i32* %i14, align 4
  %sub28 = sub nsw i32 %18, 1
  %idxprom29 = sext i32 %sub28 to i64
  %arrayidx30 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %17, i64 %idxprom29
  %arrayidx31 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx30, i64 0, i64 3
  %arrayidx32 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx31, i64 0, i64 2
  %19 = load i32, i32* %arrayidx32, align 4
  %arrayidx33 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 1
  store i32 %19, i32* %arrayidx33, align 4
  %20 = load [4 x [4 x i32]]*, [4 x [4 x i32]]** %w.addr, align 8
  %21 = load i32, i32* %i14, align 4
  %sub34 = sub nsw i32 %21, 1
  %idxprom35 = sext i32 %sub34 to i64
  %arrayidx36 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %20, i64 %idxprom35
  %arrayidx37 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx36, i64 0, i64 3
  %arrayidx38 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx37, i64 0, i64 3
  %22 = load i32, i32* %arrayidx38, align 4
  %arrayidx39 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 2
  store i32 %22, i32* %arrayidx39, align 8
  %23 = load [4 x [4 x i32]]*, [4 x [4 x i32]]** %w.addr, align 8
  %24 = load i32, i32* %i14, align 4
  %sub40 = sub nsw i32 %24, 1
  %idxprom41 = sext i32 %sub40 to i64
  %arrayidx42 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %23, i64 %idxprom41
  %arrayidx43 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx42, i64 0, i64 3
  %arrayidx44 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx43, i64 0, i64 0
  %25 = load i32, i32* %arrayidx44, align 4
  %arrayidx45 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 3
  store i32 %25, i32* %arrayidx45, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond46
 
for.cond46:
  %26 = load i32, i32* %k, align 4
  %cmp47 = icmp slt i32 %26, 4
  br i1 %cmp47, label %for.body48, label %for.end68
 
for.body48:
  %27 = load i32, i32* %k, align 4
  %idxprom49 = sext i32 %27 to i64
  %arrayidx50 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 %idxprom49
  %28 = load i32, i32* %arrayidx50, align 4
  store i32 %28, i32* %m, align 4
  %29 = load i32, i32* %m, align 4
  %div = sdiv i32 %29, 16
  store i32 %div, i32* %row, align 4
  %30 = load i32, i32* %m, align 4
  %rem = srem i32 %30, 16
  store i32 %rem, i32* %column, align 4
  %31 = load i32, i32* %row, align 4
  %idxprom51 = sext i32 %31 to i64
  %arrayidx52 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @S_BOX, i64 0, i64 %idxprom51
  %32 = load i32, i32* %column, align 4
  %idxprom53 = sext i32 %32 to i64
  %arrayidx54 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx52, i64 0, i64 %idxprom53
  %33 = load i32, i32* %arrayidx54, align 4
  %34 = load i32, i32* %k, align 4
  %idxprom55 = sext i32 %34 to i64
  %arrayidx56 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 %idxprom55
  store i32 %33, i32* %arrayidx56, align 4
  %35 = load i32, i32* %k, align 4
  %cmp57 = icmp eq i32 %35, 0
  br i1 %cmp57, label %if.then58, label %if.end
 
if.then58:
  %36 = load i32, i32* %k, align 4
  %idxprom59 = sext i32 %36 to i64
  %arrayidx60 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 %idxprom59
  %37 = load i32, i32* %arrayidx60, align 4
  %38 = load i32, i32* %i14, align 4
  %sub61 = sub nsw i32 %38, 1
  %idxprom62 = sext i32 %sub61 to i64
  %arrayidx63 = getelementptr inbounds [10 x i32], [10 x i32]* @RC, i64 0, i64 %idxprom62
  %39 = load i32, i32* %arrayidx63, align 4
  %xor = xor i32 %37, %39
  %40 = load i32, i32* %k, align 4
  %idxprom64 = sext i32 %40 to i64
  %arrayidx65 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 %idxprom64
  store i32 %xor, i32* %arrayidx65, align 4
  br label %if.end
 
if.end:
  br label %for.inc66
 
for.inc66:
  %41 = load i32, i32* %k, align 4
  %inc67 = add nsw i32 %41, 1
  store i32 %inc67, i32* %k, align 4
  br label %for.cond46
 
for.end68:
  br label %if.end97
 
if.else:
  %42 = load [4 x [4 x i32]]*, [4 x [4 x i32]]** %w.addr, align 8
  %43 = load i32, i32* %i14, align 4
  %idxprom69 = sext i32 %43 to i64
  %arrayidx70 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %42, i64 %idxprom69
  %44 = load i32, i32* %j18, align 4
  %sub71 = sub nsw i32 %44, 1
  %idxprom72 = sext i32 %sub71 to i64
  %arrayidx73 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx70, i64 0, i64 %idxprom72
  %arrayidx74 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx73, i64 0, i64 0
  %45 = load i32, i32* %arrayidx74, align 4
  %arrayidx75 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 0
  store i32 %45, i32* %arrayidx75, align 16
  %46 = load [4 x [4 x i32]]*, [4 x [4 x i32]]** %w.addr, align 8
  %47 = load i32, i32* %i14, align 4
  %idxprom76 = sext i32 %47 to i64
  %arrayidx77 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %46, i64 %idxprom76
  %48 = load i32, i32* %j18, align 4
  %sub78 = sub nsw i32 %48, 1
  %idxprom79 = sext i32 %sub78 to i64
  %arrayidx80 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx77, i64 0, i64 %idxprom79
  %arrayidx81 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx80, i64 0, i64 1
  %49 = load i32, i32* %arrayidx81, align 4
  %arrayidx82 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 1
  store i32 %49, i32* %arrayidx82, align 4
  %50 = load [4 x [4 x i32]]*, [4 x [4 x i32]]** %w.addr, align 8
  %51 = load i32, i32* %i14, align 4
  %idxprom83 = sext i32 %51 to i64
  %arrayidx84 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %50, i64 %idxprom83
  %52 = load i32, i32* %j18, align 4
  %sub85 = sub nsw i32 %52, 1
  %idxprom86 = sext i32 %sub85 to i64
  %arrayidx87 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx84, i64 0, i64 %idxprom86
  %arrayidx88 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx87, i64 0, i64 2
  %53 = load i32, i32* %arrayidx88, align 4
  %arrayidx89 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 2
  store i32 %53, i32* %arrayidx89, align 8
  %54 = load [4 x [4 x i32]]*, [4 x [4 x i32]]** %w.addr, align 8
  %55 = load i32, i32* %i14, align 4
  %idxprom90 = sext i32 %55 to i64
  %arrayidx91 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %54, i64 %idxprom90
  %56 = load i32, i32* %j18, align 4
  %sub92 = sub nsw i32 %56, 1
  %idxprom93 = sext i32 %sub92 to i64
  %arrayidx94 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx91, i64 0, i64 %idxprom93
  %arrayidx95 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx94, i64 0, i64 3
  %57 = load i32, i32* %arrayidx95, align 4
  %arrayidx96 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 3
  store i32 %57, i32* %arrayidx96, align 4
  br label %if.end97
 
if.end97:
  store i32 0, i32* %l, align 4
  br label %for.cond98
 
for.cond98:
  %58 = load i32, i32* %l, align 4
  %cmp99 = icmp slt i32 %58, 4
  br i1 %cmp99, label %for.body100, label %for.end119
 
for.body100:
  %59 = load [4 x [4 x i32]]*, [4 x [4 x i32]]** %w.addr, align 8
  %60 = load i32, i32* %i14, align 4
  %sub101 = sub nsw i32 %60, 1
  %idxprom102 = sext i32 %sub101 to i64
  %arrayidx103 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %59, i64 %idxprom102
  %61 = load i32, i32* %j18, align 4
  %idxprom104 = sext i32 %61 to i64
  %arrayidx105 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx103, i64 0, i64 %idxprom104
  %62 = load i32, i32* %l, align 4
  %idxprom106 = sext i32 %62 to i64
  %arrayidx107 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx105, i64 0, i64 %idxprom106
  %63 = load i32, i32* %arrayidx107, align 4
  %64 = load i32, i32* %l, align 4
  %idxprom108 = sext i32 %64 to i64
  %arrayidx109 = getelementptr inbounds [4 x i32], [4 x i32]* %temp, i64 0, i64 %idxprom108
  %65 = load i32, i32* %arrayidx109, align 4
  %xor110 = xor i32 %63, %65
  %66 = load [4 x [4 x i32]]*, [4 x [4 x i32]]** %w.addr, align 8
  %67 = load i32, i32* %i14, align 4
  %idxprom111 = sext i32 %67 to i64
  %arrayidx112 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %66, i64 %idxprom111
  %68 = load i32, i32* %j18, align 4
  %idxprom113 = sext i32 %68 to i64
  %arrayidx114 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* %arrayidx112, i64 0, i64 %idxprom113
  %69 = load i32, i32* %l, align 4
  %idxprom115 = sext i32 %69 to i64
  %arrayidx116 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx114, i64 0, i64 %idxprom115
  store i32 %xor110, i32* %arrayidx116, align 4
  br label %for.inc117
 
for.inc117:
  %70 = load i32, i32* %l, align 4
  %inc118 = add nsw i32 %70, 1
  store i32 %inc118, i32* %l, align 4
  br label %for.cond98
 
for.end119:
  br label %for.inc120
 
for.inc120:
  %71 = load i32, i32* %j18, align 4
  %inc121 = add nsw i32 %71, 1
  store i32 %inc121, i32* %j18, align 4
  br label %for.cond19
 
for.end122:
  br label %for.inc123
 
for.inc123:
  %72 = load i32, i32* %i14, align 4
  %inc124 = add nsw i32 %72, 1
  store i32 %inc124, i32* %i14, align 4
  br label %nfv.jmp1
 
for.end125:
  ret void
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end13 ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond15 [ i32 1, label %for.end125 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local void @addRoundKey([4 x i32]* %a, [4 x i32]* %k) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %a.addr = alloca [4 x i32]*, align 8
  %k.addr = alloca [4 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [4 x i32]* %a, [4 x i32]** %a.addr, align 8
  store [4 x i32]* %k, [4 x i32]** %k.addr, align 8
  store i32 0, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  store i32 0, i32* %j, align 4
  br label %for.cond1
 
for.cond1:
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 4
  br i1 %cmp2, label %for.body3, label %for.end
 
for.body3:
  %2 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 %idxprom
  %4 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom4
  %5 = load i32, i32* %arrayidx5, align 4
  %6 = load [4 x i32]*, [4 x i32]** %k.addr, align 8
  %7 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %7 to i64
  %arrayidx7 = getelementptr inbounds [4 x i32], [4 x i32]* %6, i64 %idxprom6
  %8 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %8 to i64
  %arrayidx9 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx7, i64 0, i64 %idxprom8
  %9 = load i32, i32* %arrayidx9, align 4
  %xor = xor i32 %5, %9
  %10 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %11 to i64
  %arrayidx11 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 %idxprom10
  %12 = load i32, i32* %j, align 4
  %idxprom12 = sext i32 %12 to i64
  %arrayidx13 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx11, i64 0, i64 %idxprom12
  store i32 %xor, i32* %arrayidx13, align 4
  br label %for.inc
 
for.inc:
  %13 = load i32, i32* %j, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1
 
for.end:
  br label %for.inc14
 
for.inc14:
  %14 = load i32, i32* %i, align 4
  %inc15 = add nsw i32 %14, 1
  store i32 %inc15, i32* %i, align 4
  br label %nfv.jmp0
 
for.end16:
  ret void
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end16 ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
}
define dso_local void @subBytes([4 x i32]* %a, i32 %encode) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %a.addr = alloca [4 x i32]*, align 8
  %encode.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %temp = alloca i32, align 4
  %row = alloca i32, align 4
  %column = alloca i32, align 4
  store [4 x i32]* %a, [4 x i32]** %a.addr, align 8
  store i32 %encode, i32* %encode.addr, align 4
  store i32 0, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  store i32 0, i32* %j, align 4
  br label %for.cond1
 
for.cond1:
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 4
  br i1 %cmp2, label %for.body3, label %for.end
 
for.body3:
  %2 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 %idxprom
  %4 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom4
  %5 = load i32, i32* %arrayidx5, align 4
  store i32 %5, i32* %temp, align 4
  %6 = load i32, i32* %temp, align 4
  %div = sdiv i32 %6, 16
  store i32 %div, i32* %row, align 4
  %7 = load i32, i32* %temp, align 4
  %rem = srem i32 %7, 16
  store i32 %rem, i32* %column, align 4
  %8 = load i32, i32* %encode.addr, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then, label %if.else
 
if.then:
  %9 = load i32, i32* %row, align 4
  %idxprom6 = sext i32 %9 to i64
  %arrayidx7 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @S_BOX, i64 0, i64 %idxprom6
  %10 = load i32, i32* %column, align 4
  %idxprom8 = sext i32 %10 to i64
  %arrayidx9 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx7, i64 0, i64 %idxprom8
  %11 = load i32, i32* %arrayidx9, align 4
  %12 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %13 to i64
  %arrayidx11 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i64 %idxprom10
  %14 = load i32, i32* %j, align 4
  %idxprom12 = sext i32 %14 to i64
  %arrayidx13 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx11, i64 0, i64 %idxprom12
  store i32 %11, i32* %arrayidx13, align 4
  br label %if.end
 
if.else:
  %15 = load i32, i32* %row, align 4
  %idxprom14 = sext i32 %15 to i64
  %arrayidx15 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @INVERSE_S_BOX, i64 0, i64 %idxprom14
  %16 = load i32, i32* %column, align 4
  %idxprom16 = sext i32 %16 to i64
  %arrayidx17 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx15, i64 0, i64 %idxprom16
  %17 = load i32, i32* %arrayidx17, align 4
  %18 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %19 = load i32, i32* %i, align 4
  %idxprom18 = sext i32 %19 to i64
  %arrayidx19 = getelementptr inbounds [4 x i32], [4 x i32]* %18, i64 %idxprom18
  %20 = load i32, i32* %j, align 4
  %idxprom20 = sext i32 %20 to i64
  %arrayidx21 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx19, i64 0, i64 %idxprom20
  store i32 %17, i32* %arrayidx21, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %21 = load i32, i32* %j, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1
 
for.end:
  br label %for.inc22
 
for.inc22:
  %22 = load i32, i32* %i, align 4
  %inc23 = add nsw i32 %22, 1
  store i32 %inc23, i32* %i, align 4
  br label %nfv.jmp0
 
for.end24:
  ret void
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end24 ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
}
define dso_local void @shiftRows([4 x i32]* %a, i32 %encode) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %a.addr = alloca [4 x i32]*, align 8
  %encode.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %temp = alloca i32, align 4
  %temp26 = alloca i32, align 4
  store [4 x i32]* %a, [4 x i32]** %a.addr, align 8
  store i32 %encode, i32* %encode.addr, align 4
  store i32 0, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  store i32 0, i32* %j, align 4
  br label %for.cond1
 
for.cond1:
  %1 = load i32, i32* %j, align 4
  %2 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %1, %2
  br i1 %cmp2, label %for.body3, label %for.end
 
for.body3:
  %3 = load i32, i32* %encode.addr, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.else
 
if.then:
  %4 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 %idxprom
  %arrayidx4 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 0
  %6 = load i32, i32* %arrayidx4, align 4
  store i32 %6, i32* %temp, align 4
  %7 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %8 to i64
  %arrayidx6 = getelementptr inbounds [4 x i32], [4 x i32]* %7, i64 %idxprom5
  %arrayidx7 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx6, i64 0, i64 1
  %9 = load i32, i32* %arrayidx7, align 4
  %10 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %11 to i64
  %arrayidx9 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 %idxprom8
  %arrayidx10 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx9, i64 0, i64 0
  store i32 %9, i32* %arrayidx10, align 4
  %12 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom11 = sext i32 %13 to i64
  %arrayidx12 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i64 %idxprom11
  %arrayidx13 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx12, i64 0, i64 2
  %14 = load i32, i32* %arrayidx13, align 4
  %15 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %16 = load i32, i32* %i, align 4
  %idxprom14 = sext i32 %16 to i64
  %arrayidx15 = getelementptr inbounds [4 x i32], [4 x i32]* %15, i64 %idxprom14
  %arrayidx16 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx15, i64 0, i64 1
  store i32 %14, i32* %arrayidx16, align 4
  %17 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %18 to i64
  %arrayidx18 = getelementptr inbounds [4 x i32], [4 x i32]* %17, i64 %idxprom17
  %arrayidx19 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx18, i64 0, i64 3
  %19 = load i32, i32* %arrayidx19, align 4
  %20 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %21 = load i32, i32* %i, align 4
  %idxprom20 = sext i32 %21 to i64
  %arrayidx21 = getelementptr inbounds [4 x i32], [4 x i32]* %20, i64 %idxprom20
  %arrayidx22 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx21, i64 0, i64 2
  store i32 %19, i32* %arrayidx22, align 4
  %22 = load i32, i32* %temp, align 4
  %23 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %24 = load i32, i32* %i, align 4
  %idxprom23 = sext i32 %24 to i64
  %arrayidx24 = getelementptr inbounds [4 x i32], [4 x i32]* %23, i64 %idxprom23
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx24, i64 0, i64 3
  store i32 %22, i32* %arrayidx25, align 4
  br label %if.end
 
if.else:
  %25 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %26 = load i32, i32* %i, align 4
  %idxprom27 = sext i32 %26 to i64
  %arrayidx28 = getelementptr inbounds [4 x i32], [4 x i32]* %25, i64 %idxprom27
  %arrayidx29 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx28, i64 0, i64 3
  %27 = load i32, i32* %arrayidx29, align 4
  store i32 %27, i32* %temp26, align 4
  %28 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %29 = load i32, i32* %i, align 4
  %idxprom30 = sext i32 %29 to i64
  %arrayidx31 = getelementptr inbounds [4 x i32], [4 x i32]* %28, i64 %idxprom30
  %arrayidx32 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx31, i64 0, i64 2
  %30 = load i32, i32* %arrayidx32, align 4
  %31 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %32 = load i32, i32* %i, align 4
  %idxprom33 = sext i32 %32 to i64
  %arrayidx34 = getelementptr inbounds [4 x i32], [4 x i32]* %31, i64 %idxprom33
  %arrayidx35 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx34, i64 0, i64 3
  store i32 %30, i32* %arrayidx35, align 4
  %33 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %34 = load i32, i32* %i, align 4
  %idxprom36 = sext i32 %34 to i64
  %arrayidx37 = getelementptr inbounds [4 x i32], [4 x i32]* %33, i64 %idxprom36
  %arrayidx38 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx37, i64 0, i64 1
  %35 = load i32, i32* %arrayidx38, align 4
  %36 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %37 = load i32, i32* %i, align 4
  %idxprom39 = sext i32 %37 to i64
  %arrayidx40 = getelementptr inbounds [4 x i32], [4 x i32]* %36, i64 %idxprom39
  %arrayidx41 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx40, i64 0, i64 2
  store i32 %35, i32* %arrayidx41, align 4
  %38 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %39 = load i32, i32* %i, align 4
  %idxprom42 = sext i32 %39 to i64
  %arrayidx43 = getelementptr inbounds [4 x i32], [4 x i32]* %38, i64 %idxprom42
  %arrayidx44 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx43, i64 0, i64 0
  %40 = load i32, i32* %arrayidx44, align 4
  %41 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %42 = load i32, i32* %i, align 4
  %idxprom45 = sext i32 %42 to i64
  %arrayidx46 = getelementptr inbounds [4 x i32], [4 x i32]* %41, i64 %idxprom45
  %arrayidx47 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx46, i64 0, i64 1
  store i32 %40, i32* %arrayidx47, align 4
  %43 = load i32, i32* %temp26, align 4
  %44 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %45 = load i32, i32* %i, align 4
  %idxprom48 = sext i32 %45 to i64
  %arrayidx49 = getelementptr inbounds [4 x i32], [4 x i32]* %44, i64 %idxprom48
  %arrayidx50 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx49, i64 0, i64 0
  store i32 %43, i32* %arrayidx50, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %46 = load i32, i32* %j, align 4
  %inc = add nsw i32 %46, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1
 
for.end:
  br label %for.inc51
 
for.inc51:
  %47 = load i32, i32* %i, align 4
  %inc52 = add nsw i32 %47, 1
  store i32 %inc52, i32* %i, align 4
  br label %nfv.jmp0
 
for.end53:
  ret void
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end53 ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
}
define dso_local void @mixColumns([4 x i32]* %a, i32 %encode) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %a.addr = alloca [4 x i32]*, align 8
  %encode.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %temp0 = alloca i32, align 4
  %temp1 = alloca i32, align 4
  %temp2 = alloca i32, align 4
  %temp3 = alloca i32, align 4
  store [4 x i32]* %a, [4 x i32]** %a.addr, align 8
  store i32 %encode, i32* %encode.addr, align 4
  store i32 0, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %1 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %1, i64 0
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx1 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom
  %3 = load i32, i32* %arrayidx1, align 4
  store i32 %3, i32* %temp0, align 4
  %4 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx2 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 1
  %5 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %5 to i64
  %arrayidx4 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx2, i64 0, i64 %idxprom3
  %6 = load i32, i32* %arrayidx4, align 4
  store i32 %6, i32* %temp1, align 4
  %7 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %7, i64 2
  %8 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %8 to i64
  %arrayidx7 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx5, i64 0, i64 %idxprom6
  %9 = load i32, i32* %arrayidx7, align 4
  store i32 %9, i32* %temp2, align 4
  %10 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx8 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 3
  %11 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %11 to i64
  %arrayidx10 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx8, i64 0, i64 %idxprom9
  %12 = load i32, i32* %arrayidx10, align 4
  store i32 %12, i32* %temp3, align 4
  %13 = load i32, i32* %encode.addr, align 4
  %tobool = icmp ne i32 %13, 0
  br i1 %tobool, label %if.then, label %if.else
 
if.then:
  %14 = load i32, i32* %temp0, align 4
  %call = call i32 @aes_multiple(i32 %14, i32 2)
  %15 = load i32, i32* %temp1, align 4
  %call11 = call i32 @aes_multiple1(i32 %15, i32 3)
  %xor = xor i32 %call, %call11
  %16 = load i32, i32* %temp2, align 4
  %xor12 = xor i32 %xor, %16
  %17 = load i32, i32* %temp3, align 4
  %xor13 = xor i32 %xor12, %17
  %18 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx14 = getelementptr inbounds [4 x i32], [4 x i32]* %18, i64 0
  %19 = load i32, i32* %i, align 4
  %idxprom15 = sext i32 %19 to i64
  %arrayidx16 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx14, i64 0, i64 %idxprom15
  store i32 %xor13, i32* %arrayidx16, align 4
  %20 = load i32, i32* %temp0, align 4
  %21 = load i32, i32* %temp1, align 4
  %call17 = call i32 @aes_multiple2(i32 %21, i32 2)
  %xor18 = xor i32 %20, %call17
  %22 = load i32, i32* %temp2, align 4
  %23 = load i32, i32* %temp2, align 4
  %call19 = call i32 @aes_multiple3(i32 %23, i32 2)
  %xor20 = xor i32 %22, %call19
  %xor21 = xor i32 %xor18, %xor20
  %24 = load i32, i32* %temp3, align 4
  %xor22 = xor i32 %xor21, %24
  %25 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx23 = getelementptr inbounds [4 x i32], [4 x i32]* %25, i64 1
  %26 = load i32, i32* %i, align 4
  %idxprom24 = sext i32 %26 to i64
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx23, i64 0, i64 %idxprom24
  store i32 %xor22, i32* %arrayidx25, align 4
  %27 = load i32, i32* %temp0, align 4
  %28 = load i32, i32* %temp1, align 4
  %xor26 = xor i32 %27, %28
  %29 = load i32, i32* %temp2, align 4
  %call27 = call i32 @aes_multiple4(i32 %29, i32 2)
  %xor28 = xor i32 %xor26, %call27
  %30 = load i32, i32* %temp3, align 4
  %31 = load i32, i32* %temp3, align 4
  %call29 = call i32 @aes_multiple5(i32 %31, i32 2)
  %xor30 = xor i32 %30, %call29
  %xor31 = xor i32 %xor28, %xor30
  %32 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx32 = getelementptr inbounds [4 x i32], [4 x i32]* %32, i64 2
  %33 = load i32, i32* %i, align 4
  %idxprom33 = sext i32 %33 to i64
  %arrayidx34 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx32, i64 0, i64 %idxprom33
  store i32 %xor31, i32* %arrayidx34, align 4
  %34 = load i32, i32* %temp0, align 4
  %35 = load i32, i32* %temp0, align 4
  %call35 = call i32 @aes_multiple6(i32 %35, i32 2)
  %xor36 = xor i32 %34, %call35
  %36 = load i32, i32* %temp1, align 4
  %xor37 = xor i32 %xor36, %36
  %37 = load i32, i32* %temp2, align 4
  %xor38 = xor i32 %xor37, %37
  %38 = load i32, i32* %temp3, align 4
  %call39 = call i32 @aes_multiple7(i32 %38, i32 2)
  %xor40 = xor i32 %xor38, %call39
  %39 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx41 = getelementptr inbounds [4 x i32], [4 x i32]* %39, i64 3
  %40 = load i32, i32* %i, align 4
  %idxprom42 = sext i32 %40 to i64
  %arrayidx43 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx41, i64 0, i64 %idxprom42
  store i32 %xor40, i32* %arrayidx43, align 4
  br label %if.end
 
if.else:
  %41 = load i32, i32* %temp0, align 4
  %call44 = call i32 @aes_multiple8(i32 %41, i32 14)
  %42 = load i32, i32* %temp1, align 4
  %call45 = call i32 @aes_multiple9(i32 %42, i32 11)
  %xor46 = xor i32 %call44, %call45
  %43 = load i32, i32* %temp2, align 4
  %call47 = call i32 @aes_multiple10(i32 %43, i32 13)
  %xor48 = xor i32 %xor46, %call47
  %44 = load i32, i32* %temp3, align 4
  %call49 = call i32 @aes_multiple11(i32 %44, i32 9)
  %xor50 = xor i32 %xor48, %call49
  %45 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx51 = getelementptr inbounds [4 x i32], [4 x i32]* %45, i64 0
  %46 = load i32, i32* %i, align 4
  %idxprom52 = sext i32 %46 to i64
  %arrayidx53 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx51, i64 0, i64 %idxprom52
  store i32 %xor50, i32* %arrayidx53, align 4
  %47 = load i32, i32* %temp0, align 4
  %call54 = call i32 @aes_multiple12(i32 %47, i32 9)
  %48 = load i32, i32* %temp1, align 4
  %call55 = call i32 @aes_multiple13(i32 %48, i32 14)
  %xor56 = xor i32 %call54, %call55
  %49 = load i32, i32* %temp2, align 4
  %call57 = call i32 @aes_multiple14(i32 %49, i32 11)
  %xor58 = xor i32 %xor56, %call57
  %50 = load i32, i32* %temp3, align 4
  %call59 = call i32 @aes_multiple15(i32 %50, i32 13)
  %xor60 = xor i32 %xor58, %call59
  %51 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx61 = getelementptr inbounds [4 x i32], [4 x i32]* %51, i64 1
  %52 = load i32, i32* %i, align 4
  %idxprom62 = sext i32 %52 to i64
  %arrayidx63 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx61, i64 0, i64 %idxprom62
  store i32 %xor60, i32* %arrayidx63, align 4
  %53 = load i32, i32* %temp0, align 4
  %call64 = call i32 @aes_multiple16(i32 %53, i32 13)
  %54 = load i32, i32* %temp1, align 4
  %call65 = call i32 @aes_multiple17(i32 %54, i32 9)
  %xor66 = xor i32 %call64, %call65
  %55 = load i32, i32* %temp2, align 4
  %call67 = call i32 @aes_multiple18(i32 %55, i32 14)
  %xor68 = xor i32 %xor66, %call67
  %56 = load i32, i32* %temp3, align 4
  %call69 = call i32 @aes_multiple19(i32 %56, i32 11)
  %xor70 = xor i32 %xor68, %call69
  %57 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx71 = getelementptr inbounds [4 x i32], [4 x i32]* %57, i64 2
  %58 = load i32, i32* %i, align 4
  %idxprom72 = sext i32 %58 to i64
  %arrayidx73 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx71, i64 0, i64 %idxprom72
  store i32 %xor70, i32* %arrayidx73, align 4
  %59 = load i32, i32* %temp0, align 4
  %call74 = call i32 @aes_multiple20(i32 %59, i32 11)
  %60 = load i32, i32* %temp1, align 4
  %call75 = call i32 @aes_multiple21(i32 %60, i32 13)
  %xor76 = xor i32 %call74, %call75
  %61 = load i32, i32* %temp2, align 4
  %call77 = call i32 @aes_multiple22(i32 %61, i32 9)
  %xor78 = xor i32 %xor76, %call77
  %62 = load i32, i32* %temp3, align 4
  %call79 = call i32 @aes_multiple23(i32 %62, i32 14)
  %xor80 = xor i32 %xor78, %call79
  %63 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx81 = getelementptr inbounds [4 x i32], [4 x i32]* %63, i64 3
  %64 = load i32, i32* %i, align 4
  %idxprom82 = sext i32 %64 to i64
  %arrayidx83 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx81, i64 0, i64 %idxprom82
  store i32 %xor80, i32* %arrayidx83, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %65 = load i32, i32* %i, align 4
  %inc = add nsw i32 %65, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  ret void
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
}
define dso_local i32 @aes_multiple(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @c2i1(i8 signext %ch) #0 {
entry:
  %retval = alloca i32, align 4
  %ch.addr = alloca i8, align 1
  store i8 %ch, i8* %ch.addr, align 1
  %call = call i16** @__ctype_b_loc() #4
  %0 = load i16*, i16** %call, align 8
  %1 = load i8, i8* %ch.addr, align 1
  %conv = sext i8 %1 to i32
  %idxprom = sext i32 %conv to i64
  %arrayidx = getelementptr inbounds i16, i16* %0, i64 %idxprom
  %2 = load i16, i16* %arrayidx, align 2
  %conv1 = zext i16 %2 to i32
  %and = and i32 %conv1, 2048
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end
 
if.then:
  %3 = load i8, i8* %ch.addr, align 1
  %conv2 = sext i8 %3 to i32
  %sub = sub nsw i32 %conv2, 48
  store i32 %sub, i32* %retval, align 4
  br label %return
 
if.end:
  %4 = load i8, i8* %ch.addr, align 1
  %conv3 = sext i8 %4 to i32
  %cmp = icmp slt i32 %conv3, 65
  br i1 %cmp, label %if.then15, label %lor.lhs.false
 
lor.lhs.false:
  %5 = load i8, i8* %ch.addr, align 1
  %conv5 = sext i8 %5 to i32
  %cmp6 = icmp sgt i32 %conv5, 70
  br i1 %cmp6, label %land.lhs.true, label %lor.lhs.false11
 
land.lhs.true:
  %6 = load i8, i8* %ch.addr, align 1
  %conv8 = sext i8 %6 to i32
  %cmp9 = icmp slt i32 %conv8, 97
  br i1 %cmp9, label %if.then15, label %lor.lhs.false11
 
lor.lhs.false11:
  %7 = load i8, i8* %ch.addr, align 1
  %conv12 = sext i8 %7 to i32
  %cmp13 = icmp sgt i32 %conv12, 122
  br i1 %cmp13, label %if.then15, label %if.end16
 
if.then15:
  store i32 -1, i32* %retval, align 4
  br label %return
 
if.end16:
  %call17 = call i16** @__ctype_b_loc() #4
  %8 = load i16*, i16** %call17, align 8
  %9 = load i8, i8* %ch.addr, align 1
  %conv18 = sext i8 %9 to i32
  %idxprom19 = sext i32 %conv18 to i64
  %arrayidx20 = getelementptr inbounds i16, i16* %8, i64 %idxprom19
  %10 = load i16, i16* %arrayidx20, align 2
  %conv21 = zext i16 %10 to i32
  %and22 = and i32 %conv21, 1024
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %if.then24, label %if.end36
 
if.then24:
  %call25 = call i16** @__ctype_b_loc() #4
  %11 = load i16*, i16** %call25, align 8
  %12 = load i8, i8* %ch.addr, align 1
  %conv26 = sext i8 %12 to i32
  %idxprom27 = sext i32 %conv26 to i64
  %arrayidx28 = getelementptr inbounds i16, i16* %11, i64 %idxprom27
  %13 = load i16, i16* %arrayidx28, align 2
  %conv29 = zext i16 %13 to i32
  %and30 = and i32 %conv29, 256
  %tobool31 = icmp ne i32 %and30, 0
  br i1 %tobool31, label %cond.true, label %cond.false
 
cond.true:
  %14 = load i8, i8* %ch.addr, align 1
  %conv32 = sext i8 %14 to i32
  %sub33 = sub nsw i32 %conv32, 55
  br label %cond.end
 
cond.false:
  %15 = load i8, i8* %ch.addr, align 1
  %conv34 = sext i8 %15 to i32
  %sub35 = sub nsw i32 %conv34, 87
  br label %cond.end
 
cond.end:
  %cond = phi i32 [ %sub33, %cond.true ], [ %sub35, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return
 
if.end36:
  store i32 -1, i32* %retval, align 4
  br label %return
 
return:
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}
define dso_local void @addRoundKey1([4 x i32]* %a, [4 x i32]* %k) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %a.addr = alloca [4 x i32]*, align 8
  %k.addr = alloca [4 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [4 x i32]* %a, [4 x i32]** %a.addr, align 8
  store [4 x i32]* %k, [4 x i32]** %k.addr, align 8
  store i32 0, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  store i32 0, i32* %j, align 4
  br label %for.cond1
 
for.cond1:
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 4
  br i1 %cmp2, label %for.body3, label %for.end
 
for.body3:
  %2 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 %idxprom
  %4 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom4
  %5 = load i32, i32* %arrayidx5, align 4
  %6 = load [4 x i32]*, [4 x i32]** %k.addr, align 8
  %7 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %7 to i64
  %arrayidx7 = getelementptr inbounds [4 x i32], [4 x i32]* %6, i64 %idxprom6
  %8 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %8 to i64
  %arrayidx9 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx7, i64 0, i64 %idxprom8
  %9 = load i32, i32* %arrayidx9, align 4
  %xor = xor i32 %5, %9
  %10 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %11 to i64
  %arrayidx11 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 %idxprom10
  %12 = load i32, i32* %j, align 4
  %idxprom12 = sext i32 %12 to i64
  %arrayidx13 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx11, i64 0, i64 %idxprom12
  store i32 %xor, i32* %arrayidx13, align 4
  br label %for.inc
 
for.inc:
  %13 = load i32, i32* %j, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1
 
for.end:
  br label %for.inc14
 
for.inc14:
  %14 = load i32, i32* %i, align 4
  %inc15 = add nsw i32 %14, 1
  store i32 %inc15, i32* %i, align 4
  br label %nfv.jmp0
 
for.end16:
  ret void
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end16 ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
}
define dso_local void @addRoundKey2([4 x i32]* %a, [4 x i32]* %k) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %a.addr = alloca [4 x i32]*, align 8
  %k.addr = alloca [4 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [4 x i32]* %a, [4 x i32]** %a.addr, align 8
  store [4 x i32]* %k, [4 x i32]** %k.addr, align 8
  store i32 0, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  store i32 0, i32* %j, align 4
  br label %for.cond1
 
for.cond1:
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 4
  br i1 %cmp2, label %for.body3, label %for.end
 
for.body3:
  %2 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 %idxprom
  %4 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom4
  %5 = load i32, i32* %arrayidx5, align 4
  %6 = load [4 x i32]*, [4 x i32]** %k.addr, align 8
  %7 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %7 to i64
  %arrayidx7 = getelementptr inbounds [4 x i32], [4 x i32]* %6, i64 %idxprom6
  %8 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %8 to i64
  %arrayidx9 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx7, i64 0, i64 %idxprom8
  %9 = load i32, i32* %arrayidx9, align 4
  %xor = xor i32 %5, %9
  %10 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %11 to i64
  %arrayidx11 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 %idxprom10
  %12 = load i32, i32* %j, align 4
  %idxprom12 = sext i32 %12 to i64
  %arrayidx13 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx11, i64 0, i64 %idxprom12
  store i32 %xor, i32* %arrayidx13, align 4
  br label %for.inc
 
for.inc:
  %13 = load i32, i32* %j, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1
 
for.end:
  br label %for.inc14
 
for.inc14:
  %14 = load i32, i32* %i, align 4
  %inc15 = add nsw i32 %14, 1
  store i32 %inc15, i32* %i, align 4
  br label %nfv.jmp0
 
for.end16:
  ret void
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end16 ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
}
define dso_local void @addRoundKey3([4 x i32]* %a, [4 x i32]* %k) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %a.addr = alloca [4 x i32]*, align 8
  %k.addr = alloca [4 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store [4 x i32]* %a, [4 x i32]** %a.addr, align 8
  store [4 x i32]* %k, [4 x i32]** %k.addr, align 8
  store i32 0, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  store i32 0, i32* %j, align 4
  br label %for.cond1
 
for.cond1:
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 4
  br i1 %cmp2, label %for.body3, label %for.end
 
for.body3:
  %2 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 %idxprom
  %4 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom4
  %5 = load i32, i32* %arrayidx5, align 4
  %6 = load [4 x i32]*, [4 x i32]** %k.addr, align 8
  %7 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %7 to i64
  %arrayidx7 = getelementptr inbounds [4 x i32], [4 x i32]* %6, i64 %idxprom6
  %8 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %8 to i64
  %arrayidx9 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx7, i64 0, i64 %idxprom8
  %9 = load i32, i32* %arrayidx9, align 4
  %xor = xor i32 %5, %9
  %10 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %11 to i64
  %arrayidx11 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 %idxprom10
  %12 = load i32, i32* %j, align 4
  %idxprom12 = sext i32 %12 to i64
  %arrayidx13 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx11, i64 0, i64 %idxprom12
  store i32 %xor, i32* %arrayidx13, align 4
  br label %for.inc
 
for.inc:
  %13 = load i32, i32* %j, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1
 
for.end:
  br label %for.inc14
 
for.inc14:
  %14 = load i32, i32* %i, align 4
  %inc15 = add nsw i32 %14, 1
  store i32 %inc15, i32* %i, align 4
  br label %nfv.jmp0
 
for.end16:
  ret void
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end16 ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
}
define dso_local void @subBytes1([4 x i32]* %a, i32 %encode) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %a.addr = alloca [4 x i32]*, align 8
  %encode.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %temp = alloca i32, align 4
  %row = alloca i32, align 4
  %column = alloca i32, align 4
  store [4 x i32]* %a, [4 x i32]** %a.addr, align 8
  store i32 %encode, i32* %encode.addr, align 4
  store i32 0, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  store i32 0, i32* %j, align 4
  br label %for.cond1
 
for.cond1:
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 4
  br i1 %cmp2, label %for.body3, label %for.end
 
for.body3:
  %2 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %2, i64 %idxprom
  %4 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom4
  %5 = load i32, i32* %arrayidx5, align 4
  store i32 %5, i32* %temp, align 4
  %6 = load i32, i32* %temp, align 4
  %div = sdiv i32 %6, 16
  store i32 %div, i32* %row, align 4
  %7 = load i32, i32* %temp, align 4
  %rem = srem i32 %7, 16
  store i32 %rem, i32* %column, align 4
  %8 = load i32, i32* %encode.addr, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then, label %if.else
 
if.then:
  %9 = load i32, i32* %row, align 4
  %idxprom6 = sext i32 %9 to i64
  %arrayidx7 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @S_BOX, i64 0, i64 %idxprom6
  %10 = load i32, i32* %column, align 4
  %idxprom8 = sext i32 %10 to i64
  %arrayidx9 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx7, i64 0, i64 %idxprom8
  %11 = load i32, i32* %arrayidx9, align 4
  %12 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %13 to i64
  %arrayidx11 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i64 %idxprom10
  %14 = load i32, i32* %j, align 4
  %idxprom12 = sext i32 %14 to i64
  %arrayidx13 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx11, i64 0, i64 %idxprom12
  store i32 %11, i32* %arrayidx13, align 4
  br label %if.end
 
if.else:
  %15 = load i32, i32* %row, align 4
  %idxprom14 = sext i32 %15 to i64
  %arrayidx15 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]]* @INVERSE_S_BOX, i64 0, i64 %idxprom14
  %16 = load i32, i32* %column, align 4
  %idxprom16 = sext i32 %16 to i64
  %arrayidx17 = getelementptr inbounds [16 x i32], [16 x i32]* %arrayidx15, i64 0, i64 %idxprom16
  %17 = load i32, i32* %arrayidx17, align 4
  %18 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %19 = load i32, i32* %i, align 4
  %idxprom18 = sext i32 %19 to i64
  %arrayidx19 = getelementptr inbounds [4 x i32], [4 x i32]* %18, i64 %idxprom18
  %20 = load i32, i32* %j, align 4
  %idxprom20 = sext i32 %20 to i64
  %arrayidx21 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx19, i64 0, i64 %idxprom20
  store i32 %17, i32* %arrayidx21, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %21 = load i32, i32* %j, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1
 
for.end:
  br label %for.inc22
 
for.inc22:
  %22 = load i32, i32* %i, align 4
  %inc23 = add nsw i32 %22, 1
  store i32 %inc23, i32* %i, align 4
  br label %nfv.jmp0
 
for.end24:
  ret void
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end24 ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
}
define dso_local void @shiftRows1([4 x i32]* %a, i32 %encode) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %a.addr = alloca [4 x i32]*, align 8
  %encode.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %temp = alloca i32, align 4
  %temp26 = alloca i32, align 4
  store [4 x i32]* %a, [4 x i32]** %a.addr, align 8
  store i32 %encode, i32* %encode.addr, align 4
  store i32 0, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  store i32 0, i32* %j, align 4
  br label %for.cond1
 
for.cond1:
  %1 = load i32, i32* %j, align 4
  %2 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %1, %2
  br i1 %cmp2, label %for.body3, label %for.end
 
for.body3:
  %3 = load i32, i32* %encode.addr, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.else
 
if.then:
  %4 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 %idxprom
  %arrayidx4 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 0
  %6 = load i32, i32* %arrayidx4, align 4
  store i32 %6, i32* %temp, align 4
  %7 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %8 to i64
  %arrayidx6 = getelementptr inbounds [4 x i32], [4 x i32]* %7, i64 %idxprom5
  %arrayidx7 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx6, i64 0, i64 1
  %9 = load i32, i32* %arrayidx7, align 4
  %10 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %11 to i64
  %arrayidx9 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 %idxprom8
  %arrayidx10 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx9, i64 0, i64 0
  store i32 %9, i32* %arrayidx10, align 4
  %12 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom11 = sext i32 %13 to i64
  %arrayidx12 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i64 %idxprom11
  %arrayidx13 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx12, i64 0, i64 2
  %14 = load i32, i32* %arrayidx13, align 4
  %15 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %16 = load i32, i32* %i, align 4
  %idxprom14 = sext i32 %16 to i64
  %arrayidx15 = getelementptr inbounds [4 x i32], [4 x i32]* %15, i64 %idxprom14
  %arrayidx16 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx15, i64 0, i64 1
  store i32 %14, i32* %arrayidx16, align 4
  %17 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %18 to i64
  %arrayidx18 = getelementptr inbounds [4 x i32], [4 x i32]* %17, i64 %idxprom17
  %arrayidx19 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx18, i64 0, i64 3
  %19 = load i32, i32* %arrayidx19, align 4
  %20 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %21 = load i32, i32* %i, align 4
  %idxprom20 = sext i32 %21 to i64
  %arrayidx21 = getelementptr inbounds [4 x i32], [4 x i32]* %20, i64 %idxprom20
  %arrayidx22 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx21, i64 0, i64 2
  store i32 %19, i32* %arrayidx22, align 4
  %22 = load i32, i32* %temp, align 4
  %23 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %24 = load i32, i32* %i, align 4
  %idxprom23 = sext i32 %24 to i64
  %arrayidx24 = getelementptr inbounds [4 x i32], [4 x i32]* %23, i64 %idxprom23
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx24, i64 0, i64 3
  store i32 %22, i32* %arrayidx25, align 4
  br label %if.end
 
if.else:
  %25 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %26 = load i32, i32* %i, align 4
  %idxprom27 = sext i32 %26 to i64
  %arrayidx28 = getelementptr inbounds [4 x i32], [4 x i32]* %25, i64 %idxprom27
  %arrayidx29 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx28, i64 0, i64 3
  %27 = load i32, i32* %arrayidx29, align 4
  store i32 %27, i32* %temp26, align 4
  %28 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %29 = load i32, i32* %i, align 4
  %idxprom30 = sext i32 %29 to i64
  %arrayidx31 = getelementptr inbounds [4 x i32], [4 x i32]* %28, i64 %idxprom30
  %arrayidx32 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx31, i64 0, i64 2
  %30 = load i32, i32* %arrayidx32, align 4
  %31 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %32 = load i32, i32* %i, align 4
  %idxprom33 = sext i32 %32 to i64
  %arrayidx34 = getelementptr inbounds [4 x i32], [4 x i32]* %31, i64 %idxprom33
  %arrayidx35 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx34, i64 0, i64 3
  store i32 %30, i32* %arrayidx35, align 4
  %33 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %34 = load i32, i32* %i, align 4
  %idxprom36 = sext i32 %34 to i64
  %arrayidx37 = getelementptr inbounds [4 x i32], [4 x i32]* %33, i64 %idxprom36
  %arrayidx38 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx37, i64 0, i64 1
  %35 = load i32, i32* %arrayidx38, align 4
  %36 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %37 = load i32, i32* %i, align 4
  %idxprom39 = sext i32 %37 to i64
  %arrayidx40 = getelementptr inbounds [4 x i32], [4 x i32]* %36, i64 %idxprom39
  %arrayidx41 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx40, i64 0, i64 2
  store i32 %35, i32* %arrayidx41, align 4
  %38 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %39 = load i32, i32* %i, align 4
  %idxprom42 = sext i32 %39 to i64
  %arrayidx43 = getelementptr inbounds [4 x i32], [4 x i32]* %38, i64 %idxprom42
  %arrayidx44 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx43, i64 0, i64 0
  %40 = load i32, i32* %arrayidx44, align 4
  %41 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %42 = load i32, i32* %i, align 4
  %idxprom45 = sext i32 %42 to i64
  %arrayidx46 = getelementptr inbounds [4 x i32], [4 x i32]* %41, i64 %idxprom45
  %arrayidx47 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx46, i64 0, i64 1
  store i32 %40, i32* %arrayidx47, align 4
  %43 = load i32, i32* %temp26, align 4
  %44 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %45 = load i32, i32* %i, align 4
  %idxprom48 = sext i32 %45 to i64
  %arrayidx49 = getelementptr inbounds [4 x i32], [4 x i32]* %44, i64 %idxprom48
  %arrayidx50 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx49, i64 0, i64 0
  store i32 %43, i32* %arrayidx50, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %46 = load i32, i32* %j, align 4
  %inc = add nsw i32 %46, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1
 
for.end:
  br label %for.inc51
 
for.inc51:
  %47 = load i32, i32* %i, align 4
  %inc52 = add nsw i32 %47, 1
  store i32 %inc52, i32* %i, align 4
  br label %nfv.jmp0
 
for.end53:
  ret void
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end53 ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
}
define dso_local i32 @aes_multiple1(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple2(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple3(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple4(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple5(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple6(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple7(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple8(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple9(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple10(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple11(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple12(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple13(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple14(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple15(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple16(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple17(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple18(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple19(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple20(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple21(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple22(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple23(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local void @mixColumns1([4 x i32]* %a, i32 %encode) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %a.addr = alloca [4 x i32]*, align 8
  %encode.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %temp0 = alloca i32, align 4
  %temp1 = alloca i32, align 4
  %temp2 = alloca i32, align 4
  %temp3 = alloca i32, align 4
  store [4 x i32]* %a, [4 x i32]** %a.addr, align 8
  store i32 %encode, i32* %encode.addr, align 4
  store i32 0, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %1 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %1, i64 0
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx1 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx, i64 0, i64 %idxprom
  %3 = load i32, i32* %arrayidx1, align 4
  store i32 %3, i32* %temp0, align 4
  %4 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx2 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i64 1
  %5 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %5 to i64
  %arrayidx4 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx2, i64 0, i64 %idxprom3
  %6 = load i32, i32* %arrayidx4, align 4
  store i32 %6, i32* %temp1, align 4
  %7 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx5 = getelementptr inbounds [4 x i32], [4 x i32]* %7, i64 2
  %8 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %8 to i64
  %arrayidx7 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx5, i64 0, i64 %idxprom6
  %9 = load i32, i32* %arrayidx7, align 4
  store i32 %9, i32* %temp2, align 4
  %10 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx8 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 3
  %11 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %11 to i64
  %arrayidx10 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx8, i64 0, i64 %idxprom9
  %12 = load i32, i32* %arrayidx10, align 4
  store i32 %12, i32* %temp3, align 4
  %13 = load i32, i32* %encode.addr, align 4
  %tobool = icmp ne i32 %13, 0
  br i1 %tobool, label %if.then, label %if.else
 
if.then:
  %14 = load i32, i32* %temp0, align 4
  %call = call i32 @aes_multiple24(i32 %14, i32 2)
  %15 = load i32, i32* %temp1, align 4
  %call11 = call i32 @aes_multiple25(i32 %15, i32 3)
  %xor = xor i32 %call, %call11
  %16 = load i32, i32* %temp2, align 4
  %xor12 = xor i32 %xor, %16
  %17 = load i32, i32* %temp3, align 4
  %xor13 = xor i32 %xor12, %17
  %18 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx14 = getelementptr inbounds [4 x i32], [4 x i32]* %18, i64 0
  %19 = load i32, i32* %i, align 4
  %idxprom15 = sext i32 %19 to i64
  %arrayidx16 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx14, i64 0, i64 %idxprom15
  store i32 %xor13, i32* %arrayidx16, align 4
  %20 = load i32, i32* %temp0, align 4
  %21 = load i32, i32* %temp1, align 4
  %call17 = call i32 @aes_multiple26(i32 %21, i32 2)
  %xor18 = xor i32 %20, %call17
  %22 = load i32, i32* %temp2, align 4
  %23 = load i32, i32* %temp2, align 4
  %call19 = call i32 @aes_multiple27(i32 %23, i32 2)
  %xor20 = xor i32 %22, %call19
  %xor21 = xor i32 %xor18, %xor20
  %24 = load i32, i32* %temp3, align 4
  %xor22 = xor i32 %xor21, %24
  %25 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx23 = getelementptr inbounds [4 x i32], [4 x i32]* %25, i64 1
  %26 = load i32, i32* %i, align 4
  %idxprom24 = sext i32 %26 to i64
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx23, i64 0, i64 %idxprom24
  store i32 %xor22, i32* %arrayidx25, align 4
  %27 = load i32, i32* %temp0, align 4
  %28 = load i32, i32* %temp1, align 4
  %xor26 = xor i32 %27, %28
  %29 = load i32, i32* %temp2, align 4
  %call27 = call i32 @aes_multiple28(i32 %29, i32 2)
  %xor28 = xor i32 %xor26, %call27
  %30 = load i32, i32* %temp3, align 4
  %31 = load i32, i32* %temp3, align 4
  %call29 = call i32 @aes_multiple29(i32 %31, i32 2)
  %xor30 = xor i32 %30, %call29
  %xor31 = xor i32 %xor28, %xor30
  %32 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx32 = getelementptr inbounds [4 x i32], [4 x i32]* %32, i64 2
  %33 = load i32, i32* %i, align 4
  %idxprom33 = sext i32 %33 to i64
  %arrayidx34 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx32, i64 0, i64 %idxprom33
  store i32 %xor31, i32* %arrayidx34, align 4
  %34 = load i32, i32* %temp0, align 4
  %35 = load i32, i32* %temp0, align 4
  %call35 = call i32 @aes_multiple30(i32 %35, i32 2)
  %xor36 = xor i32 %34, %call35
  %36 = load i32, i32* %temp1, align 4
  %xor37 = xor i32 %xor36, %36
  %37 = load i32, i32* %temp2, align 4
  %xor38 = xor i32 %xor37, %37
  %38 = load i32, i32* %temp3, align 4
  %call39 = call i32 @aes_multiple31(i32 %38, i32 2)
  %xor40 = xor i32 %xor38, %call39
  %39 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx41 = getelementptr inbounds [4 x i32], [4 x i32]* %39, i64 3
  %40 = load i32, i32* %i, align 4
  %idxprom42 = sext i32 %40 to i64
  %arrayidx43 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx41, i64 0, i64 %idxprom42
  store i32 %xor40, i32* %arrayidx43, align 4
  br label %if.end
 
if.else:
  %41 = load i32, i32* %temp0, align 4
  %call44 = call i32 @aes_multiple32(i32 %41, i32 14)
  %42 = load i32, i32* %temp1, align 4
  %call45 = call i32 @aes_multiple33(i32 %42, i32 11)
  %xor46 = xor i32 %call44, %call45
  %43 = load i32, i32* %temp2, align 4
  %call47 = call i32 @aes_multiple34(i32 %43, i32 13)
  %xor48 = xor i32 %xor46, %call47
  %44 = load i32, i32* %temp3, align 4
  %call49 = call i32 @aes_multiple35(i32 %44, i32 9)
  %xor50 = xor i32 %xor48, %call49
  %45 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx51 = getelementptr inbounds [4 x i32], [4 x i32]* %45, i64 0
  %46 = load i32, i32* %i, align 4
  %idxprom52 = sext i32 %46 to i64
  %arrayidx53 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx51, i64 0, i64 %idxprom52
  store i32 %xor50, i32* %arrayidx53, align 4
  %47 = load i32, i32* %temp0, align 4
  %call54 = call i32 @aes_multiple36(i32 %47, i32 9)
  %48 = load i32, i32* %temp1, align 4
  %call55 = call i32 @aes_multiple37(i32 %48, i32 14)
  %xor56 = xor i32 %call54, %call55
  %49 = load i32, i32* %temp2, align 4
  %call57 = call i32 @aes_multiple38(i32 %49, i32 11)
  %xor58 = xor i32 %xor56, %call57
  %50 = load i32, i32* %temp3, align 4
  %call59 = call i32 @aes_multiple39(i32 %50, i32 13)
  %xor60 = xor i32 %xor58, %call59
  %51 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx61 = getelementptr inbounds [4 x i32], [4 x i32]* %51, i64 1
  %52 = load i32, i32* %i, align 4
  %idxprom62 = sext i32 %52 to i64
  %arrayidx63 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx61, i64 0, i64 %idxprom62
  store i32 %xor60, i32* %arrayidx63, align 4
  %53 = load i32, i32* %temp0, align 4
  %call64 = call i32 @aes_multiple40(i32 %53, i32 13)
  %54 = load i32, i32* %temp1, align 4
  %call65 = call i32 @aes_multiple41(i32 %54, i32 9)
  %xor66 = xor i32 %call64, %call65
  %55 = load i32, i32* %temp2, align 4
  %call67 = call i32 @aes_multiple42(i32 %55, i32 14)
  %xor68 = xor i32 %xor66, %call67
  %56 = load i32, i32* %temp3, align 4
  %call69 = call i32 @aes_multiple43(i32 %56, i32 11)
  %xor70 = xor i32 %xor68, %call69
  %57 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx71 = getelementptr inbounds [4 x i32], [4 x i32]* %57, i64 2
  %58 = load i32, i32* %i, align 4
  %idxprom72 = sext i32 %58 to i64
  %arrayidx73 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx71, i64 0, i64 %idxprom72
  store i32 %xor70, i32* %arrayidx73, align 4
  %59 = load i32, i32* %temp0, align 4
  %call74 = call i32 @aes_multiple44(i32 %59, i32 11)
  %60 = load i32, i32* %temp1, align 4
  %call75 = call i32 @aes_multiple45(i32 %60, i32 13)
  %xor76 = xor i32 %call74, %call75
  %61 = load i32, i32* %temp2, align 4
  %call77 = call i32 @aes_multiple46(i32 %61, i32 9)
  %xor78 = xor i32 %xor76, %call77
  %62 = load i32, i32* %temp3, align 4
  %call79 = call i32 @aes_multiple47(i32 %62, i32 14)
  %xor80 = xor i32 %xor78, %call79
  %63 = load [4 x i32]*, [4 x i32]** %a.addr, align 8
  %arrayidx81 = getelementptr inbounds [4 x i32], [4 x i32]* %63, i64 3
  %64 = load i32, i32* %i, align 4
  %idxprom82 = sext i32 %64 to i64
  %arrayidx83 = getelementptr inbounds [4 x i32], [4 x i32]* %arrayidx81, i64 0, i64 %idxprom82
  store i32 %xor80, i32* %arrayidx83, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %65 = load i32, i32* %i, align 4
  %inc = add nsw i32 %65, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  ret void
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
}
define dso_local i32 @aes_multiple24(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple25(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple26(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple27(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple28(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple29(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple30(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple31(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple32(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple33(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple34(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple35(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple36(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple37(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple38(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple39(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple40(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple41(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple42(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple43(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple44(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple45(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple46(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
define dso_local i32 @aes_multiple47(i32 %a, i32 %le) #0 {
entry:
  %nfv.cond.pointer0 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer0, align 4
  %nfv.cond.pointer1 = alloca i32, align 4
  store i32 0, i32* %nfv.cond.pointer1, align 4
  %a.addr = alloca i32, align 4
  %le.addr = alloca i32, align 4
  %thr = alloca i32, align 4
  %sec = alloca i32, align 4
  %fir = alloca i32, align 4
  %fir_mod = alloca i32, align 4
  %result = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %b10 = alloca i32, align 4
  %i11 = alloca i32, align 4
  %b28 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %le, i32* %le.addr, align 4
  %0 = load i32, i32* %le.addr, align 4
  %and = and i32 %0, 8
  store i32 %and, i32* %thr, align 4
  %1 = load i32, i32* %le.addr, align 4
  %and1 = and i32 %1, 4
  store i32 %and1, i32* %sec, align 4
  %2 = load i32, i32* %le.addr, align 4
  %and2 = and i32 %2, 2
  store i32 %and2, i32* %fir, align 4
  %3 = load i32, i32* %le.addr, align 4
  %rem = srem i32 %3, 2
  store i32 %rem, i32* %fir_mod, align 4
  store i32 0, i32* %result, align 4
  %4 = load i32, i32* %thr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end7
 
if.then:
  %5 = load i32, i32* %a.addr, align 4
  store i32 %5, i32* %b, align 4
  store i32 1, i32* %i, align 4
  br label %nfv.jmp0
 
for.cond:
  %6 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %6, 3
  br i1 %cmp, label %for.body, label %nfv.jmp00
 
for.body:
  %7 = load i32, i32* %b, align 4
  %shl = shl i32 %7, 1
  store i32 %shl, i32* %b, align 4
  %8 = load i32, i32* %b, align 4
  %cmp3 = icmp sge i32 %8, 256
  br i1 %cmp3, label %if.then4, label %if.end
 
if.then4:
  %9 = load i32, i32* %b, align 4
  %xor = xor i32 %9, 283
  store i32 %xor, i32* %b, align 4
  br label %if.end
 
if.end:
  br label %for.inc
 
for.inc:
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %nfv.jmp0
 
for.end:
  %11 = load i32, i32* %b, align 4
  %rem5 = srem i32 %11, 256
  store i32 %rem5, i32* %b, align 4
  %12 = load i32, i32* %result, align 4
  %13 = load i32, i32* %b, align 4
  %xor6 = xor i32 %12, %13
  store i32 %xor6, i32* %result, align 4
  br label %if.end7
 
if.end7:
  %14 = load i32, i32* %sec, align 4
  %tobool8 = icmp ne i32 %14, 0
  br i1 %tobool8, label %if.then9, label %if.end25
 
if.then9:
  %15 = load i32, i32* %a.addr, align 4
  store i32 %15, i32* %b10, align 4
  store i32 1, i32* %i11, align 4
  br label %nfv.jmp1
 
for.cond12:
  %16 = load i32, i32* %i11, align 4
  %cmp13 = icmp sle i32 %16, 2
  br i1 %cmp13, label %for.body14, label %nfv.jmp10
 
for.body14:
  %17 = load i32, i32* %b10, align 4
  %shl15 = shl i32 %17, 1
  store i32 %shl15, i32* %b10, align 4
  %18 = load i32, i32* %b10, align 4
  %cmp16 = icmp sge i32 %18, 256
  br i1 %cmp16, label %if.then17, label %if.end19
 
if.then17:
  %19 = load i32, i32* %b10, align 4
  %xor18 = xor i32 %19, 283
  store i32 %xor18, i32* %b10, align 4
  br label %if.end19
 
if.end19:
  br label %for.inc20
 
for.inc20:
  %20 = load i32, i32* %i11, align 4
  %inc21 = add nsw i32 %20, 1
  store i32 %inc21, i32* %i11, align 4
  br label %nfv.jmp1
 
for.end22:
  %21 = load i32, i32* %b10, align 4
  %rem23 = srem i32 %21, 256
  store i32 %rem23, i32* %b10, align 4
  %22 = load i32, i32* %result, align 4
  %23 = load i32, i32* %b10, align 4
  %xor24 = xor i32 %22, %23
  store i32 %xor24, i32* %result, align 4
  br label %if.end25
 
if.end25:
  %24 = load i32, i32* %fir, align 4
  %tobool26 = icmp ne i32 %24, 0
  br i1 %tobool26, label %if.then27, label %if.end36
 
if.then27:
  %25 = load i32, i32* %a.addr, align 4
  %shl29 = shl i32 %25, 1
  store i32 %shl29, i32* %b28, align 4
  %26 = load i32, i32* %b28, align 4
  %cmp30 = icmp sge i32 %26, 256
  br i1 %cmp30, label %if.then31, label %if.end33
 
if.then31:
  %27 = load i32, i32* %b28, align 4
  %xor32 = xor i32 %27, 283
  store i32 %xor32, i32* %b28, align 4
  br label %if.end33
 
if.end33:
  %28 = load i32, i32* %b28, align 4
  %rem34 = srem i32 %28, 256
  store i32 %rem34, i32* %b28, align 4
  %29 = load i32, i32* %result, align 4
  %30 = load i32, i32* %b28, align 4
  %xor35 = xor i32 %29, %30
  store i32 %xor35, i32* %result, align 4
  br label %if.end36
 
if.end36:
  %31 = load i32, i32* %fir_mod, align 4
  %tobool37 = icmp ne i32 %31, 0
  br i1 %tobool37, label %if.then38, label %if.end40
 
if.then38:
  %32 = load i32, i32* %result, align 4
  %33 = load i32, i32* %a.addr, align 4
  %xor39 = xor i32 %32, %33
  store i32 %xor39, i32* %result, align 4
  br label %if.end40
 
if.end40:
  %34 = load i32, i32* %result, align 4
  ret i32 %34
 
nfv.jmp0:
  %nfv.cond0 = load i32, i32* %nfv.cond.pointer0, align 4
  switch i32 %nfv.cond0, label %for.cond [ i32 1, label %for.end ]
 
nfv.jmp00:
  store i32 1, i32* %nfv.cond.pointer0, align 4
  br label %nfv.jmp0
 
nfv.jmp1:
  %nfv.cond1 = load i32, i32* %nfv.cond.pointer1, align 4
  switch i32 %nfv.cond1, label %for.cond12 [ i32 1, label %for.end22 ]
 
nfv.jmp10:
  store i32 1, i32* %nfv.cond.pointer1, align 4
  br label %nfv.jmp1
}
declare i8* @llvm.stacksave() #1
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #2
declare void @llvm.stackrestore(i8*) #1
declare dso_local i16** @__ctype_b_loc() #3
attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
!llvm.module.flags = !{!0}
!llvm.ident = !{!1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 333817)"}
