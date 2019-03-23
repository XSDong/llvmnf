; ModuleID = './temp/ac.c'
source_filename = "./temp/ac.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Node = type { i8, i32, %struct.Node*, %struct.Node*, %struct.Node*, %struct.Node*, %struct.Node* }

@root = external dso_local global %struct.Node*, align 8
@target_str = external dso_local global i8*, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.Node* @search_son(%struct.Node* %pnd, i8 signext %ch) #0 {
entry:
  %retval = alloca %struct.Node*, align 8
  %pnd.addr = alloca %struct.Node*, align 8
  %ch.addr = alloca i8, align 1
  %target_son = alloca %struct.Node*, align 8
  store %struct.Node* %pnd, %struct.Node** %pnd.addr, align 8
  store i8 %ch, i8* %ch.addr, align 1
  %0 = load %struct.Node*, %struct.Node** %pnd.addr, align 8
  %sons = getelementptr inbounds %struct.Node, %struct.Node* %0, i32 0, i32 2
  %1 = load %struct.Node*, %struct.Node** %sons, align 8
  %cmp = icmp eq %struct.Node* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.Node* null, %struct.Node** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.Node*, %struct.Node** %pnd.addr, align 8
  %sons1 = getelementptr inbounds %struct.Node, %struct.Node* %2, i32 0, i32 2
  %3 = load %struct.Node*, %struct.Node** %sons1, align 8
  store %struct.Node* %3, %struct.Node** %target_son, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %4 = load %struct.Node*, %struct.Node** %target_son, align 8
  %c = getelementptr inbounds %struct.Node, %struct.Node* %4, i32 0, i32 0
  %5 = load i8, i8* %c, align 8
  %conv = sext i8 %5 to i32
  %6 = load i8, i8* %ch.addr, align 1
  %conv2 = sext i8 %6 to i32
  %cmp3 = icmp ne i32 %conv, %conv2
  br i1 %cmp3, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %7 = load %struct.Node*, %struct.Node** %target_son, align 8
  %brother = getelementptr inbounds %struct.Node, %struct.Node* %7, i32 0, i32 3
  %8 = load %struct.Node*, %struct.Node** %brother, align 8
  %cmp5 = icmp ne %struct.Node* %8, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %9 = phi i1 [ false, %while.cond ], [ %cmp5, %land.rhs ]
  br i1 %9, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %10 = load %struct.Node*, %struct.Node** %target_son, align 8
  %brother7 = getelementptr inbounds %struct.Node, %struct.Node* %10, i32 0, i32 3
  %11 = load %struct.Node*, %struct.Node** %brother7, align 8
  store %struct.Node* %11, %struct.Node** %target_son, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %12 = load %struct.Node*, %struct.Node** %target_son, align 8
  %c8 = getelementptr inbounds %struct.Node, %struct.Node* %12, i32 0, i32 0
  %13 = load i8, i8* %c8, align 8
  %conv9 = sext i8 %13 to i32
  %14 = load i8, i8* %ch.addr, align 1
  %conv10 = sext i8 %14 to i32
  %cmp11 = icmp eq i32 %conv9, %conv10
  br i1 %cmp11, label %if.then13, label %if.else

if.then13:                                        ; preds = %while.end
  %15 = load %struct.Node*, %struct.Node** %target_son, align 8
  store %struct.Node* %15, %struct.Node** %retval, align 8
  br label %return

if.else:                                          ; preds = %while.end
  store %struct.Node* null, %struct.Node** %retval, align 8
  br label %return

return:                                           ; preds = %if.else, %if.then13, %if.then
  %16 = load %struct.Node*, %struct.Node** %retval, align 8
  ret %struct.Node* %16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @add_matched_string(%struct.Node* %n) #0 {
entry:
  %n.addr = alloca %struct.Node*, align 8
  %str = alloca [2000 x i8], align 16
  %result = alloca %struct.Node*, align 8
  %len = alloca i32, align 4
  %result_str = alloca [2000 x i8], align 16
  %i = alloca i32, align 4
  store %struct.Node* %n, %struct.Node** %n.addr, align 8
  %0 = load %struct.Node*, %struct.Node** %n.addr, align 8
  store %struct.Node* %0, %struct.Node** %result, align 8
  store i32 0, i32* %len, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load %struct.Node*, %struct.Node** @root, align 8
  %2 = load %struct.Node*, %struct.Node** %result, align 8
  %cmp = icmp ne %struct.Node* %1, %2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load %struct.Node*, %struct.Node** %result, align 8
  %c = getelementptr inbounds %struct.Node, %struct.Node* %3, i32 0, i32 0
  %4 = load i8, i8* %c, align 8
  %5 = load i32, i32* %len, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %len, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [2000 x i8], [2000 x i8]* %str, i64 0, i64 %idxprom
  store i8 %4, i8* %arrayidx, align 1
  %6 = load %struct.Node*, %struct.Node** %result, align 8
  %parent = getelementptr inbounds %struct.Node, %struct.Node* %6, i32 0, i32 4
  %7 = load %struct.Node*, %struct.Node** %parent, align 8
  store %struct.Node* %7, %struct.Node** %result, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %len, align 4
  %cmp1 = icmp slt i32 %8, %9
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %len, align 4
  %sub = sub nsw i32 %10, 1
  %11 = load i32, i32* %i, align 4
  %sub2 = sub nsw i32 %sub, %11
  %idxprom3 = sext i32 %sub2 to i64
  %arrayidx4 = getelementptr inbounds [2000 x i8], [2000 x i8]* %str, i64 0, i64 %idxprom3
  %12 = load i8, i8* %arrayidx4, align 1
  %13 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %13 to i64
  %arrayidx6 = getelementptr inbounds [2000 x i8], [2000 x i8]* %result_str, i64 0, i64 %idxprom5
  store i8 %12, i8* %arrayidx6, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc7 = add nsw i32 %14, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load i32, i32* %len, align 4
  %idxprom8 = sext i32 %15 to i64
  %arrayidx9 = getelementptr inbounds [2000 x i8], [2000 x i8]* %result_str, i64 0, i64 %idxprom8
  store i8 0, i8* %arrayidx9, align 1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @match_string(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 8
  %state = alloca %struct.Node*, align 8
  %node = alloca %struct.Node*, align 8
  %i = alloca i32, align 4
  %temp = alloca %struct.Node*, align 8
  store i8* %s, i8** %s.addr, align 8
  %0 = load %struct.Node*, %struct.Node** @root, align 8
  store %struct.Node* %0, %struct.Node** %state, align 8
  %1 = load %struct.Node*, %struct.Node** @root, align 8
  store %struct.Node* %1, %struct.Node** %node, align 8
  store i32 0, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end33, %entry
  %2 = load i8*, i8** %s.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %idxprom
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %while.body, label %while.end34

while.body:                                       ; preds = %while.cond
  %5 = load %struct.Node*, %struct.Node** %state, align 8
  store %struct.Node* %5, %struct.Node** %node, align 8
  br label %while.cond2

while.cond2:                                      ; preds = %while.body9, %while.body
  %6 = load %struct.Node*, %struct.Node** %node, align 8
  %7 = load i8*, i8** %s.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom3 = zext i32 %8 to i64
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %idxprom3
  %9 = load i8, i8* %arrayidx4, align 1
  %call = call %struct.Node* @search_son(%struct.Node* %6, i8 signext %9)
  %cmp5 = icmp eq %struct.Node* null, %call
  br i1 %cmp5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond2
  %10 = load %struct.Node*, %struct.Node** @root, align 8
  %11 = load %struct.Node*, %struct.Node** %node, align 8
  %cmp7 = icmp ne %struct.Node* %10, %11
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond2
  %12 = phi i1 [ false, %while.cond2 ], [ %cmp7, %land.rhs ]
  br i1 %12, label %while.body9, label %while.end

while.body9:                                      ; preds = %land.end
  %13 = load %struct.Node*, %struct.Node** %node, align 8
  %suffix = getelementptr inbounds %struct.Node, %struct.Node* %13, i32 0, i32 5
  %14 = load %struct.Node*, %struct.Node** %suffix, align 8
  store %struct.Node* %14, %struct.Node** %node, align 8
  br label %while.cond2

while.end:                                        ; preds = %land.end
  %15 = load %struct.Node*, %struct.Node** @root, align 8
  %16 = load %struct.Node*, %struct.Node** %node, align 8
  %cmp10 = icmp eq %struct.Node* %15, %16
  br i1 %cmp10, label %if.then, label %if.else

if.then:                                          ; preds = %while.end
  %17 = load %struct.Node*, %struct.Node** %node, align 8
  %18 = load i8*, i8** %s.addr, align 8
  %19 = load i32, i32* %i, align 4
  %idxprom12 = zext i32 %19 to i64
  %arrayidx13 = getelementptr inbounds i8, i8* %18, i64 %idxprom12
  %20 = load i8, i8* %arrayidx13, align 1
  %call14 = call %struct.Node* @search_son(%struct.Node* %17, i8 signext %20)
  store %struct.Node* %call14, %struct.Node** %node, align 8
  %21 = load %struct.Node*, %struct.Node** %node, align 8
  %cmp15 = icmp eq %struct.Node* null, %21
  br i1 %cmp15, label %if.then17, label %if.end

if.then17:                                        ; preds = %if.then
  %22 = load %struct.Node*, %struct.Node** @root, align 8
  store %struct.Node* %22, %struct.Node** %node, align 8
  br label %if.end

if.end:                                           ; preds = %if.then17, %if.then
  br label %if.end21

if.else:                                          ; preds = %while.end
  %23 = load %struct.Node*, %struct.Node** %node, align 8
  %24 = load i8*, i8** %s.addr, align 8
  %25 = load i32, i32* %i, align 4
  %idxprom18 = zext i32 %25 to i64
  %arrayidx19 = getelementptr inbounds i8, i8* %24, i64 %idxprom18
  %26 = load i8, i8* %arrayidx19, align 1
  %call20 = call %struct.Node* @search_son(%struct.Node* %23, i8 signext %26)
  store %struct.Node* %call20, %struct.Node** %node, align 8
  br label %if.end21

if.end21:                                         ; preds = %if.else, %if.end
  %27 = load %struct.Node*, %struct.Node** %node, align 8
  store %struct.Node* %27, %struct.Node** %temp, align 8
  br label %while.cond22

while.cond22:                                     ; preds = %if.end27, %if.end21
  %28 = load %struct.Node*, %struct.Node** %temp, align 8
  %dictSuffix = getelementptr inbounds %struct.Node, %struct.Node* %28, i32 0, i32 6
  %29 = load %struct.Node*, %struct.Node** %dictSuffix, align 8
  %cmp23 = icmp ne %struct.Node* null, %29
  br i1 %cmp23, label %while.body25, label %while.end29

while.body25:                                     ; preds = %while.cond22
  %30 = load %struct.Node*, %struct.Node** %temp, align 8
  %inDict = getelementptr inbounds %struct.Node, %struct.Node* %30, i32 0, i32 1
  %31 = load i32, i32* %inDict, align 4
  %tobool = icmp ne i32 %31, 0
  br i1 %tobool, label %if.then26, label %if.end27

if.then26:                                        ; preds = %while.body25
  %32 = load %struct.Node*, %struct.Node** %temp, align 8
  call void @add_matched_string(%struct.Node* %32)
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %while.body25
  %33 = load %struct.Node*, %struct.Node** %temp, align 8
  %dictSuffix28 = getelementptr inbounds %struct.Node, %struct.Node* %33, i32 0, i32 6
  %34 = load %struct.Node*, %struct.Node** %dictSuffix28, align 8
  store %struct.Node* %34, %struct.Node** %temp, align 8
  br label %while.cond22

while.end29:                                      ; preds = %while.cond22
  %35 = load %struct.Node*, %struct.Node** %temp, align 8
  %inDict30 = getelementptr inbounds %struct.Node, %struct.Node* %35, i32 0, i32 1
  %36 = load i32, i32* %inDict30, align 4
  %tobool31 = icmp ne i32 %36, 0
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %while.end29
  %37 = load %struct.Node*, %struct.Node** %temp, align 8
  call void @add_matched_string(%struct.Node* %37)
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %while.end29
  %38 = load %struct.Node*, %struct.Node** %node, align 8
  store %struct.Node* %38, %struct.Node** %state, align 8
  %39 = load i32, i32* %i, align 4
  %inc = add i32 %39, 1
  store i32 %inc, i32* %i, align 4
  br label %while.cond

while.end34:                                      ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @ac_match() #0 {
entry:
  %0 = load i8*, i8** @target_str, align 8
  call void @match_string(i8* %0)
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 333817)"}
