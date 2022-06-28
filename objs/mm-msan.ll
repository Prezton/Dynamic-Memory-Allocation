; ModuleID = 'mm.c'
source_filename = "mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.block = type { i64, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { %struct.block*, %struct.block* }

@.str = private unnamed_addr constant [29 x i8] c"line num: %d current heap: \0A\00", align 1
@heap_start = internal unnamed_addr global %struct.block* null, align 8, !dbg !0
@.str.1 = private unnamed_addr constant [69 x i8] c"block is: %p size is: %lu curAlloc: %d prevAlloc: %d, prevMini: %d \0A\00", align 1
@head = internal unnamed_addr global [10 x %struct.block*] zeroinitializer, align 16, !dbg !49
@tail = internal unnamed_addr global %struct.block* null, align 8, !dbg !54
@.str.2 = private unnamed_addr constant [62 x i8] c"NullPointerException at addFree function, block->prev is NULL\00", align 1
@.str.3 = private unnamed_addr constant [56 x i8] c"NullPointerException at addFree function, block is NULL\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @msan.module_ctor, i8* null }]
@__msan_track_origins = weak_odr local_unnamed_addr constant i32 2
@__msan_retval_tls = external thread_local(initialexec) global [100 x i64]
@__msan_retval_origin_tls = external thread_local(initialexec) global i32
@__msan_param_tls = external thread_local(initialexec) global [100 x i64]
@__msan_param_origin_tls = external thread_local(initialexec) global [200 x i32]
@__msan_va_arg_tls = external thread_local(initialexec) global [100 x i64]
@__msan_va_arg_overflow_size_tls = external thread_local(initialexec) global i64
@__msan_origin_tls = external thread_local(initialexec) global i32

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local void @printHeap(i32 %__line__) local_unnamed_addr #0 !dbg !69 {
entry:
  %0 = load i32, i32* bitcast ([100 x i64]* @__msan_param_tls to i32*), align 8, !dbg !76
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !76
  call void @llvm.dbg.value(metadata i32 %__line__, metadata !73, metadata !DIExpression()), !dbg !76
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !77
  store i32 %0, i32* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i32*), align 8, !dbg !77
  store i32 %1, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !77
  store i32 %0, i32* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_va_arg_tls to i64), i64 8) to i32*), align 8, !dbg !77
  store i64 0, i64* @__msan_va_arg_overflow_size_tls, align 8, !dbg !77
  store i32 0, i32* bitcast ([100 x i64]* @__msan_retval_tls to i32*), align 8, !dbg !77
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i64 0, i64 0), i32 %__line__), !dbg !77
  %2 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !78, !tbaa !79
  %_msld = load i64, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @heap_start to i64), i64 87960930222080) to i64*), align 8, !dbg !83
  %3 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint (%struct.block** @heap_start to i64), i64 87960930222080), i64 17592186044416) to i32*), align 8, !dbg !83
  call void @llvm.dbg.value(metadata %struct.block* %2, metadata !74, metadata !DIExpression()), !dbg !83
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !84
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !84
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !84
  %call116 = call fastcc i64 @get_size(%struct.block* %2), !dbg !84
  %_msret19 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !86
  %4 = xor i64 %_msret19, -1, !dbg !86
  %5 = and i64 %call116, %4, !dbg !86
  %6 = icmp eq i64 %5, 0, !dbg !86
  %7 = icmp ne i64 %_msret19, 0, !dbg !86
  %_msprop_icmp = and i1 %7, %6, !dbg !86
  br i1 %_msprop_icmp, label %8, label %10, !dbg !87, !prof !88

; <label>:8:                                      ; preds = %entry
  %9 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !86
  store i32 %9, i32* @__msan_origin_tls, align 4, !dbg !87
  call void @__msan_warning_noreturn() #5, !dbg !87
  call void asm sideeffect "", ""() #5, !dbg !87
  unreachable, !dbg !87

; <label>:10:                                     ; preds = %entry
  %cmp17 = icmp eq i64 %call116, 0, !dbg !86
  br i1 %cmp17, label %for.end, label %for.body.preheader, !dbg !87

for.body.preheader:                               ; preds = %10
  br label %for.body, !dbg !89

for.body:                                         ; preds = %for.body.preheader, %31
  %_msphi_s = phi i64 [ %_msret28, %31 ], [ %_msld, %for.body.preheader ]
  %_msphi_o = phi i32 [ %24, %31 ], [ %3, %for.body.preheader ]
  %block.018 = phi %struct.block* [ %call9, %31 ], [ %2, %for.body.preheader ]
  call void @llvm.dbg.value(metadata %struct.block* %block.018, metadata !74, metadata !DIExpression()), !dbg !83
  %_mscmp31 = icmp eq i64 %_msphi_s, 0, !dbg !89
  br i1 %_mscmp31, label %12, label %11, !dbg !89, !prof !91

; <label>:11:                                     ; preds = %for.body
  store i32 %_msphi_o, i32* @__msan_origin_tls, align 4, !dbg !89
  call void @__msan_warning_noreturn() #5, !dbg !89
  call void asm sideeffect "", ""() #5, !dbg !89
  unreachable, !dbg !89

; <label>:12:                                     ; preds = %for.body
  %header = getelementptr inbounds %struct.block, %struct.block* %block.018, i64 0, i32 0, !dbg !89
  %13 = load i64, i64* %header, align 8, !dbg !89, !tbaa !92
  %14 = ptrtoint %struct.block* %block.018 to i64, !dbg !95
  %15 = xor i64 %14, 87960930222080, !dbg !95
  %16 = inttoptr i64 %15 to i64*, !dbg !95
  %17 = add i64 %15, 17592186044416, !dbg !95
  %18 = inttoptr i64 %17 to i32*, !dbg !95
  %_msld20 = load i64, i64* %16, align 8, !dbg !95
  %19 = load i32, i32* %18, align 8, !dbg !95
  store i64 %_msld20, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !95
  store i32 %19, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !95
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !95
  %call2 = call fastcc i64 @extract_size(i64 %13), !dbg !95
  %_msret21 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !96
  %20 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !96
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !96
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !96
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !96
  %call3 = call fastcc zeroext i1 @get_alloc(%struct.block* %block.018), !dbg !96
  %_msret22 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !96
  %21 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !96
  %_msprop = zext i1 %_msret22 to i32, !dbg !96
  %conv = zext i1 %call3 to i32, !dbg !96
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !97
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !97
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !97
  %call4 = call fastcc zeroext i1 @getPrevAlloc(%struct.block* %block.018), !dbg !97
  %_msret23 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !97
  %22 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !97
  %_msprop24 = zext i1 %_msret23 to i32, !dbg !97
  %conv5 = zext i1 %call4 to i32, !dbg !97
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !98
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !98
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !98
  %call6 = call fastcc zeroext i1 @getPrevMiniStatus(%struct.block* %block.018), !dbg !98
  %_msret25 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !98
  %23 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !98
  %_msprop26 = zext i1 %_msret25 to i32, !dbg !98
  %conv7 = zext i1 %call6 to i32, !dbg !98
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !99
  store i64 0, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !99
  store i32 %_msphi_o, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !99
  store i64 %_msret21, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i64*), align 8, !dbg !99
  store i32 %20, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !99
  store i32 %_msprop, i32* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i32*), align 8, !dbg !99
  store i32 %21, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !99
  store i32 %_msprop24, i32* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i32*), align 8, !dbg !99
  store i32 %22, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 32) to i32*), align 4, !dbg !99
  store i32 %_msprop26, i32* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 40) to i32*), align 8, !dbg !99
  store i32 %23, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 40) to i32*), align 4, !dbg !99
  store i64 0, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_va_arg_tls to i64), i64 8) to i64*), align 8, !dbg !99
  store i64 %_msret21, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_va_arg_tls to i64), i64 16) to i64*), align 8, !dbg !99
  store i32 %_msprop, i32* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_va_arg_tls to i64), i64 24) to i32*), align 8, !dbg !99
  store i32 %_msprop24, i32* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_va_arg_tls to i64), i64 32) to i32*), align 8, !dbg !99
  store i32 %_msprop26, i32* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_va_arg_tls to i64), i64 40) to i32*), align 8, !dbg !99
  store i64 0, i64* @__msan_va_arg_overflow_size_tls, align 8, !dbg !99
  store i32 0, i32* bitcast ([100 x i64]* @__msan_retval_tls to i32*), align 8, !dbg !99
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.1, i64 0, i64 0), %struct.block* %block.018, i64 %call2, i32 %conv, i32 %conv5, i32 %conv7), !dbg !99
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !100
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !100
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !100
  %call9 = call fastcc %struct.block* @find_next(%struct.block* %block.018), !dbg !100
  %_msret28 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !83
  %24 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !83
  call void @llvm.dbg.value(metadata %struct.block* %call9, metadata !74, metadata !DIExpression()), !dbg !83
  store i64 %_msret28, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !84
  store i32 %24, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !84
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !84
  %call1 = call fastcc i64 @get_size(%struct.block* %call9), !dbg !84
  %_msret29 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !86
  %25 = xor i64 %_msret29, -1, !dbg !86
  %26 = and i64 %call1, %25, !dbg !86
  %27 = icmp eq i64 %26, 0, !dbg !86
  %28 = icmp ne i64 %_msret29, 0, !dbg !86
  %_msprop_icmp30 = and i1 %28, %27, !dbg !86
  br i1 %_msprop_icmp30, label %29, label %31, !dbg !87, !prof !88

; <label>:29:                                     ; preds = %12
  %30 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !86
  store i32 %30, i32* @__msan_origin_tls, align 4, !dbg !87
  call void @__msan_warning_noreturn() #5, !dbg !87
  call void asm sideeffect "", ""() #5, !dbg !87
  unreachable, !dbg !87

; <label>:31:                                     ; preds = %12
  %cmp = icmp eq i64 %call1, 0, !dbg !86
  br i1 %cmp, label %for.end.loopexit, label %for.body, !dbg !87, !llvm.loop !101

for.end.loopexit:                                 ; preds = %31
  br label %for.end, !dbg !103

for.end:                                          ; preds = %for.end.loopexit, %10
  ret void, !dbg !103
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @get_size(%struct.block* nocapture readonly %block) unnamed_addr #0 !dbg !104 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !109
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !108, metadata !DIExpression()), !dbg !109
  %_mscmp = icmp eq i64 %0, 0, !dbg !110
  br i1 %_mscmp, label %3, label %1, !dbg !110, !prof !91

; <label>:1:                                      ; preds = %entry
  %2 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !109
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !110
  call void @__msan_warning_noreturn() #5, !dbg !110
  call void asm sideeffect "", ""() #5, !dbg !110
  unreachable, !dbg !110

; <label>:3:                                      ; preds = %entry
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !110
  %4 = load i64, i64* %header, align 8, !dbg !110, !tbaa !92
  %5 = ptrtoint %struct.block* %block to i64, !dbg !111
  %6 = xor i64 %5, 87960930222080, !dbg !111
  %7 = inttoptr i64 %6 to i64*, !dbg !111
  %8 = add i64 %6, 17592186044416, !dbg !111
  %9 = inttoptr i64 %8 to i32*, !dbg !111
  %_msld = load i64, i64* %7, align 8, !dbg !111
  %10 = load i32, i32* %9, align 8, !dbg !111
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !111
  store i32 %10, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !111
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !111
  %call = call fastcc i64 @extract_size(i64 %4), !dbg !111
  ret i64 %call, !dbg !112
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @extract_size(i64 %word) unnamed_addr #0 !dbg !113 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !118
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !118
  call void @llvm.dbg.value(metadata i64 %word, metadata !117, metadata !DIExpression()), !dbg !118
  %2 = and i64 %0, -16, !dbg !119
  %and = and i64 %word, -16, !dbg !119
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !120
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !120
  ret i64 %and, !dbg !120
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc zeroext i1 @get_alloc(%struct.block* nocapture readonly %block) unnamed_addr #0 !dbg !121 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !126
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !125, metadata !DIExpression()), !dbg !126
  %_mscmp = icmp eq i64 %0, 0, !dbg !127
  br i1 %_mscmp, label %3, label %1, !dbg !127, !prof !91

; <label>:1:                                      ; preds = %entry
  %2 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !126
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !127
  call void @__msan_warning_noreturn() #5, !dbg !127
  call void asm sideeffect "", ""() #5, !dbg !127
  unreachable, !dbg !127

; <label>:3:                                      ; preds = %entry
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !127
  %4 = load i64, i64* %header, align 8, !dbg !127, !tbaa !92
  %5 = ptrtoint %struct.block* %block to i64, !dbg !128
  %6 = xor i64 %5, 87960930222080, !dbg !128
  %7 = inttoptr i64 %6 to i64*, !dbg !128
  %8 = add i64 %6, 17592186044416, !dbg !128
  %9 = inttoptr i64 %8 to i32*, !dbg !128
  %_msld = load i64, i64* %7, align 8, !dbg !128
  %10 = load i32, i32* %9, align 8, !dbg !128
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !128
  store i32 %10, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !128
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !128
  %call = call fastcc zeroext i1 @extract_alloc(i64 %4), !dbg !128
  ret i1 %call, !dbg !129
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc zeroext i1 @getPrevAlloc(%struct.block* nocapture readonly %block) unnamed_addr #0 !dbg !130 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !134
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !132, metadata !DIExpression()), !dbg !134
  %_mscmp = icmp eq i64 %0, 0, !dbg !135
  br i1 %_mscmp, label %3, label %1, !dbg !135, !prof !91

; <label>:1:                                      ; preds = %entry
  %2 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !134
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !135
  call void @__msan_warning_noreturn() #5, !dbg !135
  call void asm sideeffect "", ""() #5, !dbg !135
  unreachable, !dbg !135

; <label>:3:                                      ; preds = %entry
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !135
  %4 = load i64, i64* %header, align 8, !dbg !135, !tbaa !92
  %5 = ptrtoint %struct.block* %block to i64, !dbg !136
  %6 = xor i64 %5, 87960930222080, !dbg !136
  %7 = inttoptr i64 %6 to i64*, !dbg !136
  %8 = add i64 %6, 17592186044416, !dbg !136
  %9 = inttoptr i64 %8 to i32*, !dbg !136
  %_msld = load i64, i64* %7, align 8, !dbg !136
  %10 = load i32, i32* %9, align 8, !dbg !136
  call void @llvm.dbg.value(metadata i64 %4, metadata !133, metadata !DIExpression()), !dbg !136
  %11 = and i64 %_msld, 2, !dbg !137
  %and = and i64 %4, 2, !dbg !137
  %12 = xor i64 %11, -1, !dbg !138
  %13 = and i64 %and, %12, !dbg !138
  %14 = icmp eq i64 %13, 0, !dbg !138
  %15 = icmp ne i64 %11, 0, !dbg !138
  %_msprop_icmp = and i1 %15, %14, !dbg !138
  %tobool = icmp ne i64 %and, 0, !dbg !138
  store i1 %_msprop_icmp, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !139
  store i32 %10, i32* @__msan_retval_origin_tls, align 4, !dbg !139
  ret i1 %tobool, !dbg !139
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc zeroext i1 @getPrevMiniStatus(%struct.block* nocapture readonly %block) unnamed_addr #0 !dbg !140 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !144
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !142, metadata !DIExpression()), !dbg !144
  %_mscmp = icmp eq i64 %0, 0, !dbg !145
  br i1 %_mscmp, label %3, label %1, !dbg !145, !prof !91

; <label>:1:                                      ; preds = %entry
  %2 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !144
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !145
  call void @__msan_warning_noreturn() #5, !dbg !145
  call void asm sideeffect "", ""() #5, !dbg !145
  unreachable, !dbg !145

; <label>:3:                                      ; preds = %entry
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !145
  %4 = load i64, i64* %header, align 8, !dbg !145, !tbaa !92
  %5 = ptrtoint %struct.block* %block to i64, !dbg !146
  %6 = xor i64 %5, 87960930222080, !dbg !146
  %7 = inttoptr i64 %6 to i64*, !dbg !146
  %8 = add i64 %6, 17592186044416, !dbg !146
  %9 = inttoptr i64 %8 to i32*, !dbg !146
  %_msld = load i64, i64* %7, align 8, !dbg !146
  %10 = load i32, i32* %9, align 8, !dbg !146
  call void @llvm.dbg.value(metadata i64 %4, metadata !143, metadata !DIExpression()), !dbg !146
  %11 = and i64 %_msld, 4, !dbg !147
  %and = and i64 %4, 4, !dbg !147
  %12 = xor i64 %11, -1, !dbg !148
  %13 = and i64 %and, %12, !dbg !148
  %14 = icmp eq i64 %13, 0, !dbg !148
  %15 = icmp ne i64 %11, 0, !dbg !148
  %_msprop_icmp = and i1 %15, %14, !dbg !148
  %tobool = icmp ne i64 %and, 0, !dbg !148
  store i1 %_msprop_icmp, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !149
  store i32 %10, i32* @__msan_retval_origin_tls, align 4, !dbg !149
  ret i1 %tobool, !dbg !149
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc %struct.block* @find_next(%struct.block* readonly %block) unnamed_addr #0 !dbg !150 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !155
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !155
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !154, metadata !DIExpression()), !dbg !155
  %2 = bitcast %struct.block* %block to i8*, !dbg !156
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !157
  %call = call fastcc i64 @get_size(%struct.block* %block), !dbg !157
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !158
  %3 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !158
  %_msprop = or i64 %_msret, %0, !dbg !158
  %4 = icmp eq i64 %_msret, 0, !dbg !158
  %5 = select i1 %4, i32 %1, i32 %3, !dbg !158
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 %call, !dbg !158
  %6 = bitcast i8* %add.ptr to %struct.block*, !dbg !159
  store i64 %_msprop, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !160
  store i32 %5, i32* @__msan_retval_origin_tls, align 4, !dbg !160
  ret %struct.block* %6, !dbg !160
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local zeroext i1 @mm_checkheap(i32 %line) local_unnamed_addr #0 !dbg !161 {
entry:
  call void @llvm.dbg.value(metadata i32 %line, metadata !165, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.value(metadata i64 0, metadata !166, metadata !DIExpression()), !dbg !180
  %0 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !181, !tbaa !79
  %_msld = load i64, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @heap_start to i64), i64 87960930222080) to i64*), align 8, !dbg !182
  %1 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint (%struct.block** @heap_start to i64), i64 87960930222080), i64 17592186044416) to i32*), align 8, !dbg !182
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !167, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i64 0, metadata !166, metadata !DIExpression()), !dbg !180
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !183
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !183
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !183
  %call191 = call fastcc i64 @get_size(%struct.block* %0), !dbg !183
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !184
  %2 = xor i64 %_msret, -1, !dbg !184
  %3 = and i64 %call191, %2, !dbg !184
  %4 = icmp eq i64 %3, 0, !dbg !184
  %5 = icmp ne i64 %_msret, 0, !dbg !184
  %_msprop_icmp = and i1 %5, %4, !dbg !184
  br i1 %_msprop_icmp, label %6, label %8, !dbg !185, !prof !88

; <label>:6:                                      ; preds = %entry
  %7 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !184
  store i32 %7, i32* @__msan_origin_tls, align 4, !dbg !185
  call void @__msan_warning_noreturn() #5, !dbg !185
  call void asm sideeffect "", ""() #5, !dbg !185
  unreachable, !dbg !185

; <label>:8:                                      ; preds = %entry
  %cmp192 = icmp eq i64 %call191, 0, !dbg !184
  br i1 %cmp192, label %for.body92.preheader, label %for.body.preheader, !dbg !185

for.body.preheader:                               ; preds = %8
  br label %for.body, !dbg !186

for.body:                                         ; preds = %for.body.preheader, %141
  %_msphi_s236 = phi i64 [ %_msprop265, %141 ], [ 0, %for.body.preheader ]
  %_msphi_o237 = phi i32 [ %134, %141 ], [ 0, %for.body.preheader ]
  %count.0194 = phi i64 [ %spec.select, %141 ], [ 0, %for.body.preheader ]
  %_msphi_s238 = phi i64 [ %_msret250, %141 ], [ %_msld, %for.body.preheader ]
  %_msphi_o239 = phi i32 [ %61, %141 ], [ %1, %for.body.preheader ]
  %block.0193 = phi %struct.block* [ %call35, %141 ], [ %0, %for.body.preheader ]
  call void @llvm.dbg.value(metadata i64 %count.0194, metadata !166, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.value(metadata %struct.block* %block.0193, metadata !167, metadata !DIExpression()), !dbg !182
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !186
  %call1 = call i8* @mem_heap_hi() #5, !dbg !186
  %_msret240 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !188
  %9 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !188
  %add.ptr = getelementptr i8, i8* %call1, i64 -7, !dbg !188
  %10 = bitcast i8* %add.ptr to %struct.block*, !dbg !186
  store i64 %_msret240, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !189
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !189
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !189
  %call2 = call fastcc i64 @get_size(%struct.block* %10), !dbg !189
  %_msret241 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !190
  %11 = xor i64 %_msret241, -1, !dbg !190
  %12 = and i64 %call2, %11, !dbg !190
  %13 = icmp eq i64 %12, 0, !dbg !190
  %14 = icmp ne i64 %_msret241, 0, !dbg !190
  %_msprop_icmp242 = and i1 %14, %13, !dbg !190
  br i1 %_msprop_icmp242, label %15, label %17, !dbg !191, !prof !88

; <label>:15:                                     ; preds = %for.body
  %16 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !190
  store i32 %16, i32* @__msan_origin_tls, align 4, !dbg !191
  call void @__msan_warning_noreturn() #5, !dbg !191
  call void asm sideeffect "", ""() #5, !dbg !191
  unreachable, !dbg !191

; <label>:17:                                     ; preds = %for.body
  %cmp3 = icmp eq i64 %call2, 0, !dbg !190
  br i1 %cmp3, label %if.end, label %land.lhs.true, !dbg !191

land.lhs.true:                                    ; preds = %17
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !192
  %call4 = call i8* @mem_heap_hi() #5, !dbg !192
  %_msret272 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !193
  %18 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !193
  %add.ptr5 = getelementptr i8, i8* %call4, i64 -7, !dbg !193
  %19 = bitcast i8* %add.ptr5 to %struct.block*, !dbg !192
  store i64 %_msret272, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !194
  store i32 %18, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !194
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !194
  %call6 = call fastcc zeroext i1 @get_alloc(%struct.block* %19), !dbg !194
  %_msret273 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !195
  br i1 %_msret273, label %20, label %22, !dbg !195, !prof !88

; <label>:20:                                     ; preds = %land.lhs.true
  %21 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !195
  store i32 %21, i32* @__msan_origin_tls, align 4, !dbg !195
  call void @__msan_warning_noreturn() #5, !dbg !195
  call void asm sideeffect "", ""() #5, !dbg !195
  unreachable, !dbg !195

; <label>:22:                                     ; preds = %land.lhs.true
  br i1 %call6, label %if.end, label %land.lhs.true9, !dbg !195

land.lhs.true9:                                   ; preds = %22
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !196
  %call10 = call i8* @mem_heap_lo() #5, !dbg !196
  %_msret274 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !196
  %23 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !196
  %24 = bitcast i8* %call10 to %struct.block*, !dbg !196
  store i64 %_msret274, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !197
  store i32 %23, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !197
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !197
  %call11 = call fastcc i64 @get_size(%struct.block* %24), !dbg !197
  %_msret275 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !198
  %25 = xor i64 %_msret275, -1, !dbg !198
  %26 = and i64 %call11, %25, !dbg !198
  %27 = icmp eq i64 %26, 0, !dbg !198
  %28 = icmp ne i64 %_msret275, 0, !dbg !198
  %_msprop_icmp276 = and i1 %28, %27, !dbg !198
  br i1 %_msprop_icmp276, label %29, label %31, !dbg !199, !prof !88

; <label>:29:                                     ; preds = %land.lhs.true9
  %30 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !198
  store i32 %30, i32* @__msan_origin_tls, align 4, !dbg !199
  call void @__msan_warning_noreturn() #5, !dbg !199
  call void asm sideeffect "", ""() #5, !dbg !199
  unreachable, !dbg !199

; <label>:31:                                     ; preds = %land.lhs.true9
  %cmp12 = icmp eq i64 %call11, 0, !dbg !198
  br i1 %cmp12, label %if.end, label %land.lhs.true14, !dbg !199

land.lhs.true14:                                  ; preds = %31
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !200
  %call15 = call i8* @mem_heap_lo() #5, !dbg !200
  %_msret277 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !200
  %32 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !200
  %33 = bitcast i8* %call15 to %struct.block*, !dbg !200
  store i64 %_msret277, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !201
  store i32 %32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !201
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !201
  %call16 = call fastcc zeroext i1 @get_alloc(%struct.block* %33), !dbg !201
  %_msret278 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !202
  br i1 %_msret278, label %34, label %36, !dbg !202, !prof !88

; <label>:34:                                     ; preds = %land.lhs.true14
  %35 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !202
  store i32 %35, i32* @__msan_origin_tls, align 4, !dbg !202
  call void @__msan_warning_noreturn() #5, !dbg !202
  call void asm sideeffect "", ""() #5, !dbg !202
  unreachable, !dbg !202

; <label>:36:                                     ; preds = %land.lhs.true14
  br i1 %call16, label %if.end, label %return.loopexit315, !dbg !202

if.end:                                           ; preds = %36, %31, %22, %17
  store i64 %_msphi_s238, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !203
  store i32 %_msphi_o239, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !203
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !203
  %call20 = call fastcc i8* @header_to_payload(%struct.block* %block.0193), !dbg !203
  %_msret243 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !205
  %37 = ptrtoint i8* %call20 to i64, !dbg !205
  %38 = and i64 %_msret243, 15, !dbg !206
  %rem = and i64 %37, 15, !dbg !206
  %39 = xor i64 %38, -1, !dbg !207
  %40 = and i64 %rem, %39, !dbg !207
  %41 = icmp eq i64 %40, 0, !dbg !207
  %42 = icmp ne i64 %38, 0, !dbg !207
  %_msprop_icmp244 = and i1 %42, %41, !dbg !207
  br i1 %_msprop_icmp244, label %43, label %45, !dbg !208, !prof !88

; <label>:43:                                     ; preds = %if.end
  %44 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !205
  store i32 %44, i32* @__msan_origin_tls, align 4, !dbg !208
  call void @__msan_warning_noreturn() #5, !dbg !208
  call void asm sideeffect "", ""() #5, !dbg !208
  unreachable, !dbg !208

; <label>:45:                                     ; preds = %if.end
  %cmp21 = icmp eq i64 %rem, 0, !dbg !207
  br i1 %cmp21, label %if.end24, label %return.loopexit315, !dbg !208

if.end24:                                         ; preds = %45
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !209
  %call25 = call i8* @mem_heap_lo() #5, !dbg !209
  %_msret245 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !211
  %_msprop246 = or i64 %_msret245, %_msphi_s238, !dbg !212
  %46 = icmp eq i64 %_msprop246, 0, !dbg !212
  br i1 %46, label %51, label %47, !dbg !213, !prof !91

; <label>:47:                                     ; preds = %if.end24
  %48 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !211
  %49 = icmp eq i64 %_msret245, 0, !dbg !212
  %50 = select i1 %49, i32 %_msphi_o239, i32 %48, !dbg !212
  store i32 %50, i32* @__msan_origin_tls, align 4, !dbg !213
  call void @__msan_warning_noreturn() #5, !dbg !213
  call void asm sideeffect "", ""() #5, !dbg !213
  unreachable, !dbg !213

; <label>:51:                                     ; preds = %if.end24
  %52 = bitcast i8* %call25 to %struct.block*, !dbg !211
  %cmp26 = icmp ult %struct.block* %block.0193, %52, !dbg !212
  br i1 %cmp26, label %land.lhs.true28, label %if.end33, !dbg !213

land.lhs.true28:                                  ; preds = %51
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !214
  %call29 = call i8* @mem_heap_hi() #5, !dbg !214
  %_msret247 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !215
  %_msprop248 = or i64 %_msret247, %_msphi_s238, !dbg !216
  %53 = icmp eq i64 %_msprop248, 0, !dbg !216
  br i1 %53, label %58, label %54, !dbg !217, !prof !91

; <label>:54:                                     ; preds = %land.lhs.true28
  %55 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !215
  %56 = icmp eq i64 %_msret247, 0, !dbg !216
  %57 = select i1 %56, i32 %_msphi_o239, i32 %55, !dbg !216
  store i32 %57, i32* @__msan_origin_tls, align 4, !dbg !217
  call void @__msan_warning_noreturn() #5, !dbg !217
  call void asm sideeffect "", ""() #5, !dbg !217
  unreachable, !dbg !217

; <label>:58:                                     ; preds = %land.lhs.true28
  %59 = bitcast i8* %call29 to %struct.block*, !dbg !215
  %cmp30 = icmp ugt %struct.block* %block.0193, %59, !dbg !216
  br i1 %cmp30, label %return.loopexit315, label %if.end33, !dbg !217

if.end33:                                         ; preds = %58, %51
  store i64 %_msphi_s238, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !218
  store i32 %_msphi_o239, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !218
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !218
  %call34 = call fastcc %struct.block* @find_prev(%struct.block* %block.0193), !dbg !218
  %_msret249 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !219
  %60 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !219
  call void @llvm.dbg.value(metadata %struct.block* %call34, metadata !169, metadata !DIExpression()), !dbg !219
  store i64 %_msphi_s238, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !220
  store i32 %_msphi_o239, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !220
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !220
  %call35 = call fastcc %struct.block* @find_next(%struct.block* %block.0193), !dbg !220
  %_msret250 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !221
  %61 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !221
  call void @llvm.dbg.value(metadata %struct.block* %call35, metadata !172, metadata !DIExpression()), !dbg !221
  %_mscmp300 = icmp eq i64 %_msphi_s238, 0, !dbg !222
  br i1 %_mscmp300, label %63, label %62, !dbg !222, !prof !91

; <label>:62:                                     ; preds = %if.end33
  store i32 %_msphi_o239, i32* @__msan_origin_tls, align 4, !dbg !222
  call void @__msan_warning_noreturn() #5, !dbg !222
  call void asm sideeffect "", ""() #5, !dbg !222
  unreachable, !dbg !222

; <label>:63:                                     ; preds = %if.end33
  %header = getelementptr inbounds %struct.block, %struct.block* %block.0193, i64 0, i32 0, !dbg !222
  %64 = load i64, i64* %header, align 8, !dbg !222, !tbaa !92
  %65 = ptrtoint %struct.block* %block.0193 to i64, !dbg !224
  %66 = xor i64 %65, 87960930222080, !dbg !224
  %67 = inttoptr i64 %66 to i64*, !dbg !224
  %68 = add i64 %66, 17592186044416, !dbg !224
  %69 = inttoptr i64 %68 to i32*, !dbg !224
  %_msld251 = load i64, i64* %67, align 8, !dbg !224
  %70 = load i32, i32* %69, align 8, !dbg !224
  store i64 %_msld251, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !224
  store i32 %70, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !224
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !224
  %call36 = call fastcc i64 @extract_size(i64 %64), !dbg !224
  %_msret252 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !225
  %71 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !225
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !225
  store i32 %_msphi_o239, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !225
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !225
  %call37 = call fastcc i64* @header_to_footer(%struct.block* %block.0193), !dbg !225
  %_msret253 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !226
  %_mscmp301 = icmp eq i64 %_msret253, 0, !dbg !226
  br i1 %_mscmp301, label %74, label %72, !dbg !226, !prof !91

; <label>:72:                                     ; preds = %63
  %73 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !226
  store i32 %73, i32* @__msan_origin_tls, align 4, !dbg !226
  call void @__msan_warning_noreturn() #5, !dbg !226
  call void asm sideeffect "", ""() #5, !dbg !226
  unreachable, !dbg !226

; <label>:74:                                     ; preds = %63
  %75 = load i64, i64* %call37, align 8, !dbg !226, !tbaa !227
  %76 = ptrtoint i64* %call37 to i64, !dbg !228
  %77 = xor i64 %76, 87960930222080, !dbg !228
  %78 = inttoptr i64 %77 to i64*, !dbg !228
  %79 = add i64 %77, 17592186044416, !dbg !228
  %80 = inttoptr i64 %79 to i32*, !dbg !228
  %_msld254 = load i64, i64* %78, align 8, !dbg !228
  %81 = load i32, i32* %80, align 8, !dbg !228
  store i64 %_msld254, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !228
  store i32 %81, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !228
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !228
  %call38 = call fastcc i64 @extract_size(i64 %75), !dbg !228
  %_msret255 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !229
  %82 = xor i64 %call38, %call36, !dbg !229
  %83 = or i64 %_msret255, %_msret252, !dbg !229
  %84 = xor i64 %83, -1, !dbg !229
  %85 = and i64 %82, %84, !dbg !229
  %86 = icmp eq i64 %85, 0, !dbg !229
  %87 = icmp ne i64 %83, 0, !dbg !229
  %_msprop_icmp256 = and i1 %87, %86, !dbg !229
  br i1 %_msprop_icmp256, label %88, label %92, !dbg !230, !prof !88

; <label>:88:                                     ; preds = %74
  %89 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !229
  %90 = icmp eq i64 %_msret255, 0, !dbg !229
  %91 = select i1 %90, i32 %71, i32 %89, !dbg !229
  store i32 %91, i32* @__msan_origin_tls, align 4, !dbg !230
  call void @__msan_warning_noreturn() #5, !dbg !230
  call void asm sideeffect "", ""() #5, !dbg !230
  unreachable, !dbg !230

; <label>:92:                                     ; preds = %74
  %cmp39 = icmp eq i64 %call36, %call38, !dbg !229
  br i1 %cmp39, label %if.end42, label %return.loopexit315, !dbg !230

if.end42:                                         ; preds = %92
  store i64 %_msld251, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !231
  store i32 %70, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !231
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !231
  %call44 = call fastcc zeroext i1 @extract_alloc(i64 %64), !dbg !231
  %_msret257 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !233
  %93 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !233
  store i64 %_msld254, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !233
  store i32 %81, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !233
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !233
  %call47 = call fastcc zeroext i1 @extract_alloc(i64 %75), !dbg !233
  %_msret258 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !234
  %_msprop259 = or i1 %_msret257, %_msret258, !dbg !234
  br i1 %_msprop259, label %94, label %97, !dbg !235, !prof !88

; <label>:94:                                     ; preds = %if.end42
  %95 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !234
  %96 = select i1 %_msret258, i32 %95, i32 %93, !dbg !234
  store i32 %96, i32* @__msan_origin_tls, align 4, !dbg !235
  call void @__msan_warning_noreturn() #5, !dbg !235
  call void asm sideeffect "", ""() #5, !dbg !235
  unreachable, !dbg !235

; <label>:97:                                     ; preds = %if.end42
  %cmp49 = xor i1 %call44, %call47, !dbg !234
  br i1 %cmp49, label %return.loopexit315, label %if.end52, !dbg !235

if.end52:                                         ; preds = %97
  %98 = ptrtoint %struct.block* %call34 to i64, !dbg !236
  %99 = xor i64 %_msret249, -1, !dbg !236
  %100 = and i64 %99, %98, !dbg !236
  %101 = icmp eq i64 %100, 0, !dbg !236
  %102 = icmp ne i64 %_msret249, 0, !dbg !236
  %_msprop_icmp260 = and i1 %102, %101, !dbg !236
  br i1 %_msprop_icmp260, label %103, label %104, !dbg !238, !prof !88

; <label>:103:                                    ; preds = %if.end52
  store i32 %60, i32* @__msan_origin_tls, align 4, !dbg !238
  call void @__msan_warning_noreturn() #5, !dbg !238
  call void asm sideeffect "", ""() #5, !dbg !238
  unreachable, !dbg !238

; <label>:104:                                    ; preds = %if.end52
  %tobool = icmp eq %struct.block* %call34, null, !dbg !236
  br i1 %tobool, label %if.end65, label %if.then53, !dbg !238

if.then53:                                        ; preds = %104
  store i64 %_msret249, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !239
  store i32 %60, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !239
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !239
  %call54 = call fastcc zeroext i1 @get_alloc(%struct.block* nonnull %call34), !dbg !239
  %_msret270 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !242
  br i1 %_msret270, label %105, label %107, !dbg !242, !prof !88

; <label>:105:                                    ; preds = %if.then53
  %106 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !242
  store i32 %106, i32* @__msan_origin_tls, align 4, !dbg !242
  call void @__msan_warning_noreturn() #5, !dbg !242
  call void asm sideeffect "", ""() #5, !dbg !242
  unreachable, !dbg !242

; <label>:107:                                    ; preds = %if.then53
  br i1 %call54, label %if.end65, label %land.lhs.true58, !dbg !242

land.lhs.true58:                                  ; preds = %107
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !243
  store i32 %_msphi_o239, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !243
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !243
  %call59 = call fastcc zeroext i1 @get_alloc(%struct.block* nonnull %block.0193), !dbg !243
  %_msret271 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !244
  br i1 %_msret271, label %108, label %110, !dbg !244, !prof !88

; <label>:108:                                    ; preds = %land.lhs.true58
  %109 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !244
  store i32 %109, i32* @__msan_origin_tls, align 4, !dbg !244
  call void @__msan_warning_noreturn() #5, !dbg !244
  call void asm sideeffect "", ""() #5, !dbg !244
  unreachable, !dbg !244

; <label>:110:                                    ; preds = %land.lhs.true58
  br i1 %call59, label %if.end65, label %return.loopexit315, !dbg !244

if.end65:                                         ; preds = %110, %107, %104
  %111 = ptrtoint %struct.block* %call35 to i64, !dbg !245
  %112 = xor i64 %_msret250, -1, !dbg !245
  %113 = and i64 %112, %111, !dbg !245
  %114 = icmp eq i64 %113, 0, !dbg !245
  %115 = icmp ne i64 %_msret250, 0, !dbg !245
  %_msprop_icmp261 = and i1 %115, %114, !dbg !245
  br i1 %_msprop_icmp261, label %116, label %117, !dbg !247, !prof !88

; <label>:116:                                    ; preds = %if.end65
  store i32 %61, i32* @__msan_origin_tls, align 4, !dbg !247
  call void @__msan_warning_noreturn() #5, !dbg !247
  call void asm sideeffect "", ""() #5, !dbg !247
  unreachable, !dbg !247

; <label>:117:                                    ; preds = %if.end65
  %tobool66 = icmp eq %struct.block* %call35, null, !dbg !245
  br i1 %tobool66, label %if.end79, label %if.then67, !dbg !247

if.then67:                                        ; preds = %117
  store i64 %_msret250, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !248
  store i32 %61, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !248
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !248
  %call68 = call fastcc zeroext i1 @get_alloc(%struct.block* nonnull %call35), !dbg !248
  %_msret268 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !251
  br i1 %_msret268, label %118, label %120, !dbg !251, !prof !88

; <label>:118:                                    ; preds = %if.then67
  %119 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !251
  store i32 %119, i32* @__msan_origin_tls, align 4, !dbg !251
  call void @__msan_warning_noreturn() #5, !dbg !251
  call void asm sideeffect "", ""() #5, !dbg !251
  unreachable, !dbg !251

; <label>:120:                                    ; preds = %if.then67
  br i1 %call68, label %if.end79, label %land.lhs.true72, !dbg !251

land.lhs.true72:                                  ; preds = %120
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !252
  store i32 %_msphi_o239, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !252
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !252
  %call73 = call fastcc zeroext i1 @get_alloc(%struct.block* nonnull %block.0193), !dbg !252
  %_msret269 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !253
  br i1 %_msret269, label %121, label %123, !dbg !253, !prof !88

; <label>:121:                                    ; preds = %land.lhs.true72
  %122 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !253
  store i32 %122, i32* @__msan_origin_tls, align 4, !dbg !253
  call void @__msan_warning_noreturn() #5, !dbg !253
  call void asm sideeffect "", ""() #5, !dbg !253
  unreachable, !dbg !253

; <label>:123:                                    ; preds = %land.lhs.true72
  br i1 %call73, label %if.end79, label %return.loopexit315, !dbg !253

if.end79:                                         ; preds = %123, %120, %117
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !254
  store i32 %_msphi_o239, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !254
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !254
  %call80 = call fastcc i64 @get_size(%struct.block* nonnull %block.0193), !dbg !254
  %_msret262 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !256
  %124 = xor i64 %_msret262, -16, !dbg !256
  %125 = and i64 %call80, %124, !dbg !256
  %126 = icmp ult i64 %125, 16, !dbg !256
  %127 = or i64 %_msret262, %call80, !dbg !256
  %128 = icmp ult i64 %127, 16, !dbg !256
  %129 = xor i1 %126, %128, !dbg !256
  br i1 %129, label %130, label %132, !dbg !257, !prof !88

; <label>:130:                                    ; preds = %if.end79
  %131 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !256
  store i32 %131, i32* @__msan_origin_tls, align 4, !dbg !257
  call void @__msan_warning_noreturn() #5, !dbg !257
  call void asm sideeffect "", ""() #5, !dbg !257
  unreachable, !dbg !257

; <label>:132:                                    ; preds = %if.end79
  %cmp81 = icmp ult i64 %call80, 16, !dbg !256
  br i1 %cmp81, label %return.loopexit315, label %if.end84, !dbg !257

if.end84:                                         ; preds = %132
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !258
  store i32 %_msphi_o239, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !258
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !258
  %call85 = call fastcc zeroext i1 @get_alloc(%struct.block* nonnull %block.0193), !dbg !258
  %_msret263 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !260
  %133 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !260
  %not.call85 = xor i1 %call85, true, !dbg !260
  %_msprop264 = zext i1 %_msret263 to i64, !dbg !260
  %add = zext i1 %not.call85 to i64, !dbg !260
  %_msprop265 = or i64 %_msphi_s236, %_msprop264, !dbg !260
  %134 = select i1 %_msret263, i32 %133, i32 %_msphi_o237, !dbg !260
  %spec.select = add i64 %count.0194, %add, !dbg !260
  call void @llvm.dbg.value(metadata i64 %spec.select, metadata !166, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.value(metadata %struct.block* %call35, metadata !167, metadata !DIExpression()), !dbg !182
  store i64 %_msret250, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !183
  store i32 %61, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !183
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !183
  %call = call fastcc i64 @get_size(%struct.block* %call35), !dbg !183
  %_msret266 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !184
  %135 = xor i64 %_msret266, -1, !dbg !184
  %136 = and i64 %call, %135, !dbg !184
  %137 = icmp eq i64 %136, 0, !dbg !184
  %138 = icmp ne i64 %_msret266, 0, !dbg !184
  %_msprop_icmp267 = and i1 %138, %137, !dbg !184
  br i1 %_msprop_icmp267, label %139, label %141, !dbg !185, !prof !88

; <label>:139:                                    ; preds = %if.end84
  %140 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !184
  store i32 %140, i32* @__msan_origin_tls, align 4, !dbg !185
  call void @__msan_warning_noreturn() #5, !dbg !185
  call void asm sideeffect "", ""() #5, !dbg !185
  unreachable, !dbg !185

; <label>:141:                                    ; preds = %if.end84
  %cmp = icmp eq i64 %call, 0, !dbg !184
  br i1 %cmp, label %for.body92.preheader.loopexit, label %for.body, !dbg !185, !llvm.loop !261

for.body92.preheader.loopexit:                    ; preds = %141
  br label %for.body92.preheader, !dbg !263

for.body92.preheader:                             ; preds = %for.body92.preheader.loopexit, %8
  %_msphi_s = phi i64 [ 0, %8 ], [ %_msprop265, %for.body92.preheader.loopexit ]
  %_msphi_o = phi i32 [ 0, %8 ], [ %134, %for.body92.preheader.loopexit ]
  %count.2189.ph = phi i64 [ 0, %8 ], [ %spec.select, %for.body92.preheader.loopexit ]
  br label %for.body92, !dbg !263

for.body92:                                       ; preds = %for.body92.preheader, %264
  %indvars.iv = phi i64 [ %indvars.iv.next, %264 ], [ 0, %for.body92.preheader ]
  %_msphi_s202 = phi i64 [ %_msphi_s206, %264 ], [ %_msphi_s, %for.body92.preheader ]
  %_msphi_o203 = phi i32 [ %_msphi_o207, %264 ], [ %_msphi_o, %for.body92.preheader ]
  %count.2189 = phi i64 [ %count.5, %264 ], [ %count.2189.ph, %for.body92.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !173, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.value(metadata i64 %count.2189, metadata !166, metadata !DIExpression()), !dbg !180
  %arrayidx = getelementptr inbounds [10 x %struct.block*], [10 x %struct.block*]* @head, i64 0, i64 %indvars.iv, !dbg !263
  br i1 false, label %142, label %143, !dbg !263, !prof !88

; <label>:142:                                    ; preds = %for.body92
  unreachable, !dbg !263

; <label>:143:                                    ; preds = %for.body92
  %144 = load %struct.block*, %struct.block** %arrayidx, align 8, !dbg !263, !tbaa !79
  %145 = ptrtoint %struct.block** %arrayidx to i64, !dbg !266
  %146 = xor i64 %145, 87960930222080, !dbg !266
  %147 = inttoptr i64 %146 to i64*, !dbg !266
  %148 = add i64 %146, 17592186044416, !dbg !266
  %149 = inttoptr i64 %148 to i32*, !dbg !266
  %_msld204 = load i64, i64* %147, align 8, !dbg !266
  %150 = load i32, i32* %149, align 8, !dbg !266
  %151 = ptrtoint %struct.block* %144 to i64, !dbg !266
  %152 = xor i64 %_msld204, -1, !dbg !266
  %153 = and i64 %152, %151, !dbg !266
  %154 = icmp eq i64 %153, 0, !dbg !266
  %155 = icmp ne i64 %_msld204, 0, !dbg !266
  %_msprop_icmp205 = and i1 %155, %154, !dbg !266
  br i1 %_msprop_icmp205, label %156, label %157, !dbg !267, !prof !88

; <label>:156:                                    ; preds = %143
  store i32 %150, i32* @__msan_origin_tls, align 4, !dbg !267
  call void @__msan_warning_noreturn() #5, !dbg !267
  call void asm sideeffect "", ""() #5, !dbg !267
  unreachable, !dbg !267

; <label>:157:                                    ; preds = %143
  %cmp93 = icmp eq %struct.block* %144, null, !dbg !266
  br i1 %cmp93, label %for.inc144, label %if.end96, !dbg !267

if.end96:                                         ; preds = %157
  call void @llvm.dbg.value(metadata %struct.block* %144, metadata !175, metadata !DIExpression()), !dbg !268
  %shl = shl i64 64, %indvars.iv, !dbg !269
  call void @llvm.dbg.value(metadata i64 %shl, metadata !178, metadata !DIExpression()), !dbg !270
  %cmp135 = icmp ne i64 %indvars.iv, 8
  br label %do.body, !dbg !271

do.body:                                          ; preds = %262, %if.end96
  %_msphi_s212 = phi i64 [ %_msphi_s202, %if.end96 ], [ %_msprop226, %262 ], !dbg !180
  %_msphi_o213 = phi i32 [ %_msphi_o203, %if.end96 ], [ %237, %262 ], !dbg !180
  %count.3 = phi i64 [ %count.2189, %if.end96 ], [ %spec.select185, %262 ], !dbg !180
  %_msphi_s214 = phi i64 [ %_msld204, %if.end96 ], [ %_msld229, %262 ], !dbg !272
  %_msphi_o215 = phi i32 [ %150, %if.end96 ], [ %246, %262 ], !dbg !272
  %block97.0 = phi %struct.block* [ %144, %if.end96 ], [ %245, %262 ], !dbg !272
  call void @llvm.dbg.value(metadata %struct.block* %block97.0, metadata !175, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.value(metadata i64 %count.3, metadata !166, metadata !DIExpression()), !dbg !180
  %prev = getelementptr inbounds %struct.block, %struct.block* %block97.0, i64 0, i32 1, i32 0, i32 1, !dbg !274
  %_mscmp282 = icmp eq i64 %_msphi_s214, 0, !dbg !274
  br i1 %_mscmp282, label %159, label %158, !dbg !274, !prof !91

; <label>:158:                                    ; preds = %do.body
  store i32 %_msphi_o215, i32* @__msan_origin_tls, align 4, !dbg !274
  call void @__msan_warning_noreturn() #5, !dbg !274
  call void asm sideeffect "", ""() #5, !dbg !274
  unreachable, !dbg !274

; <label>:159:                                    ; preds = %do.body
  %160 = load %struct.block*, %struct.block** %prev, align 8, !dbg !274, !tbaa !276
  %161 = ptrtoint %struct.block** %prev to i64, !dbg !277
  %162 = xor i64 %161, 87960930222080, !dbg !277
  %163 = inttoptr i64 %162 to i64*, !dbg !277
  %164 = add i64 %162, 17592186044416, !dbg !277
  %165 = inttoptr i64 %164 to i32*, !dbg !277
  %_msld216 = load i64, i64* %163, align 8, !dbg !277
  %166 = load i32, i32* %165, align 8, !dbg !277
  %167 = ptrtoint %struct.block* %160 to i64, !dbg !277
  %168 = xor i64 %_msld216, -1, !dbg !277
  %169 = and i64 %168, %167, !dbg !277
  %170 = icmp eq i64 %169, 0, !dbg !277
  %171 = icmp ne i64 %_msld216, 0, !dbg !277
  %_msprop_icmp217 = and i1 %171, %170, !dbg !277
  br i1 %_msprop_icmp217, label %172, label %173, !dbg !278, !prof !88

; <label>:172:                                    ; preds = %159
  store i32 %166, i32* @__msan_origin_tls, align 4, !dbg !278
  call void @__msan_warning_noreturn() #5, !dbg !278
  call void asm sideeffect "", ""() #5, !dbg !278
  unreachable, !dbg !278

; <label>:173:                                    ; preds = %159
  %tobool101 = icmp eq %struct.block* %160, null, !dbg !277
  br i1 %tobool101, label %if.end108, label %if.then102, !dbg !278

if.then102:                                       ; preds = %173
  %next = getelementptr inbounds %struct.block, %struct.block* %160, i64 0, i32 1, i32 0, i32 0, !dbg !279
  br i1 %171, label %174, label %175, !dbg !279, !prof !88

; <label>:174:                                    ; preds = %if.then102
  store i32 %166, i32* @__msan_origin_tls, align 4, !dbg !279
  call void @__msan_warning_noreturn() #5, !dbg !279
  call void asm sideeffect "", ""() #5, !dbg !279
  unreachable, !dbg !279

; <label>:175:                                    ; preds = %if.then102
  %176 = load %struct.block*, %struct.block** %next, align 8, !dbg !279, !tbaa !276
  %177 = ptrtoint %struct.block** %next to i64, !dbg !282
  %178 = xor i64 %177, 87960930222080, !dbg !282
  %179 = inttoptr i64 %178 to i64*, !dbg !282
  %_msld234 = load i64, i64* %179, align 8, !dbg !282
  %180 = ptrtoint %struct.block* %176 to i64, !dbg !282
  %181 = ptrtoint %struct.block* %block97.0 to i64, !dbg !282
  %182 = xor i64 %180, %181, !dbg !282
  %183 = xor i64 %_msld234, -1, !dbg !282
  %184 = and i64 %182, %183, !dbg !282
  %185 = icmp eq i64 %184, 0, !dbg !282
  %186 = icmp ne i64 %_msld234, 0, !dbg !282
  %_msprop_icmp235 = and i1 %186, %185, !dbg !282
  br i1 %_msprop_icmp235, label %187, label %191, !dbg !283, !prof !88

; <label>:187:                                    ; preds = %175
  %188 = add i64 %178, 17592186044416, !dbg !282
  %189 = inttoptr i64 %188 to i32*, !dbg !282
  %190 = load i32, i32* %189, align 8, !dbg !282
  store i32 %190, i32* @__msan_origin_tls, align 4, !dbg !283
  call void @__msan_warning_noreturn() #5, !dbg !283
  call void asm sideeffect "", ""() #5, !dbg !283
  unreachable, !dbg !283

; <label>:191:                                    ; preds = %175
  %cmp104 = icmp eq %struct.block* %176, %block97.0, !dbg !282
  br i1 %cmp104, label %if.end108, label %return.loopexit, !dbg !283

if.end108:                                        ; preds = %191, %173
  %next109 = getelementptr inbounds %struct.block, %struct.block* %block97.0, i64 0, i32 1, i32 0, i32 0, !dbg !284
  br i1 false, label %192, label %193, !dbg !284, !prof !88

; <label>:192:                                    ; preds = %if.end108
  unreachable, !dbg !284

; <label>:193:                                    ; preds = %if.end108
  %194 = load %struct.block*, %struct.block** %next109, align 8, !dbg !284, !tbaa !276
  %195 = ptrtoint %struct.block** %next109 to i64, !dbg !286
  %196 = xor i64 %195, 87960930222080, !dbg !286
  %197 = inttoptr i64 %196 to i64*, !dbg !286
  %198 = add i64 %196, 17592186044416, !dbg !286
  %199 = inttoptr i64 %198 to i32*, !dbg !286
  %_msld218 = load i64, i64* %197, align 8, !dbg !286
  %200 = load i32, i32* %199, align 8, !dbg !286
  %201 = ptrtoint %struct.block* %194 to i64, !dbg !286
  %202 = xor i64 %_msld218, -1, !dbg !286
  %203 = and i64 %202, %201, !dbg !286
  %204 = icmp eq i64 %203, 0, !dbg !286
  %205 = icmp ne i64 %_msld218, 0, !dbg !286
  %_msprop_icmp219 = and i1 %205, %204, !dbg !286
  br i1 %_msprop_icmp219, label %206, label %207, !dbg !287, !prof !88

; <label>:206:                                    ; preds = %193
  store i32 %200, i32* @__msan_origin_tls, align 4, !dbg !287
  call void @__msan_warning_noreturn() #5, !dbg !287
  call void asm sideeffect "", ""() #5, !dbg !287
  unreachable, !dbg !287

; <label>:207:                                    ; preds = %193
  %tobool110 = icmp eq %struct.block* %194, null, !dbg !286
  br i1 %tobool110, label %if.end118, label %if.then111, !dbg !287

if.then111:                                       ; preds = %207
  %prev113 = getelementptr inbounds %struct.block, %struct.block* %194, i64 0, i32 1, i32 0, i32 1, !dbg !288
  br i1 %205, label %208, label %209, !dbg !288, !prof !88

; <label>:208:                                    ; preds = %if.then111
  store i32 %200, i32* @__msan_origin_tls, align 4, !dbg !288
  call void @__msan_warning_noreturn() #5, !dbg !288
  call void asm sideeffect "", ""() #5, !dbg !288
  unreachable, !dbg !288

; <label>:209:                                    ; preds = %if.then111
  %210 = load %struct.block*, %struct.block** %prev113, align 8, !dbg !288, !tbaa !276
  %211 = ptrtoint %struct.block** %prev113 to i64, !dbg !291
  %212 = xor i64 %211, 87960930222080, !dbg !291
  %213 = inttoptr i64 %212 to i64*, !dbg !291
  %_msld232 = load i64, i64* %213, align 8, !dbg !291
  %214 = ptrtoint %struct.block* %210 to i64, !dbg !291
  %215 = ptrtoint %struct.block* %block97.0 to i64, !dbg !291
  %216 = xor i64 %214, %215, !dbg !291
  %217 = xor i64 %_msld232, -1, !dbg !291
  %218 = and i64 %216, %217, !dbg !291
  %219 = icmp eq i64 %218, 0, !dbg !291
  %220 = icmp ne i64 %_msld232, 0, !dbg !291
  %_msprop_icmp233 = and i1 %220, %219, !dbg !291
  br i1 %_msprop_icmp233, label %221, label %225, !dbg !292, !prof !88

; <label>:221:                                    ; preds = %209
  %222 = add i64 %212, 17592186044416, !dbg !291
  %223 = inttoptr i64 %222 to i32*, !dbg !291
  %224 = load i32, i32* %223, align 8, !dbg !291
  store i32 %224, i32* @__msan_origin_tls, align 4, !dbg !292
  call void @__msan_warning_noreturn() #5, !dbg !292
  call void asm sideeffect "", ""() #5, !dbg !292
  unreachable, !dbg !292

; <label>:225:                                    ; preds = %209
  %cmp114 = icmp eq %struct.block* %210, %block97.0, !dbg !291
  br i1 %cmp114, label %if.end118, label %return.loopexit, !dbg !292

if.end118:                                        ; preds = %225, %207
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !293
  %call119 = call i8* @mem_heap_lo() #5, !dbg !293
  %_msret220 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !295
  %226 = icmp eq i64 %_msret220, 0, !dbg !296
  br i1 %226, label %229, label %227, !dbg !297, !prof !91

; <label>:227:                                    ; preds = %if.end118
  %228 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !295
  store i32 %228, i32* @__msan_origin_tls, align 4, !dbg !297
  call void @__msan_warning_noreturn() #5, !dbg !297
  call void asm sideeffect "", ""() #5, !dbg !297
  unreachable, !dbg !297

; <label>:229:                                    ; preds = %if.end118
  %230 = bitcast i8* %call119 to %struct.block*, !dbg !295
  %cmp120 = icmp ult %struct.block* %block97.0, %230, !dbg !296
  br i1 %cmp120, label %land.lhs.true122, label %if.end127, !dbg !297

land.lhs.true122:                                 ; preds = %229
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !298
  %call123 = call i8* @mem_heap_hi() #5, !dbg !298
  %_msret222 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !299
  %231 = icmp eq i64 %_msret222, 0, !dbg !300
  br i1 %231, label %234, label %232, !dbg !301, !prof !91

; <label>:232:                                    ; preds = %land.lhs.true122
  %233 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !299
  store i32 %233, i32* @__msan_origin_tls, align 4, !dbg !301
  call void @__msan_warning_noreturn() #5, !dbg !301
  call void asm sideeffect "", ""() #5, !dbg !301
  unreachable, !dbg !301

; <label>:234:                                    ; preds = %land.lhs.true122
  %235 = bitcast i8* %call123 to %struct.block*, !dbg !299
  %cmp124 = icmp ugt %struct.block* %block97.0, %235, !dbg !300
  br i1 %cmp124, label %return.loopexit, label %if.end127, !dbg !301

if.end127:                                        ; preds = %234, %229
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !302
  store i32 %_msphi_o215, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !302
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !302
  %call128 = call fastcc zeroext i1 @get_alloc(%struct.block* nonnull %block97.0), !dbg !302
  %_msret224 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !304
  %236 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !304
  %not.call128 = xor i1 %call128, true, !dbg !304
  %sub = sext i1 %not.call128 to i64, !dbg !304
  %_msprop226 = select i1 %_msret224, i64 -1, i64 %_msphi_s212, !dbg !304
  %237 = select i1 %_msret224, i32 %236, i32 %_msphi_o213, !dbg !304
  %spec.select185 = add i64 %count.3, %sub, !dbg !304
  call void @llvm.dbg.value(metadata i64 %spec.select185, metadata !166, metadata !DIExpression()), !dbg !180
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !305
  store i32 %_msphi_o215, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !305
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !305
  %call131 = call fastcc i64 @get_size(%struct.block* nonnull %block97.0), !dbg !305
  %_msret227 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !307
  %238 = icmp ne i64 %_msret227, 0, !dbg !307
  %239 = and i1 %cmp135, %238, !dbg !308
  br i1 %239, label %240, label %242, !dbg !308, !prof !88

; <label>:240:                                    ; preds = %if.end127
  %241 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !307
  store i32 %241, i32* @__msan_origin_tls, align 4, !dbg !308
  call void @__msan_warning_noreturn() #5, !dbg !308
  call void asm sideeffect "", ""() #5, !dbg !308
  unreachable, !dbg !308

; <label>:242:                                    ; preds = %if.end127
  %cmp132 = icmp ugt i64 %call131, %shl, !dbg !307
  %or.cond = and i1 %cmp135, %cmp132, !dbg !308
  br i1 %or.cond, label %return.loopexit, label %if.end138, !dbg !308

if.end138:                                        ; preds = %242
  br i1 false, label %243, label %244, !dbg !309, !prof !88

; <label>:243:                                    ; preds = %if.end138
  unreachable, !dbg !309

; <label>:244:                                    ; preds = %if.end138
  %245 = load %struct.block*, %struct.block** %next109, align 8, !dbg !309, !tbaa !276
  %_msld229 = load i64, i64* %197, align 8, !dbg !268
  %246 = load i32, i32* %199, align 8, !dbg !268
  call void @llvm.dbg.value(metadata %struct.block* %245, metadata !175, metadata !DIExpression()), !dbg !268
  br i1 false, label %247, label %248, !dbg !310, !prof !88

; <label>:247:                                    ; preds = %244
  unreachable, !dbg !310

; <label>:248:                                    ; preds = %244
  %249 = load %struct.block*, %struct.block** %arrayidx, align 8, !dbg !310, !tbaa !79
  %_msld230 = load i64, i64* %147, align 8, !dbg !311
  %250 = ptrtoint %struct.block* %245 to i64, !dbg !311
  %251 = ptrtoint %struct.block* %249 to i64, !dbg !311
  %252 = xor i64 %251, %250, !dbg !311
  %253 = or i64 %_msld230, %_msld229, !dbg !311
  %254 = xor i64 %253, -1, !dbg !311
  %255 = and i64 %252, %254, !dbg !311
  %256 = icmp eq i64 %255, 0, !dbg !311
  %257 = icmp ne i64 %253, 0, !dbg !311
  %_msprop_icmp231 = and i1 %257, %256, !dbg !311
  br i1 %_msprop_icmp231, label %258, label %262, !dbg !312, !prof !88

; <label>:258:                                    ; preds = %248
  %259 = load i32, i32* %149, align 8, !dbg !311
  %260 = icmp eq i64 %_msld230, 0, !dbg !311
  %261 = select i1 %260, i32 %246, i32 %259, !dbg !311
  store i32 %261, i32* @__msan_origin_tls, align 4, !dbg !312
  call void @__msan_warning_noreturn() #5, !dbg !312
  call void asm sideeffect "", ""() #5, !dbg !312
  unreachable, !dbg !312

; <label>:262:                                    ; preds = %248
  %cmp142 = icmp eq %struct.block* %245, %249, !dbg !311
  br i1 %cmp142, label %for.inc144.loopexit, label %do.body, !dbg !312, !llvm.loop !313

for.inc144.loopexit:                              ; preds = %262
  br label %for.inc144, !dbg !315

for.inc144:                                       ; preds = %for.inc144.loopexit, %157
  %_msphi_s206 = phi i64 [ %_msphi_s202, %157 ], [ %_msprop226, %for.inc144.loopexit ], !dbg !180
  %_msphi_o207 = phi i32 [ %_msphi_o203, %157 ], [ %237, %for.inc144.loopexit ], !dbg !180
  %count.5 = phi i64 [ %count.2189, %157 ], [ %spec.select185, %for.inc144.loopexit ], !dbg !180
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !315
  call void @llvm.dbg.value(metadata i32 undef, metadata !173, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !265
  call void @llvm.dbg.value(metadata i64 %count.5, metadata !166, metadata !DIExpression()), !dbg !180
  br i1 false, label %263, label %264, !dbg !316, !prof !88

; <label>:263:                                    ; preds = %for.inc144
  unreachable, !dbg !316

; <label>:264:                                    ; preds = %for.inc144
  %265 = icmp ult i64 %indvars.iv.next, 10, !dbg !317
  br i1 %265, label %for.body92, label %for.end145, !dbg !316, !llvm.loop !318

for.end145:                                       ; preds = %264
  call void @llvm.dbg.value(metadata i64 %count.5, metadata !166, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.value(metadata i64 %count.5, metadata !166, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.value(metadata i64 %count.5, metadata !166, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.value(metadata i64 %count.5, metadata !166, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.value(metadata i64 %count.5, metadata !166, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.value(metadata i64 %count.5, metadata !166, metadata !DIExpression()), !dbg !180
  %266 = xor i64 %_msphi_s206, -1, !dbg !320
  %267 = and i64 %count.5, %266, !dbg !320
  %268 = icmp eq i64 %267, 0, !dbg !320
  %269 = icmp ne i64 %_msphi_s206, 0, !dbg !320
  %_msprop_icmp208 = and i1 %269, %268, !dbg !320
  %cmp146 = icmp eq i64 %count.5, 0, !dbg !320
  br label %return, !dbg !322

return.loopexit:                                  ; preds = %191, %225, %234, %242
  br label %return, !dbg !323

return.loopexit315:                               ; preds = %36, %45, %58, %92, %97, %110, %123, %132
  br label %return, !dbg !323

return:                                           ; preds = %return.loopexit315, %return.loopexit, %for.end145
  %_msphi_s209 = phi i1 [ %_msprop_icmp208, %for.end145 ], [ false, %return.loopexit ], [ false, %return.loopexit315 ], !dbg !324
  %_msphi_o210 = phi i32 [ %_msphi_o207, %for.end145 ], [ 0, %return.loopexit ], [ 0, %return.loopexit315 ], !dbg !324
  %retval.0 = phi i1 [ %cmp146, %for.end145 ], [ false, %return.loopexit ], [ false, %return.loopexit315 ], !dbg !324
  store i1 %_msphi_s209, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !323
  store i32 %_msphi_o210, i32* @__msan_retval_origin_tls, align 4, !dbg !323
  ret i1 %retval.0, !dbg !323
}

declare dso_local i8* @mem_heap_hi() local_unnamed_addr #2

declare dso_local i8* @mem_heap_lo() local_unnamed_addr #2

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc nonnull i8* @header_to_payload(%struct.block* readnone %block) unnamed_addr #0 !dbg !325 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !330
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !330
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !329, metadata !DIExpression()), !dbg !330
  %2 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, !dbg !331
  %arraydecay = bitcast %union.anon* %2 to i8*, !dbg !332
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !333
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !333
  ret i8* %arraydecay, !dbg !333
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc %struct.block* @find_prev(%struct.block* readonly %block) unnamed_addr #0 !dbg !334 {
entry:
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !336, metadata !DIExpression()), !dbg !338
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !339
  %call = call fastcc i64* @find_prev_footer(%struct.block* %block), !dbg !339
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !340
  %0 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !340
  call void @llvm.dbg.value(metadata i64* %call, metadata !337, metadata !DIExpression()), !dbg !340
  %_mscmp = icmp eq i64 %_msret, 0, !dbg !341
  br i1 %_mscmp, label %2, label %1, !dbg !341, !prof !91

; <label>:1:                                      ; preds = %entry
  store i32 %0, i32* @__msan_origin_tls, align 4, !dbg !341
  call void @__msan_warning_noreturn() #5, !dbg !341
  call void asm sideeffect "", ""() #5, !dbg !341
  unreachable, !dbg !341

; <label>:2:                                      ; preds = %entry
  %3 = load i64, i64* %call, align 8, !dbg !341, !tbaa !227
  %4 = ptrtoint i64* %call to i64, !dbg !343
  %5 = xor i64 %4, 87960930222080, !dbg !343
  %6 = inttoptr i64 %5 to i64*, !dbg !343
  %7 = add i64 %5, 17592186044416, !dbg !343
  %8 = inttoptr i64 %7 to i32*, !dbg !343
  %_msld = load i64, i64* %6, align 8, !dbg !343
  %9 = load i32, i32* %8, align 8, !dbg !343
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !343
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !343
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !343
  %call1 = call fastcc i64 @extract_size(i64 %3), !dbg !343
  %_msret4 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !344
  %10 = xor i64 %_msret4, -1, !dbg !344
  %11 = and i64 %call1, %10, !dbg !344
  %12 = icmp eq i64 %11, 0, !dbg !344
  %13 = icmp ne i64 %_msret4, 0, !dbg !344
  %_msprop_icmp = and i1 %13, %12, !dbg !344
  br i1 %_msprop_icmp, label %14, label %16, !dbg !345, !prof !88

; <label>:14:                                     ; preds = %2
  %15 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !344
  store i32 %15, i32* @__msan_origin_tls, align 4, !dbg !345
  call void @__msan_warning_noreturn() #5, !dbg !345
  call void asm sideeffect "", ""() #5, !dbg !345
  unreachable, !dbg !345

; <label>:16:                                     ; preds = %2
  %cmp = icmp eq i64 %call1, 0, !dbg !344
  br i1 %cmp, label %return, label %if.end, !dbg !345

if.end:                                           ; preds = %16
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !346
  store i32 %0, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !346
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !346
  %call2 = call fastcc %struct.block* @footer_to_header(i64* nonnull %call), !dbg !346
  %_msret5 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !347
  %17 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !347
  br label %return, !dbg !347

return:                                           ; preds = %16, %if.end
  %_msphi_s = phi i64 [ %_msret5, %if.end ], [ 0, %16 ], !dbg !348
  %_msphi_o = phi i32 [ %17, %if.end ], [ 0, %16 ], !dbg !348
  %retval.0 = phi %struct.block* [ %call2, %if.end ], [ null, %16 ], !dbg !348
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !349
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !349
  ret %struct.block* %retval.0, !dbg !349
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc nonnull i64* @header_to_footer(%struct.block* readonly %block) unnamed_addr #0 !dbg !350 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !355
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !355
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !354, metadata !DIExpression()), !dbg !355
  %2 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, !dbg !356
  %arraydecay = bitcast %union.anon* %2 to i8*, !dbg !357
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !358
  %call = call fastcc i64 @get_size(%struct.block* %block), !dbg !358
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !359
  %3 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !359
  %_msprop = or i64 %_msret, %0, !dbg !359
  %4 = icmp eq i64 %_msret, 0, !dbg !359
  %5 = select i1 %4, i32 %1, i32 %3, !dbg !359
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay, i64 %call, !dbg !359
  %add.ptr1 = getelementptr inbounds i8, i8* %add.ptr, i64 -16, !dbg !360
  %6 = bitcast i8* %add.ptr1 to i64*, !dbg !361
  store i64 %_msprop, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !362
  store i32 %5, i32* @__msan_retval_origin_tls, align 4, !dbg !362
  ret i64* %6, !dbg !362
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc zeroext i1 @extract_alloc(i64 %word) unnamed_addr #0 !dbg !363 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !368
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !368
  call void @llvm.dbg.value(metadata i64 %word, metadata !367, metadata !DIExpression()), !dbg !368
  %2 = and i64 %0, 1, !dbg !369
  %and = and i64 %word, 1, !dbg !369
  %3 = xor i64 %2, -1, !dbg !370
  %4 = and i64 %and, %3, !dbg !370
  %5 = icmp eq i64 %4, 0, !dbg !370
  %6 = icmp ne i64 %2, 0, !dbg !370
  %_msprop_icmp = and i1 %6, %5, !dbg !370
  %tobool = icmp ne i64 %and, 0, !dbg !370
  store i1 %_msprop_icmp, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !371
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !371
  ret i1 %tobool, !dbg !371
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local zeroext i1 @mm_init() local_unnamed_addr #0 !dbg !372 {
for.end:
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !379
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !379
  %call = call i8* @mem_sbrk(i64 16) #5, !dbg !379
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !380
  %0 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !380
  call void @llvm.dbg.value(metadata i64* %7, metadata !376, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i32 0, metadata !377, metadata !DIExpression()), !dbg !381
  %1 = call i8* @__msan_memset(i8* bitcast ([10 x %struct.block*]* @head to i8*), i32 0, i64 80) #5, !dbg !382
  store i64 0, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @tail to i64), i64 87960930222080) to i64*), align 8, !dbg !385
  store %struct.block* null, %struct.block** @tail, align 8, !dbg !385, !tbaa !79
  %2 = ptrtoint i8* %call to i64, !dbg !386
  %.demorgan = or i64 %_msret, %2, !dbg !386
  %3 = icmp eq i64 %.demorgan, -1, !dbg !386
  %4 = icmp ne i64 %_msret, 0, !dbg !386
  %_msprop_icmp = and i1 %4, %3, !dbg !386
  br i1 %_msprop_icmp, label %5, label %6, !dbg !388, !prof !88

; <label>:5:                                      ; preds = %for.end
  store i32 %0, i32* @__msan_origin_tls, align 4, !dbg !388
  call void @__msan_warning_noreturn() #5, !dbg !388
  call void asm sideeffect "", ""() #5, !dbg !388
  unreachable, !dbg !388

; <label>:6:                                      ; preds = %for.end
  %cmp1 = icmp eq i8* %call, inttoptr (i64 -1 to i8*), !dbg !386
  br i1 %cmp1, label %return, label %if.end, !dbg !388

if.end:                                           ; preds = %6
  %7 = bitcast i8* %call to i64*, !dbg !389
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !390
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !390
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !390
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !390
  %call2 = call fastcc i64 @pack(i64 0, i1 zeroext true, i1 zeroext true), !dbg !390
  %_msret17 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !391
  %8 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !391
  br i1 %4, label %9, label %10, !dbg !391, !prof !88

; <label>:9:                                      ; preds = %if.end
  store i32 %0, i32* @__msan_origin_tls, align 4, !dbg !391
  call void @__msan_warning_noreturn() #5, !dbg !391
  call void asm sideeffect "", ""() #5, !dbg !391
  unreachable, !dbg !391

; <label>:10:                                     ; preds = %if.end
  %11 = ptrtoint i8* %call to i64, !dbg !391
  %12 = xor i64 %11, 87960930222080, !dbg !391
  %13 = inttoptr i64 %12 to i64*, !dbg !391
  store i64 %_msret17, i64* %13, align 8, !dbg !391
  %_mscmp22 = icmp ne i64 %_msret17, 0, !dbg !391
  br i1 %_mscmp22, label %14, label %21, !dbg !391, !prof !88

; <label>:14:                                     ; preds = %10
  %15 = add i64 %12, 17592186044416, !dbg !391
  %16 = call i32 @__msan_chain_origin(i32 %8) #5, !dbg !391
  %17 = zext i32 %16 to i64, !dbg !391
  %18 = shl nuw i64 %17, 32, !dbg !391
  %19 = or i64 %18, %17, !dbg !391
  %20 = inttoptr i64 %15 to i64*, !dbg !391
  store i64 %19, i64* %20, align 8, !dbg !391
  br label %21, !dbg !391

; <label>:21:                                     ; preds = %10, %14
  store i64 %call2, i64* %7, align 8, !dbg !391, !tbaa !227
  %arrayidx5 = getelementptr inbounds i8, i8* %call, i64 8, !dbg !392
  %22 = bitcast i8* %arrayidx5 to i64*, !dbg !392
  br i1 false, label %23, label %24, !dbg !393, !prof !88

; <label>:23:                                     ; preds = %21
  unreachable, !dbg !393

; <label>:24:                                     ; preds = %21
  %25 = ptrtoint i8* %arrayidx5 to i64, !dbg !393
  %26 = xor i64 %25, 87960930222080, !dbg !393
  %27 = inttoptr i64 %26 to i64*, !dbg !393
  store i64 %_msret17, i64* %27, align 8, !dbg !393
  br i1 %_mscmp22, label %28, label %35, !dbg !393, !prof !88

; <label>:28:                                     ; preds = %24
  %29 = add i64 %26, 17592186044416, !dbg !393
  %30 = call i32 @__msan_chain_origin(i32 %8) #5, !dbg !393
  %31 = zext i32 %30 to i64, !dbg !393
  %32 = shl nuw i64 %31, 32, !dbg !393
  %33 = or i64 %32, %31, !dbg !393
  %34 = inttoptr i64 %29 to i64*, !dbg !393
  store i64 %33, i64* %34, align 8, !dbg !393
  br label %35, !dbg !393

; <label>:35:                                     ; preds = %24, %28
  store i64 %call2, i64* %22, align 8, !dbg !393, !tbaa !227
  store i64 0, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @heap_start to i64), i64 87960930222080) to i64*), align 8, !dbg !394
  br i1 false, label %36, label %37, !dbg !394, !prof !88

; <label>:36:                                     ; preds = %35
  br label %37, !dbg !394

; <label>:37:                                     ; preds = %35, %36
  store i8* %arrayidx5, i8** bitcast (%struct.block** @heap_start to i8**), align 8, !dbg !394, !tbaa !79
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !395
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !395
  %call7 = call fastcc %struct.block* @extend_heap(i64 4096), !dbg !395
  %_msret18 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !397
  %38 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !397
  %39 = ptrtoint %struct.block* %call7 to i64, !dbg !397
  %40 = xor i64 %_msret18, -1, !dbg !397
  %41 = and i64 %40, %39, !dbg !397
  %42 = icmp eq i64 %41, 0, !dbg !397
  %43 = icmp ne i64 %_msret18, 0, !dbg !397
  %_msprop_icmp19 = and i1 %43, %42, !dbg !397
  %cmp8 = icmp ne %struct.block* %call7, null, !dbg !397
  br label %return, !dbg !398

return:                                           ; preds = %37, %6
  %_msphi_s = phi i1 [ false, %6 ], [ %_msprop_icmp19, %37 ], !dbg !400
  %_msphi_o = phi i32 [ 0, %6 ], [ %38, %37 ], !dbg !400
  %retval.0 = phi i1 [ false, %6 ], [ %cmp8, %37 ], !dbg !400
  store i1 %_msphi_s, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !401
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !401
  ret i1 %retval.0, !dbg !401
}

declare dso_local i8* @mem_sbrk(i64) local_unnamed_addr #2

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @pack(i64 %size, i1 zeroext %alloc, i1 zeroext %prevAlloc) unnamed_addr #0 !dbg !402 {
entry:
  %0 = load i1, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !410
  %1 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !410
  %2 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !410
  %3 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !410
  %4 = load i1, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !410
  %5 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !410
  call void @llvm.dbg.value(metadata i64 %size, metadata !406, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.value(metadata i1 %alloc, metadata !407, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.value(metadata i1 %prevAlloc, metadata !408, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.value(metadata i64 %size, metadata !409, metadata !DIExpression()), !dbg !413
  %_msprop = zext i1 %4 to i64, !dbg !414
  %or = zext i1 %alloc to i64, !dbg !414
  %6 = xor i64 %or, -1, !dbg !414
  %7 = xor i64 %size, -1, !dbg !414
  %8 = and i64 %2, %_msprop, !dbg !414
  %9 = and i64 %2, %6, !dbg !414
  %10 = and i64 %_msprop, %7, !dbg !414
  %11 = or i64 %10, %9, !dbg !414
  %12 = or i64 %11, %8, !dbg !414
  %13 = icmp eq i64 %2, 0, !dbg !414
  %14 = select i1 %13, i32 %5, i32 %3, !dbg !414
  %spec.select = or i64 %or, %size, !dbg !414
  call void @llvm.dbg.value(metadata i64 %spec.select, metadata !409, metadata !DIExpression()), !dbg !413
  %15 = and i64 %12, -3, !dbg !415
  %or4 = or i64 %spec.select, 2, !dbg !415
  call void @llvm.dbg.value(metadata i64 %or4, metadata !409, metadata !DIExpression()), !dbg !413
  %16 = select i1 %prevAlloc, i64 %15, i64 %12, !dbg !418
  %17 = xor i64 %or4, %spec.select, !dbg !418
  %18 = or i64 %12, %17, !dbg !418
  %_msprop_select = select i1 %0, i64 %18, i64 %16, !dbg !418
  %19 = select i1 %0, i32 %1, i32 %14, !dbg !418
  %word.1 = select i1 %prevAlloc, i64 %or4, i64 %spec.select, !dbg !418
  call void @llvm.dbg.value(metadata i64 %word.1, metadata !409, metadata !DIExpression()), !dbg !413
  store i64 %_msprop_select, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !419
  store i32 %19, i32* @__msan_retval_origin_tls, align 4, !dbg !419
  ret i64 %word.1, !dbg !419
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc %struct.block* @extend_heap(i64 %size) unnamed_addr #0 !dbg !420 {
entry:
  call void @llvm.dbg.value(metadata i64 %size, metadata !424, metadata !DIExpression()), !dbg !428
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !429
  %call = call fastcc i64 @round_up(i64 %size), !dbg !429
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !428
  %0 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !428
  call void @llvm.dbg.value(metadata i64 %call, metadata !424, metadata !DIExpression()), !dbg !428
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !430
  store i32 %0, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !430
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !430
  %call1 = call i8* @mem_sbrk(i64 %call) #5, !dbg !430
  %_msret14 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !432
  %1 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !432
  call void @llvm.dbg.value(metadata i8* %call1, metadata !425, metadata !DIExpression()), !dbg !432
  %2 = ptrtoint i8* %call1 to i64, !dbg !433
  %.demorgan = or i64 %_msret14, %2, !dbg !433
  %3 = icmp eq i64 %.demorgan, -1, !dbg !433
  %4 = icmp ne i64 %_msret14, 0, !dbg !433
  %_msprop_icmp = and i1 %4, %3, !dbg !433
  br i1 %_msprop_icmp, label %5, label %6, !dbg !434, !prof !88

; <label>:5:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !434
  call void @__msan_warning_noreturn() #5, !dbg !434
  call void asm sideeffect "", ""() #5, !dbg !434
  unreachable, !dbg !434

; <label>:6:                                      ; preds = %entry
  %cmp = icmp eq i8* %call1, inttoptr (i64 -1 to i8*), !dbg !433
  br i1 %cmp, label %return, label %if.end, !dbg !434

if.end:                                           ; preds = %6
  store i64 %_msret14, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !435
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !435
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !435
  %call2 = call fastcc %struct.block* @payload_to_header(i8* %call1), !dbg !435
  %_msret15 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !436
  %7 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !436
  call void @llvm.dbg.value(metadata %struct.block* %call2, metadata !426, metadata !DIExpression()), !dbg !436
  store i64 %_msret15, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !437
  store i32 %7, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !437
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !437
  %call3 = call fastcc zeroext i1 @getPrevAlloc(%struct.block* nonnull %call2), !dbg !437
  %_msret16 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !438
  %8 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !438
  store i64 %_msret15, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !438
  store i32 %7, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !438
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !438
  %call4 = call fastcc zeroext i1 @getPrevMiniStatus(%struct.block* nonnull %call2), !dbg !438
  %_msret17 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !439
  %9 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !439
  store i64 %_msret15, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !439
  store i32 %7, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !439
  store i64 %_msret, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !439
  store i32 %0, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !439
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !439
  store i1 %_msret16, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !439
  store i32 %8, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !439
  store i1 %_msret17, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !439
  store i32 %9, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 32) to i32*), align 4, !dbg !439
  call fastcc void @write_block(%struct.block* nonnull %call2, i64 %call, i1 zeroext false, i1 zeroext %call3, i1 zeroext %call4), !dbg !439
  store i64 %_msret15, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !440
  store i32 %7, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !440
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !440
  %call5 = call fastcc %struct.block* @find_next(%struct.block* nonnull %call2), !dbg !440
  %_msret18 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !441
  %10 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !441
  call void @llvm.dbg.value(metadata %struct.block* %call5, metadata !427, metadata !DIExpression()), !dbg !441
  store i64 %_msret18, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !442
  store i32 %10, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !442
  call fastcc void @write_epilogue(%struct.block* %call5), !dbg !442
  store i64 %_msret15, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !443
  store i32 %7, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !443
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !443
  %call6 = call fastcc %struct.block* @coalesce_block(%struct.block* nonnull %call2), !dbg !443
  %_msret19 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !436
  %11 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !436
  call void @llvm.dbg.value(metadata %struct.block* %call6, metadata !426, metadata !DIExpression()), !dbg !436
  br label %return, !dbg !444

return:                                           ; preds = %6, %if.end
  %_msphi_s = phi i64 [ %_msret19, %if.end ], [ 0, %6 ], !dbg !445
  %_msphi_o = phi i32 [ %11, %if.end ], [ 0, %6 ], !dbg !445
  %retval.0 = phi %struct.block* [ %call6, %if.end ], [ null, %6 ], !dbg !445
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !446
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !446
  ret %struct.block* %retval.0, !dbg !446
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local i8* @mm_malloc(i64 %size) local_unnamed_addr #0 !dbg !447 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !457
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !457
  call void @llvm.dbg.value(metadata i64 %size, metadata !451, metadata !DIExpression()), !dbg !457
  call void @llvm.dbg.value(metadata i8* null, metadata !455, metadata !DIExpression()), !dbg !458
  %2 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !459, !tbaa !79
  %_msld = load i64, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @heap_start to i64), i64 87960930222080) to i64*), align 8, !dbg !461
  %3 = ptrtoint %struct.block* %2 to i64, !dbg !461
  %4 = xor i64 %_msld, -1, !dbg !461
  %5 = and i64 %4, %3, !dbg !461
  %6 = icmp eq i64 %5, 0, !dbg !461
  %7 = icmp ne i64 %_msld, 0, !dbg !461
  %_msprop_icmp = and i1 %7, %6, !dbg !461
  br i1 %_msprop_icmp, label %8, label %10, !dbg !462, !prof !88

; <label>:8:                                      ; preds = %entry
  %9 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint (%struct.block** @heap_start to i64), i64 87960930222080), i64 17592186044416) to i32*), align 8, !dbg !461
  store i32 %9, i32* @__msan_origin_tls, align 4, !dbg !462
  call void @__msan_warning_noreturn() #5, !dbg !462
  call void asm sideeffect "", ""() #5, !dbg !462
  unreachable, !dbg !462

; <label>:10:                                     ; preds = %entry
  %cmp = icmp eq %struct.block* %2, null, !dbg !461
  br i1 %cmp, label %if.then, label %if.end, !dbg !462

if.then:                                          ; preds = %10
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !463
  %call = call zeroext i1 @mm_init(), !dbg !463
  br label %if.end, !dbg !465

if.end:                                           ; preds = %if.then, %10
  %11 = xor i64 %0, -1, !dbg !466
  %12 = and i64 %11, %size, !dbg !466
  %13 = icmp eq i64 %12, 0, !dbg !466
  %14 = icmp ne i64 %0, 0, !dbg !466
  %_msprop_icmp29 = and i1 %14, %13, !dbg !466
  br i1 %_msprop_icmp29, label %15, label %16, !dbg !468, !prof !88

; <label>:15:                                     ; preds = %if.end
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !468
  call void @__msan_warning_noreturn() #5, !dbg !468
  call void asm sideeffect "", ""() #5, !dbg !468
  unreachable, !dbg !468

; <label>:16:                                     ; preds = %if.end
  %cmp1 = icmp eq i64 %size, 0, !dbg !466
  br i1 %cmp1, label %return, label %if.end3, !dbg !468

if.end3:                                          ; preds = %16
  %add = add i64 %size, 8, !dbg !469
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !470
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !470
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !470
  %call4 = call fastcc i64 @round_up(i64 %add), !dbg !470
  %_msret30 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !471
  %17 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !471
  call void @llvm.dbg.value(metadata i64 %call4, metadata !452, metadata !DIExpression()), !dbg !471
  store i64 %_msret30, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !472
  store i32 %17, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !472
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !472
  %call5 = call fastcc %struct.block* @find_first_free(i64 %call4), !dbg !472
  %_msret31 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !473
  %18 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !473
  call void @llvm.dbg.value(metadata %struct.block* %call5, metadata !454, metadata !DIExpression()), !dbg !473
  %19 = ptrtoint %struct.block* %call5 to i64, !dbg !474
  %20 = xor i64 %_msret31, -1, !dbg !474
  %21 = and i64 %20, %19, !dbg !474
  %22 = icmp eq i64 %21, 0, !dbg !474
  %23 = icmp ne i64 %_msret31, 0, !dbg !474
  %_msprop_icmp32 = and i1 %23, %22, !dbg !474
  br i1 %_msprop_icmp32, label %24, label %25, !dbg !476, !prof !88

; <label>:24:                                     ; preds = %if.end3
  store i32 %18, i32* @__msan_origin_tls, align 4, !dbg !476
  call void @__msan_warning_noreturn() #5, !dbg !476
  call void asm sideeffect "", ""() #5, !dbg !476
  unreachable, !dbg !476

; <label>:25:                                     ; preds = %if.end3
  %cmp6 = icmp eq %struct.block* %call5, null, !dbg !474
  br i1 %cmp6, label %if.then7, label %if.end13, !dbg !476

if.then7:                                         ; preds = %25
  store i64 %_msret30, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !477
  store i32 %17, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !477
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !477
  %call8 = call fastcc i64 @max(i64 %call4), !dbg !477
  %_msret33 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !479
  %26 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !479
  call void @llvm.dbg.value(metadata i64 %call8, metadata !453, metadata !DIExpression()), !dbg !479
  store i64 %_msret33, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !480
  store i32 %26, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !480
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !480
  %call9 = call fastcc %struct.block* @extend_heap(i64 %call8), !dbg !480
  %_msret34 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !473
  %27 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !473
  call void @llvm.dbg.value(metadata %struct.block* %call9, metadata !454, metadata !DIExpression()), !dbg !473
  %28 = ptrtoint %struct.block* %call9 to i64, !dbg !481
  %29 = xor i64 %_msret34, -1, !dbg !481
  %30 = and i64 %29, %28, !dbg !481
  %31 = icmp eq i64 %30, 0, !dbg !481
  %32 = icmp ne i64 %_msret34, 0, !dbg !481
  %_msprop_icmp35 = and i1 %32, %31, !dbg !481
  br i1 %_msprop_icmp35, label %33, label %34, !dbg !483, !prof !88

; <label>:33:                                     ; preds = %if.then7
  store i32 %27, i32* @__msan_origin_tls, align 4, !dbg !483
  call void @__msan_warning_noreturn() #5, !dbg !483
  call void asm sideeffect "", ""() #5, !dbg !483
  unreachable, !dbg !483

; <label>:34:                                     ; preds = %if.then7
  %cmp10 = icmp eq %struct.block* %call9, null, !dbg !481
  br i1 %cmp10, label %return, label %if.end13, !dbg !483

if.end13:                                         ; preds = %34, %25
  %_msphi_s36 = phi i64 [ %_msret34, %34 ], [ %_msret31, %25 ], !dbg !484
  %_msphi_o37 = phi i32 [ %27, %34 ], [ %18, %25 ], !dbg !484
  %block.0 = phi %struct.block* [ %call9, %34 ], [ %call5, %25 ], !dbg !484
  call void @llvm.dbg.value(metadata %struct.block* %block.0, metadata !454, metadata !DIExpression()), !dbg !473
  store i64 %_msphi_s36, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !485
  store i32 %_msphi_o37, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !485
  call fastcc void @removeFree(%struct.block* nonnull %block.0), !dbg !485
  store i64 %_msphi_s36, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !486
  store i32 %_msphi_o37, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !486
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !486
  %call14 = call fastcc i64 @get_size(%struct.block* nonnull %block.0), !dbg !486
  %_msret38 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !487
  %35 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !487
  call void @llvm.dbg.value(metadata i64 %call14, metadata !456, metadata !DIExpression()), !dbg !487
  store i64 %_msphi_s36, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !488
  store i32 %_msphi_o37, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !488
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !488
  %call15 = call fastcc zeroext i1 @getPrevMiniStatus(%struct.block* nonnull %block.0), !dbg !488
  %_msret39 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !489
  %36 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !489
  store i64 %_msphi_s36, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !489
  store i32 %_msphi_o37, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !489
  store i64 %_msret38, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !489
  store i32 %35, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !489
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !489
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !489
  store i1 %_msret39, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !489
  store i32 %36, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 32) to i32*), align 4, !dbg !489
  call fastcc void @write_block(%struct.block* nonnull %block.0, i64 %call14, i1 zeroext true, i1 zeroext true, i1 zeroext %call15), !dbg !489
  store i64 %_msphi_s36, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !490
  store i32 %_msphi_o37, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !490
  store i64 %_msret30, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !490
  store i32 %17, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !490
  call fastcc void @split_block(%struct.block* nonnull %block.0, i64 %call4), !dbg !490
  store i64 %_msphi_s36, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !491
  store i32 %_msphi_o37, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !491
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !491
  %call16 = call fastcc i8* @header_to_payload(%struct.block* nonnull %block.0), !dbg !491
  %_msret40 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !458
  %37 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !458
  call void @llvm.dbg.value(metadata i8* %call16, metadata !455, metadata !DIExpression()), !dbg !458
  br label %return, !dbg !492

return:                                           ; preds = %34, %16, %if.end13
  %_msphi_s = phi i64 [ %_msret40, %if.end13 ], [ 0, %16 ], [ 0, %34 ], !dbg !484
  %_msphi_o = phi i32 [ %37, %if.end13 ], [ 0, %16 ], [ 0, %34 ], !dbg !484
  %retval.0 = phi i8* [ %call16, %if.end13 ], [ null, %16 ], [ null, %34 ], !dbg !484
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !493
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !493
  ret i8* %retval.0, !dbg !493
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @round_up(i64 %size) unnamed_addr #0 !dbg !494 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !501
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !501
  call void @llvm.dbg.value(metadata i64 %size, metadata !498, metadata !DIExpression()), !dbg !501
  call void @llvm.dbg.value(metadata i64 16, metadata !499, metadata !DIExpression()), !dbg !502
  %add = add i64 %size, 15, !dbg !503
  %2 = and i64 %0, -16, !dbg !504
  %div = and i64 %add, -16, !dbg !504
  call void @llvm.dbg.value(metadata i64 %div, metadata !500, metadata !DIExpression()), !dbg !505
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !506
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !506
  ret i64 %div, !dbg !506
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc %struct.block* @find_first_free(i64 %asize) unnamed_addr #0 !dbg !507 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !515
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !515
  call void @llvm.dbg.value(metadata i64 %asize, metadata !509, metadata !DIExpression()), !dbg !515
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !516
  %call = call fastcc i64 @getHead(i64 %asize), !dbg !516
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !517
  %2 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !517
  call void @llvm.dbg.value(metadata i64 %call, metadata !510, metadata !DIExpression()), !dbg !517
  %3 = xor i64 %_msret, -1, !dbg !518
  %4 = and i64 %call, %3, !dbg !518
  %5 = icmp ult i64 %4, 10, !dbg !518
  %6 = or i64 %_msret, %call, !dbg !518
  %7 = icmp ult i64 %6, 10, !dbg !518
  %8 = xor i1 %5, %7, !dbg !518
  br i1 %8, label %9, label %10, !dbg !519, !prof !88

; <label>:9:                                      ; preds = %entry
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !519
  call void @__msan_warning_noreturn() #5, !dbg !519
  call void asm sideeffect "", ""() #5, !dbg !519
  unreachable, !dbg !519

; <label>:10:                                     ; preds = %entry
  %cmp21 = icmp ult i64 %call, 10, !dbg !518
  br i1 %cmp21, label %for.body.preheader, label %return, !dbg !519

for.body.preheader:                               ; preds = %10
  %11 = icmp eq i64 %_msret, 0
  br label %for.body, !dbg !520

for.body:                                         ; preds = %for.body.preheader, %61
  %i.022 = phi i64 [ %inc, %61 ], [ %call, %for.body.preheader ]
  call void @llvm.dbg.value(metadata i64 %i.022, metadata !510, metadata !DIExpression()), !dbg !517
  %arrayidx = getelementptr inbounds [10 x %struct.block*], [10 x %struct.block*]* @head, i64 0, i64 %i.022, !dbg !520
  br i1 %11, label %13, label %12, !dbg !520, !prof !91

; <label>:12:                                     ; preds = %for.body
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !520
  call void @__msan_warning_noreturn() #5, !dbg !520
  call void asm sideeffect "", ""() #5, !dbg !520
  unreachable, !dbg !520

; <label>:13:                                     ; preds = %for.body
  %14 = load %struct.block*, %struct.block** %arrayidx, align 8, !dbg !520, !tbaa !79
  %15 = ptrtoint %struct.block** %arrayidx to i64, !dbg !522
  %16 = xor i64 %15, 87960930222080, !dbg !522
  %17 = inttoptr i64 %16 to i64*, !dbg !522
  %18 = add i64 %16, 17592186044416, !dbg !522
  %19 = inttoptr i64 %18 to i32*, !dbg !522
  %_msld = load i64, i64* %17, align 8, !dbg !522
  %20 = load i32, i32* %19, align 8, !dbg !522
  %21 = ptrtoint %struct.block* %14 to i64, !dbg !522
  %22 = xor i64 %_msld, -1, !dbg !522
  %23 = and i64 %22, %21, !dbg !522
  %24 = icmp eq i64 %23, 0, !dbg !522
  %25 = icmp ne i64 %_msld, 0, !dbg !522
  %_msprop_icmp = and i1 %25, %24, !dbg !522
  br i1 %_msprop_icmp, label %26, label %27, !dbg !523, !prof !88

; <label>:26:                                     ; preds = %13
  store i32 %20, i32* @__msan_origin_tls, align 4, !dbg !523
  call void @__msan_warning_noreturn() #5, !dbg !523
  call void asm sideeffect "", ""() #5, !dbg !523
  unreachable, !dbg !523

; <label>:27:                                     ; preds = %13
  %cmp1 = icmp eq %struct.block* %14, null, !dbg !522
  br i1 %cmp1, label %for.inc, label %do.body.preheader, !dbg !523

do.body.preheader:                                ; preds = %27
  br label %do.body, !dbg !524

do.body:                                          ; preds = %do.body.preheader, %55
  %_msphi_s33 = phi i64 [ %_msld36, %55 ], [ %_msld, %do.body.preheader ], !dbg !527
  %_msphi_o34 = phi i32 [ %45, %55 ], [ %20, %do.body.preheader ], !dbg !527
  %block.0 = phi %struct.block* [ %39, %55 ], [ %14, %do.body.preheader ], !dbg !527
  call void @llvm.dbg.value(metadata %struct.block* %block.0, metadata !512, metadata !DIExpression()), !dbg !528
  store i64 %_msphi_s33, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !524
  store i32 %_msphi_o34, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !524
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !524
  %call3 = call fastcc zeroext i1 @get_alloc(%struct.block* %block.0), !dbg !524
  %_msret35 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !529
  br i1 %_msret35, label %28, label %30, !dbg !529, !prof !88

; <label>:28:                                     ; preds = %do.body
  %29 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !529
  store i32 %29, i32* @__msan_origin_tls, align 4, !dbg !529
  call void @__msan_warning_noreturn() #5, !dbg !529
  call void asm sideeffect "", ""() #5, !dbg !529
  unreachable, !dbg !529

; <label>:30:                                     ; preds = %do.body
  br i1 %call3, label %if.end7, label %land.lhs.true, !dbg !529

land.lhs.true:                                    ; preds = %30
  store i64 %_msphi_s33, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !530
  store i32 %_msphi_o34, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !530
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !530
  %call4 = call fastcc i64 @get_size(%struct.block* %block.0), !dbg !530
  %_msret38 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !531
  %_msprop39 = or i64 %_msret38, %0, !dbg !531
  %31 = icmp eq i64 %_msprop39, 0, !dbg !531
  br i1 %31, label %36, label %32, !dbg !532, !prof !91

; <label>:32:                                     ; preds = %land.lhs.true
  %33 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !531
  %34 = icmp eq i64 %0, 0, !dbg !531
  %35 = select i1 %34, i32 %33, i32 %1, !dbg !531
  store i32 %35, i32* @__msan_origin_tls, align 4, !dbg !532
  call void @__msan_warning_noreturn() #5, !dbg !532
  call void asm sideeffect "", ""() #5, !dbg !532
  unreachable, !dbg !532

; <label>:36:                                     ; preds = %land.lhs.true
  %cmp5 = icmp ult i64 %call4, %asize, !dbg !531
  br i1 %cmp5, label %if.end7, label %return.loopexit, !dbg !532

if.end7:                                          ; preds = %36, %30
  %next = getelementptr inbounds %struct.block, %struct.block* %block.0, i64 0, i32 1, i32 0, i32 0, !dbg !533
  %_mscmp44 = icmp eq i64 %_msphi_s33, 0, !dbg !533
  br i1 %_mscmp44, label %38, label %37, !dbg !533, !prof !91

; <label>:37:                                     ; preds = %if.end7
  store i32 %_msphi_o34, i32* @__msan_origin_tls, align 4, !dbg !533
  call void @__msan_warning_noreturn() #5, !dbg !533
  call void asm sideeffect "", ""() #5, !dbg !533
  unreachable, !dbg !533

; <label>:38:                                     ; preds = %if.end7
  %39 = load %struct.block*, %struct.block** %next, align 8, !dbg !533, !tbaa !276
  %40 = ptrtoint %struct.block** %next to i64, !dbg !528
  %41 = xor i64 %40, 87960930222080, !dbg !528
  %42 = inttoptr i64 %41 to i64*, !dbg !528
  %43 = add i64 %41, 17592186044416, !dbg !528
  %44 = inttoptr i64 %43 to i32*, !dbg !528
  %_msld36 = load i64, i64* %42, align 8, !dbg !528
  %45 = load i32, i32* %44, align 8, !dbg !528
  call void @llvm.dbg.value(metadata %struct.block* %39, metadata !512, metadata !DIExpression()), !dbg !528
  %46 = ptrtoint %struct.block* %39 to i64, !dbg !534
  %47 = xor i64 %46, %21, !dbg !534
  %48 = or i64 %_msld36, %_msld, !dbg !534
  %49 = xor i64 %48, -1, !dbg !534
  %50 = and i64 %47, %49, !dbg !534
  %51 = icmp eq i64 %50, 0, !dbg !534
  %52 = icmp ne i64 %48, 0, !dbg !534
  %_msprop_icmp37 = and i1 %52, %51, !dbg !534
  br i1 %_msprop_icmp37, label %53, label %55, !dbg !535, !prof !88

; <label>:53:                                     ; preds = %38
  %54 = select i1 %25, i32 %20, i32 %45, !dbg !534
  store i32 %54, i32* @__msan_origin_tls, align 4, !dbg !535
  call void @__msan_warning_noreturn() #5, !dbg !535
  call void asm sideeffect "", ""() #5, !dbg !535
  unreachable, !dbg !535

; <label>:55:                                     ; preds = %38
  %cmp9 = icmp eq %struct.block* %39, %14, !dbg !534
  br i1 %cmp9, label %for.inc.loopexit, label %do.body, !dbg !535, !llvm.loop !536

for.inc.loopexit:                                 ; preds = %55
  br label %for.inc, !dbg !539

for.inc:                                          ; preds = %for.inc.loopexit, %27
  %inc = add nuw nsw i64 %i.022, 1, !dbg !539
  call void @llvm.dbg.value(metadata i64 %inc, metadata !510, metadata !DIExpression()), !dbg !517
  %56 = and i64 %inc, %3, !dbg !518
  %57 = icmp ult i64 %56, 10, !dbg !518
  %58 = icmp ult i64 %inc, 10, !dbg !518
  %59 = xor i1 %57, %58, !dbg !518
  br i1 %59, label %60, label %61, !dbg !519, !prof !88

; <label>:60:                                     ; preds = %for.inc
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !519
  call void @__msan_warning_noreturn() #5, !dbg !519
  call void asm sideeffect "", ""() #5, !dbg !519
  unreachable, !dbg !519

; <label>:61:                                     ; preds = %for.inc
  br i1 %58, label %for.body, label %return.loopexit47, !dbg !519, !llvm.loop !540

return.loopexit:                                  ; preds = %36
  call void @llvm.dbg.value(metadata %struct.block* %block.0, metadata !512, metadata !DIExpression()), !dbg !528
  br label %return, !dbg !542

return.loopexit47:                                ; preds = %61
  br label %return, !dbg !542

return:                                           ; preds = %return.loopexit47, %return.loopexit, %10
  %_msphi_s31 = phi i64 [ 0, %10 ], [ %_msphi_s33, %return.loopexit ], [ 0, %return.loopexit47 ], !dbg !543
  %_msphi_o32 = phi i32 [ 0, %10 ], [ %_msphi_o34, %return.loopexit ], [ 0, %return.loopexit47 ], !dbg !543
  %retval.0 = phi %struct.block* [ null, %10 ], [ %block.0, %return.loopexit ], [ null, %return.loopexit47 ], !dbg !543
  store i64 %_msphi_s31, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !542
  store i32 %_msphi_o32, i32* @__msan_retval_origin_tls, align 4, !dbg !542
  ret %struct.block* %retval.0, !dbg !542
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @max(i64 %x) unnamed_addr #0 !dbg !544 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !548
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !548
  call void @llvm.dbg.value(metadata i64 %x, metadata !546, metadata !DIExpression()), !dbg !548
  call void @llvm.dbg.value(metadata i64 4096, metadata !547, metadata !DIExpression()), !dbg !549
  %2 = xor i64 %0, -1, !dbg !550
  %3 = and i64 %2, %x, !dbg !550
  %4 = icmp ugt i64 %3, 4096, !dbg !550
  %5 = or i64 %0, %x, !dbg !550
  %6 = icmp ugt i64 %5, 4096, !dbg !550
  %7 = xor i1 %4, %6, !dbg !550
  %cmp = icmp ugt i64 %x, 4096, !dbg !550
  %8 = select i1 %cmp, i64 %0, i64 0, !dbg !551
  %9 = xor i64 %x, 4096, !dbg !551
  %10 = or i64 %0, %9, !dbg !551
  %_msprop_select = select i1 %7, i64 %10, i64 %8, !dbg !551
  %11 = or i1 %7, %cmp, !dbg !551
  %12 = select i1 %11, i32 %1, i32 0, !dbg !551
  %cond = select i1 %cmp, i64 %x, i64 4096, !dbg !551
  store i64 %_msprop_select, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !552
  store i32 %12, i32* @__msan_retval_origin_tls, align 4, !dbg !552
  ret i64 %cond, !dbg !552
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc void @removeFree(%struct.block* %block) unnamed_addr #0 !dbg !553 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !565
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !565
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !557, metadata !DIExpression()), !dbg !565
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !566
  %call = call fastcc i64 @get_size(%struct.block* %block), !dbg !566
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !567
  %2 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !567
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !567
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !567
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !567
  %call1 = call fastcc i64 @getHead(i64 %call), !dbg !567
  %_msret124 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !568
  %3 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !568
  call void @llvm.dbg.value(metadata i64 %call1, metadata !558, metadata !DIExpression()), !dbg !568
  %4 = icmp ne i64 %_msret124, 0, !dbg !569
  %cmp = icmp eq i64 %call1, 0, !dbg !569
  %next = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 0, !dbg !570
  %_mscmp = icmp eq i64 %0, 0, !dbg !570
  br i1 %_mscmp, label %6, label %5, !dbg !570, !prof !91

; <label>:5:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !570
  call void @__msan_warning_noreturn() #5, !dbg !570
  call void asm sideeffect "", ""() #5, !dbg !570
  unreachable, !dbg !570

; <label>:6:                                      ; preds = %entry
  %7 = xor i64 %_msret124, -1, !dbg !569
  %8 = and i64 %call1, %7, !dbg !569
  %9 = icmp eq i64 %8, 0, !dbg !569
  %_msprop_icmp = and i1 %4, %9, !dbg !569
  %10 = load %struct.block*, %struct.block** %next, align 8, !dbg !570, !tbaa !276
  %11 = ptrtoint %struct.block** %next to i64, !dbg !572
  %12 = xor i64 %11, 87960930222080, !dbg !572
  %13 = inttoptr i64 %12 to i64*, !dbg !572
  %14 = add i64 %12, 17592186044416, !dbg !572
  %15 = inttoptr i64 %14 to i32*, !dbg !572
  %_msld = load i64, i64* %13, align 8, !dbg !572
  %16 = load i32, i32* %15, align 8, !dbg !572
  %17 = ptrtoint %struct.block* %10 to i64, !dbg !572
  br i1 %_msprop_icmp, label %18, label %19, !dbg !572, !prof !88

; <label>:18:                                     ; preds = %6
  store i32 %3, i32* @__msan_origin_tls, align 4, !dbg !572
  call void @__msan_warning_noreturn() #5, !dbg !572
  call void asm sideeffect "", ""() #5, !dbg !572
  unreachable, !dbg !572

; <label>:19:                                     ; preds = %6
  br i1 %cmp, label %if.then, label %if.end39, !dbg !572

if.then:                                          ; preds = %19
  %20 = ptrtoint %struct.block* %block to i64, !dbg !573
  %21 = xor i64 %17, %20, !dbg !573
  %22 = xor i64 %_msld, -1, !dbg !573
  %23 = and i64 %21, %22, !dbg !573
  %24 = icmp eq i64 %23, 0, !dbg !573
  %25 = icmp ne i64 %_msld, 0, !dbg !573
  %_msprop_icmp125 = and i1 %25, %24, !dbg !573
  %cmp2 = icmp eq %struct.block* %10, %block, !dbg !573
  %26 = load %struct.block*, %struct.block** @tail, align 8, !dbg !575
  %_msld126 = load i64, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @tail to i64), i64 87960930222080) to i64*), align 8, !dbg !576
  %27 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint (%struct.block** @tail to i64), i64 87960930222080), i64 17592186044416) to i32*), align 8, !dbg !576
  %28 = ptrtoint %struct.block* %26 to i64, !dbg !576
  %29 = xor i64 %28, %20, !dbg !576
  %30 = xor i64 %_msld126, -1, !dbg !576
  %31 = and i64 %29, %30, !dbg !576
  %32 = icmp eq i64 %31, 0, !dbg !576
  %33 = icmp ne i64 %_msld126, 0, !dbg !576
  %_msprop_icmp127 = and i1 %33, %32, !dbg !576
  %cmp3 = icmp eq %struct.block* %26, %block, !dbg !576
  %34 = and i1 %_msprop_icmp125, %_msprop_icmp127, !dbg !577
  %35 = and i1 %cmp2, %_msprop_icmp127, !dbg !577
  %36 = and i1 %_msprop_icmp125, %cmp3, !dbg !577
  %37 = or i1 %36, %35, !dbg !577
  %38 = or i1 %34, %37, !dbg !577
  br i1 %38, label %39, label %41, !dbg !577, !prof !88

; <label>:39:                                     ; preds = %if.then
  %40 = select i1 %_msprop_icmp127, i32 %27, i32 %16, !dbg !577
  store i32 %40, i32* @__msan_origin_tls, align 4, !dbg !577
  call void @__msan_warning_noreturn() #5, !dbg !577
  call void asm sideeffect "", ""() #5, !dbg !577
  unreachable, !dbg !577

; <label>:41:                                     ; preds = %if.then
  %or.cond = and i1 %cmp2, %cmp3, !dbg !577
  br i1 %or.cond, label %land.lhs.true4, label %.if.end_crit_edge, !dbg !577

.if.end_crit_edge:                                ; preds = %41
  %.pre = select i1 %4, i32 %3, i32 0, !dbg !578
  br label %if.end, !dbg !577

land.lhs.true4:                                   ; preds = %41
  %42 = select i1 %4, i32 %3, i32 0, !dbg !580
  br i1 %4, label %43, label %44, !dbg !580, !prof !88

; <label>:43:                                     ; preds = %land.lhs.true4
  store i32 %42, i32* @__msan_origin_tls, align 4, !dbg !580
  call void @__msan_warning_noreturn() #5, !dbg !580
  call void asm sideeffect "", ""() #5, !dbg !580
  unreachable, !dbg !580

; <label>:44:                                     ; preds = %land.lhs.true4
  %45 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @head, i64 0, i64 0), align 16, !dbg !580, !tbaa !79
  %_msld128 = load i64, i64* inttoptr (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080) to i64*), align 16, !dbg !581
  %46 = ptrtoint %struct.block* %45 to i64, !dbg !581
  %47 = xor i64 %46, %20, !dbg !581
  %48 = xor i64 %_msld128, -1, !dbg !581
  %49 = and i64 %47, %48, !dbg !581
  %50 = icmp eq i64 %49, 0, !dbg !581
  %51 = icmp ne i64 %_msld128, 0, !dbg !581
  %_msprop_icmp129 = and i1 %51, %50, !dbg !581
  br i1 %_msprop_icmp129, label %52, label %54, !dbg !582, !prof !88

; <label>:52:                                     ; preds = %44
  %53 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080), i64 17592186044416) to i32*), align 16, !dbg !581
  store i32 %53, i32* @__msan_origin_tls, align 4, !dbg !582
  call void @__msan_warning_noreturn() #5, !dbg !582
  call void asm sideeffect "", ""() #5, !dbg !582
  unreachable, !dbg !582

; <label>:54:                                     ; preds = %44
  %cmp5 = icmp eq %struct.block* %45, %block, !dbg !581
  br i1 %cmp5, label %if.then6, label %if.end, !dbg !582

if.then6:                                         ; preds = %54
  br i1 false, label %55, label %56, !dbg !583, !prof !88

; <label>:55:                                     ; preds = %if.then6
  unreachable, !dbg !583

; <label>:56:                                     ; preds = %if.then6
  store i64 0, i64* inttoptr (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080) to i64*), align 16, !dbg !583
  store %struct.block* null, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @head, i64 0, i64 0), align 16, !dbg !583, !tbaa !79
  store i64 0, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @tail to i64), i64 87960930222080) to i64*), align 8, !dbg !585
  store %struct.block* null, %struct.block** @tail, align 8, !dbg !585, !tbaa !79
  br i1 false, label %57, label %58, !dbg !586, !prof !88

; <label>:57:                                     ; preds = %56
  unreachable, !dbg !586

; <label>:58:                                     ; preds = %56
  store i64 0, i64* %13, align 8, !dbg !586
  store %struct.block* null, %struct.block** %next, align 8, !dbg !586, !tbaa !276
  br label %return, !dbg !587

if.end:                                           ; preds = %.if.end_crit_edge, %54
  %.pre-phi = phi i32 [ %.pre, %.if.end_crit_edge ], [ %42, %54 ], !dbg !578
  br i1 %4, label %59, label %60, !dbg !578, !prof !88

; <label>:59:                                     ; preds = %if.end
  store i32 %.pre-phi, i32* @__msan_origin_tls, align 4, !dbg !578
  call void @__msan_warning_noreturn() #5, !dbg !578
  call void asm sideeffect "", ""() #5, !dbg !578
  unreachable, !dbg !578

; <label>:60:                                     ; preds = %if.end
  %61 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @head, i64 0, i64 0), align 16, !dbg !578, !tbaa !79
  %_msld131 = load i64, i64* inttoptr (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080) to i64*), align 16, !dbg !588
  %62 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080), i64 17592186044416) to i32*), align 16, !dbg !588
  %63 = ptrtoint %struct.block* %61 to i64, !dbg !588
  %64 = xor i64 %63, %20, !dbg !588
  %65 = xor i64 %_msld131, -1, !dbg !588
  %66 = and i64 %64, %65, !dbg !588
  %67 = icmp eq i64 %66, 0, !dbg !588
  %68 = icmp ne i64 %_msld131, 0, !dbg !588
  %_msprop_icmp132 = and i1 %68, %67, !dbg !588
  br i1 %_msprop_icmp132, label %69, label %70, !dbg !589, !prof !88

; <label>:69:                                     ; preds = %60
  store i32 %62, i32* @__msan_origin_tls, align 4, !dbg !589
  call void @__msan_warning_noreturn() #5, !dbg !589
  call void asm sideeffect "", ""() #5, !dbg !589
  unreachable, !dbg !589

; <label>:70:                                     ; preds = %60
  %cmp10 = icmp eq %struct.block* %61, %block, !dbg !588
  br i1 %cmp10, label %if.then11, label %if.end18, !dbg !589

if.then11:                                        ; preds = %70
  br i1 %68, label %71, label %72, !dbg !590, !prof !88

; <label>:71:                                     ; preds = %if.then11
  store i32 %62, i32* @__msan_origin_tls, align 4, !dbg !590
  call void @__msan_warning_noreturn() #5, !dbg !590
  call void asm sideeffect "", ""() #5, !dbg !590
  unreachable, !dbg !590

; <label>:72:                                     ; preds = %if.then11
  %73 = ptrtoint %struct.block** %next to i64, !dbg !592
  %74 = xor i64 %73, 87960930222080, !dbg !592
  %75 = inttoptr i64 %74 to i64*, !dbg !592
  %76 = add i64 %74, 17592186044416, !dbg !592
  %77 = inttoptr i64 %76 to i32*, !dbg !592
  %_msld133 = load i64, i64* %75, align 8, !dbg !592
  %78 = load i32, i32* %77, align 8, !dbg !592
  br i1 false, label %79, label %80, !dbg !592, !prof !88

; <label>:79:                                     ; preds = %72
  unreachable, !dbg !592

; <label>:80:                                     ; preds = %72
  store i64 %_msld133, i64* inttoptr (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080) to i64*), align 16, !dbg !592
  %_mscmp195 = icmp ne i64 %_msld133, 0, !dbg !592
  br i1 %_mscmp195, label %81, label %86, !dbg !592, !prof !88

; <label>:81:                                     ; preds = %80
  %82 = call i32 @__msan_chain_origin(i32 %78) #5, !dbg !592
  %83 = zext i32 %82 to i64, !dbg !592
  %84 = shl nuw i64 %83, 32, !dbg !592
  %85 = or i64 %84, %83, !dbg !592
  store i64 %85, i64* inttoptr (i64 add (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080), i64 17592186044416) to i64*), align 16, !dbg !592
  br label %86, !dbg !592

; <label>:86:                                     ; preds = %80, %81
  store i64 %17, i64* bitcast ([10 x %struct.block*]* @head to i64*), align 16, !dbg !592, !tbaa !79
  %87 = getelementptr inbounds %struct.block, %struct.block* %26, i64 0, i32 1, !dbg !593
  %88 = bitcast %union.anon* %87 to i64*, !dbg !594
  br i1 %33, label %89, label %90, !dbg !594, !prof !88

; <label>:89:                                     ; preds = %86
  store i32 %27, i32* @__msan_origin_tls, align 4, !dbg !594
  call void @__msan_warning_noreturn() #5, !dbg !594
  call void asm sideeffect "", ""() #5, !dbg !594
  unreachable, !dbg !594

; <label>:90:                                     ; preds = %86
  %91 = ptrtoint %union.anon* %87 to i64, !dbg !594
  %92 = xor i64 %91, 87960930222080, !dbg !594
  %93 = inttoptr i64 %92 to i64*, !dbg !594
  store i64 %_msld133, i64* %93, align 8, !dbg !594
  br i1 %_mscmp195, label %94, label %101, !dbg !594, !prof !88

; <label>:94:                                     ; preds = %90
  %95 = add i64 %92, 17592186044416, !dbg !594
  %96 = call i32 @__msan_chain_origin(i32 %78) #5, !dbg !594
  %97 = zext i32 %96 to i64, !dbg !594
  %98 = shl nuw i64 %97, 32, !dbg !594
  %99 = or i64 %98, %97, !dbg !594
  %100 = inttoptr i64 %95 to i64*, !dbg !594
  store i64 %99, i64* %100, align 8, !dbg !594
  br label %101, !dbg !594

; <label>:101:                                    ; preds = %90, %94
  store i64 %17, i64* %88, align 8, !dbg !594, !tbaa !276
  br i1 false, label %102, label %103, !dbg !595, !prof !88

; <label>:102:                                    ; preds = %101
  unreachable, !dbg !595

; <label>:103:                                    ; preds = %101
  store i64 0, i64* %13, align 8, !dbg !595
  store %struct.block* null, %struct.block** %next, align 8, !dbg !595, !tbaa !276
  br label %return, !dbg !596

if.end18:                                         ; preds = %70
  br i1 %_msprop_icmp127, label %104, label %105, !dbg !597, !prof !88

; <label>:104:                                    ; preds = %if.end18
  store i32 %27, i32* @__msan_origin_tls, align 4, !dbg !597
  call void @__msan_warning_noreturn() #5, !dbg !597
  call void asm sideeffect "", ""() #5, !dbg !597
  unreachable, !dbg !597

; <label>:105:                                    ; preds = %if.end18
  br i1 %cmp3, label %while.cond.preheader, label %while.cond30.preheader, !dbg !597

while.cond30.preheader:                           ; preds = %105
  br label %while.cond30, !dbg !598

while.cond.preheader:                             ; preds = %105
  br label %while.cond, !dbg !599

while.cond:                                       ; preds = %while.cond.preheader, %124
  %_msphi_s = phi i64 [ %_msld134, %124 ], [ %_msld131, %while.cond.preheader ], !dbg !600
  %_msphi_o = phi i32 [ %114, %124 ], [ %62, %while.cond.preheader ], !dbg !600
  %cur.0 = phi %struct.block* [ %108, %124 ], [ %61, %while.cond.preheader ], !dbg !600
  call void @llvm.dbg.value(metadata %struct.block* %cur.0, metadata !559, metadata !DIExpression()), !dbg !602
  %next22 = getelementptr inbounds %struct.block, %struct.block* %cur.0, i64 0, i32 1, i32 0, i32 0, !dbg !599
  %_mscmp169 = icmp eq i64 %_msphi_s, 0, !dbg !599
  br i1 %_mscmp169, label %107, label %106, !dbg !599, !prof !91

; <label>:106:                                    ; preds = %while.cond
  store i32 %_msphi_o, i32* @__msan_origin_tls, align 4, !dbg !599
  call void @__msan_warning_noreturn() #5, !dbg !599
  call void asm sideeffect "", ""() #5, !dbg !599
  unreachable, !dbg !599

; <label>:107:                                    ; preds = %while.cond
  %108 = load %struct.block*, %struct.block** %next22, align 8, !dbg !599, !tbaa !276
  %109 = ptrtoint %struct.block** %next22 to i64, !dbg !603
  %110 = xor i64 %109, 87960930222080, !dbg !603
  %111 = inttoptr i64 %110 to i64*, !dbg !603
  %112 = add i64 %110, 17592186044416, !dbg !603
  %113 = inttoptr i64 %112 to i32*, !dbg !603
  %_msld134 = load i64, i64* %111, align 8, !dbg !603
  %114 = load i32, i32* %113, align 8, !dbg !603
  %115 = ptrtoint %struct.block* %108 to i64, !dbg !603
  %116 = xor i64 %115, %28, !dbg !603
  %117 = or i64 %_msld134, %_msld126, !dbg !603
  %118 = xor i64 %117, -1, !dbg !603
  %119 = and i64 %116, %118, !dbg !603
  %120 = icmp eq i64 %119, 0, !dbg !603
  %121 = icmp ne i64 %117, 0, !dbg !603
  %_msprop_icmp135 = and i1 %121, %120, !dbg !603
  br i1 %_msprop_icmp135, label %122, label %124, !dbg !604, !prof !88

; <label>:122:                                    ; preds = %107
  %123 = select i1 %33, i32 %27, i32 %114, !dbg !603
  store i32 %123, i32* @__msan_origin_tls, align 4, !dbg !604
  call void @__msan_warning_noreturn() #5, !dbg !604
  call void asm sideeffect "", ""() #5, !dbg !604
  unreachable, !dbg !604

; <label>:124:                                    ; preds = %107
  %cmp23 = icmp eq %struct.block* %108, %block, !dbg !603
  br i1 %cmp23, label %while.end, label %while.cond, !dbg !604, !llvm.loop !605

while.end:                                        ; preds = %124
  call void @llvm.dbg.value(metadata %struct.block* %cur.0, metadata !559, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata %struct.block* %cur.0, metadata !559, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata %struct.block* %cur.0, metadata !559, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata %struct.block* %cur.0, metadata !559, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata %struct.block* %cur.0, metadata !559, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata %struct.block* %cur.0, metadata !559, metadata !DIExpression()), !dbg !602
  store i64 0, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @tail to i64), i64 87960930222080) to i64*), align 8, !dbg !607
  br i1 false, label %125, label %126, !dbg !607, !prof !88

; <label>:125:                                    ; preds = %while.end
  br label %126, !dbg !607

; <label>:126:                                    ; preds = %while.end, %125
  store %struct.block* %cur.0, %struct.block** @tail, align 8, !dbg !607, !tbaa !79
  br i1 false, label %127, label %128, !dbg !608, !prof !88

; <label>:127:                                    ; preds = %126
  unreachable, !dbg !608

; <label>:128:                                    ; preds = %126
  %129 = load i64, i64* bitcast ([10 x %struct.block*]* @head to i64*), align 16, !dbg !608, !tbaa !79
  %_msld136 = load i64, i64* inttoptr (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080) to i64*), align 16, !dbg !609
  %130 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080), i64 17592186044416) to i32*), align 16, !dbg !609
  %131 = bitcast %struct.block** %next22 to i64*, !dbg !609
  br i1 false, label %132, label %133, !dbg !609, !prof !88

; <label>:132:                                    ; preds = %128
  unreachable, !dbg !609

; <label>:133:                                    ; preds = %128
  %134 = ptrtoint %struct.block** %next22 to i64, !dbg !609
  %135 = xor i64 %134, 87960930222080, !dbg !609
  %136 = inttoptr i64 %135 to i64*, !dbg !609
  store i64 %_msld136, i64* %136, align 8, !dbg !609
  %_mscmp198 = icmp eq i64 %_msld136, 0, !dbg !609
  br i1 %_mscmp198, label %144, label %137, !dbg !609, !prof !91

; <label>:137:                                    ; preds = %133
  %138 = add i64 %135, 17592186044416, !dbg !609
  %139 = call i32 @__msan_chain_origin(i32 %130) #5, !dbg !609
  %140 = zext i32 %139 to i64, !dbg !609
  %141 = shl nuw i64 %140, 32, !dbg !609
  %142 = or i64 %141, %140, !dbg !609
  %143 = inttoptr i64 %138 to i64*, !dbg !609
  store i64 %142, i64* %143, align 8, !dbg !609
  br label %144, !dbg !609

; <label>:144:                                    ; preds = %133, %137
  store i64 %129, i64* %131, align 8, !dbg !609, !tbaa !276
  br label %return, !dbg !610

while.cond30:                                     ; preds = %while.cond30.preheader, %161
  %_msphi_s137 = phi i64 [ %_msld139, %161 ], [ %_msld131, %while.cond30.preheader ], !dbg !611
  %_msphi_o138 = phi i32 [ %153, %161 ], [ %62, %while.cond30.preheader ], !dbg !611
  %cur28.0 = phi %struct.block* [ %147, %161 ], [ %61, %while.cond30.preheader ], !dbg !611
  call void @llvm.dbg.value(metadata %struct.block* %cur28.0, metadata !564, metadata !DIExpression()), !dbg !613
  %next31 = getelementptr inbounds %struct.block, %struct.block* %cur28.0, i64 0, i32 1, i32 0, i32 0, !dbg !598
  %_mscmp173 = icmp eq i64 %_msphi_s137, 0, !dbg !598
  br i1 %_mscmp173, label %146, label %145, !dbg !598, !prof !91

; <label>:145:                                    ; preds = %while.cond30
  store i32 %_msphi_o138, i32* @__msan_origin_tls, align 4, !dbg !598
  call void @__msan_warning_noreturn() #5, !dbg !598
  call void asm sideeffect "", ""() #5, !dbg !598
  unreachable, !dbg !598

; <label>:146:                                    ; preds = %while.cond30
  %147 = load %struct.block*, %struct.block** %next31, align 8, !dbg !598, !tbaa !276
  %148 = ptrtoint %struct.block** %next31 to i64, !dbg !614
  %149 = xor i64 %148, 87960930222080, !dbg !614
  %150 = inttoptr i64 %149 to i64*, !dbg !614
  %151 = add i64 %149, 17592186044416, !dbg !614
  %152 = inttoptr i64 %151 to i32*, !dbg !614
  %_msld139 = load i64, i64* %150, align 8, !dbg !614
  %153 = load i32, i32* %152, align 8, !dbg !614
  %154 = ptrtoint %struct.block* %147 to i64, !dbg !614
  %155 = xor i64 %154, %20, !dbg !614
  %156 = xor i64 %_msld139, -1, !dbg !614
  %157 = and i64 %155, %156, !dbg !614
  %158 = icmp eq i64 %157, 0, !dbg !614
  %159 = icmp ne i64 %_msld139, 0, !dbg !614
  %_msprop_icmp140 = and i1 %159, %158, !dbg !614
  br i1 %_msprop_icmp140, label %160, label %161, !dbg !615, !prof !88

; <label>:160:                                    ; preds = %146
  store i32 %153, i32* @__msan_origin_tls, align 4, !dbg !615
  call void @__msan_warning_noreturn() #5, !dbg !615
  call void asm sideeffect "", ""() #5, !dbg !615
  unreachable, !dbg !615

; <label>:161:                                    ; preds = %146
  %cmp32 = icmp eq %struct.block* %147, %block, !dbg !614
  br i1 %cmp32, label %while.end35, label %while.cond30, !dbg !615, !llvm.loop !616

while.end35:                                      ; preds = %161
  call void @llvm.dbg.value(metadata %struct.block* %cur28.0, metadata !564, metadata !DIExpression()), !dbg !613
  call void @llvm.dbg.value(metadata %struct.block* %cur28.0, metadata !564, metadata !DIExpression()), !dbg !613
  call void @llvm.dbg.value(metadata %struct.block* %cur28.0, metadata !564, metadata !DIExpression()), !dbg !613
  call void @llvm.dbg.value(metadata %struct.block* %cur28.0, metadata !564, metadata !DIExpression()), !dbg !613
  br i1 false, label %162, label %163, !dbg !618, !prof !88

; <label>:162:                                    ; preds = %while.end35
  unreachable, !dbg !618

; <label>:163:                                    ; preds = %while.end35
  %164 = ptrtoint %struct.block** %next to i64, !dbg !619
  %165 = xor i64 %164, 87960930222080, !dbg !619
  %166 = inttoptr i64 %165 to i64*, !dbg !619
  %167 = add i64 %165, 17592186044416, !dbg !619
  %168 = inttoptr i64 %167 to i32*, !dbg !619
  %_msld141 = load i64, i64* %166, align 8, !dbg !619
  %169 = load i32, i32* %168, align 8, !dbg !619
  %170 = bitcast %struct.block** %next31 to i64*, !dbg !619
  br i1 false, label %171, label %172, !dbg !619, !prof !88

; <label>:171:                                    ; preds = %163
  unreachable, !dbg !619

; <label>:172:                                    ; preds = %163
  %173 = ptrtoint %struct.block** %next31 to i64, !dbg !619
  %174 = xor i64 %173, 87960930222080, !dbg !619
  %175 = inttoptr i64 %174 to i64*, !dbg !619
  store i64 %_msld141, i64* %175, align 8, !dbg !619
  %_mscmp199 = icmp eq i64 %_msld141, 0, !dbg !619
  br i1 %_mscmp199, label %183, label %176, !dbg !619, !prof !91

; <label>:176:                                    ; preds = %172
  %177 = add i64 %174, 17592186044416, !dbg !619
  %178 = call i32 @__msan_chain_origin(i32 %169) #5, !dbg !619
  %179 = zext i32 %178 to i64, !dbg !619
  %180 = shl nuw i64 %179, 32, !dbg !619
  %181 = or i64 %180, %179, !dbg !619
  %182 = inttoptr i64 %177 to i64*, !dbg !619
  store i64 %181, i64* %182, align 8, !dbg !619
  br label %183, !dbg !619

; <label>:183:                                    ; preds = %172, %176
  store i64 %17, i64* %170, align 8, !dbg !619, !tbaa !276
  br i1 false, label %184, label %185, !dbg !620, !prof !88

; <label>:184:                                    ; preds = %183
  unreachable, !dbg !620

; <label>:185:                                    ; preds = %183
  store i64 0, i64* %13, align 8, !dbg !620
  store %struct.block* null, %struct.block** %next, align 8, !dbg !620, !tbaa !276
  br label %return, !dbg !621

if.end39:                                         ; preds = %19
  %prev = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 1, !dbg !622
  br i1 false, label %186, label %187, !dbg !622, !prof !88

; <label>:186:                                    ; preds = %if.end39
  unreachable, !dbg !622

; <label>:187:                                    ; preds = %if.end39
  %188 = load %struct.block*, %struct.block** %prev, align 8, !dbg !622, !tbaa !276
  %189 = ptrtoint %struct.block** %prev to i64, !dbg !623
  %190 = xor i64 %189, 87960930222080, !dbg !623
  %191 = inttoptr i64 %190 to i64*, !dbg !623
  %192 = add i64 %190, 17592186044416, !dbg !623
  %193 = inttoptr i64 %192 to i32*, !dbg !623
  %_msld142 = load i64, i64* %191, align 8, !dbg !623
  %194 = load i32, i32* %193, align 8, !dbg !623
  %195 = ptrtoint %struct.block* %188 to i64, !dbg !623
  %196 = xor i64 %195, %17, !dbg !623
  %197 = or i64 %_msld142, %_msld, !dbg !623
  %198 = xor i64 %197, -1, !dbg !623
  %199 = and i64 %196, %198, !dbg !623
  %200 = icmp eq i64 %199, 0, !dbg !623
  %201 = icmp ne i64 %197, 0, !dbg !623
  %_msprop_icmp143 = and i1 %201, %200, !dbg !623
  %202 = icmp ne i64 %_msld142, 0, !dbg !623
  %cmp41 = icmp eq %struct.block* %10, %188, !dbg !623
  %203 = ptrtoint %struct.block* %block to i64, !dbg !624
  %204 = xor i64 %17, %203, !dbg !624
  %205 = xor i64 %_msld, -1, !dbg !624
  %206 = and i64 %204, %205, !dbg !624
  %207 = icmp eq i64 %206, 0, !dbg !624
  %208 = icmp ne i64 %_msld, 0, !dbg !624
  %_msprop_icmp144 = and i1 %208, %207, !dbg !624
  %cmp44 = icmp eq %struct.block* %10, %block, !dbg !624
  %209 = and i1 %_msprop_icmp144, %_msprop_icmp143, !dbg !625
  %210 = and i1 %cmp44, %_msprop_icmp143, !dbg !625
  %211 = and i1 %_msprop_icmp144, %cmp41, !dbg !625
  %212 = or i1 %211, %210, !dbg !625
  %213 = or i1 %209, %212, !dbg !625
  %or.cond121 = and i1 %cmp44, %cmp41, !dbg !625
  %214 = xor i64 %195, %203, !dbg !626
  %215 = xor i64 %_msld142, -1, !dbg !626
  %216 = and i64 %214, %215, !dbg !626
  %217 = icmp eq i64 %216, 0, !dbg !626
  %_msprop_icmp145 = and i1 %202, %217, !dbg !626
  %cmp47 = icmp eq %struct.block* %188, %block, !dbg !626
  %218 = and i1 %_msprop_icmp145, %213, !dbg !625
  %219 = and i1 %cmp47, %213, !dbg !625
  %220 = and i1 %or.cond121, %_msprop_icmp145, !dbg !625
  %221 = or i1 %220, %219, !dbg !625
  %222 = or i1 %218, %221, !dbg !625
  %223 = select i1 %4, i32 %3, i32 0, !dbg !627
  %arrayidx49 = getelementptr inbounds [10 x %struct.block*], [10 x %struct.block*]* @head, i64 0, i64 %call1, !dbg !627
  br i1 %222, label %224, label %228, !dbg !625, !prof !88

; <label>:224:                                    ; preds = %187
  %225 = and i1 %_msprop_icmp143, %202, !dbg !625
  %226 = select i1 %225, i32 %194, i32 %16, !dbg !625
  %227 = select i1 %213, i32 %226, i32 %194, !dbg !625
  store i32 %227, i32* @__msan_origin_tls, align 4, !dbg !625
  call void @__msan_warning_noreturn() #5, !dbg !625
  call void asm sideeffect "", ""() #5, !dbg !625
  unreachable, !dbg !625

; <label>:228:                                    ; preds = %187
  %or.cond122 = and i1 %cmp47, %or.cond121, !dbg !625
  br i1 %or.cond122, label %if.then48, label %if.end52, !dbg !625

if.then48:                                        ; preds = %228
  br i1 %4, label %229, label %230, !dbg !629, !prof !88

; <label>:229:                                    ; preds = %if.then48
  store i32 %223, i32* @__msan_origin_tls, align 4, !dbg !629
  call void @__msan_warning_noreturn() #5, !dbg !629
  call void asm sideeffect "", ""() #5, !dbg !629
  unreachable, !dbg !629

; <label>:230:                                    ; preds = %if.then48
  %231 = ptrtoint %struct.block** %arrayidx49 to i64, !dbg !629
  %232 = xor i64 %231, 87960930222080, !dbg !629
  %233 = inttoptr i64 %232 to i64*, !dbg !629
  store i64 0, i64* %233, align 8, !dbg !629
  store %struct.block* null, %struct.block** %arrayidx49, align 8, !dbg !629, !tbaa !79
  %234 = bitcast %struct.block** %next to i8*, !dbg !631
  %235 = call i8* @__msan_memset(i8* %234, i32 0, i64 16) #5, !dbg !632
  br label %return, !dbg !631

if.end52:                                         ; preds = %228
  br i1 %4, label %236, label %237, !dbg !633, !prof !88

; <label>:236:                                    ; preds = %if.end52
  store i32 %223, i32* @__msan_origin_tls, align 4, !dbg !633
  call void @__msan_warning_noreturn() #5, !dbg !633
  call void asm sideeffect "", ""() #5, !dbg !633
  unreachable, !dbg !633

; <label>:237:                                    ; preds = %if.end52
  %238 = load %struct.block*, %struct.block** %arrayidx49, align 8, !dbg !633, !tbaa !79
  %239 = ptrtoint %struct.block** %arrayidx49 to i64, !dbg !634
  %240 = xor i64 %239, 87960930222080, !dbg !634
  %241 = inttoptr i64 %240 to i64*, !dbg !634
  %242 = add i64 %240, 17592186044416, !dbg !634
  %243 = inttoptr i64 %242 to i32*, !dbg !634
  %_msld147 = load i64, i64* %241, align 8, !dbg !634
  %244 = load i32, i32* %243, align 8, !dbg !634
  %245 = ptrtoint %struct.block* %238 to i64, !dbg !634
  %246 = xor i64 %245, %203, !dbg !634
  %247 = xor i64 %_msld147, -1, !dbg !634
  %248 = and i64 %246, %247, !dbg !634
  %249 = icmp eq i64 %248, 0, !dbg !634
  %250 = icmp ne i64 %_msld147, 0, !dbg !634
  %_msprop_icmp148 = and i1 %250, %249, !dbg !634
  br i1 %_msprop_icmp148, label %251, label %252, !dbg !635, !prof !88

; <label>:251:                                    ; preds = %237
  store i32 %244, i32* @__msan_origin_tls, align 4, !dbg !635
  call void @__msan_warning_noreturn() #5, !dbg !635
  call void asm sideeffect "", ""() #5, !dbg !635
  unreachable, !dbg !635

; <label>:252:                                    ; preds = %237
  %cmp54 = icmp eq %struct.block* %238, %block, !dbg !634
  br i1 %cmp54, label %if.then55, label %if.end67, !dbg !635

if.then55:                                        ; preds = %252
  br i1 %250, label %253, label %254, !dbg !636, !prof !88

; <label>:253:                                    ; preds = %if.then55
  store i32 %244, i32* @__msan_origin_tls, align 4, !dbg !636
  call void @__msan_warning_noreturn() #5, !dbg !636
  call void asm sideeffect "", ""() #5, !dbg !636
  unreachable, !dbg !636

; <label>:254:                                    ; preds = %if.then55
  br i1 false, label %255, label %256, !dbg !638, !prof !88

; <label>:255:                                    ; preds = %254
  unreachable, !dbg !638

; <label>:256:                                    ; preds = %254
  store i64 %_msld, i64* %241, align 8, !dbg !638
  br i1 %208, label %257, label %263, !dbg !638, !prof !88

; <label>:257:                                    ; preds = %256
  %258 = call i32 @__msan_chain_origin(i32 %16) #5, !dbg !638
  %259 = zext i32 %258 to i64, !dbg !638
  %260 = shl nuw i64 %259, 32, !dbg !638
  %261 = or i64 %260, %259, !dbg !638
  %262 = inttoptr i64 %242 to i64*, !dbg !638
  store i64 %261, i64* %262, align 8, !dbg !638
  br label %263, !dbg !638

; <label>:263:                                    ; preds = %256, %257
  store %struct.block* %10, %struct.block** %arrayidx49, align 8, !dbg !638, !tbaa !79
  br i1 false, label %264, label %265, !dbg !639, !prof !88

; <label>:264:                                    ; preds = %263
  unreachable, !dbg !639

; <label>:265:                                    ; preds = %263
  %266 = bitcast %struct.block** %prev to i64*, !dbg !639
  %267 = load i64, i64* %266, align 8, !dbg !639, !tbaa !276
  %268 = ptrtoint %struct.block** %prev to i64, !dbg !640
  %269 = xor i64 %268, 87960930222080, !dbg !640
  %270 = inttoptr i64 %269 to i64*, !dbg !640
  %271 = add i64 %269, 17592186044416, !dbg !640
  %272 = inttoptr i64 %271 to i32*, !dbg !640
  %_msld150 = load i64, i64* %270, align 8, !dbg !640
  %273 = load i32, i32* %272, align 8, !dbg !640
  %prev61 = getelementptr inbounds %struct.block, %struct.block* %10, i64 0, i32 1, i32 0, i32 1, !dbg !640
  %274 = bitcast %struct.block** %prev61 to i64*, !dbg !641
  br i1 %208, label %275, label %276, !dbg !641, !prof !88

; <label>:275:                                    ; preds = %265
  store i32 %16, i32* @__msan_origin_tls, align 4, !dbg !641
  call void @__msan_warning_noreturn() #5, !dbg !641
  call void asm sideeffect "", ""() #5, !dbg !641
  unreachable, !dbg !641

; <label>:276:                                    ; preds = %265
  %277 = ptrtoint %struct.block** %prev61 to i64, !dbg !641
  %278 = xor i64 %277, 87960930222080, !dbg !641
  %279 = inttoptr i64 %278 to i64*, !dbg !641
  store i64 %_msld150, i64* %279, align 8, !dbg !641
  %_mscmp201 = icmp eq i64 %_msld150, 0, !dbg !641
  br i1 %_mscmp201, label %287, label %280, !dbg !641, !prof !91

; <label>:280:                                    ; preds = %276
  %281 = add i64 %278, 17592186044416, !dbg !641
  %282 = call i32 @__msan_chain_origin(i32 %273) #5, !dbg !641
  %283 = zext i32 %282 to i64, !dbg !641
  %284 = shl nuw i64 %283, 32, !dbg !641
  %285 = or i64 %284, %283, !dbg !641
  %286 = inttoptr i64 %281 to i64*, !dbg !641
  store i64 %285, i64* %286, align 8, !dbg !641
  br label %287, !dbg !641

; <label>:287:                                    ; preds = %276, %280
  store i64 %267, i64* %274, align 8, !dbg !641, !tbaa !276
  br i1 false, label %288, label %289, !dbg !642, !prof !88

; <label>:288:                                    ; preds = %287
  unreachable, !dbg !642

; <label>:289:                                    ; preds = %287
  %290 = bitcast %struct.block** %arrayidx49 to i64*, !dbg !642
  %291 = load i64, i64* %290, align 8, !dbg !642, !tbaa !79
  %292 = ptrtoint %struct.block** %arrayidx49 to i64, !dbg !643
  %293 = xor i64 %292, 87960930222080, !dbg !643
  %294 = inttoptr i64 %293 to i64*, !dbg !643
  %295 = add i64 %293, 17592186044416, !dbg !643
  %296 = inttoptr i64 %295 to i32*, !dbg !643
  %_msld151 = load i64, i64* %294, align 8, !dbg !643
  %297 = load i32, i32* %296, align 8, !dbg !643
  br i1 false, label %298, label %299, !dbg !643, !prof !88

; <label>:298:                                    ; preds = %289
  unreachable, !dbg !643

; <label>:299:                                    ; preds = %289
  %300 = load %struct.block*, %struct.block** %prev, align 8, !dbg !643, !tbaa !276
  %_msld152 = load i64, i64* %191, align 8, !dbg !644
  %301 = getelementptr inbounds %struct.block, %struct.block* %300, i64 0, i32 1, !dbg !644
  %302 = bitcast %union.anon* %301 to i64*, !dbg !645
  %_mscmp189 = icmp eq i64 %_msld152, 0, !dbg !645
  br i1 %_mscmp189, label %305, label %303, !dbg !645, !prof !91

; <label>:303:                                    ; preds = %299
  %304 = load i32, i32* %193, align 8, !dbg !644
  store i32 %304, i32* @__msan_origin_tls, align 4, !dbg !645
  call void @__msan_warning_noreturn() #5, !dbg !645
  call void asm sideeffect "", ""() #5, !dbg !645
  unreachable, !dbg !645

; <label>:305:                                    ; preds = %299
  %306 = ptrtoint %union.anon* %301 to i64, !dbg !645
  %307 = xor i64 %306, 87960930222080, !dbg !645
  %308 = inttoptr i64 %307 to i64*, !dbg !645
  store i64 %_msld151, i64* %308, align 8, !dbg !645
  %_mscmp202 = icmp eq i64 %_msld151, 0, !dbg !645
  br i1 %_mscmp202, label %316, label %309, !dbg !645, !prof !91

; <label>:309:                                    ; preds = %305
  %310 = add i64 %307, 17592186044416, !dbg !645
  %311 = call i32 @__msan_chain_origin(i32 %297) #5, !dbg !645
  %312 = zext i32 %311 to i64, !dbg !645
  %313 = shl nuw i64 %312, 32, !dbg !645
  %314 = or i64 %313, %312, !dbg !645
  %315 = inttoptr i64 %310 to i64*, !dbg !645
  store i64 %314, i64* %315, align 8, !dbg !645
  br label %316, !dbg !645

; <label>:316:                                    ; preds = %305, %309
  store i64 %291, i64* %302, align 8, !dbg !645, !tbaa !276
  %317 = bitcast %struct.block** %next to i8*, !dbg !646
  %318 = call i8* @__msan_memset(i8* %317, i32 0, i64 16) #5, !dbg !647
  br label %return, !dbg !646

if.end67:                                         ; preds = %252
  br i1 false, label %319, label %320, !dbg !648, !prof !88

; <label>:319:                                    ; preds = %if.end67
  unreachable, !dbg !648

; <label>:320:                                    ; preds = %if.end67
  %321 = ptrtoint %struct.block** %next to i64, !dbg !649
  %322 = xor i64 %321, 87960930222080, !dbg !649
  %323 = inttoptr i64 %322 to i64*, !dbg !649
  %324 = add i64 %322, 17592186044416, !dbg !649
  %325 = inttoptr i64 %324 to i32*, !dbg !649
  %_msld153 = load i64, i64* %323, align 8, !dbg !649
  %326 = load i32, i32* %325, align 8, !dbg !649
  %327 = getelementptr inbounds %struct.block, %struct.block* %188, i64 0, i32 1, !dbg !649
  %328 = bitcast %union.anon* %327 to i64*, !dbg !650
  br i1 %202, label %329, label %330, !dbg !650, !prof !88

; <label>:329:                                    ; preds = %320
  store i32 %194, i32* @__msan_origin_tls, align 4, !dbg !650
  call void @__msan_warning_noreturn() #5, !dbg !650
  call void asm sideeffect "", ""() #5, !dbg !650
  unreachable, !dbg !650

; <label>:330:                                    ; preds = %320
  %331 = ptrtoint %union.anon* %327 to i64, !dbg !650
  %332 = xor i64 %331, 87960930222080, !dbg !650
  %333 = inttoptr i64 %332 to i64*, !dbg !650
  store i64 %_msld153, i64* %333, align 8, !dbg !650
  %_mscmp203 = icmp eq i64 %_msld153, 0, !dbg !650
  br i1 %_mscmp203, label %341, label %334, !dbg !650, !prof !91

; <label>:334:                                    ; preds = %330
  %335 = add i64 %332, 17592186044416, !dbg !650
  %336 = call i32 @__msan_chain_origin(i32 %326) #5, !dbg !650
  %337 = zext i32 %336 to i64, !dbg !650
  %338 = shl nuw i64 %337, 32, !dbg !650
  %339 = or i64 %338, %337, !dbg !650
  %340 = inttoptr i64 %335 to i64*, !dbg !650
  store i64 %339, i64* %340, align 8, !dbg !650
  br label %341, !dbg !650

; <label>:341:                                    ; preds = %330, %334
  store i64 %17, i64* %328, align 8, !dbg !650, !tbaa !276
  br i1 false, label %342, label %343, !dbg !651, !prof !88

; <label>:342:                                    ; preds = %341
  unreachable, !dbg !651

; <label>:343:                                    ; preds = %341
  %344 = bitcast %struct.block** %prev to i64*, !dbg !651
  %345 = load i64, i64* %344, align 8, !dbg !651, !tbaa !276
  %346 = ptrtoint %struct.block** %prev to i64, !dbg !652
  %347 = xor i64 %346, 87960930222080, !dbg !652
  %348 = inttoptr i64 %347 to i64*, !dbg !652
  %349 = add i64 %347, 17592186044416, !dbg !652
  %350 = inttoptr i64 %349 to i32*, !dbg !652
  %_msld154 = load i64, i64* %348, align 8, !dbg !652
  %351 = load i32, i32* %350, align 8, !dbg !652
  br i1 false, label %352, label %353, !dbg !652, !prof !88

; <label>:352:                                    ; preds = %343
  unreachable, !dbg !652

; <label>:353:                                    ; preds = %343
  %354 = load %struct.block*, %struct.block** %next, align 8, !dbg !652, !tbaa !276
  %_msld155 = load i64, i64* %13, align 8, !dbg !653
  %prev73 = getelementptr inbounds %struct.block, %struct.block* %354, i64 0, i32 1, i32 0, i32 1, !dbg !653
  %355 = bitcast %struct.block** %prev73 to i64*, !dbg !654
  %_mscmp194 = icmp eq i64 %_msld155, 0, !dbg !654
  br i1 %_mscmp194, label %358, label %356, !dbg !654, !prof !91

; <label>:356:                                    ; preds = %353
  %357 = load i32, i32* %15, align 8, !dbg !653
  store i32 %357, i32* @__msan_origin_tls, align 4, !dbg !654
  call void @__msan_warning_noreturn() #5, !dbg !654
  call void asm sideeffect "", ""() #5, !dbg !654
  unreachable, !dbg !654

; <label>:358:                                    ; preds = %353
  %359 = ptrtoint %struct.block** %prev73 to i64, !dbg !654
  %360 = xor i64 %359, 87960930222080, !dbg !654
  %361 = inttoptr i64 %360 to i64*, !dbg !654
  store i64 %_msld154, i64* %361, align 8, !dbg !654
  %_mscmp204 = icmp eq i64 %_msld154, 0, !dbg !654
  br i1 %_mscmp204, label %369, label %362, !dbg !654, !prof !91

; <label>:362:                                    ; preds = %358
  %363 = add i64 %360, 17592186044416, !dbg !654
  %364 = call i32 @__msan_chain_origin(i32 %351) #5, !dbg !654
  %365 = zext i32 %364 to i64, !dbg !654
  %366 = shl nuw i64 %365, 32, !dbg !654
  %367 = or i64 %366, %365, !dbg !654
  %368 = inttoptr i64 %363 to i64*, !dbg !654
  store i64 %367, i64* %368, align 8, !dbg !654
  br label %369, !dbg !654

; <label>:369:                                    ; preds = %358, %362
  store i64 %345, i64* %355, align 8, !dbg !654, !tbaa !276
  %370 = bitcast %struct.block** %next to i8*, !dbg !655
  %371 = call i8* @__msan_memset(i8* %370, i32 0, i64 16) #5, !dbg !656
  br label %return, !dbg !655

return:                                           ; preds = %369, %316, %230, %185, %144, %103, %58
  ret void, !dbg !655
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc void @write_block(%struct.block* %block, i64 %size, i1 zeroext %alloc, i1 zeroext %prevAlloc, i1 zeroext %prevMini) unnamed_addr #0 !dbg !657 {
entry:
  %0 = load i1, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !669
  %1 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 32) to i32*), align 4, !dbg !669
  %2 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !669
  %3 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !669
  %4 = load i1, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !669
  %5 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !669
  %6 = load i1, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !669
  %7 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !669
  %8 = load i64, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !669
  %9 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !669
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !661, metadata !DIExpression()), !dbg !669
  call void @llvm.dbg.value(metadata i64 %size, metadata !662, metadata !DIExpression()), !dbg !670
  call void @llvm.dbg.value(metadata i1 %alloc, metadata !663, metadata !DIExpression()), !dbg !671
  call void @llvm.dbg.value(metadata i1 %prevAlloc, metadata !664, metadata !DIExpression()), !dbg !672
  call void @llvm.dbg.value(metadata i1 %prevMini, metadata !665, metadata !DIExpression()), !dbg !673
  store i64 %8, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !674
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !674
  store i1 %6, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !674
  store i32 %7, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !674
  store i1 %4, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !674
  store i32 %5, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !674
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !674
  %call = call fastcc i64 @pack(i64 %size, i1 zeroext %alloc, i1 zeroext %prevAlloc), !dbg !674
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !675
  %10 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !675
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !675
  %11 = and i64 %_msret, -5, !dbg !676
  %and = and i64 %call, -5, !dbg !676
  %or = or i64 %call, 4, !dbg !679
  %12 = or i64 %_msret, 4, !dbg !681
  %_msprop_select = select i1 %0, i64 %12, i64 %11, !dbg !681
  %13 = select i1 %0, i32 %1, i32 %10, !dbg !681
  %storemerge = select i1 %prevMini, i64 %or, i64 %and, !dbg !681
  %_mscmp = icmp eq i64 %2, 0, !dbg !682
  br i1 %_mscmp, label %15, label %14, !dbg !682, !prof !91

; <label>:14:                                     ; preds = %entry
  store i32 %3, i32* @__msan_origin_tls, align 4, !dbg !682
  call void @__msan_warning_noreturn() #5, !dbg !682
  call void asm sideeffect "", ""() #5, !dbg !682
  unreachable, !dbg !682

; <label>:15:                                     ; preds = %entry
  %16 = ptrtoint %struct.block* %block to i64, !dbg !682
  %17 = xor i64 %16, 87960930222080, !dbg !682
  %18 = inttoptr i64 %17 to i64*, !dbg !682
  store i64 %_msprop_select, i64* %18, align 8, !dbg !682
  %_mscmp24 = icmp eq i64 %_msprop_select, 0, !dbg !682
  br i1 %_mscmp24, label %26, label %19, !dbg !682, !prof !91

; <label>:19:                                     ; preds = %15
  %20 = add i64 %17, 17592186044416, !dbg !682
  %21 = call i32 @__msan_chain_origin(i32 %13) #5, !dbg !682
  %22 = zext i32 %21 to i64, !dbg !682
  %23 = shl nuw i64 %22, 32, !dbg !682
  %24 = or i64 %23, %22, !dbg !682
  %25 = inttoptr i64 %20 to i64*, !dbg !682
  store i64 %24, i64* %25, align 8, !dbg !682
  br label %26, !dbg !682

; <label>:26:                                     ; preds = %15, %19
  store i64 %storemerge, i64* %header, align 8, !dbg !682, !tbaa !92
  %tobool7.not = xor i1 %alloc, true, !dbg !683
  %27 = xor i64 %size, 16, !dbg !684
  %28 = xor i64 %8, -1, !dbg !684
  %29 = and i64 %27, %28, !dbg !684
  %30 = icmp eq i64 %29, 0, !dbg !684
  %31 = icmp ne i64 %8, 0, !dbg !684
  %_msprop_icmp = and i1 %31, %30, !dbg !684
  %cmp = icmp ne i64 %size, 16, !dbg !684
  %32 = and i1 %6, %_msprop_icmp, !dbg !683
  %33 = and i1 %cmp, %6, !dbg !683
  %34 = and i1 %_msprop_icmp, %tobool7.not, !dbg !683
  %35 = or i1 %33, %34, !dbg !683
  %36 = or i1 %32, %35, !dbg !683
  br i1 %36, label %37, label %39, !dbg !683, !prof !88

; <label>:37:                                     ; preds = %26
  %38 = select i1 %6, i32 %7, i32 %9, !dbg !683
  store i32 %38, i32* @__msan_origin_tls, align 4, !dbg !683
  call void @__msan_warning_noreturn() #5, !dbg !683
  call void asm sideeffect "", ""() #5, !dbg !683
  unreachable, !dbg !683

; <label>:39:                                     ; preds = %26
  %or.cond = and i1 %cmp, %tobool7.not, !dbg !683
  br i1 %or.cond, label %if.then8, label %if.end13, !dbg !683

if.then8:                                         ; preds = %39
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !685
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !685
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !685
  %call9 = call fastcc i64* @header_to_footer(%struct.block* nonnull %block), !dbg !685
  %_msret21 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !686
  call void @llvm.dbg.value(metadata i64* %call9, metadata !666, metadata !DIExpression()), !dbg !686
  %_mscmp23 = icmp eq i64 %_msret21, 0, !dbg !687
  br i1 %_mscmp23, label %42, label %40, !dbg !687, !prof !91

; <label>:40:                                     ; preds = %if.then8
  %41 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !686
  store i32 %41, i32* @__msan_origin_tls, align 4, !dbg !687
  call void @__msan_warning_noreturn() #5, !dbg !687
  call void asm sideeffect "", ""() #5, !dbg !687
  unreachable, !dbg !687

; <label>:42:                                     ; preds = %if.then8
  %43 = ptrtoint i64* %call9 to i64, !dbg !687
  %44 = xor i64 %43, 87960930222080, !dbg !687
  %45 = inttoptr i64 %44 to i64*, !dbg !687
  store i64 %_msret, i64* %45, align 8, !dbg !687
  %_mscmp25 = icmp eq i64 %_msret, 0, !dbg !687
  br i1 %_mscmp25, label %53, label %46, !dbg !687, !prof !91

; <label>:46:                                     ; preds = %42
  %47 = add i64 %44, 17592186044416, !dbg !687
  %48 = call i32 @__msan_chain_origin(i32 %10) #5, !dbg !687
  %49 = zext i32 %48 to i64, !dbg !687
  %50 = shl nuw i64 %49, 32, !dbg !687
  %51 = or i64 %50, %49, !dbg !687
  %52 = inttoptr i64 %47 to i64*, !dbg !687
  store i64 %51, i64* %52, align 8, !dbg !687
  br label %53, !dbg !687

; <label>:53:                                     ; preds = %42, %46
  store i64 %call, i64* %call9, align 8, !dbg !687, !tbaa !227
  br label %if.end13, !dbg !688

if.end13:                                         ; preds = %39, %53
  ret void, !dbg !689
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc void @split_block(%struct.block* %block, i64 %asize) unnamed_addr #0 !dbg !690 {
entry:
  %0 = load i64, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !705
  %1 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !705
  %2 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !705
  %3 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !705
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !694, metadata !DIExpression()), !dbg !705
  call void @llvm.dbg.value(metadata i64 %asize, metadata !695, metadata !DIExpression()), !dbg !706
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !707
  %call = call fastcc i64 @get_size(%struct.block* %block), !dbg !707
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !708
  %4 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !708
  call void @llvm.dbg.value(metadata i64 %call, metadata !696, metadata !DIExpression()), !dbg !708
  %_msprop = or i64 %_msret, %0, !dbg !709
  %5 = icmp ne i64 %0, 0, !dbg !709
  %6 = select i1 %5, i32 %1, i32 %4, !dbg !709
  %sub = sub i64 %call, %asize, !dbg !709
  %7 = xor i64 %_msprop, -1, !dbg !710
  %8 = and i64 %sub, %7, !dbg !710
  %9 = icmp ugt i64 %8, 15, !dbg !710
  %10 = or i64 %_msprop, %sub, !dbg !710
  %11 = icmp ugt i64 %10, 15, !dbg !710
  %12 = xor i1 %9, %11, !dbg !710
  br i1 %12, label %13, label %14, !dbg !711, !prof !88

; <label>:13:                                     ; preds = %entry
  store i32 %6, i32* @__msan_origin_tls, align 4, !dbg !711
  call void @__msan_warning_noreturn() #5, !dbg !711
  call void asm sideeffect "", ""() #5, !dbg !711
  unreachable, !dbg !711

; <label>:14:                                     ; preds = %entry
  %cmp = icmp ugt i64 %sub, 15, !dbg !710
  br i1 %cmp, label %if.then, label %if.else14, !dbg !711

if.then:                                          ; preds = %14
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !712
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !712
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !712
  %call1 = call fastcc zeroext i1 @getPrevMiniStatus(%struct.block* %block), !dbg !712
  %_msret39 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !713
  %15 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !713
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !713
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !713
  store i64 %0, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !713
  store i32 %1, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !713
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !713
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !713
  store i1 %_msret39, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !713
  store i32 %15, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 32) to i32*), align 4, !dbg !713
  call fastcc void @write_block(%struct.block* %block, i64 %asize, i1 zeroext true, i1 zeroext true, i1 zeroext %call1), !dbg !713
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !714
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !714
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !714
  %call2 = call fastcc %struct.block* @find_next(%struct.block* %block), !dbg !714
  %_msret40 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !715
  %16 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !715
  call void @llvm.dbg.value(metadata %struct.block* %call2, metadata !697, metadata !DIExpression()), !dbg !715
  %17 = xor i64 %asize, 16, !dbg !716
  %18 = xor i64 %0, -1, !dbg !716
  %19 = and i64 %17, %18, !dbg !716
  %20 = icmp eq i64 %19, 0, !dbg !716
  %_msprop_icmp = and i1 %5, %20, !dbg !716
  br i1 %_msprop_icmp, label %21, label %22, !dbg !718, !prof !88

; <label>:21:                                     ; preds = %if.then
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !718
  call void @__msan_warning_noreturn() #5, !dbg !718
  call void asm sideeffect "", ""() #5, !dbg !718
  unreachable, !dbg !718

; <label>:22:                                     ; preds = %if.then
  %cmp3 = icmp eq i64 %asize, 16, !dbg !716
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !718

if.then4:                                         ; preds = %22
  store i64 %_msret40, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !719
  store i32 %16, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !719
  store i64 %_msprop, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !719
  store i32 %6, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !719
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !719
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !719
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !719
  call fastcc void @write_block(%struct.block* %call2, i64 %sub, i1 zeroext false, i1 zeroext true, i1 zeroext true), !dbg !719
  br label %if.end, !dbg !721

if.else:                                          ; preds = %22
  store i64 %_msret40, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !722
  store i32 %16, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !722
  store i64 %_msprop, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !722
  store i32 %6, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !722
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !722
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !722
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !722
  call fastcc void @write_block(%struct.block* %call2, i64 %sub, i1 zeroext false, i1 zeroext true, i1 zeroext false), !dbg !722
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  %23 = xor i64 %sub, 16, !dbg !724
  %24 = and i64 %23, %7, !dbg !724
  %25 = icmp eq i64 %24, 0, !dbg !724
  %26 = icmp ne i64 %_msprop, 0, !dbg !724
  %_msprop_icmp41 = and i1 %26, %25, !dbg !724
  br i1 %_msprop_icmp41, label %27, label %28, !dbg !725, !prof !88

; <label>:27:                                     ; preds = %if.end
  store i32 %6, i32* @__msan_origin_tls, align 4, !dbg !725
  call void @__msan_warning_noreturn() #5, !dbg !725
  call void asm sideeffect "", ""() #5, !dbg !725
  unreachable, !dbg !725

; <label>:28:                                     ; preds = %if.end
  %cmp8 = icmp eq i64 %sub, 16, !dbg !724
  br i1 %cmp8, label %if.then9, label %if.end13, !dbg !725

if.then9:                                         ; preds = %28
  store i64 %_msret40, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !726
  store i32 %16, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !726
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !726
  %call10 = call fastcc %struct.block* @find_next(%struct.block* %call2), !dbg !726
  %_msret42 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !727
  %29 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !727
  call void @llvm.dbg.value(metadata %struct.block* %call10, metadata !700, metadata !DIExpression()), !dbg !727
  store i64 %_msret42, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !728
  store i32 %29, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !728
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !728
  %call11 = call fastcc i64 @get_size(%struct.block* %call10), !dbg !728
  %_msret43 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !729
  %30 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !729
  store i64 %_msret42, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !729
  store i32 %29, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !729
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !729
  %call12 = call fastcc zeroext i1 @get_alloc(%struct.block* %call10), !dbg !729
  %_msret44 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !730
  %31 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !730
  store i64 %_msret42, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !730
  store i32 %29, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !730
  store i64 %_msret43, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !730
  store i32 %30, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !730
  store i1 %_msret44, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !730
  store i32 %31, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !730
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !730
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !730
  call fastcc void @write_block(%struct.block* %call10, i64 %call11, i1 zeroext %call12, i1 zeroext false, i1 zeroext true), !dbg !730
  br label %if.end13, !dbg !731

if.end13:                                         ; preds = %if.then9, %28
  store i64 %_msret40, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !732
  store i32 %16, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !732
  call fastcc void @addFree(%struct.block* %call2), !dbg !732
  br label %if.end23, !dbg !733

if.else14:                                        ; preds = %14
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !734
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !734
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !734
  %call16 = call fastcc %struct.block* @find_next(%struct.block* %block), !dbg !734
  %_msret45 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !735
  %32 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !735
  call void @llvm.dbg.value(metadata %struct.block* %call16, metadata !703, metadata !DIExpression()), !dbg !735
  %33 = xor i64 %call, 16, !dbg !736
  %34 = xor i64 %_msret, -1, !dbg !736
  %35 = and i64 %33, %34, !dbg !736
  %36 = icmp eq i64 %35, 0, !dbg !736
  %37 = icmp ne i64 %_msret, 0, !dbg !736
  %_msprop_icmp46 = and i1 %37, %36, !dbg !736
  store i64 %_msret45, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !738
  store i32 %32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !738
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !738
  %call19 = call fastcc i64 @get_size(%struct.block* %call16), !dbg !738
  %_msret47 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !740
  %38 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !740
  br i1 %_msprop_icmp46, label %39, label %40, !dbg !740, !prof !88

; <label>:39:                                     ; preds = %if.else14
  store i32 %4, i32* @__msan_origin_tls, align 4, !dbg !740
  call void @__msan_warning_noreturn() #5, !dbg !740
  call void asm sideeffect "", ""() #5, !dbg !740
  unreachable, !dbg !740

; <label>:40:                                     ; preds = %if.else14
  %cmp17 = icmp eq i64 %call, 16, !dbg !736
  br i1 %cmp17, label %if.then18, label %if.else20, !dbg !740

if.then18:                                        ; preds = %40
  store i64 %_msret45, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !741
  store i32 %32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !741
  store i64 %_msret47, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !741
  store i32 %38, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !741
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !741
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !741
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !741
  call fastcc void @write_block(%struct.block* %call16, i64 %call19, i1 zeroext true, i1 zeroext true, i1 zeroext true), !dbg !741
  br label %if.end23, !dbg !743

if.else20:                                        ; preds = %40
  store i64 %_msret45, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !744
  store i32 %32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !744
  store i64 %_msret47, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !744
  store i32 %38, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !744
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !744
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !744
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !744
  call fastcc void @write_block(%struct.block* %call16, i64 %call19, i1 zeroext true, i1 zeroext true, i1 zeroext false), !dbg !744
  br label %if.end23

if.end23:                                         ; preds = %if.then18, %if.else20, %if.end13
  ret void, !dbg !745
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local void @mm_free(i8* %bp) local_unnamed_addr #0 !dbg !746 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !753
  call void @llvm.dbg.value(metadata i8* %bp, metadata !750, metadata !DIExpression()), !dbg !753
  %1 = ptrtoint i8* %bp to i64, !dbg !754
  %2 = xor i64 %0, -1, !dbg !754
  %3 = and i64 %2, %1, !dbg !754
  %4 = icmp eq i64 %3, 0, !dbg !754
  %5 = icmp ne i64 %0, 0, !dbg !754
  %_msprop_icmp = and i1 %5, %4, !dbg !754
  br i1 %_msprop_icmp, label %6, label %8, !dbg !756, !prof !88

; <label>:6:                                      ; preds = %entry
  %7 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !753
  store i32 %7, i32* @__msan_origin_tls, align 4, !dbg !756
  call void @__msan_warning_noreturn() #5, !dbg !756
  call void asm sideeffect "", ""() #5, !dbg !756
  unreachable, !dbg !756

; <label>:8:                                      ; preds = %entry
  %cmp = icmp eq i8* %bp, null, !dbg !754
  br i1 %cmp, label %return, label %if.end, !dbg !756

if.end:                                           ; preds = %8
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !757
  %call = call fastcc %struct.block* @payload_to_header(i8* nonnull %bp), !dbg !757
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !758
  %9 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !758
  call void @llvm.dbg.value(metadata %struct.block* %call, metadata !751, metadata !DIExpression()), !dbg !758
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !759
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !759
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !759
  %call1 = call fastcc i64 @get_size(%struct.block* nonnull %call), !dbg !759
  %_msret10 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !760
  %10 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !760
  call void @llvm.dbg.value(metadata i64 %call1, metadata !752, metadata !DIExpression()), !dbg !760
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !761
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !761
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !761
  %call2 = call fastcc zeroext i1 @getPrevAlloc(%struct.block* nonnull %call), !dbg !761
  %_msret11 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !762
  %11 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !762
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !762
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !762
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !762
  %call3 = call fastcc zeroext i1 @getPrevMiniStatus(%struct.block* nonnull %call), !dbg !762
  %_msret12 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !763
  %12 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !763
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !763
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !763
  store i64 %_msret10, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !763
  store i32 %10, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !763
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !763
  store i1 %_msret11, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !763
  store i32 %11, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !763
  store i1 %_msret12, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !763
  store i32 %12, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 32) to i32*), align 4, !dbg !763
  call fastcc void @write_block(%struct.block* nonnull %call, i64 %call1, i1 zeroext false, i1 zeroext %call2, i1 zeroext %call3), !dbg !763
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !764
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !764
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !764
  %call4 = call fastcc %struct.block* @coalesce_block(%struct.block* nonnull %call), !dbg !764
  call void @llvm.dbg.value(metadata %struct.block* %call4, metadata !751, metadata !DIExpression()), !dbg !758
  br label %return, !dbg !765

return:                                           ; preds = %8, %if.end
  ret void, !dbg !765
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc nonnull %struct.block* @payload_to_header(i8* readnone %bp) unnamed_addr #0 !dbg !766 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !771
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !771
  call void @llvm.dbg.value(metadata i8* %bp, metadata !770, metadata !DIExpression()), !dbg !771
  %add.ptr = getelementptr inbounds i8, i8* %bp, i64 -8, !dbg !772
  %2 = bitcast i8* %add.ptr to %struct.block*, !dbg !773
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !774
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !774
  ret %struct.block* %2, !dbg !774
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc %struct.block* @coalesce_block(%struct.block* %block) unnamed_addr #0 !dbg !775 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !790
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !790
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !777, metadata !DIExpression()), !dbg !790
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !778, metadata !DIExpression()), !dbg !791
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !792
  %call = call fastcc %struct.block* @find_next(%struct.block* %block), !dbg !792
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !793
  %2 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !793
  call void @llvm.dbg.value(metadata %struct.block* %call, metadata !779, metadata !DIExpression()), !dbg !793
  call void @llvm.dbg.value(metadata i64 0, metadata !780, metadata !DIExpression()), !dbg !794
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !795
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !795
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !795
  %call1 = call fastcc zeroext i1 @getPrevAlloc(%struct.block* %block), !dbg !795
  %_msret104 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !796
  %3 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !796
  call void @llvm.dbg.value(metadata i8 1, metadata !782, metadata !DIExpression()), !dbg !796
  br i1 %_msret104, label %4, label %5, !dbg !797, !prof !88

; <label>:4:                                      ; preds = %entry
  store i32 %3, i32* @__msan_origin_tls, align 4, !dbg !797
  call void @__msan_warning_noreturn() #5, !dbg !797
  call void asm sideeffect "", ""() #5, !dbg !797
  unreachable, !dbg !797

; <label>:5:                                      ; preds = %entry
  br i1 %call1, label %if.end5, label %if.then, !dbg !797

if.then:                                          ; preds = %5
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !798
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !798
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !798
  %call2 = call fastcc zeroext i1 @getPrevMiniStatus(%struct.block* %block), !dbg !798
  %_msret133 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !802
  br i1 %_msret133, label %6, label %8, !dbg !802, !prof !88

; <label>:6:                                      ; preds = %if.then
  %7 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !802
  store i32 %7, i32* @__msan_origin_tls, align 4, !dbg !802
  call void @__msan_warning_noreturn() #5, !dbg !802
  call void asm sideeffect "", ""() #5, !dbg !802
  unreachable, !dbg !802

; <label>:8:                                      ; preds = %if.then
  br i1 %call2, label %if.then3, label %if.else, !dbg !802

if.then3:                                         ; preds = %8
  %add.ptr = getelementptr inbounds %struct.block, %struct.block* %block, i64 -1, i32 1, !dbg !803
  %9 = bitcast %union.anon* %add.ptr to %struct.block*, !dbg !805
  call void @llvm.dbg.value(metadata %struct.block* %9, metadata !778, metadata !DIExpression()), !dbg !791
  br label %if.end5, !dbg !806

if.else:                                          ; preds = %8
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !807
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !807
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !807
  %call4 = call fastcc %struct.block* @find_prev(%struct.block* %block), !dbg !807
  %_msret134 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !791
  %10 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !791
  call void @llvm.dbg.value(metadata %struct.block* %call4, metadata !778, metadata !DIExpression()), !dbg !791
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.else, %5
  %_msphi_s = phi i64 [ 0, %5 ], [ %0, %if.then3 ], [ %_msret134, %if.else ], !dbg !809
  %_msphi_o = phi i32 [ 0, %5 ], [ %1, %if.then3 ], [ %10, %if.else ], !dbg !809
  %prevBlock.0 = phi %struct.block* [ null, %5 ], [ %9, %if.then3 ], [ %call4, %if.else ], !dbg !809
  call void @llvm.dbg.value(metadata %struct.block* %prevBlock.0, metadata !778, metadata !DIExpression()), !dbg !791
  %11 = ptrtoint %struct.block* %call to i64, !dbg !810
  %12 = xor i64 %_msret, -1, !dbg !810
  %13 = and i64 %12, %11, !dbg !810
  %14 = icmp eq i64 %13, 0, !dbg !810
  %15 = icmp ne i64 %_msret, 0, !dbg !810
  %_msprop_icmp = and i1 %15, %14, !dbg !810
  br i1 %_msprop_icmp, label %16, label %17, !dbg !812, !prof !88

; <label>:16:                                     ; preds = %if.end5
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !812
  call void @__msan_warning_noreturn() #5, !dbg !812
  call void asm sideeffect "", ""() #5, !dbg !812
  unreachable, !dbg !812

; <label>:17:                                     ; preds = %if.end5
  %cmp = icmp eq %struct.block* %call, null, !dbg !810
  br i1 %cmp, label %if.end9, label %if.then6, !dbg !812

if.then6:                                         ; preds = %17
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !813
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !813
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !813
  %call7 = call fastcc zeroext i1 @get_alloc(%struct.block* nonnull %call), !dbg !813
  %_msret132 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !815
  %18 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !815
  br label %if.end9, !dbg !815

if.end9:                                          ; preds = %17, %if.then6
  %_msphi_s105 = phi i1 [ %_msret132, %if.then6 ], [ false, %17 ]
  %_msphi_o106 = phi i32 [ %18, %if.then6 ], [ 0, %17 ]
  %nextAlloc.0 = phi i1 [ %call7, %if.then6 ], [ true, %17 ]
  %call1.not = xor i1 %call1, true, !dbg !816
  %nextAlloc.0.not = xor i1 %nextAlloc.0, true, !dbg !816
  %19 = and i1 %call1, %_msphi_s105, !dbg !816
  %20 = select i1 %_msphi_s105, i32 %_msphi_o106, i32 %3, !dbg !816
  br i1 %19, label %21, label %22, !dbg !816, !prof !88

; <label>:21:                                     ; preds = %if.end9
  store i32 %20, i32* @__msan_origin_tls, align 4, !dbg !816
  call void @__msan_warning_noreturn() #5, !dbg !816
  call void asm sideeffect "", ""() #5, !dbg !816
  unreachable, !dbg !816

; <label>:22:                                     ; preds = %if.end9
  %brmerge = or i1 %call1.not, %nextAlloc.0.not, !dbg !816
  br i1 %brmerge, label %if.else22, label %if.then12, !dbg !816

if.then12:                                        ; preds = %22
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !817
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !817
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !817
  %call13 = call fastcc i64 @get_size(%struct.block* %block), !dbg !817
  %_msret127 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !794
  %23 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !794
  call void @llvm.dbg.value(metadata i64 %call13, metadata !780, metadata !DIExpression()), !dbg !794
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !819
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !819
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !819
  %call14 = call fastcc zeroext i1 @getPrevMiniStatus(%struct.block* %block), !dbg !819
  %_msret128 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !820
  %24 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !820
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !820
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !820
  store i64 %_msret127, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !820
  store i32 %23, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !820
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !820
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !820
  store i1 %_msret128, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !820
  store i32 %24, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 32) to i32*), align 4, !dbg !820
  call fastcc void @write_block(%struct.block* %block, i64 %call13, i1 zeroext false, i1 zeroext true, i1 zeroext %call14), !dbg !820
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !821
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !821
  call fastcc void @addFree(%struct.block* %block), !dbg !821
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !822
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !822
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !822
  %call15 = call fastcc i64 @get_size(%struct.block* %block), !dbg !822
  %_msret129 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !824
  %25 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !824
  %26 = xor i64 %call15, 16, !dbg !824
  %27 = xor i64 %_msret129, -1, !dbg !824
  %28 = and i64 %26, %27, !dbg !824
  %29 = icmp eq i64 %28, 0, !dbg !824
  %30 = icmp ne i64 %_msret129, 0, !dbg !824
  %_msprop_icmp130 = and i1 %30, %29, !dbg !824
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !825
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !825
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !825
  %call18 = call fastcc i64 @get_size(%struct.block* %call), !dbg !825
  %_msret131 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !827
  %31 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !827
  br i1 %_msprop_icmp130, label %32, label %33, !dbg !827, !prof !88

; <label>:32:                                     ; preds = %if.then12
  store i32 %25, i32* @__msan_origin_tls, align 4, !dbg !827
  call void @__msan_warning_noreturn() #5, !dbg !827
  call void asm sideeffect "", ""() #5, !dbg !827
  unreachable, !dbg !827

; <label>:33:                                     ; preds = %if.then12
  %cmp16 = icmp eq i64 %call15, 16, !dbg !824
  br i1 %cmp16, label %if.then17, label %if.else19, !dbg !827

if.then17:                                        ; preds = %33
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !828
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !828
  store i64 %_msret131, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !828
  store i32 %31, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !828
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !828
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !828
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !828
  call fastcc void @write_block(%struct.block* %call, i64 %call18, i1 zeroext true, i1 zeroext false, i1 zeroext true), !dbg !828
  br label %return, !dbg !830

if.else19:                                        ; preds = %33
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !831
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !831
  store i64 %_msret131, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !831
  store i32 %31, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !831
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !831
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !831
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !831
  call fastcc void @write_block(%struct.block* %call, i64 %call18, i1 zeroext true, i1 zeroext false, i1 zeroext false), !dbg !831
  br label %return

if.else22:                                        ; preds = %22
  br i1 false, label %34, label %35, !dbg !832, !prof !88

; <label>:34:                                     ; preds = %if.else22
  unreachable, !dbg !832

; <label>:35:                                     ; preds = %if.else22
  %brmerge101 = or i1 %nextAlloc.0, %call1.not, !dbg !832
  br i1 %brmerge101, label %if.else32, label %if.then26, !dbg !832

if.then26:                                        ; preds = %35
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !833
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !833
  call fastcc void @removeFree(%struct.block* %call), !dbg !833
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !834
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !834
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !834
  %call27 = call fastcc i64 @get_size(%struct.block* %block), !dbg !834
  %_msret121 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !835
  %36 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !835
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !835
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !835
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !835
  %call28 = call fastcc i64 @get_size(%struct.block* %call), !dbg !835
  %_msret122 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !836
  %37 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !836
  %_msprop123 = or i64 %_msret122, %_msret121, !dbg !836
  %38 = icmp eq i64 %_msret121, 0, !dbg !836
  %39 = select i1 %38, i32 %37, i32 %36, !dbg !836
  %add = add i64 %call28, %call27, !dbg !836
  call void @llvm.dbg.value(metadata i64 %add, metadata !780, metadata !DIExpression()), !dbg !794
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !837
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !837
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !837
  %call29 = call fastcc zeroext i1 @getPrevMiniStatus(%struct.block* %block), !dbg !837
  %_msret124 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !838
  %40 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !838
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !838
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !838
  store i64 %_msprop123, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !838
  store i32 %39, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !838
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !838
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !838
  store i1 %_msret124, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !838
  store i32 %40, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 32) to i32*), align 4, !dbg !838
  call fastcc void @write_block(%struct.block* %block, i64 %add, i1 zeroext false, i1 zeroext true, i1 zeroext %call29), !dbg !838
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !839
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !839
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !839
  %call30 = call fastcc %struct.block* @find_next(%struct.block* %block), !dbg !839
  %_msret125 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !840
  %41 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !840
  call void @llvm.dbg.value(metadata %struct.block* %call30, metadata !783, metadata !DIExpression()), !dbg !840
  store i64 %_msret125, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !841
  store i32 %41, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !841
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !841
  %call31 = call fastcc i64 @get_size(%struct.block* %call30), !dbg !841
  %_msret126 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !842
  %42 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !842
  store i64 %_msret125, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !842
  store i32 %41, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !842
  store i64 %_msret126, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !842
  store i32 %42, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !842
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !842
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !842
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !842
  call fastcc void @write_block(%struct.block* %call30, i64 %call31, i1 zeroext true, i1 zeroext false, i1 zeroext false), !dbg !842
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !843
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !843
  call fastcc void @addFree(%struct.block* %block), !dbg !843
  br label %return, !dbg !844

if.else32:                                        ; preds = %35
  %43 = and i1 %_msphi_s105, %call1.not, !dbg !845
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !846
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !846
  call fastcc void @removeFree(%struct.block* %prevBlock.0), !dbg !846
  br i1 %43, label %44, label %45, !dbg !845, !prof !88

; <label>:44:                                     ; preds = %if.else32
  store i32 %20, i32* @__msan_origin_tls, align 4, !dbg !845
  call void @__msan_warning_noreturn() #5, !dbg !845
  call void asm sideeffect "", ""() #5, !dbg !845
  unreachable, !dbg !845

; <label>:45:                                     ; preds = %if.else32
  %brmerge103 = or i1 %call1, %nextAlloc.0.not, !dbg !845
  br i1 %brmerge103, label %if.else42, label %if.then36, !dbg !845

if.then36:                                        ; preds = %45
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !848
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !848
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !848
  %call37 = call fastcc i64 @get_size(%struct.block* %block), !dbg !848
  %_msret116 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !849
  %46 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !849
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !849
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !849
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !849
  %call38 = call fastcc i64 @get_size(%struct.block* %prevBlock.0), !dbg !849
  %_msret117 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !850
  %47 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !850
  %_msprop118 = or i64 %_msret117, %_msret116, !dbg !850
  %48 = icmp eq i64 %_msret116, 0, !dbg !850
  %49 = select i1 %48, i32 %47, i32 %46, !dbg !850
  %add39 = add i64 %call38, %call37, !dbg !850
  call void @llvm.dbg.value(metadata i64 %add39, metadata !780, metadata !DIExpression()), !dbg !794
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !851
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !851
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !851
  %call40 = call fastcc zeroext i1 @getPrevMiniStatus(%struct.block* %prevBlock.0), !dbg !851
  %_msret119 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !852
  %50 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !852
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !852
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !852
  store i64 %_msprop118, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !852
  store i32 %49, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !852
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !852
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !852
  store i1 %_msret119, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !852
  store i32 %50, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 32) to i32*), align 4, !dbg !852
  call fastcc void @write_block(%struct.block* %prevBlock.0, i64 %add39, i1 zeroext false, i1 zeroext true, i1 zeroext %call40), !dbg !852
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !853
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !853
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !853
  %call41 = call fastcc i64 @get_size(%struct.block* %call), !dbg !853
  %_msret120 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !854
  %51 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !854
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !854
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !854
  store i64 %_msret120, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !854
  store i32 %51, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !854
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !854
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !854
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !854
  call fastcc void @write_block(%struct.block* %call, i64 %call41, i1 zeroext true, i1 zeroext false, i1 zeroext false), !dbg !854
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !855
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !855
  call fastcc void @addFree(%struct.block* %prevBlock.0), !dbg !855
  br label %return, !dbg !856

if.else42:                                        ; preds = %45
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !857
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !857
  call fastcc void @removeFree(%struct.block* %call), !dbg !857
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !858
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !858
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !858
  %call43 = call fastcc i64 @get_size(%struct.block* %block), !dbg !858
  %_msret107 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !859
  %52 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !859
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !859
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !859
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !859
  %call44 = call fastcc i64 @get_size(%struct.block* %prevBlock.0), !dbg !859
  %_msret108 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !860
  %53 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !860
  %_msprop = or i64 %_msret108, %_msret107, !dbg !860
  %54 = icmp eq i64 %_msret107, 0, !dbg !860
  %55 = select i1 %54, i32 %53, i32 %52, !dbg !860
  %add45 = add i64 %call44, %call43, !dbg !860
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !861
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !861
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !861
  %call46 = call fastcc i64 @get_size(%struct.block* %call), !dbg !861
  %_msret109 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !862
  %56 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !862
  %_msprop110 = or i64 %_msprop, %_msret109, !dbg !862
  %57 = icmp eq i64 %_msret109, 0, !dbg !862
  %58 = select i1 %57, i32 %55, i32 %56, !dbg !862
  %add47 = add i64 %add45, %call46, !dbg !862
  call void @llvm.dbg.value(metadata i64 %add47, metadata !780, metadata !DIExpression()), !dbg !794
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !863
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !863
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !863
  %call48 = call fastcc zeroext i1 @getPrevMiniStatus(%struct.block* %prevBlock.0), !dbg !863
  %_msret111 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !864
  %59 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !864
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !864
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !864
  store i64 %_msprop110, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !864
  store i32 %58, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !864
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !864
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !864
  store i1 %_msret111, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !864
  store i32 %59, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 32) to i32*), align 4, !dbg !864
  call fastcc void @write_block(%struct.block* %prevBlock.0, i64 %add47, i1 zeroext false, i1 zeroext true, i1 zeroext %call48), !dbg !864
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !865
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !865
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !865
  %call50 = call fastcc %struct.block* @find_next(%struct.block* %prevBlock.0), !dbg !865
  %_msret112 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !866
  %60 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !866
  call void @llvm.dbg.value(metadata %struct.block* %call50, metadata !787, metadata !DIExpression()), !dbg !866
  store i64 %_msret112, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !867
  store i32 %60, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !867
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !867
  %call51 = call fastcc i64 @get_size(%struct.block* %call50), !dbg !867
  %_msret113 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !868
  %61 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !868
  store i64 %_msret112, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !868
  store i32 %60, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !868
  store i64 %_msret113, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !868
  store i32 %61, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !868
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !868
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !868
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 32) to i1*), align 8, !dbg !868
  call fastcc void @write_block(%struct.block* %call50, i64 %call51, i1 zeroext true, i1 zeroext false, i1 zeroext false), !dbg !868
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !869
  store i32 %_msphi_o, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !869
  call fastcc void @addFree(%struct.block* %prevBlock.0), !dbg !869
  br label %return, !dbg !870

return:                                           ; preds = %if.then17, %if.else19, %if.else42, %if.then36, %if.then26
  %_msphi_s114 = phi i64 [ %_msphi_s, %if.else42 ], [ %_msphi_s, %if.then36 ], [ %0, %if.then26 ], [ %0, %if.else19 ], [ %0, %if.then17 ], !dbg !871
  %_msphi_o115 = phi i32 [ %_msphi_o, %if.else42 ], [ %_msphi_o, %if.then36 ], [ %1, %if.then26 ], [ %1, %if.else19 ], [ %1, %if.then17 ], !dbg !871
  %retval.0 = phi %struct.block* [ %prevBlock.0, %if.else42 ], [ %prevBlock.0, %if.then36 ], [ %block, %if.then26 ], [ %block, %if.else19 ], [ %block, %if.then17 ], !dbg !871
  store i64 %_msphi_s114, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !872
  store i32 %_msphi_o115, i32* @__msan_retval_origin_tls, align 4, !dbg !872
  ret %struct.block* %retval.0, !dbg !872
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local i8* @mm_realloc(i8* %ptr, i64 %size) local_unnamed_addr #0 !dbg !873 {
entry:
  %0 = load i64, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !882
  %1 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !882
  %2 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !882
  %3 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !882
  call void @llvm.dbg.value(metadata i8* %ptr, metadata !877, metadata !DIExpression()), !dbg !882
  call void @llvm.dbg.value(metadata i64 %size, metadata !878, metadata !DIExpression()), !dbg !883
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !884
  %call = call fastcc %struct.block* @payload_to_header(i8* %ptr), !dbg !884
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !885
  %4 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !885
  call void @llvm.dbg.value(metadata %struct.block* %call, metadata !879, metadata !DIExpression()), !dbg !885
  %5 = xor i64 %0, -1, !dbg !886
  %6 = and i64 %5, %size, !dbg !886
  %7 = icmp eq i64 %6, 0, !dbg !886
  %8 = icmp ne i64 %0, 0, !dbg !886
  %_msprop_icmp = and i1 %8, %7, !dbg !886
  br i1 %_msprop_icmp, label %9, label %10, !dbg !888, !prof !88

; <label>:9:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !888
  call void @__msan_warning_noreturn() #5, !dbg !888
  call void asm sideeffect "", ""() #5, !dbg !888
  unreachable, !dbg !888

; <label>:10:                                     ; preds = %entry
  %cmp = icmp eq i64 %size, 0, !dbg !886
  br i1 %cmp, label %if.then, label %if.end, !dbg !888

if.then:                                          ; preds = %10
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !889
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !889
  call void @mm_free(i8* %ptr), !dbg !889
  br label %return, !dbg !891

if.end:                                           ; preds = %10
  %11 = ptrtoint i8* %ptr to i64, !dbg !892
  %12 = xor i64 %2, -1, !dbg !892
  %13 = and i64 %12, %11, !dbg !892
  %14 = icmp eq i64 %13, 0, !dbg !892
  %15 = icmp ne i64 %2, 0, !dbg !892
  %_msprop_icmp23 = and i1 %15, %14, !dbg !892
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !894
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !894
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !894
  %call3 = call i8* @mm_malloc(i64 %size), !dbg !894
  %_msret24 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !895
  %16 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !895
  br i1 %_msprop_icmp23, label %17, label %18, !dbg !895, !prof !88

; <label>:17:                                     ; preds = %if.end
  store i32 %3, i32* @__msan_origin_tls, align 4, !dbg !895
  call void @__msan_warning_noreturn() #5, !dbg !895
  call void asm sideeffect "", ""() #5, !dbg !895
  unreachable, !dbg !895

; <label>:18:                                     ; preds = %if.end
  %cmp1 = icmp eq i8* %ptr, null, !dbg !892
  br i1 %cmp1, label %return, label %if.end4, !dbg !895

if.end4:                                          ; preds = %18
  call void @llvm.dbg.value(metadata i8* %call3, metadata !881, metadata !DIExpression()), !dbg !896
  %19 = ptrtoint i8* %call3 to i64, !dbg !897
  %20 = xor i64 %_msret24, -1, !dbg !897
  %21 = and i64 %20, %19, !dbg !897
  %22 = icmp eq i64 %21, 0, !dbg !897
  %23 = icmp ne i64 %_msret24, 0, !dbg !897
  %_msprop_icmp25 = and i1 %23, %22, !dbg !897
  br i1 %_msprop_icmp25, label %24, label %25, !dbg !899, !prof !88

; <label>:24:                                     ; preds = %if.end4
  store i32 %16, i32* @__msan_origin_tls, align 4, !dbg !899
  call void @__msan_warning_noreturn() #5, !dbg !899
  call void asm sideeffect "", ""() #5, !dbg !899
  unreachable, !dbg !899

; <label>:25:                                     ; preds = %if.end4
  %cmp6 = icmp eq i8* %call3, null, !dbg !897
  br i1 %cmp6, label %return, label %if.end8, !dbg !899

if.end8:                                          ; preds = %25
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !900
  store i32 %4, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !900
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !900
  %call9 = call fastcc i64 @get_payload_size(%struct.block* nonnull %call), !dbg !900
  %_msret26 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !901
  %26 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !901
  call void @llvm.dbg.value(metadata i64 %call9, metadata !880, metadata !DIExpression()), !dbg !901
  %_msprop = or i64 %_msret26, %0, !dbg !902
  %27 = select i1 %8, i32 %1, i32 %26, !dbg !902
  %28 = icmp ne i64 %_msprop, 0, !dbg !902
  %cmp10 = icmp ugt i64 %call9, %size, !dbg !902
  %29 = select i1 %cmp10, i64 %0, i64 %_msret26, !dbg !904
  %30 = xor i64 %call9, %size, !dbg !904
  %31 = or i64 %_msprop, %30, !dbg !904
  %_msprop_select = select i1 %28, i64 %31, i64 %29, !dbg !904
  %32 = select i1 %cmp10, i32 %1, i32 %26, !dbg !904
  %33 = select i1 %28, i32 %27, i32 %32, !dbg !904
  %spec.select = select i1 %cmp10, i64 %size, i64 %call9, !dbg !904
  call void @llvm.dbg.value(metadata i64 %spec.select, metadata !880, metadata !DIExpression()), !dbg !901
  store i64 %_msret24, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !905
  store i32 %16, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !905
  store i64 %2, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !905
  store i32 %3, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !905
  store i64 %_msprop_select, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i64*), align 8, !dbg !905
  store i32 %33, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !905
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !905
  %call13 = call i8* @mem_memcpy(i8* nonnull %call3, i8* nonnull %ptr, i64 %spec.select) #5, !dbg !905
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !906
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !906
  call void @mm_free(i8* nonnull %ptr), !dbg !906
  br label %return, !dbg !907

return:                                           ; preds = %25, %18, %if.end8, %if.then
  %_msphi_s = phi i64 [ 0, %if.then ], [ %_msret24, %if.end8 ], [ %_msret24, %18 ], [ 0, %25 ], !dbg !894
  %_msphi_o = phi i32 [ 0, %if.then ], [ %16, %if.end8 ], [ %16, %18 ], [ 0, %25 ], !dbg !894
  %retval.0 = phi i8* [ null, %if.then ], [ %call3, %if.end8 ], [ %call3, %18 ], [ null, %25 ], !dbg !894
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !908
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !908
  ret i8* %retval.0, !dbg !908
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @get_payload_size(%struct.block* nocapture readonly %block) unnamed_addr #0 !dbg !909 {
entry:
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !911, metadata !DIExpression()), !dbg !913
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !914
  %call = call fastcc i64 @get_size(%struct.block* %block), !dbg !914
  call void @llvm.dbg.value(metadata i64 %call, metadata !912, metadata !DIExpression()), !dbg !915
  %sub = add i64 %call, -8, !dbg !916
  ret i64 %sub, !dbg !917
}

declare dso_local i8* @mem_memcpy(i8*, i8*, i64) local_unnamed_addr #2

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local i8* @mm_calloc(i64 %elements, i64 %size) local_unnamed_addr #0 !dbg !918 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !926
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !926
  %2 = load i64, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !926
  %3 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !926
  call void @llvm.dbg.value(metadata i64 %elements, metadata !922, metadata !DIExpression()), !dbg !926
  call void @llvm.dbg.value(metadata i64 %size, metadata !923, metadata !DIExpression()), !dbg !927
  %_msprop = or i64 %2, %0, !dbg !928
  %4 = icmp ne i64 %0, 0, !dbg !928
  %5 = select i1 %4, i32 %1, i32 %3, !dbg !928
  %mul = mul i64 %size, %elements, !dbg !928
  call void @llvm.dbg.value(metadata i64 %mul, metadata !925, metadata !DIExpression()), !dbg !929
  %6 = xor i64 %0, -1, !dbg !930
  %7 = and i64 %6, %elements, !dbg !930
  %8 = icmp eq i64 %7, 0, !dbg !930
  %_msprop_icmp = and i1 %4, %8, !dbg !930
  br i1 %_msprop_icmp, label %9, label %10, !dbg !932, !prof !88

; <label>:9:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !932
  call void @__msan_warning_noreturn() #5, !dbg !932
  call void asm sideeffect "", ""() #5, !dbg !932
  unreachable, !dbg !932

; <label>:10:                                     ; preds = %entry
  %cmp = icmp eq i64 %elements, 0, !dbg !930
  br i1 %cmp, label %return, label %if.end, !dbg !932

if.end:                                           ; preds = %10
  br i1 %4, label %11, label %12, !dbg !933, !prof !88

; <label>:11:                                     ; preds = %if.end
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !933
  call void @__msan_warning_noreturn() #5, !dbg !933
  call void asm sideeffect "", ""() #5, !dbg !933
  unreachable, !dbg !933

; <label>:12:                                     ; preds = %if.end
  %div = udiv i64 %mul, %elements, !dbg !933
  %13 = xor i64 %div, %size, !dbg !935
  %14 = xor i64 %_msprop, -1, !dbg !935
  %15 = and i64 %13, %14, !dbg !935
  %16 = icmp eq i64 %15, 0, !dbg !935
  %17 = icmp ne i64 %_msprop, 0, !dbg !935
  %_msprop_icmp15 = and i1 %17, %16, !dbg !935
  br i1 %_msprop_icmp15, label %18, label %21, !dbg !936, !prof !88

; <label>:18:                                     ; preds = %12
  %19 = icmp eq i64 %2, 0, !dbg !935
  %20 = select i1 %19, i32 %5, i32 %3, !dbg !935
  store i32 %20, i32* @__msan_origin_tls, align 4, !dbg !936
  call void @__msan_warning_noreturn() #5, !dbg !936
  call void asm sideeffect "", ""() #5, !dbg !936
  unreachable, !dbg !936

; <label>:21:                                     ; preds = %12
  %cmp1 = icmp eq i64 %div, %size, !dbg !935
  br i1 %cmp1, label %if.end3, label %return, !dbg !936

if.end3:                                          ; preds = %21
  store i64 %_msprop, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !937
  store i32 %5, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !937
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !937
  %call = call i8* @mm_malloc(i64 %mul), !dbg !937
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !938
  %22 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !938
  call void @llvm.dbg.value(metadata i8* %call, metadata !924, metadata !DIExpression()), !dbg !938
  %23 = ptrtoint i8* %call to i64, !dbg !939
  %24 = xor i64 %_msret, -1, !dbg !939
  %25 = and i64 %24, %23, !dbg !939
  %26 = icmp eq i64 %25, 0, !dbg !939
  %27 = icmp ne i64 %_msret, 0, !dbg !939
  %_msprop_icmp16 = and i1 %27, %26, !dbg !939
  br i1 %_msprop_icmp16, label %28, label %29, !dbg !941, !prof !88

; <label>:28:                                     ; preds = %if.end3
  store i32 %22, i32* @__msan_origin_tls, align 4, !dbg !941
  call void @__msan_warning_noreturn() #5, !dbg !941
  call void asm sideeffect "", ""() #5, !dbg !941
  unreachable, !dbg !941

; <label>:29:                                     ; preds = %if.end3
  %cmp4 = icmp eq i8* %call, null, !dbg !939
  br i1 %cmp4, label %return, label %if.end6, !dbg !941

if.end6:                                          ; preds = %29
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !942
  store i32 %22, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !942
  store i32 0, i32* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i32*), align 8, !dbg !942
  store i64 %_msprop, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i64*), align 8, !dbg !942
  store i32 %5, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !942
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !942
  %call7 = call i8* @mem_memset(i8* nonnull %call, i32 0, i64 %mul) #5, !dbg !942
  br label %return, !dbg !943

return:                                           ; preds = %29, %21, %10, %if.end6
  %_msphi_s = phi i64 [ %_msret, %if.end6 ], [ 0, %10 ], [ 0, %21 ], [ 0, %29 ], !dbg !944
  %_msphi_o = phi i32 [ %22, %if.end6 ], [ 0, %10 ], [ 0, %21 ], [ 0, %29 ], !dbg !944
  %retval.0 = phi i8* [ %call, %if.end6 ], [ null, %10 ], [ null, %21 ], [ null, %29 ], !dbg !944
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !945
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !945
  ret i8* %retval.0, !dbg !945
}

declare dso_local i8* @mem_memset(i8*, i32, i64) local_unnamed_addr #2

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc nonnull i64* @find_prev_footer(%struct.block* readnone %block) unnamed_addr #0 !dbg !946 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !949
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !949
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !948, metadata !DIExpression()), !dbg !949
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !950
  %add.ptr = getelementptr inbounds i64, i64* %header, i64 -1, !dbg !951
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !952
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !952
  ret i64* %add.ptr, !dbg !952
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc nonnull %struct.block* @footer_to_header(i64* readonly %footer) unnamed_addr #0 !dbg !953 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !959
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !959
  call void @llvm.dbg.value(metadata i64* %footer, metadata !957, metadata !DIExpression()), !dbg !959
  %_mscmp = icmp eq i64 %0, 0, !dbg !960
  br i1 %_mscmp, label %3, label %2, !dbg !960, !prof !91

; <label>:2:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !960
  call void @__msan_warning_noreturn() #5, !dbg !960
  call void asm sideeffect "", ""() #5, !dbg !960
  unreachable, !dbg !960

; <label>:3:                                      ; preds = %entry
  %4 = load i64, i64* %footer, align 8, !dbg !960, !tbaa !227
  %5 = ptrtoint i64* %footer to i64, !dbg !961
  %6 = xor i64 %5, 87960930222080, !dbg !961
  %7 = inttoptr i64 %6 to i64*, !dbg !961
  %8 = add i64 %6, 17592186044416, !dbg !961
  %9 = inttoptr i64 %8 to i32*, !dbg !961
  %_msld = load i64, i64* %7, align 8, !dbg !961
  %10 = load i32, i32* %9, align 8, !dbg !961
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !961
  store i32 %10, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !961
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !961
  %call = call fastcc i64 @extract_size(i64 %4), !dbg !961
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !962
  %11 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !962
  call void @llvm.dbg.value(metadata i64 %call, metadata !958, metadata !DIExpression()), !dbg !962
  %add.ptr3 = getelementptr inbounds i64, i64* %footer, i64 1, !dbg !963
  %add.ptr = bitcast i64* %add.ptr3 to i8*, !dbg !963
  %12 = icmp eq i64 %_msret, 0, !dbg !964
  %idx.neg = sub i64 0, %call, !dbg !964
  %13 = select i1 %12, i32 %1, i32 %11, !dbg !964
  %add.ptr1 = getelementptr inbounds i8, i8* %add.ptr, i64 %idx.neg, !dbg !964
  %14 = bitcast i8* %add.ptr1 to %struct.block*, !dbg !965
  store i32 %13, i32* @__msan_retval_origin_tls, align 4, !dbg !966
  ret %struct.block* %14, !dbg !966
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc void @write_epilogue(%struct.block* nocapture %block) unnamed_addr #0 !dbg !967 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !970
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !970
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !969, metadata !DIExpression()), !dbg !970
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !971
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !971
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !971
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !971
  %call = call fastcc i64 @pack(i64 0, i1 zeroext true, i1 zeroext false), !dbg !971
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !972
  %2 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !972
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !972
  %_mscmp = icmp eq i64 %0, 0, !dbg !973
  br i1 %_mscmp, label %4, label %3, !dbg !973, !prof !91

; <label>:3:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !973
  call void @__msan_warning_noreturn() #5, !dbg !973
  call void asm sideeffect "", ""() #5, !dbg !973
  unreachable, !dbg !973

; <label>:4:                                      ; preds = %entry
  %5 = ptrtoint %struct.block* %block to i64, !dbg !973
  %6 = xor i64 %5, 87960930222080, !dbg !973
  %7 = inttoptr i64 %6 to i64*, !dbg !973
  store i64 %_msret, i64* %7, align 8, !dbg !973
  %_mscmp1 = icmp eq i64 %_msret, 0, !dbg !973
  br i1 %_mscmp1, label %15, label %8, !dbg !973, !prof !91

; <label>:8:                                      ; preds = %4
  %9 = add i64 %6, 17592186044416, !dbg !973
  %10 = call i32 @__msan_chain_origin(i32 %2) #5, !dbg !973
  %11 = zext i32 %10 to i64, !dbg !973
  %12 = shl nuw i64 %11, 32, !dbg !973
  %13 = or i64 %12, %11, !dbg !973
  %14 = inttoptr i64 %9 to i64*, !dbg !973
  store i64 %13, i64* %14, align 8, !dbg !973
  br label %15, !dbg !973

; <label>:15:                                     ; preds = %4, %8
  store i64 %call, i64* %header, align 8, !dbg !973, !tbaa !92
  ret void, !dbg !974
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @getHead(i64 %asize) unnamed_addr #0 !dbg !975 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !981
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !981
  call void @llvm.dbg.value(metadata i64 %asize, metadata !979, metadata !DIExpression()), !dbg !981
  %2 = xor i64 %0, -1, !dbg !982
  %3 = and i64 %2, %asize, !dbg !982
  %4 = icmp ult i64 %3, 32, !dbg !982
  %5 = or i64 %0, %asize, !dbg !982
  %6 = icmp ult i64 %5, 32, !dbg !982
  %7 = xor i1 %4, %6, !dbg !982
  br i1 %7, label %8, label %9, !dbg !984, !prof !88

; <label>:8:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !984
  call void @__msan_warning_noreturn() #5, !dbg !984
  call void asm sideeffect "", ""() #5, !dbg !984
  unreachable, !dbg !984

; <label>:9:                                      ; preds = %entry
  %cmp = icmp ult i64 %asize, 32, !dbg !982
  br i1 %cmp, label %if.end32, label %if.else, !dbg !984

if.else:                                          ; preds = %9
  %10 = icmp ult i64 %3, 65, !dbg !985
  %11 = icmp ult i64 %5, 65, !dbg !985
  %12 = xor i1 %10, %11, !dbg !985
  br i1 %12, label %13, label %14, !dbg !987, !prof !88

; <label>:13:                                     ; preds = %if.else
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !987
  call void @__msan_warning_noreturn() #5, !dbg !987
  call void asm sideeffect "", ""() #5, !dbg !987
  unreachable, !dbg !987

; <label>:14:                                     ; preds = %if.else
  %cmp1 = icmp ult i64 %asize, 65, !dbg !985
  br i1 %cmp1, label %if.end32, label %if.else3, !dbg !987

if.else3:                                         ; preds = %14
  %15 = icmp ult i64 %3, 129, !dbg !988
  %16 = icmp ult i64 %5, 129, !dbg !988
  %17 = xor i1 %15, %16, !dbg !988
  br i1 %17, label %18, label %19, !dbg !990, !prof !88

; <label>:18:                                     ; preds = %if.else3
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !990
  call void @__msan_warning_noreturn() #5, !dbg !990
  call void asm sideeffect "", ""() #5, !dbg !990
  unreachable, !dbg !990

; <label>:19:                                     ; preds = %if.else3
  %cmp4 = icmp ult i64 %asize, 129, !dbg !988
  br i1 %cmp4, label %if.end32, label %if.else6, !dbg !990

if.else6:                                         ; preds = %19
  %20 = icmp ult i64 %3, 257, !dbg !991
  %21 = icmp ult i64 %5, 257, !dbg !991
  %22 = xor i1 %20, %21, !dbg !991
  br i1 %22, label %23, label %24, !dbg !993, !prof !88

; <label>:23:                                     ; preds = %if.else6
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !993
  call void @__msan_warning_noreturn() #5, !dbg !993
  call void asm sideeffect "", ""() #5, !dbg !993
  unreachable, !dbg !993

; <label>:24:                                     ; preds = %if.else6
  %cmp7 = icmp ult i64 %asize, 257, !dbg !991
  br i1 %cmp7, label %if.end32, label %if.else9, !dbg !993

if.else9:                                         ; preds = %24
  %25 = icmp ult i64 %3, 513, !dbg !994
  %26 = icmp ult i64 %5, 513, !dbg !994
  %27 = xor i1 %25, %26, !dbg !994
  br i1 %27, label %28, label %29, !dbg !996, !prof !88

; <label>:28:                                     ; preds = %if.else9
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !996
  call void @__msan_warning_noreturn() #5, !dbg !996
  call void asm sideeffect "", ""() #5, !dbg !996
  unreachable, !dbg !996

; <label>:29:                                     ; preds = %if.else9
  %cmp10 = icmp ult i64 %asize, 513, !dbg !994
  br i1 %cmp10, label %if.end32, label %if.else12, !dbg !996

if.else12:                                        ; preds = %29
  %30 = icmp ult i64 %3, 1025, !dbg !997
  %31 = icmp ult i64 %5, 1025, !dbg !997
  %32 = xor i1 %30, %31, !dbg !997
  br i1 %32, label %33, label %34, !dbg !999, !prof !88

; <label>:33:                                     ; preds = %if.else12
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !999
  call void @__msan_warning_noreturn() #5, !dbg !999
  call void asm sideeffect "", ""() #5, !dbg !999
  unreachable, !dbg !999

; <label>:34:                                     ; preds = %if.else12
  %cmp13 = icmp ult i64 %asize, 1025, !dbg !997
  br i1 %cmp13, label %if.end32, label %if.else15, !dbg !999

if.else15:                                        ; preds = %34
  %35 = icmp ult i64 %3, 2049, !dbg !1000
  %36 = icmp ult i64 %5, 2049, !dbg !1000
  %37 = xor i1 %35, %36, !dbg !1000
  br i1 %37, label %38, label %39, !dbg !1002, !prof !88

; <label>:38:                                     ; preds = %if.else15
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !1002
  call void @__msan_warning_noreturn() #5, !dbg !1002
  call void asm sideeffect "", ""() #5, !dbg !1002
  unreachable, !dbg !1002

; <label>:39:                                     ; preds = %if.else15
  %cmp16 = icmp ult i64 %asize, 2049, !dbg !1000
  br i1 %cmp16, label %if.end32, label %if.else18, !dbg !1002

if.else18:                                        ; preds = %39
  %40 = icmp ult i64 %3, 4097, !dbg !1003
  %41 = icmp ult i64 %5, 4097, !dbg !1003
  %42 = xor i1 %40, %41, !dbg !1003
  br i1 %42, label %43, label %44, !dbg !1005, !prof !88

; <label>:43:                                     ; preds = %if.else18
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !1005
  call void @__msan_warning_noreturn() #5, !dbg !1005
  call void asm sideeffect "", ""() #5, !dbg !1005
  unreachable, !dbg !1005

; <label>:44:                                     ; preds = %if.else18
  %cmp19 = icmp ult i64 %asize, 4097, !dbg !1003
  br i1 %cmp19, label %if.end32, label %if.else21, !dbg !1005

if.else21:                                        ; preds = %44
  %45 = icmp ult i64 %3, 8193, !dbg !1006
  %46 = icmp ult i64 %5, 8193, !dbg !1006
  %47 = xor i1 %45, %46, !dbg !1006
  %cmp22 = icmp ult i64 %asize, 8193, !dbg !1006
  %_msprop_select = zext i1 %47 to i64, !dbg !1008
  %48 = select i1 %47, i32 %1, i32 0, !dbg !1008
  %. = select i1 %cmp22, i64 8, i64 9, !dbg !1008
  br label %if.end32, !dbg !1008

if.end32:                                         ; preds = %if.else21, %44, %39, %34, %29, %24, %19, %14, %9
  %_msphi_s = phi i64 [ 0, %9 ], [ 0, %14 ], [ 0, %19 ], [ 0, %24 ], [ 0, %29 ], [ 0, %34 ], [ 0, %39 ], [ 0, %44 ], [ %_msprop_select, %if.else21 ], !dbg !1010
  %_msphi_o = phi i32 [ 0, %9 ], [ 0, %14 ], [ 0, %19 ], [ 0, %24 ], [ 0, %29 ], [ 0, %34 ], [ 0, %39 ], [ 0, %44 ], [ %48, %if.else21 ], !dbg !1010
  %i.0 = phi i64 [ 0, %9 ], [ 1, %14 ], [ 2, %19 ], [ 3, %24 ], [ 4, %29 ], [ 5, %34 ], [ 6, %39 ], [ 7, %44 ], [ %., %if.else21 ], !dbg !1010
  call void @llvm.dbg.value(metadata i64 %i.0, metadata !980, metadata !DIExpression()), !dbg !1012
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !1013
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !1013
  ret i64 %i.0, !dbg !1013
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc void @addFree(%struct.block* %block) unnamed_addr #0 !dbg !1014 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !1018
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !1018
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !1016, metadata !DIExpression()), !dbg !1018
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !1019
  %call = call fastcc i64 @get_size(%struct.block* %block), !dbg !1019
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !1020
  %2 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !1020
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !1020
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !1020
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !1020
  %call1 = call fastcc i64 @getHead(i64 %call), !dbg !1020
  %_msret67 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !1021
  %3 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !1021
  call void @llvm.dbg.value(metadata i64 %call1, metadata !1017, metadata !DIExpression()), !dbg !1021
  %4 = xor i64 %_msret67, -1, !dbg !1022
  %5 = and i64 %call1, %4, !dbg !1022
  %6 = icmp eq i64 %5, 0, !dbg !1022
  %7 = icmp ne i64 %_msret67, 0, !dbg !1022
  %_msprop_icmp = and i1 %7, %6, !dbg !1022
  br i1 %_msprop_icmp, label %8, label %9, !dbg !1024, !prof !88

; <label>:8:                                      ; preds = %entry
  store i32 %3, i32* @__msan_origin_tls, align 4, !dbg !1024
  call void @__msan_warning_noreturn() #5, !dbg !1024
  call void asm sideeffect "", ""() #5, !dbg !1024
  unreachable, !dbg !1024

; <label>:9:                                      ; preds = %entry
  %cmp = icmp eq i64 %call1, 0, !dbg !1022
  br i1 %cmp, label %if.then, label %.if.end11_crit_edge, !dbg !1024

.if.end11_crit_edge:                              ; preds = %9
  %.pre = select i1 %7, i32 %3, i32 0, !dbg !1025
  br label %if.end11, !dbg !1024

if.then:                                          ; preds = %9
  %10 = select i1 %7, i32 %3, i32 0, !dbg !1027
  br i1 %7, label %11, label %12, !dbg !1027, !prof !88

; <label>:11:                                     ; preds = %if.then
  store i32 %10, i32* @__msan_origin_tls, align 4, !dbg !1027
  call void @__msan_warning_noreturn() #5, !dbg !1027
  call void asm sideeffect "", ""() #5, !dbg !1027
  unreachable, !dbg !1027

; <label>:12:                                     ; preds = %if.then
  %13 = load %struct.block*, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @head, i64 0, i64 0), align 16, !dbg !1027, !tbaa !79
  %_msld = load i64, i64* inttoptr (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080) to i64*), align 16, !dbg !1030
  %14 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080), i64 17592186044416) to i32*), align 16, !dbg !1030
  %15 = ptrtoint %struct.block* %13 to i64, !dbg !1030
  %16 = xor i64 %_msld, -1, !dbg !1030
  %17 = and i64 %16, %15, !dbg !1030
  %18 = icmp eq i64 %17, 0, !dbg !1030
  %19 = icmp ne i64 %_msld, 0, !dbg !1030
  %_msprop_icmp68 = and i1 %19, %18, !dbg !1030
  br i1 %_msprop_icmp68, label %20, label %21, !dbg !1031, !prof !88

; <label>:20:                                     ; preds = %12
  store i32 %14, i32* @__msan_origin_tls, align 4, !dbg !1031
  call void @__msan_warning_noreturn() #5, !dbg !1031
  call void asm sideeffect "", ""() #5, !dbg !1031
  unreachable, !dbg !1031

; <label>:21:                                     ; preds = %12
  %cmp2 = icmp eq %struct.block* %13, null, !dbg !1030
  br i1 %cmp2, label %if.else, label %if.then3, !dbg !1031

if.then3:                                         ; preds = %21
  %22 = ptrtoint %struct.block* %block to i64, !dbg !1032
  %23 = xor i64 %0, -1, !dbg !1032
  %24 = and i64 %23, %22, !dbg !1032
  %25 = icmp eq i64 %24, 0, !dbg !1032
  %26 = icmp ne i64 %0, 0, !dbg !1032
  %_msprop_icmp69 = and i1 %26, %25, !dbg !1032
  br i1 %_msprop_icmp69, label %27, label %28, !dbg !1035, !prof !88

; <label>:27:                                     ; preds = %if.then3
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !1035
  call void @__msan_warning_noreturn() #5, !dbg !1035
  call void asm sideeffect "", ""() #5, !dbg !1035
  unreachable, !dbg !1035

; <label>:28:                                     ; preds = %if.then3
  %cmp4 = icmp eq %struct.block* %block, null, !dbg !1032
  br i1 %cmp4, label %if.end11, label %if.then5, !dbg !1035

if.then5:                                         ; preds = %28
  %next = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 0, !dbg !1036
  br i1 %26, label %29, label %30, !dbg !1038, !prof !88

; <label>:29:                                     ; preds = %if.then5
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !1038
  call void @__msan_warning_noreturn() #5, !dbg !1038
  call void asm sideeffect "", ""() #5, !dbg !1038
  unreachable, !dbg !1038

; <label>:30:                                     ; preds = %if.then5
  %31 = ptrtoint %struct.block** %next to i64, !dbg !1038
  %32 = xor i64 %31, 87960930222080, !dbg !1038
  %33 = inttoptr i64 %32 to i64*, !dbg !1038
  store i64 %_msld, i64* %33, align 8, !dbg !1038
  br i1 %19, label %34, label %41, !dbg !1038, !prof !88

; <label>:34:                                     ; preds = %30
  %35 = add i64 %32, 17592186044416, !dbg !1038
  %36 = call i32 @__msan_chain_origin(i32 %14) #5, !dbg !1038
  %37 = zext i32 %36 to i64, !dbg !1038
  %38 = shl nuw i64 %37, 32, !dbg !1038
  %39 = or i64 %38, %37, !dbg !1038
  %40 = inttoptr i64 %35 to i64*, !dbg !1038
  store i64 %39, i64* %40, align 8, !dbg !1038
  br label %41, !dbg !1038

; <label>:41:                                     ; preds = %30, %34
  store %struct.block* %13, %struct.block** %next, align 8, !dbg !1038, !tbaa !276
  %42 = load %struct.block*, %struct.block** @tail, align 8, !dbg !1039, !tbaa !79
  %_msld79 = load i64, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @tail to i64), i64 87960930222080) to i64*), align 8, !dbg !1040
  %next7 = getelementptr inbounds %struct.block, %struct.block* %42, i64 0, i32 1, i32 0, i32 0, !dbg !1040
  %_mscmp99 = icmp eq i64 %_msld79, 0, !dbg !1041
  br i1 %_mscmp99, label %45, label %43, !dbg !1041, !prof !91

; <label>:43:                                     ; preds = %41
  %44 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint (%struct.block** @tail to i64), i64 87960930222080), i64 17592186044416) to i32*), align 8, !dbg !1040
  store i32 %44, i32* @__msan_origin_tls, align 4, !dbg !1041
  call void @__msan_warning_noreturn() #5, !dbg !1041
  call void asm sideeffect "", ""() #5, !dbg !1041
  unreachable, !dbg !1041

; <label>:45:                                     ; preds = %41
  %46 = ptrtoint %struct.block** %next7 to i64, !dbg !1041
  %47 = xor i64 %46, 87960930222080, !dbg !1041
  %48 = inttoptr i64 %47 to i64*, !dbg !1041
  store i64 0, i64* %48, align 8, !dbg !1041
  br i1 false, label %49, label %50, !dbg !1041, !prof !88

; <label>:49:                                     ; preds = %45
  br label %50, !dbg !1041

; <label>:50:                                     ; preds = %45, %49
  store %struct.block* %block, %struct.block** %next7, align 8, !dbg !1041, !tbaa !276
  store i64 0, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @tail to i64), i64 87960930222080) to i64*), align 8, !dbg !1042
  br i1 false, label %51, label %52, !dbg !1042, !prof !88

; <label>:51:                                     ; preds = %50
  br label %52, !dbg !1042

; <label>:52:                                     ; preds = %50, %51
  store %struct.block* %block, %struct.block** @tail, align 8, !dbg !1042, !tbaa !79
  br label %if.end40, !dbg !1043

if.else:                                          ; preds = %21
  br i1 false, label %53, label %54, !dbg !1044, !prof !88

; <label>:53:                                     ; preds = %if.else
  unreachable, !dbg !1044

; <label>:54:                                     ; preds = %if.else
  store i64 %0, i64* inttoptr (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080) to i64*), align 16, !dbg !1044
  %_mscmp100 = icmp ne i64 %0, 0, !dbg !1044
  br i1 %_mscmp100, label %55, label %60, !dbg !1044, !prof !88

; <label>:55:                                     ; preds = %54
  %56 = call i32 @__msan_chain_origin(i32 %1) #5, !dbg !1044
  %57 = zext i32 %56 to i64, !dbg !1044
  %58 = shl nuw i64 %57, 32, !dbg !1044
  %59 = or i64 %58, %57, !dbg !1044
  store i64 %59, i64* inttoptr (i64 add (i64 xor (i64 ptrtoint ([10 x %struct.block*]* @head to i64), i64 87960930222080), i64 17592186044416) to i64*), align 16, !dbg !1044
  br label %60, !dbg !1044

; <label>:60:                                     ; preds = %54, %55
  store %struct.block* %block, %struct.block** getelementptr inbounds ([10 x %struct.block*], [10 x %struct.block*]* @head, i64 0, i64 0), align 16, !dbg !1044, !tbaa !79
  %next9 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 0, !dbg !1046
  br i1 %_mscmp100, label %61, label %62, !dbg !1047, !prof !88

; <label>:61:                                     ; preds = %60
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !1047
  call void @__msan_warning_noreturn() #5, !dbg !1047
  call void asm sideeffect "", ""() #5, !dbg !1047
  unreachable, !dbg !1047

; <label>:62:                                     ; preds = %60
  %63 = ptrtoint %struct.block** %next9 to i64, !dbg !1047
  %64 = xor i64 %63, 87960930222080, !dbg !1047
  %65 = inttoptr i64 %64 to i64*, !dbg !1047
  store i64 0, i64* %65, align 8, !dbg !1047
  br i1 false, label %66, label %67, !dbg !1047, !prof !88

; <label>:66:                                     ; preds = %62
  br label %67, !dbg !1047

; <label>:67:                                     ; preds = %62, %66
  store %struct.block* %block, %struct.block** %next9, align 8, !dbg !1047, !tbaa !276
  store i64 0, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @tail to i64), i64 87960930222080) to i64*), align 8, !dbg !1048
  br i1 false, label %68, label %69, !dbg !1048, !prof !88

; <label>:68:                                     ; preds = %67
  br label %69, !dbg !1048

; <label>:69:                                     ; preds = %67, %68
  store %struct.block* %block, %struct.block** @tail, align 8, !dbg !1048, !tbaa !79
  br label %if.end40, !dbg !1049

if.end11:                                         ; preds = %.if.end11_crit_edge, %28
  %.pre-phi = phi i32 [ %.pre, %.if.end11_crit_edge ], [ %10, %28 ], !dbg !1025
  %arrayidx12 = getelementptr inbounds [10 x %struct.block*], [10 x %struct.block*]* @head, i64 0, i64 %call1, !dbg !1025
  br i1 %7, label %70, label %71, !dbg !1025, !prof !88

; <label>:70:                                     ; preds = %if.end11
  store i32 %.pre-phi, i32* @__msan_origin_tls, align 4, !dbg !1025
  call void @__msan_warning_noreturn() #5, !dbg !1025
  call void asm sideeffect "", ""() #5, !dbg !1025
  unreachable, !dbg !1025

; <label>:71:                                     ; preds = %if.end11
  %72 = load %struct.block*, %struct.block** %arrayidx12, align 8, !dbg !1025, !tbaa !79
  %73 = ptrtoint %struct.block** %arrayidx12 to i64, !dbg !1050
  %74 = xor i64 %73, 87960930222080, !dbg !1050
  %75 = inttoptr i64 %74 to i64*, !dbg !1050
  %76 = add i64 %74, 17592186044416, !dbg !1050
  %77 = inttoptr i64 %76 to i32*, !dbg !1050
  %_msld71 = load i64, i64* %75, align 8, !dbg !1050
  %78 = load i32, i32* %77, align 8, !dbg !1050
  %79 = ptrtoint %struct.block* %72 to i64, !dbg !1050
  %80 = xor i64 %_msld71, -1, !dbg !1050
  %81 = and i64 %80, %79, !dbg !1050
  %82 = icmp eq i64 %81, 0, !dbg !1050
  %83 = icmp ne i64 %_msld71, 0, !dbg !1050
  %_msprop_icmp72 = and i1 %83, %82, !dbg !1050
  br i1 %_msprop_icmp72, label %84, label %85, !dbg !1051, !prof !88

; <label>:84:                                     ; preds = %71
  store i32 %78, i32* @__msan_origin_tls, align 4, !dbg !1051
  call void @__msan_warning_noreturn() #5, !dbg !1051
  call void asm sideeffect "", ""() #5, !dbg !1051
  unreachable, !dbg !1051

; <label>:85:                                     ; preds = %71
  %cmp13 = icmp eq %struct.block* %72, null, !dbg !1050
  br i1 %cmp13, label %if.else34, label %if.then14, !dbg !1051

if.then14:                                        ; preds = %85
  %86 = ptrtoint %struct.block* %block to i64, !dbg !1052
  %87 = xor i64 %0, -1, !dbg !1052
  %88 = and i64 %87, %86, !dbg !1052
  %89 = icmp eq i64 %88, 0, !dbg !1052
  %90 = icmp ne i64 %0, 0, !dbg !1052
  %_msprop_icmp73 = and i1 %90, %89, !dbg !1052
  br i1 %_msprop_icmp73, label %91, label %92, !dbg !1055, !prof !88

; <label>:91:                                     ; preds = %if.then14
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !1055
  call void @__msan_warning_noreturn() #5, !dbg !1055
  call void asm sideeffect "", ""() #5, !dbg !1055
  unreachable, !dbg !1055

; <label>:92:                                     ; preds = %if.then14
  %cmp15 = icmp eq %struct.block* %block, null, !dbg !1052
  br i1 %cmp15, label %if.else31, label %if.then16, !dbg !1055

if.then16:                                        ; preds = %92
  %next18 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 0, !dbg !1056
  br i1 %90, label %93, label %94, !dbg !1058, !prof !88

; <label>:93:                                     ; preds = %if.then16
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !1058
  call void @__msan_warning_noreturn() #5, !dbg !1058
  call void asm sideeffect "", ""() #5, !dbg !1058
  unreachable, !dbg !1058

; <label>:94:                                     ; preds = %if.then16
  %95 = ptrtoint %struct.block** %next18 to i64, !dbg !1058
  %96 = xor i64 %95, 87960930222080, !dbg !1058
  %97 = inttoptr i64 %96 to i64*, !dbg !1058
  store i64 %_msld71, i64* %97, align 8, !dbg !1058
  br i1 %83, label %98, label %105, !dbg !1058, !prof !88

; <label>:98:                                     ; preds = %94
  %99 = add i64 %96, 17592186044416, !dbg !1058
  %100 = call i32 @__msan_chain_origin(i32 %78) #5, !dbg !1058
  %101 = zext i32 %100 to i64, !dbg !1058
  %102 = shl nuw i64 %101, 32, !dbg !1058
  %103 = or i64 %102, %101, !dbg !1058
  %104 = inttoptr i64 %99 to i64*, !dbg !1058
  store i64 %103, i64* %104, align 8, !dbg !1058
  br label %105, !dbg !1058

; <label>:105:                                    ; preds = %94, %98
  store %struct.block* %72, %struct.block** %next18, align 8, !dbg !1058, !tbaa !276
  %prev = getelementptr inbounds %struct.block, %struct.block* %72, i64 0, i32 1, i32 0, i32 1, !dbg !1059
  br i1 %83, label %106, label %107, !dbg !1059, !prof !88

; <label>:106:                                    ; preds = %105
  store i32 %78, i32* @__msan_origin_tls, align 4, !dbg !1059
  call void @__msan_warning_noreturn() #5, !dbg !1059
  call void asm sideeffect "", ""() #5, !dbg !1059
  unreachable, !dbg !1059

; <label>:107:                                    ; preds = %105
  %108 = bitcast %struct.block** %prev to i64*, !dbg !1059
  %109 = load i64, i64* %108, align 8, !dbg !1059, !tbaa !276
  %110 = ptrtoint %struct.block** %prev to i64, !dbg !1060
  %111 = xor i64 %110, 87960930222080, !dbg !1060
  %112 = inttoptr i64 %111 to i64*, !dbg !1060
  %113 = add i64 %111, 17592186044416, !dbg !1060
  %114 = inttoptr i64 %113 to i32*, !dbg !1060
  %_msld75 = load i64, i64* %112, align 8, !dbg !1060
  %115 = load i32, i32* %114, align 8, !dbg !1060
  %prev20 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 1, !dbg !1060
  %116 = bitcast %struct.block** %prev20 to i64*, !dbg !1061
  br i1 false, label %117, label %118, !dbg !1061, !prof !88

; <label>:117:                                    ; preds = %107
  unreachable, !dbg !1061

; <label>:118:                                    ; preds = %107
  %119 = ptrtoint %struct.block** %prev20 to i64, !dbg !1061
  %120 = xor i64 %119, 87960930222080, !dbg !1061
  %121 = inttoptr i64 %120 to i64*, !dbg !1061
  store i64 %_msld75, i64* %121, align 8, !dbg !1061
  %_mscmp107 = icmp eq i64 %_msld75, 0, !dbg !1061
  br i1 %_mscmp107, label %129, label %122, !dbg !1061, !prof !91

; <label>:122:                                    ; preds = %118
  %123 = add i64 %120, 17592186044416, !dbg !1061
  %124 = call i32 @__msan_chain_origin(i32 %115) #5, !dbg !1061
  %125 = zext i32 %124 to i64, !dbg !1061
  %126 = shl nuw i64 %125, 32, !dbg !1061
  %127 = or i64 %126, %125, !dbg !1061
  %128 = inttoptr i64 %123 to i64*, !dbg !1061
  store i64 %127, i64* %128, align 8, !dbg !1061
  br label %129, !dbg !1061

; <label>:129:                                    ; preds = %118, %122
  store i64 %109, i64* %116, align 8, !dbg !1061, !tbaa !276
  br i1 false, label %130, label %131, !dbg !1062, !prof !88

; <label>:130:                                    ; preds = %129
  unreachable, !dbg !1062

; <label>:131:                                    ; preds = %129
  %132 = ptrtoint %struct.block** %prev to i64, !dbg !1062
  %133 = xor i64 %132, 87960930222080, !dbg !1062
  %134 = inttoptr i64 %133 to i64*, !dbg !1062
  store i64 0, i64* %134, align 8, !dbg !1062
  br i1 false, label %135, label %136, !dbg !1062, !prof !88

; <label>:135:                                    ; preds = %131
  br label %136, !dbg !1062

; <label>:136:                                    ; preds = %131, %135
  store %struct.block* %block, %struct.block** %prev, align 8, !dbg !1062, !tbaa !276
  br i1 false, label %137, label %138, !dbg !1063, !prof !88

; <label>:137:                                    ; preds = %136
  unreachable, !dbg !1063

; <label>:138:                                    ; preds = %136
  %139 = load %struct.block*, %struct.block** %prev20, align 8, !dbg !1063, !tbaa !276
  %140 = ptrtoint %struct.block** %prev20 to i64, !dbg !1065
  %141 = xor i64 %140, 87960930222080, !dbg !1065
  %142 = inttoptr i64 %141 to i64*, !dbg !1065
  %143 = add i64 %141, 17592186044416, !dbg !1065
  %144 = inttoptr i64 %143 to i32*, !dbg !1065
  %_msld76 = load i64, i64* %142, align 8, !dbg !1065
  %145 = load i32, i32* %144, align 8, !dbg !1065
  %146 = ptrtoint %struct.block* %139 to i64, !dbg !1065
  %147 = xor i64 %_msld76, -1, !dbg !1065
  %148 = and i64 %147, %146, !dbg !1065
  %149 = icmp eq i64 %148, 0, !dbg !1065
  %150 = icmp ne i64 %_msld76, 0, !dbg !1065
  %_msprop_icmp77 = and i1 %150, %149, !dbg !1065
  br i1 %_msprop_icmp77, label %151, label %152, !dbg !1066, !prof !88

; <label>:151:                                    ; preds = %138
  store i32 %145, i32* @__msan_origin_tls, align 4, !dbg !1066
  call void @__msan_warning_noreturn() #5, !dbg !1066
  call void asm sideeffect "", ""() #5, !dbg !1066
  unreachable, !dbg !1066

; <label>:152:                                    ; preds = %138
  %cmp24 = icmp eq %struct.block* %139, null, !dbg !1065
  br i1 %cmp24, label %if.else28, label %if.then25, !dbg !1066

if.then25:                                        ; preds = %152
  %next27 = getelementptr inbounds %struct.block, %struct.block* %139, i64 0, i32 1, i32 0, i32 0, !dbg !1067
  br i1 %150, label %153, label %154, !dbg !1069, !prof !88

; <label>:153:                                    ; preds = %if.then25
  store i32 %145, i32* @__msan_origin_tls, align 4, !dbg !1069
  call void @__msan_warning_noreturn() #5, !dbg !1069
  call void asm sideeffect "", ""() #5, !dbg !1069
  unreachable, !dbg !1069

; <label>:154:                                    ; preds = %if.then25
  %155 = ptrtoint %struct.block** %next27 to i64, !dbg !1069
  %156 = xor i64 %155, 87960930222080, !dbg !1069
  %157 = inttoptr i64 %156 to i64*, !dbg !1069
  store i64 0, i64* %157, align 8, !dbg !1069
  br i1 false, label %158, label %159, !dbg !1069, !prof !88

; <label>:158:                                    ; preds = %154
  br label %159, !dbg !1069

; <label>:159:                                    ; preds = %154, %158
  store %struct.block* %block, %struct.block** %next27, align 8, !dbg !1069, !tbaa !276
  br label %if.end40, !dbg !1070

if.else28:                                        ; preds = %152
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !1071
  store i64 0, i64* @__msan_va_arg_overflow_size_tls, align 8, !dbg !1071
  store i32 0, i32* bitcast ([100 x i64]* @__msan_retval_tls to i32*), align 8, !dbg !1071
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.2, i64 0, i64 0)), !dbg !1071
  br label %if.end40, !dbg !1073

if.else31:                                        ; preds = %92
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !1074
  store i64 0, i64* @__msan_va_arg_overflow_size_tls, align 8, !dbg !1074
  store i32 0, i32* bitcast ([100 x i64]* @__msan_retval_tls to i32*), align 8, !dbg !1074
  %call32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.3, i64 0, i64 0)), !dbg !1074
  br label %if.end40, !dbg !1076

if.else34:                                        ; preds = %85
  br i1 false, label %160, label %161, !dbg !1077, !prof !88

; <label>:160:                                    ; preds = %if.else34
  unreachable, !dbg !1077

; <label>:161:                                    ; preds = %if.else34
  store i64 %0, i64* %75, align 8, !dbg !1077
  %_mscmp103 = icmp ne i64 %0, 0, !dbg !1077
  br i1 %_mscmp103, label %162, label %168, !dbg !1077, !prof !88

; <label>:162:                                    ; preds = %161
  %163 = call i32 @__msan_chain_origin(i32 %1) #5, !dbg !1077
  %164 = zext i32 %163 to i64, !dbg !1077
  %165 = shl nuw i64 %164, 32, !dbg !1077
  %166 = or i64 %165, %164, !dbg !1077
  %167 = inttoptr i64 %76 to i64*, !dbg !1077
  store i64 %166, i64* %167, align 8, !dbg !1077
  br label %168, !dbg !1077

; <label>:168:                                    ; preds = %161, %162
  store %struct.block* %block, %struct.block** %arrayidx12, align 8, !dbg !1077, !tbaa !79
  %next37 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 0, !dbg !1079
  br i1 %_mscmp103, label %169, label %170, !dbg !1080, !prof !88

; <label>:169:                                    ; preds = %168
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !1080
  call void @__msan_warning_noreturn() #5, !dbg !1080
  call void asm sideeffect "", ""() #5, !dbg !1080
  unreachable, !dbg !1080

; <label>:170:                                    ; preds = %168
  %171 = ptrtoint %struct.block** %next37 to i64, !dbg !1080
  %172 = xor i64 %171, 87960930222080, !dbg !1080
  %173 = inttoptr i64 %172 to i64*, !dbg !1080
  store i64 0, i64* %173, align 8, !dbg !1080
  br i1 false, label %174, label %175, !dbg !1080, !prof !88

; <label>:174:                                    ; preds = %170
  br label %175, !dbg !1080

; <label>:175:                                    ; preds = %170, %174
  store %struct.block* %block, %struct.block** %next37, align 8, !dbg !1080, !tbaa !276
  %prev39 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 1, !dbg !1081
  br i1 false, label %176, label %177, !dbg !1082, !prof !88

; <label>:176:                                    ; preds = %175
  unreachable, !dbg !1082

; <label>:177:                                    ; preds = %175
  %178 = ptrtoint %struct.block** %prev39 to i64, !dbg !1082
  %179 = xor i64 %178, 87960930222080, !dbg !1082
  %180 = inttoptr i64 %179 to i64*, !dbg !1082
  store i64 0, i64* %180, align 8, !dbg !1082
  br i1 false, label %181, label %182, !dbg !1082, !prof !88

; <label>:181:                                    ; preds = %177
  br label %182, !dbg !1082

; <label>:182:                                    ; preds = %177, %181
  store %struct.block* %block, %struct.block** %prev39, align 8, !dbg !1082, !tbaa !276
  br label %if.end40

if.end40:                                         ; preds = %52, %69, %if.else28, %if.else31, %182, %159
  ret void, !dbg !1083
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

declare void @__msan_init() local_unnamed_addr

define internal void @msan.module_ctor() {
  tail call void @__msan_init()
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #4

declare i32 @__msan_chain_origin(i32)

declare i8* @__msan_memmove(i8*, i8*, i64)

declare i8* @__msan_memcpy(i8*, i8*, i64)

declare i8* @__msan_memset(i8*, i32, i64)

declare void @__msan_warning_noreturn()

declare void @__msan_maybe_warning_1(i8, i32)

declare void @__msan_maybe_store_origin_1(i8, i8*, i32)

declare void @__msan_maybe_warning_2(i16, i32)

declare void @__msan_maybe_store_origin_2(i16, i8*, i32)

declare void @__msan_maybe_warning_4(i32, i32)

declare void @__msan_maybe_store_origin_4(i32, i8*, i32)

declare void @__msan_maybe_warning_8(i64, i32)

declare void @__msan_maybe_store_origin_8(i64, i8*, i32)

declare void @__msan_set_alloca_origin4(i8*, i64, i8*, i64)

declare void @__msan_poison_stack(i8*, i64)

attributes #0 = { noinline nounwind sanitize_memory uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!65, !66, !67}
!llvm.ident = !{!68}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "heap_start", scope: !2, file: !3, line: 149, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 7.0.0 (tags/RELEASE_700/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !35)
!3 = !DIFile(filename: "mm.c", directory: "/afs/andrew.cmu.edu/usr18/peizhaol/private/lab5_malloc/malloc-lab-Prezton")
!4 = !{}
!5 = !{!6, !9, !31, !32, !33, !34}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 62, baseType: !8)
!7 = !DIFile(filename: "/usr/local/depot/llvm-7.0/lib/clang/7.0.0/include/stddef.h", directory: "/afs/andrew.cmu.edu/usr18/peizhaol/private/lab5_malloc/malloc-lab-Prezton")
!8 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "block_t", file: !3, line: 144, baseType: !11)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "block", file: !3, line: 118, size: 192, elements: !12)
!12 = !{!13, !17}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "header", scope: !11, file: !3, line: 120, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "word_t", file: !3, line: 77, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !16, line: 55, baseType: !8)
!16 = !DIFile(filename: "/usr/include/stdint.h", directory: "/afs/andrew.cmu.edu/usr18/peizhaol/private/lab5_malloc/malloc-lab-Prezton")
!17 = !DIDerivedType(tag: DW_TAG_member, scope: !11, file: !3, line: 136, baseType: !18, size: 128, offset: 64)
!18 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !11, file: !3, line: 136, size: 128, elements: !19)
!19 = !{!20, !26}
!20 = !DIDerivedType(tag: DW_TAG_member, scope: !18, file: !3, line: 137, baseType: !21, size: 128)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !18, file: !3, line: 137, size: 128, elements: !22)
!22 = !{!23, !25}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !21, file: !3, line: 138, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !21, file: !3, line: 139, baseType: !24, size: 64, offset: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !18, file: !3, line: 141, baseType: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 0)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!33 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!35 = !{!36, !39, !41, !45, !47, !49, !54, !0, !56, !59, !61, !63}
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!37 = distinct !DIGlobalVariable(name: "dsize", scope: !2, file: !3, line: 83, type: !38, isLocal: true, isDefinition: true)
!38 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!39 = !DIGlobalVariableExpression(var: !40, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!40 = distinct !DIGlobalVariable(name: "min_block_size", scope: !2, file: !3, line: 86, type: !38, isLocal: true, isDefinition: true)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression(DW_OP_constu, 10, DW_OP_stack_value))
!42 = distinct !DIGlobalVariable(name: "NUMCLASS", scope: !2, file: !3, line: 152, type: !43, isLocal: true, isDefinition: true)
!43 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !44)
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression(DW_OP_constu, 8, DW_OP_stack_value))
!46 = distinct !DIGlobalVariable(name: "wsize", scope: !2, file: !3, line: 80, type: !38, isLocal: true, isDefinition: true)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression(DW_OP_constu, 4096, DW_OP_stack_value))
!48 = distinct !DIGlobalVariable(name: "chunksize", scope: !2, file: !3, line: 92, type: !38, isLocal: true, isDefinition: true)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(name: "head", scope: !2, file: !3, line: 155, type: !51, isLocal: true, isDefinition: true)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 640, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 10)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "tail", scope: !2, file: !3, line: 158, type: !9, isLocal: true, isDefinition: true)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_stack_value))
!57 = distinct !DIGlobalVariable(name: "size_mask", scope: !2, file: !3, line: 115, type: !58, isLocal: true, isDefinition: true)
!58 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!60 = distinct !DIGlobalVariable(name: "alloc_mask_prev", scope: !2, file: !3, line: 105, type: !58, isLocal: true, isDefinition: true)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression(DW_OP_constu, 4, DW_OP_stack_value))
!62 = distinct !DIGlobalVariable(name: "mask_mini", scope: !2, file: !3, line: 110, type: !58, isLocal: true, isDefinition: true)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!64 = distinct !DIGlobalVariable(name: "alloc_mask", scope: !2, file: !3, line: 97, type: !58, isLocal: true, isDefinition: true)
!65 = !{i32 2, !"Dwarf Version", i32 4}
!66 = !{i32 2, !"Debug Info Version", i32 3}
!67 = !{i32 1, !"wchar_size", i32 4}
!68 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
!69 = distinct !DISubprogram(name: "printHeap", scope: !3, file: !3, line: 844, type: !70, isLocal: false, isDefinition: true, scopeLine: 844, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !72)
!70 = !DISubroutineType(types: !71)
!71 = !{null, !44}
!72 = !{!73, !74}
!73 = !DILocalVariable(name: "__line__", arg: 1, scope: !69, file: !3, line: 844, type: !44)
!74 = !DILocalVariable(name: "block", scope: !75, file: !3, line: 846, type: !9)
!75 = distinct !DILexicalBlock(scope: !69, file: !3, line: 846, column: 5)
!76 = !DILocation(line: 844, column: 20, scope: !69)
!77 = !DILocation(line: 845, column: 5, scope: !69)
!78 = !DILocation(line: 846, column: 27, scope: !75)
!79 = !{!80, !80, i64 0}
!80 = !{!"any pointer", !81, i64 0}
!81 = !{!"omnipotent char", !82, i64 0}
!82 = !{!"Simple C/C++ TBAA"}
!83 = !DILocation(line: 846, column: 19, scope: !75)
!84 = !DILocation(line: 846, column: 39, scope: !85)
!85 = distinct !DILexicalBlock(scope: !75, file: !3, line: 846, column: 5)
!86 = !DILocation(line: 846, column: 55, scope: !85)
!87 = !DILocation(line: 846, column: 5, scope: !75)
!88 = !{!"branch_weights", i32 1, i32 1000}
!89 = !DILocation(line: 850, column: 43, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !3, line: 847, column: 36)
!91 = !{!"branch_weights", i32 1000, i32 1}
!92 = !{!93, !94, i64 0}
!93 = !{!"block", !94, i64 0, !81, i64 8}
!94 = !{!"long", !81, i64 0}
!95 = !DILocation(line: 850, column: 23, scope: !90)
!96 = !DILocation(line: 850, column: 52, scope: !90)
!97 = !DILocation(line: 851, column: 16, scope: !90)
!98 = !DILocation(line: 851, column: 37, scope: !90)
!99 = !DILocation(line: 848, column: 9, scope: !90)
!100 = !DILocation(line: 847, column: 18, scope: !85)
!101 = distinct !{!101, !87, !102}
!102 = !DILocation(line: 852, column: 5, scope: !75)
!103 = !DILocation(line: 853, column: 1, scope: !69)
!104 = distinct !DISubprogram(name: "get_size", scope: !3, file: !3, line: 245, type: !105, isLocal: true, isDefinition: true, scopeLine: 245, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !107)
!105 = !DISubroutineType(types: !106)
!106 = !{!6, !9}
!107 = !{!108}
!108 = !DILocalVariable(name: "block", arg: 1, scope: !104, file: !3, line: 245, type: !9)
!109 = !DILocation(line: 245, column: 33, scope: !104)
!110 = !DILocation(line: 246, column: 32, scope: !104)
!111 = !DILocation(line: 246, column: 12, scope: !104)
!112 = !DILocation(line: 246, column: 5, scope: !104)
!113 = distinct !DISubprogram(name: "extract_size", scope: !3, file: !3, line: 236, type: !114, isLocal: true, isDefinition: true, scopeLine: 236, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !116)
!114 = !DISubroutineType(types: !115)
!115 = !{!6, !14}
!116 = !{!117}
!117 = !DILocalVariable(name: "word", arg: 1, scope: !113, file: !3, line: 236, type: !14)
!118 = !DILocation(line: 236, column: 35, scope: !113)
!119 = !DILocation(line: 237, column: 18, scope: !113)
!120 = !DILocation(line: 237, column: 5, scope: !113)
!121 = distinct !DISubprogram(name: "get_alloc", scope: !3, file: !3, line: 328, type: !122, isLocal: true, isDefinition: true, scopeLine: 328, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !124)
!122 = !DISubroutineType(types: !123)
!123 = !{!33, !9}
!124 = !{!125}
!125 = !DILocalVariable(name: "block", arg: 1, scope: !121, file: !3, line: 328, type: !9)
!126 = !DILocation(line: 328, column: 32, scope: !121)
!127 = !DILocation(line: 329, column: 33, scope: !121)
!128 = !DILocation(line: 329, column: 12, scope: !121)
!129 = !DILocation(line: 329, column: 5, scope: !121)
!130 = distinct !DISubprogram(name: "getPrevAlloc", scope: !3, file: !3, line: 337, type: !122, isLocal: true, isDefinition: true, scopeLine: 337, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !131)
!131 = !{!132, !133}
!132 = !DILocalVariable(name: "block", arg: 1, scope: !130, file: !3, line: 337, type: !9)
!133 = !DILocalVariable(name: "word", scope: !130, file: !3, line: 338, type: !14)
!134 = !DILocation(line: 337, column: 35, scope: !130)
!135 = !DILocation(line: 338, column: 26, scope: !130)
!136 = !DILocation(line: 338, column: 12, scope: !130)
!137 = !DILocation(line: 339, column: 24, scope: !130)
!138 = !DILocation(line: 339, column: 12, scope: !130)
!139 = !DILocation(line: 339, column: 5, scope: !130)
!140 = distinct !DISubprogram(name: "getPrevMiniStatus", scope: !3, file: !3, line: 347, type: !122, isLocal: true, isDefinition: true, scopeLine: 347, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !141)
!141 = !{!142, !143}
!142 = !DILocalVariable(name: "block", arg: 1, scope: !140, file: !3, line: 347, type: !9)
!143 = !DILocalVariable(name: "word", scope: !140, file: !3, line: 348, type: !14)
!144 = !DILocation(line: 347, column: 40, scope: !140)
!145 = !DILocation(line: 348, column: 26, scope: !140)
!146 = !DILocation(line: 348, column: 12, scope: !140)
!147 = !DILocation(line: 349, column: 24, scope: !140)
!148 = !DILocation(line: 349, column: 12, scope: !140)
!149 = !DILocation(line: 349, column: 5, scope: !140)
!150 = distinct !DISubprogram(name: "find_next", scope: !3, file: !3, line: 405, type: !151, isLocal: true, isDefinition: true, scopeLine: 405, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !153)
!151 = !DISubroutineType(types: !152)
!152 = !{!9, !9}
!153 = !{!154}
!154 = !DILocalVariable(name: "block", arg: 1, scope: !150, file: !3, line: 405, type: !9)
!155 = !DILocation(line: 405, column: 36, scope: !150)
!156 = !DILocation(line: 409, column: 24, scope: !150)
!157 = !DILocation(line: 409, column: 40, scope: !150)
!158 = !DILocation(line: 409, column: 38, scope: !150)
!159 = !DILocation(line: 409, column: 12, scope: !150)
!160 = !DILocation(line: 409, column: 5, scope: !150)
!161 = distinct !DISubprogram(name: "mm_checkheap", scope: !3, file: !3, line: 862, type: !162, isLocal: false, isDefinition: true, scopeLine: 862, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !164)
!162 = !DISubroutineType(types: !163)
!163 = !{!33, !44}
!164 = !{!165, !166, !167, !169, !172, !173, !175, !178}
!165 = !DILocalVariable(name: "line", arg: 1, scope: !161, file: !3, line: 862, type: !44)
!166 = !DILocalVariable(name: "count", scope: !161, file: !3, line: 865, type: !6)
!167 = !DILocalVariable(name: "block", scope: !168, file: !3, line: 867, type: !9)
!168 = distinct !DILexicalBlock(scope: !161, file: !3, line: 867, column: 5)
!169 = !DILocalVariable(name: "prevBlock", scope: !170, file: !3, line: 889, type: !9)
!170 = distinct !DILexicalBlock(scope: !171, file: !3, line: 868, column: 36)
!171 = distinct !DILexicalBlock(scope: !168, file: !3, line: 867, column: 5)
!172 = !DILocalVariable(name: "nextBlock", scope: !170, file: !3, line: 890, type: !9)
!173 = !DILocalVariable(name: "i", scope: !174, file: !3, line: 929, type: !44)
!174 = distinct !DILexicalBlock(scope: !161, file: !3, line: 929, column: 5)
!175 = !DILocalVariable(name: "block", scope: !176, file: !3, line: 933, type: !9)
!176 = distinct !DILexicalBlock(scope: !177, file: !3, line: 929, column: 40)
!177 = distinct !DILexicalBlock(scope: !174, file: !3, line: 929, column: 5)
!178 = !DILocalVariable(name: "curSize", scope: !176, file: !3, line: 936, type: !6)
!179 = !DILocation(line: 862, column: 23, scope: !161)
!180 = !DILocation(line: 865, column: 12, scope: !161)
!181 = !DILocation(line: 867, column: 27, scope: !168)
!182 = !DILocation(line: 867, column: 19, scope: !168)
!183 = !DILocation(line: 867, column: 39, scope: !171)
!184 = !DILocation(line: 867, column: 55, scope: !171)
!185 = !DILocation(line: 867, column: 5, scope: !168)
!186 = !DILocation(line: 871, column: 22, scope: !187)
!187 = distinct !DILexicalBlock(scope: !170, file: !3, line: 871, column: 13)
!188 = !DILocation(line: 871, column: 36, scope: !187)
!189 = !DILocation(line: 871, column: 13, scope: !187)
!190 = !DILocation(line: 871, column: 41, scope: !187)
!191 = !DILocation(line: 871, column: 46, scope: !187)
!192 = !DILocation(line: 872, column: 23, scope: !187)
!193 = !DILocation(line: 872, column: 37, scope: !187)
!194 = !DILocation(line: 872, column: 13, scope: !187)
!195 = !DILocation(line: 872, column: 50, scope: !187)
!196 = !DILocation(line: 873, column: 22, scope: !187)
!197 = !DILocation(line: 873, column: 13, scope: !187)
!198 = !DILocation(line: 873, column: 37, scope: !187)
!199 = !DILocation(line: 873, column: 42, scope: !187)
!200 = !DILocation(line: 873, column: 55, scope: !187)
!201 = !DILocation(line: 873, column: 45, scope: !187)
!202 = !DILocation(line: 871, column: 13, scope: !170)
!203 = !DILocation(line: 878, column: 21, scope: !204)
!204 = distinct !DILexicalBlock(scope: !170, file: !3, line: 878, column: 13)
!205 = !DILocation(line: 878, column: 13, scope: !204)
!206 = !DILocation(line: 878, column: 46, scope: !204)
!207 = !DILocation(line: 878, column: 54, scope: !204)
!208 = !DILocation(line: 878, column: 13, scope: !170)
!209 = !DILocation(line: 883, column: 32, scope: !210)
!210 = distinct !DILexicalBlock(scope: !170, file: !3, line: 883, column: 13)
!211 = !DILocation(line: 883, column: 21, scope: !210)
!212 = !DILocation(line: 883, column: 19, scope: !210)
!213 = !DILocation(line: 883, column: 46, scope: !210)
!214 = !DILocation(line: 884, column: 32, scope: !210)
!215 = !DILocation(line: 884, column: 21, scope: !210)
!216 = !DILocation(line: 884, column: 19, scope: !210)
!217 = !DILocation(line: 883, column: 13, scope: !170)
!218 = !DILocation(line: 889, column: 30, scope: !170)
!219 = !DILocation(line: 889, column: 18, scope: !170)
!220 = !DILocation(line: 890, column: 30, scope: !170)
!221 = !DILocation(line: 890, column: 18, scope: !170)
!222 = !DILocation(line: 893, column: 33, scope: !223)
!223 = distinct !DILexicalBlock(scope: !170, file: !3, line: 893, column: 13)
!224 = !DILocation(line: 893, column: 13, scope: !223)
!225 = !DILocation(line: 894, column: 27, scope: !223)
!226 = !DILocation(line: 894, column: 26, scope: !223)
!227 = !{!94, !94, i64 0}
!228 = !DILocation(line: 894, column: 13, scope: !223)
!229 = !DILocation(line: 893, column: 41, scope: !223)
!230 = !DILocation(line: 893, column: 13, scope: !170)
!231 = !DILocation(line: 898, column: 13, scope: !232)
!232 = distinct !DILexicalBlock(scope: !170, file: !3, line: 898, column: 13)
!233 = !DILocation(line: 899, column: 13, scope: !232)
!234 = !DILocation(line: 898, column: 42, scope: !232)
!235 = !DILocation(line: 898, column: 13, scope: !170)
!236 = !DILocation(line: 904, column: 13, scope: !237)
!237 = distinct !DILexicalBlock(scope: !170, file: !3, line: 904, column: 13)
!238 = !DILocation(line: 904, column: 13, scope: !170)
!239 = !DILocation(line: 905, column: 17, scope: !240)
!240 = distinct !DILexicalBlock(scope: !241, file: !3, line: 905, column: 17)
!241 = distinct !DILexicalBlock(scope: !237, file: !3, line: 904, column: 24)
!242 = !DILocation(line: 905, column: 43, scope: !240)
!243 = !DILocation(line: 905, column: 46, scope: !240)
!244 = !DILocation(line: 905, column: 17, scope: !241)
!245 = !DILocation(line: 911, column: 13, scope: !246)
!246 = distinct !DILexicalBlock(scope: !170, file: !3, line: 911, column: 13)
!247 = !DILocation(line: 911, column: 13, scope: !170)
!248 = !DILocation(line: 912, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !250, file: !3, line: 912, column: 17)
!250 = distinct !DILexicalBlock(scope: !246, file: !3, line: 911, column: 24)
!251 = !DILocation(line: 912, column: 43, scope: !249)
!252 = !DILocation(line: 912, column: 46, scope: !249)
!253 = !DILocation(line: 912, column: 17, scope: !250)
!254 = !DILocation(line: 918, column: 13, scope: !255)
!255 = distinct !DILexicalBlock(scope: !170, file: !3, line: 918, column: 13)
!256 = !DILocation(line: 918, column: 29, scope: !255)
!257 = !DILocation(line: 918, column: 13, scope: !170)
!258 = !DILocation(line: 923, column: 14, scope: !259)
!259 = distinct !DILexicalBlock(scope: !170, file: !3, line: 923, column: 13)
!260 = !DILocation(line: 923, column: 13, scope: !170)
!261 = distinct !{!261, !185, !262}
!262 = !DILocation(line: 926, column: 5, scope: !168)
!263 = !DILocation(line: 930, column: 13, scope: !264)
!264 = distinct !DILexicalBlock(scope: !176, file: !3, line: 930, column: 13)
!265 = !DILocation(line: 929, column: 14, scope: !174)
!266 = !DILocation(line: 930, column: 21, scope: !264)
!267 = !DILocation(line: 930, column: 13, scope: !176)
!268 = !DILocation(line: 933, column: 18, scope: !176)
!269 = !DILocation(line: 936, column: 36, scope: !176)
!270 = !DILocation(line: 936, column: 16, scope: !176)
!271 = !DILocation(line: 937, column: 9, scope: !176)
!272 = !DILocation(line: 0, scope: !273)
!273 = distinct !DILexicalBlock(scope: !176, file: !3, line: 937, column: 12)
!274 = !DILocation(line: 940, column: 24, scope: !275)
!275 = distinct !DILexicalBlock(scope: !273, file: !3, line: 940, column: 17)
!276 = !{!81, !81, i64 0}
!277 = !DILocation(line: 940, column: 17, scope: !275)
!278 = !DILocation(line: 940, column: 17, scope: !273)
!279 = !DILocation(line: 941, column: 34, scope: !280)
!280 = distinct !DILexicalBlock(scope: !281, file: !3, line: 941, column: 21)
!281 = distinct !DILexicalBlock(scope: !275, file: !3, line: 940, column: 30)
!282 = !DILocation(line: 941, column: 39, scope: !280)
!283 = !DILocation(line: 941, column: 21, scope: !281)
!284 = !DILocation(line: 946, column: 24, scope: !285)
!285 = distinct !DILexicalBlock(scope: !273, file: !3, line: 946, column: 17)
!286 = !DILocation(line: 946, column: 17, scope: !285)
!287 = !DILocation(line: 946, column: 17, scope: !273)
!288 = !DILocation(line: 947, column: 34, scope: !289)
!289 = distinct !DILexicalBlock(scope: !290, file: !3, line: 947, column: 21)
!290 = distinct !DILexicalBlock(scope: !285, file: !3, line: 946, column: 30)
!291 = !DILocation(line: 947, column: 39, scope: !289)
!292 = !DILocation(line: 947, column: 21, scope: !290)
!293 = !DILocation(line: 954, column: 36, scope: !294)
!294 = distinct !DILexicalBlock(scope: !273, file: !3, line: 954, column: 17)
!295 = !DILocation(line: 954, column: 25, scope: !294)
!296 = !DILocation(line: 954, column: 23, scope: !294)
!297 = !DILocation(line: 954, column: 50, scope: !294)
!298 = !DILocation(line: 955, column: 36, scope: !294)
!299 = !DILocation(line: 955, column: 25, scope: !294)
!300 = !DILocation(line: 955, column: 23, scope: !294)
!301 = !DILocation(line: 954, column: 17, scope: !273)
!302 = !DILocation(line: 960, column: 18, scope: !303)
!303 = distinct !DILexicalBlock(scope: !273, file: !3, line: 960, column: 17)
!304 = !DILocation(line: 960, column: 17, scope: !273)
!305 = !DILocation(line: 965, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !273, file: !3, line: 965, column: 17)
!307 = !DILocation(line: 965, column: 33, scope: !306)
!308 = !DILocation(line: 965, column: 43, scope: !306)
!309 = !DILocation(line: 971, column: 28, scope: !273)
!310 = !DILocation(line: 972, column: 27, scope: !176)
!311 = !DILocation(line: 972, column: 24, scope: !176)
!312 = !DILocation(line: 972, column: 9, scope: !273)
!313 = distinct !{!313, !271, !314}
!314 = !DILocation(line: 972, column: 34, scope: !176)
!315 = !DILocation(line: 929, column: 36, scope: !177)
!316 = !DILocation(line: 929, column: 5, scope: !174)
!317 = !DILocation(line: 929, column: 23, scope: !177)
!318 = distinct !{!318, !316, !319}
!319 = !DILocation(line: 973, column: 5, scope: !174)
!320 = !DILocation(line: 975, column: 15, scope: !321)
!321 = distinct !DILexicalBlock(scope: !161, file: !3, line: 975, column: 9)
!322 = !DILocation(line: 979, column: 5, scope: !161)
!323 = !DILocation(line: 980, column: 1, scope: !161)
!324 = !DILocation(line: 0, scope: !161)
!325 = distinct !DISubprogram(name: "header_to_payload", scope: !3, file: !3, line: 266, type: !326, isLocal: true, isDefinition: true, scopeLine: 266, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !328)
!326 = !DISubroutineType(types: !327)
!327 = !{!31, !9}
!328 = !{!329}
!329 = !DILocalVariable(name: "block", arg: 1, scope: !325, file: !3, line: 266, type: !9)
!330 = !DILocation(line: 266, column: 41, scope: !325)
!331 = !DILocation(line: 268, column: 28, scope: !325)
!332 = !DILocation(line: 268, column: 20, scope: !325)
!333 = !DILocation(line: 268, column: 5, scope: !325)
!334 = distinct !DISubprogram(name: "find_prev", scope: !3, file: !3, line: 437, type: !151, isLocal: true, isDefinition: true, scopeLine: 437, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !335)
!335 = !{!336, !337}
!336 = !DILocalVariable(name: "block", arg: 1, scope: !334, file: !3, line: 437, type: !9)
!337 = !DILocalVariable(name: "footerp", scope: !334, file: !3, line: 439, type: !32)
!338 = !DILocation(line: 437, column: 36, scope: !334)
!339 = !DILocation(line: 439, column: 23, scope: !334)
!340 = !DILocation(line: 439, column: 13, scope: !334)
!341 = !DILocation(line: 442, column: 22, scope: !342)
!342 = distinct !DILexicalBlock(scope: !334, file: !3, line: 442, column: 9)
!343 = !DILocation(line: 442, column: 9, scope: !342)
!344 = !DILocation(line: 442, column: 32, scope: !342)
!345 = !DILocation(line: 442, column: 9, scope: !334)
!346 = !DILocation(line: 446, column: 12, scope: !334)
!347 = !DILocation(line: 446, column: 5, scope: !334)
!348 = !DILocation(line: 0, scope: !334)
!349 = !DILocation(line: 447, column: 1, scope: !334)
!350 = distinct !DISubprogram(name: "header_to_footer", scope: !3, file: !3, line: 278, type: !351, isLocal: true, isDefinition: true, scopeLine: 278, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !353)
!351 = !DISubroutineType(types: !352)
!352 = !{!32, !9}
!353 = !{!354}
!354 = !DILocalVariable(name: "block", arg: 1, scope: !350, file: !3, line: 278, type: !9)
!355 = !DILocation(line: 278, column: 42, scope: !350)
!356 = !DILocation(line: 281, column: 30, scope: !350)
!357 = !DILocation(line: 281, column: 23, scope: !350)
!358 = !DILocation(line: 281, column: 40, scope: !350)
!359 = !DILocation(line: 281, column: 38, scope: !350)
!360 = !DILocation(line: 281, column: 56, scope: !350)
!361 = !DILocation(line: 281, column: 12, scope: !350)
!362 = !DILocation(line: 281, column: 5, scope: !350)
!363 = distinct !DISubprogram(name: "extract_alloc", scope: !3, file: !3, line: 319, type: !364, isLocal: true, isDefinition: true, scopeLine: 319, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !366)
!364 = !DISubroutineType(types: !365)
!365 = !{!33, !14}
!366 = !{!367}
!367 = !DILocalVariable(name: "word", arg: 1, scope: !363, file: !3, line: 319, type: !14)
!368 = !DILocation(line: 319, column: 34, scope: !363)
!369 = !DILocation(line: 320, column: 24, scope: !363)
!370 = !DILocation(line: 320, column: 12, scope: !363)
!371 = !DILocation(line: 320, column: 5, scope: !363)
!372 = distinct !DISubprogram(name: "mm_init", scope: !3, file: !3, line: 992, type: !373, isLocal: false, isDefinition: true, scopeLine: 992, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !375)
!373 = !DISubroutineType(types: !374)
!374 = !{!33}
!375 = !{!376, !377}
!376 = !DILocalVariable(name: "start", scope: !372, file: !3, line: 994, type: !32)
!377 = !DILocalVariable(name: "i", scope: !378, file: !3, line: 995, type: !44)
!378 = distinct !DILexicalBlock(scope: !372, file: !3, line: 995, column: 5)
!379 = !DILocation(line: 994, column: 32, scope: !372)
!380 = !DILocation(line: 994, column: 13, scope: !372)
!381 = !DILocation(line: 995, column: 14, scope: !378)
!382 = !DILocation(line: 996, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !384, file: !3, line: 995, column: 40)
!384 = distinct !DILexicalBlock(scope: !378, file: !3, line: 995, column: 5)
!385 = !DILocation(line: 998, column: 10, scope: !372)
!386 = !DILocation(line: 999, column: 15, scope: !387)
!387 = distinct !DILexicalBlock(scope: !372, file: !3, line: 999, column: 9)
!388 = !DILocation(line: 999, column: 9, scope: !372)
!389 = !DILocation(line: 994, column: 21, scope: !372)
!390 = !DILocation(line: 1003, column: 16, scope: !372)
!391 = !DILocation(line: 1003, column: 14, scope: !372)
!392 = !DILocation(line: 1004, column: 5, scope: !372)
!393 = !DILocation(line: 1004, column: 14, scope: !372)
!394 = !DILocation(line: 1007, column: 16, scope: !372)
!395 = !DILocation(line: 1010, column: 9, scope: !396)
!396 = distinct !DILexicalBlock(scope: !372, file: !3, line: 1010, column: 9)
!397 = !DILocation(line: 1010, column: 32, scope: !396)
!398 = !DILocation(line: 1011, column: 9, scope: !399)
!399 = distinct !DILexicalBlock(scope: !396, file: !3, line: 1010, column: 41)
!400 = !DILocation(line: 0, scope: !372)
!401 = !DILocation(line: 1018, column: 1, scope: !372)
!402 = distinct !DISubprogram(name: "pack", scope: !3, file: !3, line: 216, type: !403, isLocal: true, isDefinition: true, scopeLine: 216, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !405)
!403 = !DISubroutineType(types: !404)
!404 = !{!14, !6, !33, !33}
!405 = !{!406, !407, !408, !409}
!406 = !DILocalVariable(name: "size", arg: 1, scope: !402, file: !3, line: 216, type: !6)
!407 = !DILocalVariable(name: "alloc", arg: 2, scope: !402, file: !3, line: 216, type: !33)
!408 = !DILocalVariable(name: "prevAlloc", arg: 3, scope: !402, file: !3, line: 216, type: !33)
!409 = !DILocalVariable(name: "word", scope: !402, file: !3, line: 217, type: !14)
!410 = !DILocation(line: 216, column: 27, scope: !402)
!411 = !DILocation(line: 216, column: 38, scope: !402)
!412 = !DILocation(line: 216, column: 50, scope: !402)
!413 = !DILocation(line: 217, column: 12, scope: !402)
!414 = !DILocation(line: 218, column: 9, scope: !402)
!415 = !DILocation(line: 222, column: 14, scope: !416)
!416 = distinct !DILexicalBlock(scope: !417, file: !3, line: 221, column: 20)
!417 = distinct !DILexicalBlock(scope: !402, file: !3, line: 221, column: 9)
!418 = !DILocation(line: 221, column: 9, scope: !402)
!419 = !DILocation(line: 224, column: 5, scope: !402)
!420 = distinct !DISubprogram(name: "extend_heap", scope: !3, file: !3, line: 739, type: !421, isLocal: true, isDefinition: true, scopeLine: 739, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !423)
!421 = !DISubroutineType(types: !422)
!422 = !{!9, !6}
!423 = !{!424, !425, !426, !427}
!424 = !DILocalVariable(name: "size", arg: 1, scope: !420, file: !3, line: 739, type: !6)
!425 = !DILocalVariable(name: "bp", scope: !420, file: !3, line: 740, type: !31)
!426 = !DILocalVariable(name: "block", scope: !420, file: !3, line: 749, type: !9)
!427 = !DILocalVariable(name: "block_next", scope: !420, file: !3, line: 756, type: !9)
!428 = !DILocation(line: 739, column: 36, scope: !420)
!429 = !DILocation(line: 743, column: 12, scope: !420)
!430 = !DILocation(line: 744, column: 15, scope: !431)
!431 = distinct !DILexicalBlock(scope: !420, file: !3, line: 744, column: 9)
!432 = !DILocation(line: 740, column: 11, scope: !420)
!433 = !DILocation(line: 744, column: 31, scope: !431)
!434 = !DILocation(line: 744, column: 9, scope: !420)
!435 = !DILocation(line: 749, column: 22, scope: !420)
!436 = !DILocation(line: 749, column: 14, scope: !420)
!437 = !DILocation(line: 752, column: 37, scope: !420)
!438 = !DILocation(line: 753, column: 17, scope: !420)
!439 = !DILocation(line: 752, column: 5, scope: !420)
!440 = !DILocation(line: 756, column: 27, scope: !420)
!441 = !DILocation(line: 756, column: 14, scope: !420)
!442 = !DILocation(line: 757, column: 5, scope: !420)
!443 = !DILocation(line: 760, column: 13, scope: !420)
!444 = !DILocation(line: 762, column: 5, scope: !420)
!445 = !DILocation(line: 0, scope: !420)
!446 = !DILocation(line: 763, column: 1, scope: !420)
!447 = distinct !DISubprogram(name: "mm_malloc", scope: !3, file: !3, line: 1026, type: !448, isLocal: false, isDefinition: true, scopeLine: 1026, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !450)
!448 = !DISubroutineType(types: !449)
!449 = !{!31, !6}
!450 = !{!451, !452, !453, !454, !455, !456}
!451 = !DILocalVariable(name: "size", arg: 1, scope: !447, file: !3, line: 1026, type: !6)
!452 = !DILocalVariable(name: "asize", scope: !447, file: !3, line: 1029, type: !6)
!453 = !DILocalVariable(name: "extendsize", scope: !447, file: !3, line: 1030, type: !6)
!454 = !DILocalVariable(name: "block", scope: !447, file: !3, line: 1031, type: !9)
!455 = !DILocalVariable(name: "bp", scope: !447, file: !3, line: 1032, type: !31)
!456 = !DILocalVariable(name: "block_size", scope: !447, file: !3, line: 1070, type: !6)
!457 = !DILocation(line: 1026, column: 21, scope: !447)
!458 = !DILocation(line: 1032, column: 11, scope: !447)
!459 = !DILocation(line: 1035, column: 9, scope: !460)
!460 = distinct !DILexicalBlock(scope: !447, file: !3, line: 1035, column: 9)
!461 = !DILocation(line: 1035, column: 20, scope: !460)
!462 = !DILocation(line: 1035, column: 9, scope: !447)
!463 = !DILocation(line: 1036, column: 9, scope: !464)
!464 = distinct !DILexicalBlock(scope: !460, file: !3, line: 1035, column: 29)
!465 = !DILocation(line: 1037, column: 5, scope: !464)
!466 = !DILocation(line: 1040, column: 14, scope: !467)
!467 = distinct !DILexicalBlock(scope: !447, file: !3, line: 1040, column: 9)
!468 = !DILocation(line: 1040, column: 9, scope: !447)
!469 = !DILocation(line: 1046, column: 27, scope: !447)
!470 = !DILocation(line: 1046, column: 13, scope: !447)
!471 = !DILocation(line: 1029, column: 12, scope: !447)
!472 = !DILocation(line: 1050, column: 13, scope: !447)
!473 = !DILocation(line: 1031, column: 14, scope: !447)
!474 = !DILocation(line: 1053, column: 15, scope: !475)
!475 = distinct !DILexicalBlock(scope: !447, file: !3, line: 1053, column: 9)
!476 = !DILocation(line: 1053, column: 9, scope: !447)
!477 = !DILocation(line: 1055, column: 22, scope: !478)
!478 = distinct !DILexicalBlock(scope: !475, file: !3, line: 1053, column: 24)
!479 = !DILocation(line: 1030, column: 12, scope: !447)
!480 = !DILocation(line: 1056, column: 17, scope: !478)
!481 = !DILocation(line: 1058, column: 19, scope: !482)
!482 = distinct !DILexicalBlock(scope: !478, file: !3, line: 1058, column: 13)
!483 = !DILocation(line: 1058, column: 13, scope: !478)
!484 = !DILocation(line: 0, scope: !447)
!485 = !DILocation(line: 1067, column: 5, scope: !447)
!486 = !DILocation(line: 1070, column: 25, scope: !447)
!487 = !DILocation(line: 1070, column: 12, scope: !447)
!488 = !DILocation(line: 1071, column: 48, scope: !447)
!489 = !DILocation(line: 1071, column: 5, scope: !447)
!490 = !DILocation(line: 1074, column: 5, scope: !447)
!491 = !DILocation(line: 1076, column: 10, scope: !447)
!492 = !DILocation(line: 1079, column: 5, scope: !447)
!493 = !DILocation(line: 1080, column: 1, scope: !447)
!494 = distinct !DISubprogram(name: "round_up", scope: !3, file: !3, line: 196, type: !495, isLocal: true, isDefinition: true, scopeLine: 196, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !497)
!495 = !DISubroutineType(types: !496)
!496 = !{!6, !6, !6}
!497 = !{!498, !499, !500}
!498 = !DILocalVariable(name: "size", arg: 1, scope: !494, file: !3, line: 196, type: !6)
!499 = !DILocalVariable(name: "n", arg: 2, scope: !494, file: !3, line: 196, type: !6)
!500 = !DILocalVariable(name: "tmp", scope: !494, file: !3, line: 197, type: !6)
!501 = !DILocation(line: 196, column: 31, scope: !494)
!502 = !DILocation(line: 196, column: 44, scope: !494)
!503 = !DILocation(line: 197, column: 29, scope: !494)
!504 = !DILocation(line: 197, column: 20, scope: !494)
!505 = !DILocation(line: 197, column: 12, scope: !494)
!506 = !DILocation(line: 201, column: 5, scope: !494)
!507 = distinct !DISubprogram(name: "find_first_free", scope: !3, file: !3, line: 613, type: !421, isLocal: true, isDefinition: true, scopeLine: 613, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !508)
!508 = !{!509, !510, !512}
!509 = !DILocalVariable(name: "asize", arg: 1, scope: !507, file: !3, line: 613, type: !6)
!510 = !DILocalVariable(name: "i", scope: !511, file: !3, line: 614, type: !6)
!511 = distinct !DILexicalBlock(scope: !507, file: !3, line: 614, column: 5)
!512 = !DILocalVariable(name: "block", scope: !513, file: !3, line: 620, type: !9)
!513 = distinct !DILexicalBlock(scope: !514, file: !3, line: 614, column: 56)
!514 = distinct !DILexicalBlock(scope: !511, file: !3, line: 614, column: 5)
!515 = !DILocation(line: 613, column: 40, scope: !507)
!516 = !DILocation(line: 614, column: 21, scope: !511)
!517 = !DILocation(line: 614, column: 17, scope: !511)
!518 = !DILocation(line: 614, column: 39, scope: !514)
!519 = !DILocation(line: 614, column: 5, scope: !511)
!520 = !DILocation(line: 616, column: 13, scope: !521)
!521 = distinct !DILexicalBlock(scope: !513, file: !3, line: 616, column: 13)
!522 = !DILocation(line: 616, column: 21, scope: !521)
!523 = !DILocation(line: 616, column: 13, scope: !513)
!524 = !DILocation(line: 622, column: 19, scope: !525)
!525 = distinct !DILexicalBlock(scope: !526, file: !3, line: 622, column: 17)
!526 = distinct !DILexicalBlock(scope: !513, file: !3, line: 621, column: 12)
!527 = !DILocation(line: 0, scope: !526)
!528 = !DILocation(line: 620, column: 18, scope: !513)
!529 = !DILocation(line: 622, column: 37, scope: !525)
!530 = !DILocation(line: 622, column: 50, scope: !525)
!531 = !DILocation(line: 622, column: 47, scope: !525)
!532 = !DILocation(line: 622, column: 17, scope: !526)
!533 = !DILocation(line: 625, column: 28, scope: !526)
!534 = !DILocation(line: 626, column: 24, scope: !513)
!535 = !DILocation(line: 626, column: 9, scope: !526)
!536 = distinct !{!536, !537, !538}
!537 = !DILocation(line: 621, column: 9, scope: !513)
!538 = !DILocation(line: 626, column: 34, scope: !513)
!539 = !DILocation(line: 614, column: 52, scope: !514)
!540 = distinct !{!540, !519, !541}
!541 = !DILocation(line: 627, column: 5, scope: !511)
!542 = !DILocation(line: 630, column: 1, scope: !507)
!543 = !DILocation(line: 0, scope: !507)
!544 = distinct !DISubprogram(name: "max", scope: !3, file: !3, line: 186, type: !495, isLocal: true, isDefinition: true, scopeLine: 186, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !545)
!545 = !{!546, !547}
!546 = !DILocalVariable(name: "x", arg: 1, scope: !544, file: !3, line: 186, type: !6)
!547 = !DILocalVariable(name: "y", arg: 2, scope: !544, file: !3, line: 186, type: !6)
!548 = !DILocation(line: 186, column: 26, scope: !544)
!549 = !DILocation(line: 186, column: 36, scope: !544)
!550 = !DILocation(line: 187, column: 15, scope: !544)
!551 = !DILocation(line: 187, column: 12, scope: !544)
!552 = !DILocation(line: 187, column: 5, scope: !544)
!553 = distinct !DISubprogram(name: "removeFree", scope: !3, file: !3, line: 494, type: !554, isLocal: true, isDefinition: true, scopeLine: 494, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !556)
!554 = !DISubroutineType(types: !555)
!555 = !{null, !9}
!556 = !{!557, !558, !559, !564}
!557 = !DILocalVariable(name: "block", arg: 1, scope: !553, file: !3, line: 494, type: !9)
!558 = !DILocalVariable(name: "i", scope: !553, file: !3, line: 495, type: !6)
!559 = !DILocalVariable(name: "cur", scope: !560, file: !3, line: 514, type: !9)
!560 = distinct !DILexicalBlock(scope: !561, file: !3, line: 513, column: 28)
!561 = distinct !DILexicalBlock(scope: !562, file: !3, line: 513, column: 13)
!562 = distinct !DILexicalBlock(scope: !563, file: !3, line: 497, column: 17)
!563 = distinct !DILexicalBlock(scope: !553, file: !3, line: 497, column: 9)
!564 = !DILocalVariable(name: "cur", scope: !562, file: !3, line: 522, type: !9)
!565 = !DILocation(line: 494, column: 33, scope: !553)
!566 = !DILocation(line: 495, column: 24, scope: !553)
!567 = !DILocation(line: 495, column: 16, scope: !553)
!568 = !DILocation(line: 495, column: 12, scope: !553)
!569 = !DILocation(line: 497, column: 11, scope: !563)
!570 = !DILocation(line: 0, scope: !571)
!571 = distinct !DILexicalBlock(scope: !553, file: !3, line: 532, column: 9)
!572 = !DILocation(line: 497, column: 9, scope: !553)
!573 = !DILocation(line: 499, column: 25, scope: !574)
!574 = distinct !DILexicalBlock(scope: !562, file: !3, line: 499, column: 13)
!575 = !DILocation(line: 499, column: 46, scope: !574)
!576 = !DILocation(line: 499, column: 43, scope: !574)
!577 = !DILocation(line: 499, column: 34, scope: !574)
!578 = !DILocation(line: 505, column: 22, scope: !579)
!579 = distinct !DILexicalBlock(scope: !562, file: !3, line: 505, column: 13)
!580 = !DILocation(line: 499, column: 63, scope: !574)
!581 = !DILocation(line: 499, column: 60, scope: !574)
!582 = !DILocation(line: 499, column: 13, scope: !562)
!583 = !DILocation(line: 500, column: 21, scope: !584)
!584 = distinct !DILexicalBlock(scope: !574, file: !3, line: 499, column: 72)
!585 = !DILocation(line: 501, column: 18, scope: !584)
!586 = !DILocation(line: 502, column: 25, scope: !584)
!587 = !DILocation(line: 503, column: 13, scope: !584)
!588 = !DILocation(line: 505, column: 19, scope: !579)
!589 = !DILocation(line: 505, column: 13, scope: !562)
!590 = !DILocation(line: 506, column: 32, scope: !591)
!591 = distinct !DILexicalBlock(scope: !579, file: !3, line: 505, column: 31)
!592 = !DILocation(line: 506, column: 21, scope: !591)
!593 = !DILocation(line: 509, column: 19, scope: !591)
!594 = !DILocation(line: 509, column: 24, scope: !591)
!595 = !DILocation(line: 510, column: 25, scope: !591)
!596 = !DILocation(line: 511, column: 13, scope: !591)
!597 = !DILocation(line: 513, column: 13, scope: !562)
!598 = !DILocation(line: 523, column: 21, scope: !562)
!599 = !DILocation(line: 515, column: 25, scope: !560)
!600 = !DILocation(line: 0, scope: !601)
!601 = distinct !DILexicalBlock(scope: !560, file: !3, line: 515, column: 39)
!602 = !DILocation(line: 514, column: 22, scope: !560)
!603 = !DILocation(line: 515, column: 30, scope: !560)
!604 = !DILocation(line: 515, column: 13, scope: !560)
!605 = distinct !{!605, !604, !606}
!606 = !DILocation(line: 517, column: 13, scope: !560)
!607 = !DILocation(line: 518, column: 18, scope: !560)
!608 = !DILocation(line: 519, column: 26, scope: !560)
!609 = !DILocation(line: 519, column: 24, scope: !560)
!610 = !DILocation(line: 520, column: 13, scope: !560)
!611 = !DILocation(line: 0, scope: !612)
!612 = distinct !DILexicalBlock(scope: !562, file: !3, line: 523, column: 36)
!613 = !DILocation(line: 522, column: 18, scope: !562)
!614 = !DILocation(line: 523, column: 26, scope: !562)
!615 = !DILocation(line: 523, column: 9, scope: !562)
!616 = distinct !{!616, !615, !617}
!617 = !DILocation(line: 525, column: 9, scope: !562)
!618 = !DILocation(line: 526, column: 28, scope: !562)
!619 = !DILocation(line: 526, column: 19, scope: !562)
!620 = !DILocation(line: 527, column: 21, scope: !562)
!621 = !DILocation(line: 528, column: 9, scope: !562)
!622 = !DILocation(line: 532, column: 31, scope: !571)
!623 = !DILocation(line: 532, column: 21, scope: !571)
!624 = !DILocation(line: 532, column: 51, scope: !571)
!625 = !DILocation(line: 532, column: 36, scope: !571)
!626 = !DILocation(line: 533, column: 21, scope: !571)
!627 = !DILocation(line: 0, scope: !628)
!628 = distinct !DILexicalBlock(scope: !553, file: !3, line: 541, column: 9)
!629 = !DILocation(line: 534, column: 17, scope: !630)
!630 = distinct !DILexicalBlock(scope: !571, file: !3, line: 533, column: 31)
!631 = !DILocation(line: 537, column: 9, scope: !630)
!632 = !DILocation(line: 536, column: 21, scope: !630)
!633 = !DILocation(line: 541, column: 18, scope: !628)
!634 = !DILocation(line: 541, column: 15, scope: !628)
!635 = !DILocation(line: 541, column: 9, scope: !553)
!636 = !DILocation(line: 542, column: 28, scope: !637)
!637 = distinct !DILexicalBlock(scope: !628, file: !3, line: 541, column: 27)
!638 = !DILocation(line: 542, column: 17, scope: !637)
!639 = !DILocation(line: 543, column: 32, scope: !637)
!640 = !DILocation(line: 543, column: 18, scope: !637)
!641 = !DILocation(line: 543, column: 23, scope: !637)
!642 = !DILocation(line: 544, column: 29, scope: !637)
!643 = !DILocation(line: 544, column: 16, scope: !637)
!644 = !DILocation(line: 544, column: 22, scope: !637)
!645 = !DILocation(line: 544, column: 27, scope: !637)
!646 = !DILocation(line: 547, column: 9, scope: !637)
!647 = !DILocation(line: 546, column: 21, scope: !637)
!648 = !DILocation(line: 551, column: 32, scope: !553)
!649 = !DILocation(line: 551, column: 18, scope: !553)
!650 = !DILocation(line: 551, column: 23, scope: !553)
!651 = !DILocation(line: 552, column: 32, scope: !553)
!652 = !DILocation(line: 552, column: 12, scope: !553)
!653 = !DILocation(line: 552, column: 18, scope: !553)
!654 = !DILocation(line: 552, column: 23, scope: !553)
!655 = !DILocation(line: 555, column: 1, scope: !553)
!656 = !DILocation(line: 554, column: 17, scope: !553)
!657 = distinct !DISubprogram(name: "write_block", scope: !3, file: !3, line: 379, type: !658, isLocal: true, isDefinition: true, scopeLine: 380, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !660)
!658 = !DISubroutineType(types: !659)
!659 = !{null, !9, !6, !33, !33, !33}
!660 = !{!661, !662, !663, !664, !665, !666}
!661 = !DILocalVariable(name: "block", arg: 1, scope: !657, file: !3, line: 379, type: !9)
!662 = !DILocalVariable(name: "size", arg: 2, scope: !657, file: !3, line: 379, type: !6)
!663 = !DILocalVariable(name: "alloc", arg: 3, scope: !657, file: !3, line: 379, type: !33)
!664 = !DILocalVariable(name: "prevAlloc", arg: 4, scope: !657, file: !3, line: 379, type: !33)
!665 = !DILocalVariable(name: "prevMini", arg: 5, scope: !657, file: !3, line: 380, type: !33)
!666 = !DILocalVariable(name: "footerp", scope: !667, file: !3, line: 390, type: !32)
!667 = distinct !DILexicalBlock(scope: !668, file: !3, line: 389, column: 47)
!668 = distinct !DILexicalBlock(scope: !657, file: !3, line: 389, column: 9)
!669 = !DILocation(line: 379, column: 34, scope: !657)
!670 = !DILocation(line: 379, column: 48, scope: !657)
!671 = !DILocation(line: 379, column: 59, scope: !657)
!672 = !DILocation(line: 379, column: 71, scope: !657)
!673 = !DILocation(line: 380, column: 30, scope: !657)
!674 = !DILocation(line: 383, column: 21, scope: !657)
!675 = !DILocation(line: 383, column: 12, scope: !657)
!676 = !DILocation(line: 387, column: 23, scope: !677)
!677 = distinct !DILexicalBlock(scope: !678, file: !3, line: 386, column: 12)
!678 = distinct !DILexicalBlock(scope: !657, file: !3, line: 384, column: 9)
!679 = !DILocation(line: 385, column: 23, scope: !680)
!680 = distinct !DILexicalBlock(scope: !678, file: !3, line: 384, column: 19)
!681 = !DILocation(line: 384, column: 9, scope: !657)
!682 = !DILocation(line: 0, scope: !680)
!683 = !DILocation(line: 389, column: 18, scope: !668)
!684 = !DILocation(line: 389, column: 27, scope: !668)
!685 = !DILocation(line: 390, column: 27, scope: !667)
!686 = !DILocation(line: 390, column: 17, scope: !667)
!687 = !DILocation(line: 391, column: 18, scope: !667)
!688 = !DILocation(line: 392, column: 5, scope: !667)
!689 = !DILocation(line: 393, column: 1, scope: !657)
!690 = distinct !DISubprogram(name: "split_block", scope: !3, file: !3, line: 776, type: !691, isLocal: true, isDefinition: true, scopeLine: 776, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !693)
!691 = !DISubroutineType(types: !692)
!692 = !{null, !9, !6}
!693 = !{!694, !695, !696, !697, !700, !703}
!694 = !DILocalVariable(name: "block", arg: 1, scope: !690, file: !3, line: 776, type: !9)
!695 = !DILocalVariable(name: "asize", arg: 2, scope: !690, file: !3, line: 776, type: !6)
!696 = !DILocalVariable(name: "block_size", scope: !690, file: !3, line: 779, type: !6)
!697 = !DILocalVariable(name: "block_next", scope: !698, file: !3, line: 782, type: !9)
!698 = distinct !DILexicalBlock(scope: !699, file: !3, line: 781, column: 49)
!699 = distinct !DILexicalBlock(scope: !690, file: !3, line: 781, column: 9)
!700 = !DILocalVariable(name: "next_next_block", scope: !701, file: !3, line: 799, type: !9)
!701 = distinct !DILexicalBlock(scope: !702, file: !3, line: 798, column: 51)
!702 = distinct !DILexicalBlock(scope: !698, file: !3, line: 798, column: 13)
!703 = !DILocalVariable(name: "block_next", scope: !704, file: !3, line: 806, type: !9)
!704 = distinct !DILexicalBlock(scope: !699, file: !3, line: 805, column: 12)
!705 = !DILocation(line: 776, column: 34, scope: !690)
!706 = !DILocation(line: 776, column: 48, scope: !690)
!707 = !DILocation(line: 779, column: 25, scope: !690)
!708 = !DILocation(line: 779, column: 12, scope: !690)
!709 = !DILocation(line: 781, column: 21, scope: !699)
!710 = !DILocation(line: 781, column: 30, scope: !699)
!711 = !DILocation(line: 781, column: 9, scope: !690)
!712 = !DILocation(line: 786, column: 47, scope: !698)
!713 = !DILocation(line: 786, column: 9, scope: !698)
!714 = !DILocation(line: 787, column: 22, scope: !698)
!715 = !DILocation(line: 782, column: 18, scope: !698)
!716 = !DILocation(line: 790, column: 19, scope: !717)
!717 = distinct !DILexicalBlock(scope: !698, file: !3, line: 790, column: 13)
!718 = !DILocation(line: 790, column: 13, scope: !698)
!719 = !DILocation(line: 791, column: 13, scope: !720)
!720 = distinct !DILexicalBlock(scope: !717, file: !3, line: 790, column: 38)
!721 = !DILocation(line: 792, column: 9, scope: !720)
!722 = !DILocation(line: 793, column: 13, scope: !723)
!723 = distinct !DILexicalBlock(scope: !717, file: !3, line: 792, column: 16)
!724 = !DILocation(line: 798, column: 32, scope: !702)
!725 = !DILocation(line: 798, column: 13, scope: !698)
!726 = !DILocation(line: 799, column: 40, scope: !701)
!727 = !DILocation(line: 799, column: 22, scope: !701)
!728 = !DILocation(line: 800, column: 42, scope: !701)
!729 = !DILocation(line: 801, column: 25, scope: !701)
!730 = !DILocation(line: 800, column: 13, scope: !701)
!731 = !DILocation(line: 802, column: 9, scope: !701)
!732 = !DILocation(line: 804, column: 9, scope: !698)
!733 = !DILocation(line: 805, column: 5, scope: !698)
!734 = !DILocation(line: 806, column: 31, scope: !704)
!735 = !DILocation(line: 806, column: 18, scope: !704)
!736 = !DILocation(line: 807, column: 24, scope: !737)
!737 = distinct !DILexicalBlock(scope: !704, file: !3, line: 807, column: 13)
!738 = !DILocation(line: 0, scope: !739)
!739 = distinct !DILexicalBlock(scope: !737, file: !3, line: 809, column: 16)
!740 = !DILocation(line: 807, column: 13, scope: !704)
!741 = !DILocation(line: 808, column: 13, scope: !742)
!742 = distinct !DILexicalBlock(scope: !737, file: !3, line: 807, column: 43)
!743 = !DILocation(line: 809, column: 9, scope: !742)
!744 = !DILocation(line: 810, column: 13, scope: !739)
!745 = !DILocation(line: 814, column: 1, scope: !690)
!746 = distinct !DISubprogram(name: "mm_free", scope: !3, file: !3, line: 1092, type: !747, isLocal: false, isDefinition: true, scopeLine: 1092, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !749)
!747 = !DISubroutineType(types: !748)
!748 = !{null, !31}
!749 = !{!750, !751, !752}
!750 = !DILocalVariable(name: "bp", arg: 1, scope: !746, file: !3, line: 1092, type: !31)
!751 = !DILocalVariable(name: "block", scope: !746, file: !3, line: 1098, type: !9)
!752 = !DILocalVariable(name: "size", scope: !746, file: !3, line: 1099, type: !6)
!753 = !DILocation(line: 1092, column: 17, scope: !746)
!754 = !DILocation(line: 1094, column: 12, scope: !755)
!755 = distinct !DILexicalBlock(scope: !746, file: !3, line: 1094, column: 9)
!756 = !DILocation(line: 1094, column: 9, scope: !746)
!757 = !DILocation(line: 1098, column: 22, scope: !746)
!758 = !DILocation(line: 1098, column: 14, scope: !746)
!759 = !DILocation(line: 1099, column: 19, scope: !746)
!760 = !DILocation(line: 1099, column: 12, scope: !746)
!761 = !DILocation(line: 1105, column: 37, scope: !746)
!762 = !DILocation(line: 1106, column: 17, scope: !746)
!763 = !DILocation(line: 1105, column: 5, scope: !746)
!764 = !DILocation(line: 1109, column: 13, scope: !746)
!765 = !DILocation(line: 1112, column: 1, scope: !746)
!766 = distinct !DISubprogram(name: "payload_to_header", scope: !3, file: !3, line: 255, type: !767, isLocal: true, isDefinition: true, scopeLine: 255, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !769)
!767 = !DISubroutineType(types: !768)
!768 = !{!9, !31}
!769 = !{!770}
!770 = !DILocalVariable(name: "bp", arg: 1, scope: !766, file: !3, line: 255, type: !31)
!771 = !DILocation(line: 255, column: 41, scope: !766)
!772 = !DILocation(line: 256, column: 35, scope: !766)
!773 = !DILocation(line: 256, column: 12, scope: !766)
!774 = !DILocation(line: 256, column: 5, scope: !766)
!775 = distinct !DISubprogram(name: "coalesce_block", scope: !3, file: !3, line: 643, type: !151, isLocal: true, isDefinition: true, scopeLine: 643, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !776)
!776 = !{!777, !778, !779, !780, !781, !782, !783, !787}
!777 = !DILocalVariable(name: "block", arg: 1, scope: !775, file: !3, line: 643, type: !9)
!778 = !DILocalVariable(name: "prevBlock", scope: !775, file: !3, line: 645, type: !9)
!779 = !DILocalVariable(name: "nextBlock", scope: !775, file: !3, line: 646, type: !9)
!780 = !DILocalVariable(name: "newSize", scope: !775, file: !3, line: 647, type: !6)
!781 = !DILocalVariable(name: "prevAlloc", scope: !775, file: !3, line: 648, type: !33)
!782 = !DILocalVariable(name: "nextAlloc", scope: !775, file: !3, line: 649, type: !33)
!783 = !DILocalVariable(name: "true_next_block", scope: !784, file: !3, line: 686, type: !9)
!784 = distinct !DILexicalBlock(scope: !785, file: !3, line: 681, column: 41)
!785 = distinct !DILexicalBlock(scope: !786, file: !3, line: 681, column: 14)
!786 = distinct !DILexicalBlock(scope: !775, file: !3, line: 666, column: 9)
!787 = !DILocalVariable(name: "true_next_block", scope: !788, file: !3, line: 719, type: !9)
!788 = distinct !DILexicalBlock(scope: !789, file: !3, line: 712, column: 10)
!789 = distinct !DILexicalBlock(scope: !785, file: !3, line: 695, column: 14)
!790 = !DILocation(line: 643, column: 41, scope: !775)
!791 = !DILocation(line: 645, column: 14, scope: !775)
!792 = !DILocation(line: 646, column: 26, scope: !775)
!793 = !DILocation(line: 646, column: 14, scope: !775)
!794 = !DILocation(line: 647, column: 12, scope: !775)
!795 = !DILocation(line: 648, column: 22, scope: !775)
!796 = !DILocation(line: 649, column: 10, scope: !775)
!797 = !DILocation(line: 653, column: 9, scope: !775)
!798 = !DILocation(line: 654, column: 13, scope: !799)
!799 = distinct !DILexicalBlock(scope: !800, file: !3, line: 654, column: 13)
!800 = distinct !DILexicalBlock(scope: !801, file: !3, line: 653, column: 21)
!801 = distinct !DILexicalBlock(scope: !775, file: !3, line: 653, column: 9)
!802 = !DILocation(line: 654, column: 13, scope: !800)
!803 = !DILocation(line: 655, column: 51, scope: !804)
!804 = distinct !DILexicalBlock(scope: !799, file: !3, line: 654, column: 39)
!805 = !DILocation(line: 655, column: 25, scope: !804)
!806 = !DILocation(line: 656, column: 9, scope: !804)
!807 = !DILocation(line: 657, column: 25, scope: !808)
!808 = distinct !DILexicalBlock(scope: !799, file: !3, line: 656, column: 16)
!809 = !DILocation(line: 0, scope: !808)
!810 = !DILocation(line: 661, column: 19, scope: !811)
!811 = distinct !DILexicalBlock(scope: !775, file: !3, line: 661, column: 9)
!812 = !DILocation(line: 661, column: 9, scope: !775)
!813 = !DILocation(line: 662, column: 21, scope: !814)
!814 = distinct !DILexicalBlock(scope: !811, file: !3, line: 661, column: 28)
!815 = !DILocation(line: 663, column: 5, scope: !814)
!816 = !DILocation(line: 666, column: 19, scope: !786)
!817 = !DILocation(line: 667, column: 19, scope: !818)
!818 = distinct !DILexicalBlock(scope: !786, file: !3, line: 666, column: 33)
!819 = !DILocation(line: 668, column: 50, scope: !818)
!820 = !DILocation(line: 668, column: 9, scope: !818)
!821 = !DILocation(line: 669, column: 9, scope: !818)
!822 = !DILocation(line: 672, column: 13, scope: !823)
!823 = distinct !DILexicalBlock(scope: !818, file: !3, line: 672, column: 13)
!824 = !DILocation(line: 672, column: 29, scope: !823)
!825 = !DILocation(line: 0, scope: !826)
!826 = distinct !DILexicalBlock(scope: !823, file: !3, line: 674, column: 16)
!827 = !DILocation(line: 672, column: 13, scope: !818)
!828 = !DILocation(line: 673, column: 13, scope: !829)
!829 = distinct !DILexicalBlock(scope: !823, file: !3, line: 672, column: 48)
!830 = !DILocation(line: 674, column: 9, scope: !829)
!831 = !DILocation(line: 675, column: 13, scope: !826)
!832 = !DILocation(line: 681, column: 24, scope: !785)
!833 = !DILocation(line: 682, column: 9, scope: !784)
!834 = !DILocation(line: 683, column: 19, scope: !784)
!835 = !DILocation(line: 683, column: 37, scope: !784)
!836 = !DILocation(line: 683, column: 35, scope: !784)
!837 = !DILocation(line: 684, column: 50, scope: !784)
!838 = !DILocation(line: 684, column: 9, scope: !784)
!839 = !DILocation(line: 686, column: 36, scope: !784)
!840 = !DILocation(line: 686, column: 18, scope: !784)
!841 = !DILocation(line: 687, column: 38, scope: !784)
!842 = !DILocation(line: 687, column: 9, scope: !784)
!843 = !DILocation(line: 689, column: 9, scope: !784)
!844 = !DILocation(line: 691, column: 9, scope: !784)
!845 = !DILocation(line: 695, column: 27, scope: !789)
!846 = !DILocation(line: 0, scope: !847)
!847 = distinct !DILexicalBlock(scope: !789, file: !3, line: 695, column: 41)
!848 = !DILocation(line: 697, column: 19, scope: !847)
!849 = !DILocation(line: 697, column: 37, scope: !847)
!850 = !DILocation(line: 697, column: 35, scope: !847)
!851 = !DILocation(line: 700, column: 21, scope: !847)
!852 = !DILocation(line: 699, column: 9, scope: !847)
!853 = !DILocation(line: 704, column: 32, scope: !847)
!854 = !DILocation(line: 704, column: 9, scope: !847)
!855 = !DILocation(line: 706, column: 9, scope: !847)
!856 = !DILocation(line: 708, column: 9, scope: !847)
!857 = !DILocation(line: 714, column: 9, scope: !788)
!858 = !DILocation(line: 715, column: 19, scope: !788)
!859 = !DILocation(line: 715, column: 37, scope: !788)
!860 = !DILocation(line: 715, column: 35, scope: !788)
!861 = !DILocation(line: 715, column: 59, scope: !788)
!862 = !DILocation(line: 715, column: 57, scope: !788)
!863 = !DILocation(line: 718, column: 21, scope: !788)
!864 = !DILocation(line: 717, column: 9, scope: !788)
!865 = !DILocation(line: 719, column: 36, scope: !788)
!866 = !DILocation(line: 719, column: 18, scope: !788)
!867 = !DILocation(line: 720, column: 38, scope: !788)
!868 = !DILocation(line: 720, column: 9, scope: !788)
!869 = !DILocation(line: 722, column: 9, scope: !788)
!870 = !DILocation(line: 724, column: 9, scope: !788)
!871 = !DILocation(line: 0, scope: !784)
!872 = !DILocation(line: 726, column: 1, scope: !775)
!873 = distinct !DISubprogram(name: "mm_realloc", scope: !3, file: !3, line: 1126, type: !874, isLocal: false, isDefinition: true, scopeLine: 1126, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !876)
!874 = !DISubroutineType(types: !875)
!875 = !{!31, !31, !6}
!876 = !{!877, !878, !879, !880, !881}
!877 = !DILocalVariable(name: "ptr", arg: 1, scope: !873, file: !3, line: 1126, type: !31)
!878 = !DILocalVariable(name: "size", arg: 2, scope: !873, file: !3, line: 1126, type: !6)
!879 = !DILocalVariable(name: "block", scope: !873, file: !3, line: 1127, type: !9)
!880 = !DILocalVariable(name: "copysize", scope: !873, file: !3, line: 1128, type: !6)
!881 = !DILocalVariable(name: "newptr", scope: !873, file: !3, line: 1129, type: !31)
!882 = !DILocation(line: 1126, column: 21, scope: !873)
!883 = !DILocation(line: 1126, column: 33, scope: !873)
!884 = !DILocation(line: 1127, column: 22, scope: !873)
!885 = !DILocation(line: 1127, column: 14, scope: !873)
!886 = !DILocation(line: 1132, column: 14, scope: !887)
!887 = distinct !DILexicalBlock(scope: !873, file: !3, line: 1132, column: 9)
!888 = !DILocation(line: 1132, column: 9, scope: !873)
!889 = !DILocation(line: 1133, column: 9, scope: !890)
!890 = distinct !DILexicalBlock(scope: !887, file: !3, line: 1132, column: 20)
!891 = !DILocation(line: 1134, column: 9, scope: !890)
!892 = !DILocation(line: 1138, column: 13, scope: !893)
!893 = distinct !DILexicalBlock(scope: !873, file: !3, line: 1138, column: 9)
!894 = !DILocation(line: 0, scope: !873)
!895 = !DILocation(line: 1138, column: 9, scope: !873)
!896 = !DILocation(line: 1129, column: 11, scope: !873)
!897 = !DILocation(line: 1146, column: 16, scope: !898)
!898 = distinct !DILexicalBlock(scope: !873, file: !3, line: 1146, column: 9)
!899 = !DILocation(line: 1146, column: 9, scope: !873)
!900 = !DILocation(line: 1151, column: 16, scope: !873)
!901 = !DILocation(line: 1128, column: 12, scope: !873)
!902 = !DILocation(line: 1152, column: 14, scope: !903)
!903 = distinct !DILexicalBlock(scope: !873, file: !3, line: 1152, column: 9)
!904 = !DILocation(line: 1152, column: 9, scope: !873)
!905 = !DILocation(line: 1155, column: 5, scope: !873)
!906 = !DILocation(line: 1158, column: 5, scope: !873)
!907 = !DILocation(line: 1160, column: 5, scope: !873)
!908 = !DILocation(line: 1161, column: 1, scope: !873)
!909 = distinct !DISubprogram(name: "get_payload_size", scope: !3, file: !3, line: 306, type: !105, isLocal: true, isDefinition: true, scopeLine: 306, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !910)
!910 = !{!911, !912}
!911 = !DILocalVariable(name: "block", arg: 1, scope: !909, file: !3, line: 306, type: !9)
!912 = !DILocalVariable(name: "asize", scope: !909, file: !3, line: 307, type: !6)
!913 = !DILocation(line: 306, column: 41, scope: !909)
!914 = !DILocation(line: 307, column: 20, scope: !909)
!915 = !DILocation(line: 307, column: 12, scope: !909)
!916 = !DILocation(line: 308, column: 18, scope: !909)
!917 = !DILocation(line: 308, column: 5, scope: !909)
!918 = distinct !DISubprogram(name: "mm_calloc", scope: !3, file: !3, line: 1175, type: !919, isLocal: false, isDefinition: true, scopeLine: 1175, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !921)
!919 = !DISubroutineType(types: !920)
!920 = !{!31, !6, !6}
!921 = !{!922, !923, !924, !925}
!922 = !DILocalVariable(name: "elements", arg: 1, scope: !918, file: !3, line: 1175, type: !6)
!923 = !DILocalVariable(name: "size", arg: 2, scope: !918, file: !3, line: 1175, type: !6)
!924 = !DILocalVariable(name: "bp", scope: !918, file: !3, line: 1176, type: !31)
!925 = !DILocalVariable(name: "asize", scope: !918, file: !3, line: 1177, type: !6)
!926 = !DILocation(line: 1175, column: 21, scope: !918)
!927 = !DILocation(line: 1175, column: 38, scope: !918)
!928 = !DILocation(line: 1177, column: 29, scope: !918)
!929 = !DILocation(line: 1177, column: 12, scope: !918)
!930 = !DILocation(line: 1179, column: 18, scope: !931)
!931 = distinct !DILexicalBlock(scope: !918, file: !3, line: 1179, column: 9)
!932 = !DILocation(line: 1179, column: 9, scope: !918)
!933 = !DILocation(line: 1182, column: 15, scope: !934)
!934 = distinct !DILexicalBlock(scope: !918, file: !3, line: 1182, column: 9)
!935 = !DILocation(line: 1182, column: 26, scope: !934)
!936 = !DILocation(line: 1182, column: 9, scope: !918)
!937 = !DILocation(line: 1187, column: 10, scope: !918)
!938 = !DILocation(line: 1176, column: 11, scope: !918)
!939 = !DILocation(line: 1188, column: 12, scope: !940)
!940 = distinct !DILexicalBlock(scope: !918, file: !3, line: 1188, column: 9)
!941 = !DILocation(line: 1188, column: 9, scope: !918)
!942 = !DILocation(line: 1193, column: 5, scope: !918)
!943 = !DILocation(line: 1195, column: 5, scope: !918)
!944 = !DILocation(line: 0, scope: !918)
!945 = !DILocation(line: 1196, column: 1, scope: !918)
!946 = distinct !DISubprogram(name: "find_prev_footer", scope: !3, file: !3, line: 417, type: !351, isLocal: true, isDefinition: true, scopeLine: 417, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !947)
!947 = !{!948}
!948 = !DILocalVariable(name: "block", arg: 1, scope: !946, file: !3, line: 417, type: !9)
!949 = !DILocation(line: 417, column: 42, scope: !946)
!950 = !DILocation(line: 419, column: 21, scope: !946)
!951 = !DILocation(line: 419, column: 29, scope: !946)
!952 = !DILocation(line: 419, column: 5, scope: !946)
!953 = distinct !DISubprogram(name: "footer_to_header", scope: !3, file: !3, line: 291, type: !954, isLocal: true, isDefinition: true, scopeLine: 291, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !956)
!954 = !DISubroutineType(types: !955)
!955 = !{!9, !32}
!956 = !{!957, !958}
!957 = !DILocalVariable(name: "footer", arg: 1, scope: !953, file: !3, line: 291, type: !32)
!958 = !DILocalVariable(name: "size", scope: !953, file: !3, line: 292, type: !6)
!959 = !DILocation(line: 291, column: 42, scope: !953)
!960 = !DILocation(line: 292, column: 32, scope: !953)
!961 = !DILocation(line: 292, column: 19, scope: !953)
!962 = !DILocation(line: 292, column: 12, scope: !953)
!963 = !DILocation(line: 294, column: 39, scope: !953)
!964 = !DILocation(line: 294, column: 47, scope: !953)
!965 = !DILocation(line: 294, column: 12, scope: !953)
!966 = !DILocation(line: 294, column: 5, scope: !953)
!967 = distinct !DISubprogram(name: "write_epilogue", scope: !3, file: !3, line: 359, type: !554, isLocal: true, isDefinition: true, scopeLine: 359, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !968)
!968 = !{!969}
!969 = !DILocalVariable(name: "block", arg: 1, scope: !967, file: !3, line: 359, type: !9)
!970 = !DILocation(line: 359, column: 37, scope: !967)
!971 = !DILocation(line: 364, column: 21, scope: !967)
!972 = !DILocation(line: 364, column: 12, scope: !967)
!973 = !DILocation(line: 364, column: 19, scope: !967)
!974 = !DILocation(line: 365, column: 1, scope: !967)
!975 = distinct !DISubprogram(name: "getHead", scope: !3, file: !3, line: 463, type: !976, isLocal: true, isDefinition: true, scopeLine: 463, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !978)
!976 = !DISubroutineType(types: !977)
!977 = !{!6, !6}
!978 = !{!979, !980}
!979 = !DILocalVariable(name: "asize", arg: 1, scope: !975, file: !3, line: 463, type: !6)
!980 = !DILocalVariable(name: "i", scope: !975, file: !3, line: 464, type: !6)
!981 = !DILocation(line: 463, column: 30, scope: !975)
!982 = !DILocation(line: 465, column: 15, scope: !983)
!983 = distinct !DILexicalBlock(scope: !975, file: !3, line: 465, column: 9)
!984 = !DILocation(line: 465, column: 9, scope: !975)
!985 = !DILocation(line: 467, column: 22, scope: !986)
!986 = distinct !DILexicalBlock(scope: !983, file: !3, line: 467, column: 16)
!987 = !DILocation(line: 467, column: 16, scope: !983)
!988 = !DILocation(line: 469, column: 22, scope: !989)
!989 = distinct !DILexicalBlock(scope: !986, file: !3, line: 469, column: 16)
!990 = !DILocation(line: 469, column: 16, scope: !986)
!991 = !DILocation(line: 471, column: 22, scope: !992)
!992 = distinct !DILexicalBlock(scope: !989, file: !3, line: 471, column: 16)
!993 = !DILocation(line: 471, column: 16, scope: !989)
!994 = !DILocation(line: 473, column: 22, scope: !995)
!995 = distinct !DILexicalBlock(scope: !992, file: !3, line: 473, column: 16)
!996 = !DILocation(line: 473, column: 16, scope: !992)
!997 = !DILocation(line: 475, column: 22, scope: !998)
!998 = distinct !DILexicalBlock(scope: !995, file: !3, line: 475, column: 16)
!999 = !DILocation(line: 475, column: 16, scope: !995)
!1000 = !DILocation(line: 477, column: 22, scope: !1001)
!1001 = distinct !DILexicalBlock(scope: !998, file: !3, line: 477, column: 16)
!1002 = !DILocation(line: 477, column: 16, scope: !998)
!1003 = !DILocation(line: 479, column: 22, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !1001, file: !3, line: 479, column: 16)
!1005 = !DILocation(line: 479, column: 16, scope: !1001)
!1006 = !DILocation(line: 481, column: 22, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !1004, file: !3, line: 481, column: 16)
!1008 = !DILocation(line: 483, column: 5, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !1007, file: !3, line: 481, column: 31)
!1010 = !DILocation(line: 0, scope: !1011)
!1011 = distinct !DILexicalBlock(scope: !1007, file: !3, line: 483, column: 12)
!1012 = !DILocation(line: 464, column: 12, scope: !975)
!1013 = !DILocation(line: 486, column: 5, scope: !975)
!1014 = distinct !DISubprogram(name: "addFree", scope: !3, file: !3, line: 562, type: !554, isLocal: true, isDefinition: true, scopeLine: 562, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !1015)
!1015 = !{!1016, !1017}
!1016 = !DILocalVariable(name: "block", arg: 1, scope: !1014, file: !3, line: 562, type: !9)
!1017 = !DILocalVariable(name: "i", scope: !1014, file: !3, line: 564, type: !6)
!1018 = !DILocation(line: 562, column: 30, scope: !1014)
!1019 = !DILocation(line: 564, column: 24, scope: !1014)
!1020 = !DILocation(line: 564, column: 16, scope: !1014)
!1021 = !DILocation(line: 564, column: 12, scope: !1014)
!1022 = !DILocation(line: 567, column: 11, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !1014, file: !3, line: 567, column: 9)
!1024 = !DILocation(line: 567, column: 9, scope: !1014)
!1025 = !DILocation(line: 584, column: 9, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1014, file: !3, line: 584, column: 9)
!1027 = !DILocation(line: 568, column: 13, scope: !1028)
!1028 = distinct !DILexicalBlock(scope: !1029, file: !3, line: 568, column: 13)
!1029 = distinct !DILexicalBlock(scope: !1023, file: !3, line: 567, column: 17)
!1030 = !DILocation(line: 568, column: 21, scope: !1028)
!1031 = !DILocation(line: 568, column: 13, scope: !1029)
!1032 = !DILocation(line: 569, column: 23, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1034, file: !3, line: 569, column: 17)
!1034 = distinct !DILexicalBlock(scope: !1028, file: !3, line: 568, column: 30)
!1035 = !DILocation(line: 569, column: 17, scope: !1034)
!1036 = !DILocation(line: 570, column: 24, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1033, file: !3, line: 569, column: 32)
!1038 = !DILocation(line: 570, column: 29, scope: !1037)
!1039 = !DILocation(line: 572, column: 17, scope: !1037)
!1040 = !DILocation(line: 572, column: 23, scope: !1037)
!1041 = !DILocation(line: 572, column: 28, scope: !1037)
!1042 = !DILocation(line: 573, column: 22, scope: !1037)
!1043 = !DILocation(line: 574, column: 17, scope: !1037)
!1044 = !DILocation(line: 577, column: 21, scope: !1045)
!1045 = distinct !DILexicalBlock(scope: !1028, file: !3, line: 576, column: 16)
!1046 = !DILocation(line: 578, column: 20, scope: !1045)
!1047 = !DILocation(line: 578, column: 25, scope: !1045)
!1048 = !DILocation(line: 579, column: 18, scope: !1045)
!1049 = !DILocation(line: 580, column: 13, scope: !1045)
!1050 = !DILocation(line: 584, column: 17, scope: !1026)
!1051 = !DILocation(line: 584, column: 9, scope: !1014)
!1052 = !DILocation(line: 585, column: 19, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1054, file: !3, line: 585, column: 13)
!1054 = distinct !DILexicalBlock(scope: !1026, file: !3, line: 584, column: 26)
!1055 = !DILocation(line: 585, column: 13, scope: !1054)
!1056 = !DILocation(line: 586, column: 20, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1053, file: !3, line: 585, column: 28)
!1058 = !DILocation(line: 586, column: 25, scope: !1057)
!1059 = !DILocation(line: 587, column: 36, scope: !1057)
!1060 = !DILocation(line: 587, column: 20, scope: !1057)
!1061 = !DILocation(line: 587, column: 25, scope: !1057)
!1062 = !DILocation(line: 588, column: 27, scope: !1057)
!1063 = !DILocation(line: 589, column: 24, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1057, file: !3, line: 589, column: 17)
!1065 = !DILocation(line: 589, column: 29, scope: !1064)
!1066 = !DILocation(line: 589, column: 17, scope: !1057)
!1067 = !DILocation(line: 590, column: 30, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1064, file: !3, line: 589, column: 38)
!1069 = !DILocation(line: 590, column: 35, scope: !1068)
!1070 = !DILocation(line: 601, column: 5, scope: !1054)
!1071 = !DILocation(line: 592, column: 17, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1064, file: !3, line: 591, column: 20)
!1073 = !DILocation(line: 594, column: 17, scope: !1072)
!1074 = !DILocation(line: 597, column: 13, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1053, file: !3, line: 596, column: 16)
!1076 = !DILocation(line: 598, column: 13, scope: !1075)
!1077 = !DILocation(line: 602, column: 17, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1026, file: !3, line: 601, column: 12)
!1079 = !DILocation(line: 603, column: 18, scope: !1078)
!1080 = !DILocation(line: 603, column: 23, scope: !1078)
!1081 = !DILocation(line: 604, column: 18, scope: !1078)
!1082 = !DILocation(line: 604, column: 23, scope: !1078)
!1083 = !DILocation(line: 606, column: 1, scope: !1014)
