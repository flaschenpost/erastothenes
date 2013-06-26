	.file	"tlc.c"
# GNU C++ (Gentoo 4.7.1 p1.5, pie-0.5.3) version 4.7.1 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 4.7.1, GMP version 5.0.2, MPFR version 3.1.1, MPC version 1.0.1
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -D_GNU_SOURCE tlc.c -march=corei7-avx -mcx16 -msahf
# -mno-movbe -maes -mpclmul -mpopcnt -mno-abm -mno-lwp -mno-fma -mno-fma4
# -mno-xop -mno-bmi -mno-bmi2 -mno-tbm -mavx -mno-avx2 -msse4.2 -msse4.1
# -mno-lzcnt -mno-rdrnd -mno-f16c -mno-fsgsbase --param l1-cache-size=32
# --param l1-cache-line-size=64 --param l2-cache-size=3072
# -mtune=corei7-avx -g -fverbose-asm
# options enabled:  -fasynchronous-unwind-tables -fauto-inc-dec
# -fbranch-count-reg -fcommon -fdebug-types-section
# -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexceptions -ffunction-cse -fgcse-lm
# -fgnu-runtime -fident -finline-atomics -fira-share-save-slots
# -fira-share-spill-slots -fivopts -fkeep-static-consts
# -fleading-underscore -fmath-errno -fmerge-debug-strings
# -fmove-loop-invariants -fpeephole -fprefetch-loop-arrays
# -freg-struct-return -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fshow-column
# -fsigned-zeros -fsplit-ivs-in-unroller -fstrict-volatile-bitfields
# -ftrapping-math -ftree-cselim -ftree-forwprop -ftree-loop-if-convert
# -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
# -ftree-parallelize-loops= -ftree-phiprop -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-slp-vectorize -ftree-vect-loop-version
# -funit-at-a-time -funwind-tables -fvect-cost-model -fverbose-asm
# -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -maccumulate-outgoing-args -maes -malign-stringops -mavx
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store -mcx16
# -mfancy-math-387 -mfp-ret-in-387 -mglibc -mieee-fp -mmmx -mpclmul
# -mpopcnt -mpush-args -mred-zone -msahf -msse -msse2 -msse3 -msse4
# -msse4.1 -msse4.2 -mssse3 -mtls-direct-seg-refs

	.text
.Ltext0:
	.globl	p
	.bss
	.align 4
	.type	p, @object
	.size	p, 4
p:
	.zero	4
	.globl	max
	.data
	.align 8
	.type	max, @object
	.size	max, 8
max:
	.quad	900
	.globl	j
	.bss
	.align 8
	.type	j, @object
	.size	j, 8
j:
	.zero	8
	.globl	k
	.align 8
	.type	k, @object
	.size	k, 8
k:
	.zero	8
	.section	.rodata
.LC0:
	.string	"\t %llu \n"
	.text
	.globl	_Z8dumpBitsPyi
	.type	_Z8dumpBitsPyi, @function
_Z8dumpBitsPyi:
.LFB0:
	.file 1 "tlc.c"
	.loc 1 21 0
	.cfi_startproc
	pushq	%rbp	#
.LCFI0:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
.LCFI1:
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$40, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)	# l, l
	movl	%esi, -44(%rbp)	# n, n
.LBB2:
.LBB3:
	.loc 1 22 0
	movl	$0, -20(%rbp)	#, j
	jmp	.L2	#
.L7:
.LBB4:
	.loc 1 24 0
	movl	$0, -24(%rbp)	#, i
	jmp	.L3	#
.L6:
	.loc 1 25 0
	movl	-20(%rbp), %eax	# j, tmp72
	cltq
	leaq	0(,%rax,8), %rdx	#, D.5172
	movq	-40(%rbp), %rax	# l, tmp73
	addq	%rdx, %rax	# D.5172, D.5173
	movq	(%rax), %rdx	# *D.5173_12, D.5174
	movl	-24(%rbp), %eax	# i, tmp74
	movl	$1, %esi	#, tmp75
	movq	%rsi, %rbx	# tmp75,
	movl	%eax, %ecx	#,
	salq	%cl, %rbx	#,
	movq	%rbx, %rax	#, D.5175
	andq	%rdx, %rax	# D.5174, D.5176
	testq	%rax, %rax	# D.5176
	je	.L4	#,
	.loc 1 26 0
	movl	$49, %edi	#,
	call	putchar	#
	jmp	.L5	#
.L4:
	.loc 1 29 0
	movl	$48, %edi	#,
	call	putchar	#
.L5:
	.loc 1 24 0
	addl	$1, -24(%rbp)	#, i
.L3:
	.loc 1 24 0 is_stmt 0 discriminator 1
	movl	-24(%rbp), %eax	# i, i.44
	cmpl	$63, %eax	#, i.44
	setbe	%al	#, D.5169
	testb	%al, %al	# D.5169
	jne	.L6	#,
	.loc 1 32 0 is_stmt 1
	movl	-20(%rbp), %eax	# j, tmp76
	cltq
	leaq	0(,%rax,8), %rdx	#, D.5181
	movq	-40(%rbp), %rax	# l, tmp77
	addq	%rdx, %rax	# D.5181, D.5182
	movq	(%rax), %rax	# *D.5182_19, D.5183
	movq	%rax, %rsi	# D.5183,
	movl	$.LC0, %edi	#,
	movl	$0, %eax	#,
	call	printf	#
.LBE4:
	.loc 1 22 0
	addl	$1, -20(%rbp)	#, j
.L2:
	.loc 1 22 0 is_stmt 0 discriminator 1
	movl	-20(%rbp), %eax	# j, tmp78
	cmpl	-44(%rbp), %eax	# n, tmp78
	setl	%al	#, D.5163
	testb	%al, %al	# D.5163
	jne	.L7	#,
.LBE3:
.LBE2:
	.loc 1 34 0 is_stmt 1
	addq	$40, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
.LCFI2:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z8dumpBitsPyi, .-_Z8dumpBitsPyi
	.section	.rodata
.LC1:
	.string	"pd = %lu %lu\n"
	.text
	.globl	_Z6doInitPy
	.type	_Z6doInitPy, @function
_Z6doInitPy:
.LFB1:
	.loc 1 36 0
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1
	pushq	%rbp	#
.LCFI3:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
.LCFI4:
	.cfi_def_cfa_register 6
	subq	$4512, %rsp	#,
	movq	%rdi, -4504(%rbp)	# C, C
.LBB5:
	.loc 1 38 0
	leaq	-4496(%rbp), %rsi	#, tmp62
	movl	$0, %eax	#, tmp63
	movl	$561, %edx	#, tmp64
	movq	%rsi, %rdi	# tmp62,
	movq	%rdx, %rcx	# tmp64,
	rep stosq
	.loc 1 47 0
#APP
# 47 "tlc.c" 1
	mov r8,1
    mov r9,0
    mov r10,0
    or	QWORD PTR [rbp-4496], 42 

# 0 "" 2
	.loc 1 49 0
#NO_APP
	movq	-4488(%rbp), %rdx	# predef, D.5127
	movq	-4496(%rbp), %rax	# predef, D.5128
	movq	%rax, %rsi	# D.5128,
	movl	$.LC1, %edi	#,
	movl	$0, %eax	#,
.LEHB0:
	call	printf	#
.LEHE0:
	.loc 1 50 0
	jmp	.L12	#
.L11:
	movq	%rax, %rdi	# D.5189,
.LEHB1:
	call	_Unwind_Resume	#
.LEHE1:
.L12:
.LBE5:
	.loc 1 73 0
	leave
.LCFI5:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1-.LLSDACSB1
.LLSDACSB1:
	.uleb128 .LEHB0-.LFB1
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L11-.LFB1
	.uleb128 0
	.uleb128 .LEHB1-.LFB1
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE1:
	.text
	.size	_Z6doInitPy, .-_Z6doInitPy
	.globl	_Z6doWorkPyyyyy
	.type	_Z6doWorkPyyyyy, @function
_Z6doWorkPyyyyy:
.LFB2:
	.loc 1 108 0
	.cfi_startproc
	pushq	%rbp	#
.LCFI6:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
.LCFI7:
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$960, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -1056(%rbp)	# C, C
	movq	%rsi, -1064(%rbp)	# j, j
	movq	%rdx, -1072(%rbp)	# k, k
	movq	%rcx, -1080(%rbp)	# limit, limit
	movq	%r8, -1088(%rbp)	# p, p
.LBB6:
	.loc 1 109 0
	movq	-1064(%rbp), %rax	# j, tmp130
	shrq	$6, %rax	#, tmp129
	movq	%rax, -16(%rbp)	# tmp129, pos
	.loc 1 111 0
	leaq	-1048(%rbp), %rsi	#, tmp131
	movl	$0, %eax	#, tmp132
	movl	$128, %edx	#, tmp133
	movq	%rsi, %rdi	# tmp131,
	movq	%rdx, %rcx	# tmp133,
	rep stosq
	.loc 1 115 0
	jmp	.L14	#
.L15:
	.loc 1 117 0
	movq	-1064(%rbp), %rax	# j, tmp134
	shrq	$6, %rax	#, D.5050
	leaq	0(,%rax,8), %rcx	#, D.5051
	movq	-1056(%rbp), %rdx	# C, tmp135
	addq	%rcx, %rdx	# D.5051, D.5052
	leaq	0(,%rax,8), %rcx	#, D.5053
	movq	-1056(%rbp), %rax	# C, tmp136
	addq	%rcx, %rax	# D.5053, D.5054
	movq	(%rax), %rax	# *D.5054_17, D.5055
	movq	-1064(%rbp), %rcx	# j, tmp137
	andl	$63, %ecx	#, D.5057
	movl	$1, %esi	#, tmp138
	movq	%rsi, %rbx	# tmp138,
	salq	%cl, %rbx	# D.5057,
	movq	%rbx, %rcx	#, D.5058
	orq	%rcx, %rax	# D.5058, D.5059
	movq	%rax, (%rdx)	# D.5059, *D.5052_15
	.loc 1 118 0
	movq	-1064(%rbp), %rax	# j, tmp139
	shrq	$6, %rax	#, D.5060
	movq	-1048(%rbp,%rax,8), %rdx	# predef, D.5061
	movq	-1064(%rbp), %rcx	# j, tmp140
	andl	$63, %ecx	#, D.5063
	movl	$1, %esi	#, tmp141
	movq	%rsi, %rdi	# tmp141,
	salq	%cl, %rdi	# D.5063,
	movq	%rdi, %rcx	#, D.5064
	orq	%rcx, %rdx	# D.5064, D.5065
	movq	%rdx, -1048(%rbp,%rax,8)	# D.5065, predef
	.loc 1 119 0
	movq	-1088(%rbp), %rax	# p, tmp142
	addq	%rax, %rax	# D.5066
	addq	%rax, -1064(%rbp)	# D.5066, j
	.loc 1 120 0
	movq	-1072(%rbp), %rax	# k, tmp143
	shrq	$6, %rax	#, D.5067
	leaq	0(,%rax,8), %rcx	#, D.5068
	movq	-1056(%rbp), %rdx	# C, tmp144
	addq	%rcx, %rdx	# D.5068, D.5069
	leaq	0(,%rax,8), %rcx	#, D.5070
	movq	-1056(%rbp), %rax	# C, tmp145
	addq	%rcx, %rax	# D.5070, D.5071
	movq	(%rax), %rax	# *D.5071_35, D.5072
	movq	-1072(%rbp), %rcx	# k, tmp146
	andl	$63, %ecx	#, D.5074
	movl	$1, %esi	#, tmp147
	movq	%rsi, %rbx	# tmp147,
	salq	%cl, %rbx	# D.5074,
	movq	%rbx, %rcx	#, D.5075
	orq	%rcx, %rax	# D.5075, D.5076
	movq	%rax, (%rdx)	# D.5076, *D.5069_33
	.loc 1 121 0
	movq	-1072(%rbp), %rax	# k, tmp148
	shrq	$6, %rax	#, D.5077
	movq	-1048(%rbp,%rax,8), %rdx	# predef, D.5078
	movq	-1072(%rbp), %rcx	# k, tmp149
	andl	$63, %ecx	#, D.5080
	movl	$1, %esi	#, tmp150
	movq	%rsi, %rdi	# tmp150,
	salq	%cl, %rdi	# D.5080,
	movq	%rdi, %rcx	#, D.5081
	orq	%rcx, %rdx	# D.5081, D.5082
	movq	%rdx, -1048(%rbp,%rax,8)	# D.5082, predef
	.loc 1 122 0
	movq	-1088(%rbp), %rax	# p, tmp151
	addq	%rax, %rax	# D.5083
	addq	%rax, -1072(%rbp)	# D.5083, k
.L14:
	.loc 1 115 0 discriminator 1
	movq	-1088(%rbp), %rax	# p, tmp152
	addq	$1, %rax	#, D.5047
	salq	$6, %rax	#, D.5048
	cmpq	-1072(%rbp), %rax	# k, D.5048
	seta	%al	#, D.5049
	testb	%al, %al	# D.5049
	jne	.L15	#,
	.loc 1 124 0
	movq	-1088(%rbp), %rax	# p, tmp153
	addq	$1, %rax	#, D.5084
	salq	$6, %rax	#, D.5085
	cmpq	-1064(%rbp), %rax	# j, D.5085
	jbe	.L16	#,
	.loc 1 126 0
	movq	-1064(%rbp), %rax	# j, tmp154
	shrq	$6, %rax	#, D.5088
	leaq	0(,%rax,8), %rcx	#, D.5089
	movq	-1056(%rbp), %rdx	# C, tmp155
	addq	%rcx, %rdx	# D.5089, D.5090
	leaq	0(,%rax,8), %rcx	#, D.5091
	movq	-1056(%rbp), %rax	# C, tmp156
	addq	%rcx, %rax	# D.5091, D.5092
	movq	(%rax), %rax	# *D.5092_55, D.5093
	movq	-1064(%rbp), %rcx	# j, tmp157
	andl	$63, %ecx	#, D.5095
	movl	$1, %esi	#, tmp158
	movq	%rsi, %rbx	# tmp158,
	salq	%cl, %rbx	# D.5095,
	movq	%rbx, %rcx	#, D.5096
	orq	%rcx, %rax	# D.5096, D.5097
	movq	%rax, (%rdx)	# D.5097, *D.5090_53
	.loc 1 127 0
	movq	-1064(%rbp), %rax	# j, tmp159
	shrq	$6, %rax	#, D.5098
	movq	-1048(%rbp,%rax,8), %rdx	# predef, D.5099
	movq	-1064(%rbp), %rcx	# j, tmp160
	andl	$63, %ecx	#, D.5101
	movl	$1, %esi	#, tmp161
	movq	%rsi, %rdi	# tmp161,
	salq	%cl, %rdi	# D.5101,
	movq	%rdi, %rcx	#, D.5102
	orq	%rcx, %rdx	# D.5102, D.5103
	movq	%rdx, -1048(%rbp,%rax,8)	# D.5103, predef
.L16:
	.loc 1 130 0
	movq	-1088(%rbp), %rax	# p, tmp162
	movq	-1048(%rbp,%rax,8), %rax	# predef, D.5105
	movq	%rax, -1048(%rbp)	# D.5105, predef
	.loc 1 131 0
	movq	-1088(%rbp), %rax	# p, tmp163
	movq	%rax, -16(%rbp)	# tmp163, pos
	jmp	.L17	#
.L18:
	.loc 1 132 0 discriminator 2
	movq	-1088(%rbp), %rax	# p, tmp164
	movq	-16(%rbp), %rdx	# pos, tmp165
	movq	%rdx, %rcx	# tmp165,
	subq	%rax, %rcx	# tmp164,
	movq	%rcx, %rax	#, D.5111
	movq	-1048(%rbp,%rax,8), %rdx	# predef, D.5112
	movq	-16(%rbp), %rax	# pos, tmp166
	movq	%rdx, -1048(%rbp,%rax,8)	# D.5112, predef
	.loc 1 131 0 discriminator 2
	addq	$1, -16(%rbp)	#, pos
.L17:
	.loc 1 131 0 is_stmt 0 discriminator 1
	cmpq	$127, -16(%rbp)	#, pos
	setbe	%al	#, D.5109
	testb	%al, %al	# D.5109
	jne	.L18	#,
	.loc 1 135 0 is_stmt 1
	movq	-1088(%rbp), %rax	# p, tmp167
	movq	%rax, -16(%rbp)	# tmp167, pos
	.loc 1 136 0
	jmp	.L19	#
.L20:
.LBB7:
	.loc 1 137 0
	movl	$0, -20(%rbp)	#, l
	.loc 1 138 0
	movq	-16(%rbp), %rax	# pos, pos.25
	leaq	0(,%rax,8), %rcx	#, D.5119
	movq	-1056(%rbp), %rdx	# C, tmp168
	addq	%rdx, %rcx	# tmp168, D.5120
	leaq	0(,%rax,8), %rdx	#, D.5121
	movq	-1056(%rbp), %rax	# C, tmp169
	addq	%rdx, %rax	# D.5121, D.5122
	movq	(%rax), %rsi	# *D.5122_82, D.5123
	movq	-16(%rbp), %rax	# pos, tmp170
	movl	$0, %edx	#, tmp171
	divq	-1088(%rbp)	# p
	movq	%rdx, %rax	# tmp171, D.5124
	movq	-1048(%rbp,%rax,8), %rax	# predef, D.5125
	orq	%rsi, %rax	# D.5123, D.5126
	movq	%rax, (%rcx)	# D.5126, *D.5120_80
	addq	$1, -16(%rbp)	#, pos
.L19:
.LBE7:
	.loc 1 136 0 discriminator 1
	movq	-1080(%rbp), %rax	# limit, tmp173
	shrq	$7, %rax	#, D.5116
	cmpq	-16(%rbp), %rax	# pos, D.5116
	setae	%al	#, D.5117
	testb	%al, %al	# D.5117
	jne	.L20	#,
.LBE6:
	.loc 1 140 0
	addq	$960, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
.LCFI8:
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z6doWorkPyyyyy, .-_Z6doWorkPyyyyy
	.section	.rodata
	.align 8
.LC5:
	.string	"max = %llu, limit=%llu, size %llu\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.loc 1 142 0
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA3
	pushq	%rbp	#
.LCFI9:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
.LCFI10:
	.cfi_def_cfa_register 6
	addq	$-128, %rsp	#,
.LBB8:
	.loc 1 143 0
	movq	max(%rip), %rax	# max, max.0
	testq	%rax, %rax	# max.0
	js	.L22	#,
	vcvtsi2sdq	%rax, %xmm0, %xmm0	# max.0,
	vmovsd	%xmm0, -104(%rbp)	#, %sfp
	jmp	.L23	#
.L22:
	movq	%rax, %rdx	# max.0, tmp83
	shrq	%rdx	# tmp83
	andl	$1, %eax	#, tmp84
	orq	%rax, %rdx	# tmp84, tmp83
	vcvtsi2sdq	%rdx, %xmm0, %xmm0	# tmp83, tmp82
	vaddsd	%xmm0, %xmm0, %xmm0	# tmp82, tmp82,
	vmovsd	%xmm0, -104(%rbp)	#, %sfp
.L23:
	movq	max(%rip), %rax	# max, max.1
	testq	%rax, %rax	# max.1
	js	.L24	#,
	vcvtsi2sdq	%rax, %xmm1, %xmm1	# max.1,
	vmovd	%xmm1, %rax	#, D.4953
	jmp	.L25	#
.L24:
	movq	%rax, %rdx	# max.1, tmp86
	shrq	%rdx	# tmp86
	andl	$1, %eax	#, tmp87
	orq	%rax, %rdx	# tmp87, tmp86
	vcvtsi2sdq	%rdx, %xmm0, %xmm0	# tmp86, tmp85
	vaddsd	%xmm0, %xmm0, %xmm0	# tmp85, tmp85,
	vmovd	%xmm0, %rax	#, D.4953
.L25:
	vmovd	%rax, %xmm0	# D.4953,
	call	log	#
	vmovd	%xmm0, %rax	#, D.4954
	vmovd	%rax, %xmm2	# D.4954,
	vmulsd	-104(%rbp), %xmm2, %xmm2	# %sfp,,
	vmovsd	%xmm2, -112(%rbp)	#, %sfp
	movq	max(%rip), %rax	# max, max.2
	testq	%rax, %rax	# max.2
	js	.L26	#,
	vcvtsi2sdq	%rax, %xmm0, %xmm0	# max.2,
	vmovsd	%xmm0, -120(%rbp)	#, %sfp
	jmp	.L27	#
.L26:
	movq	%rax, %rdx	# max.2, tmp89
	shrq	%rdx	# tmp89
	andl	$1, %eax	#, tmp90
	orq	%rax, %rdx	# tmp90, tmp89
	vcvtsi2sdq	%rdx, %xmm0, %xmm0	# tmp89, tmp88
	vaddsd	%xmm0, %xmm0, %xmm0	# tmp88, tmp88,
	vmovsd	%xmm0, -120(%rbp)	#, %sfp
.L27:
	movq	max(%rip), %rax	# max, max.3
	testq	%rax, %rax	# max.3
	js	.L28	#,
	vcvtsi2sdq	%rax, %xmm1, %xmm1	# max.3,
	vmovd	%xmm1, %rax	#, D.4959
	jmp	.L29	#
.L28:
	movq	%rax, %rdx	# max.3, tmp92
	shrq	%rdx	# tmp92
	andl	$1, %eax	#, tmp93
	orq	%rax, %rdx	# tmp93, tmp92
	vcvtsi2sdq	%rdx, %xmm0, %xmm0	# tmp92, tmp91
	vaddsd	%xmm0, %xmm0, %xmm0	# tmp91, tmp91,
	vmovd	%xmm0, %rax	#, D.4959
.L29:
	vmovd	%rax, %xmm0	# D.4959,
	call	log	#
	vmovd	%xmm0, %rax	#, D.4960
	vmovd	%rax, %xmm0	# D.4960,
	call	log	#
	vmovd	%xmm0, %rdx	#, D.4961
	movabsq	$4606628476045850837, %rax	#, tmp94
	vmovd	%rdx, %xmm2	# D.4961,
	vmovd	%rax, %xmm1	# tmp94,
	vsubsd	%xmm1, %xmm2, %xmm0	#,, D.4962
	vmulsd	-120(%rbp), %xmm0, %xmm0	# %sfp, D.4962, D.4963
	vaddsd	-112(%rbp), %xmm0, %xmm0	# %sfp, D.4963, D.4964
	movabsq	$4634204016564240384, %rax	#, tmp95
	vmovd	%rax, %xmm2	# tmp95,
	vaddsd	%xmm2, %xmm0, %xmm2	#, D.4964,
	vmovd	%xmm2, %rax	#, D.4965
	vmovd	%rax, %xmm0	# D.4965,
	vucomisd	.LC4(%rip), %xmm0	#,
	jae	.L30	#,
	vmovd	%rax, %xmm1	# D.4965,
	vcvttsd2siq	%xmm1, %rax	#, tmp96
	movq	%rax, -8(%rbp)	# tmp96, limit
	jmp	.L31	#
.L30:
	movabsq	$4890909195324358656, %rdx	#, tmp98
	vmovd	%rax, %xmm2	# D.4965,
	vmovd	%rdx, %xmm0	# tmp98,
	vsubsd	%xmm0, %xmm2, %xmm2	#,,
	vmovd	%xmm2, %rax	#, tmp97
	vmovd	%rax, %xmm1	# tmp97,
	vcvttsd2siq	%xmm1, %rax	#, tmp99
	movq	%rax, -8(%rbp)	# tmp99, limit
	movabsq	$-9223372036854775808, %rax	#, tmp100
	xorq	%rax, -8(%rbp)	# tmp100, limit
.L31:
	movq	-8(%rbp), %rax	# limit, tmp101
	movq	%rax, -8(%rbp)	# tmp101, limit
	.loc 1 144 0
	movq	-8(%rbp), %rax	# limit, tmp102
	shrq	$7, %rax	#, D.4966
	addq	$16, %rax	#, tmp103
	movq	%rax, -16(%rbp)	# tmp103, size_ST
	.loc 1 145 0
	movq	-16(%rbp), %rax	# size_ST, tmp104
	movb	$0, %al	#, D.4967
	addq	$256, %rax	#, tmp105
	movq	%rax, -16(%rbp)	# tmp105, size_ST
	.loc 1 146 0
	movq	max(%rip), %rax	# max, max.4
	movq	-16(%rbp), %rcx	# size_ST, tmp106
	movq	-8(%rbp), %rdx	# limit, tmp107
	movq	%rax, %rsi	# max.4,
	movl	$.LC5, %edi	#,
	movl	$0, %eax	#,
.LEHB2:
	call	printf	#
	.loc 1 147 0
	movq	-16(%rbp), %rax	# size_ST, tmp108
	shrq	$4, %rax	#, D.4969
	addq	$1, %rax	#, D.4970
	movl	$128, %esi	#,
	movq	%rax, %rdi	# D.4970,
	call	calloc	#
	movq	%rax, -24(%rbp)	# tmp109, C
	.loc 1 148 0
	movq	$0, k(%rip)	#, k
	.loc 1 149 0
	movq	-24(%rbp), %rax	# C, tmp110
	movq	%rax, %rdi	# tmp110,
	call	_Z6doInitPy	#
.LEHE2:
	.loc 1 150 0
	movl	$0, %edi	#,
	call	exit	#
.L33:
	movq	%rax, %rdi	# D.5192,
.LEHB3:
	call	_Unwind_Resume	#
.LEHE3:
.LBE8:
	.cfi_endproc
.LFE3:
	.section	.gcc_except_table
.LLSDA3:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3-.LLSDACSB3
.LLSDACSB3:
	.uleb128 .LEHB2-.LFB3
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L33-.LFB3
	.uleb128 0
	.uleb128 .LEHB3-.LFB3
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE3:
	.text
	.size	main, .-main
	.section	.rodata
	.align 8
.LC4:
	.long	0
	.long	1138753536
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x32d
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.long	.LASF25
	.long	.LASF26
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF11
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF12
	.uleb128 0x4
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.byte	0x15
	.long	.LASF15
	.quad	.LFB0
	.quad	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x109
	.uleb128 0x5
	.string	"l"
	.byte	0x1
	.byte	0x15
	.long	0x109
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x5
	.string	"n"
	.byte	0x1
	.byte	0x15
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x6
	.quad	.LBB3
	.quad	.LBE3
	.uleb128 0x7
	.string	"j"
	.byte	0x1
	.byte	0x16
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x6
	.quad	.LBB4
	.quad	.LBE4
	.uleb128 0x7
	.string	"i"
	.byte	0x1
	.byte	0x17
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x7a
	.uleb128 0x4
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0x24
	.long	.LASF16
	.quad	.LFB1
	.quad	.LFE1
	.long	.LLST1
	.byte	0x1
	.long	0x188
	.uleb128 0x5
	.string	"C"
	.byte	0x1
	.byte	0x24
	.long	0x109
	.byte	0x3
	.byte	0x91
	.sleb128 -4520
	.uleb128 0x6
	.quad	.LBB5
	.quad	.LBE5
	.uleb128 0x9
	.long	.LASF17
	.byte	0x1
	.byte	0x26
	.long	0x188
	.byte	0x3
	.byte	0x91
	.sleb128 -4512
	.uleb128 0x7
	.string	"r8"
	.byte	0x1
	.byte	0x33
	.long	0x2d
	.byte	0x1
	.byte	0x58
	.uleb128 0x7
	.string	"r9"
	.byte	0x1
	.byte	0x34
	.long	0x2d
	.byte	0x1
	.byte	0x59
	.uleb128 0x7
	.string	"pos"
	.byte	0x1
	.byte	0x35
	.long	0x2d
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x7a
	.long	0x199
	.uleb128 0xb
	.long	0x65
	.value	0x230
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.long	.LASF18
	.byte	0x1
	.byte	0x6c
	.long	.LASF19
	.quad	.LFB2
	.quad	.LFE2
	.long	.LLST2
	.byte	0x1
	.long	0x24f
	.uleb128 0x5
	.string	"C"
	.byte	0x1
	.byte	0x6c
	.long	0x109
	.byte	0x3
	.byte	0x91
	.sleb128 -1072
	.uleb128 0x5
	.string	"j"
	.byte	0x1
	.byte	0x6c
	.long	0x7a
	.byte	0x3
	.byte	0x91
	.sleb128 -1080
	.uleb128 0x5
	.string	"k"
	.byte	0x1
	.byte	0x6c
	.long	0x7a
	.byte	0x3
	.byte	0x91
	.sleb128 -1088
	.uleb128 0xd
	.long	.LASF20
	.byte	0x1
	.byte	0x6c
	.long	0x7a
	.byte	0x3
	.byte	0x91
	.sleb128 -1096
	.uleb128 0x5
	.string	"p"
	.byte	0x1
	.byte	0x6c
	.long	0x7a
	.byte	0x3
	.byte	0x91
	.sleb128 -1104
	.uleb128 0x6
	.quad	.LBB6
	.quad	.LBE6
	.uleb128 0x7
	.string	"pos"
	.byte	0x1
	.byte	0x6d
	.long	0x7a
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.long	.LASF17
	.byte	0x1
	.byte	0x6f
	.long	0x24f
	.byte	0x3
	.byte	0x91
	.sleb128 -1064
	.uleb128 0x6
	.quad	.LBB7
	.quad	.LBE7
	.uleb128 0x7
	.string	"l"
	.byte	0x1
	.byte	0x89
	.long	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x7a
	.long	0x25f
	.uleb128 0xe
	.long	0x65
	.byte	0x7f
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.byte	0x8e
	.long	0x57
	.quad	.LFB3
	.quad	.LFE3
	.long	.LLST3
	.byte	0x1
	.long	0x2ce
	.uleb128 0x6
	.quad	.LBB8
	.quad	.LBE8
	.uleb128 0x9
	.long	.LASF20
	.byte	0x1
	.byte	0x8f
	.long	0x7a
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.long	.LASF22
	.byte	0x1
	.byte	0x90
	.long	0x7a
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x7
	.string	"C"
	.byte	0x1
	.byte	0x93
	.long	0x109
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x9
	.long	.LASF23
	.byte	0x1
	.byte	0x98
	.long	0x2ce
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x57
	.long	0x2de
	.uleb128 0xe
	.long	0x65
	.byte	0xe
	.byte	0
	.uleb128 0x10
	.string	"p"
	.byte	0x1
	.byte	0xf
	.long	0x57
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	p
	.uleb128 0x10
	.string	"max"
	.byte	0x1
	.byte	0x10
	.long	0x7a
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	max
	.uleb128 0x10
	.string	"j"
	.byte	0x1
	.byte	0x11
	.long	0x7a
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	j
	.uleb128 0x10
	.string	"k"
	.byte	0x1
	.byte	0x12
	.long	0x7a
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	k
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LFB0-.Ltext0
	.quad	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI0-.Ltext0
	.quad	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI1-.Ltext0
	.quad	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI2-.Ltext0
	.quad	.LFE0-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST1:
	.quad	.LFB1-.Ltext0
	.quad	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI3-.Ltext0
	.quad	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI4-.Ltext0
	.quad	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI5-.Ltext0
	.quad	.LFE1-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST2:
	.quad	.LFB2-.Ltext0
	.quad	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI6-.Ltext0
	.quad	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI7-.Ltext0
	.quad	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI8-.Ltext0
	.quad	.LFE2-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST3:
	.quad	.LFB3-.Ltext0
	.quad	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI9-.Ltext0
	.quad	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI10-.Ltext0
	.quad	.LFE3-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF13:
	.string	"dumpBits"
.LASF23:
	.string	"prims"
.LASF11:
	.string	"float"
.LASF26:
	.string	"/home/marcog/erastothenes"
.LASF22:
	.string	"size_ST"
.LASF25:
	.string	"tlc.c"
.LASF2:
	.string	"short unsigned int"
.LASF1:
	.string	"unsigned char"
.LASF12:
	.string	"double"
.LASF21:
	.string	"main"
.LASF18:
	.string	"doWork"
.LASF17:
	.string	"predef"
.LASF0:
	.string	"long unsigned int"
.LASF3:
	.string	"unsigned int"
.LASF10:
	.string	"long long unsigned int"
.LASF24:
	.string	"GNU C++ 4.7.1"
.LASF20:
	.string	"limit"
.LASF7:
	.string	"sizetype"
.LASF9:
	.string	"long long int"
.LASF14:
	.string	"doInit"
.LASF5:
	.string	"short int"
.LASF15:
	.string	"_Z8dumpBitsPyi"
.LASF6:
	.string	"long int"
.LASF8:
	.string	"char"
.LASF19:
	.string	"_Z6doWorkPyyyyy"
.LASF4:
	.string	"signed char"
.LASF16:
	.string	"_Z6doInitPy"
	.ident	"GCC: (Gentoo 4.7.1 p1.5, pie-0.5.3) 4.7.1"
	.section	.note.GNU-stack,"",@progbits
