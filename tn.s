	.file	"tn.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"1 "
.LC1:
	.string	"0 "
.LC2:
	.string	"\t %llu \n"
	.text
	.p2align 4,,15
	.globl	dumpBits
	.type	dumpBits, @function
dumpBits:
.LFB63:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	$1, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L8:
	xorl	%eax, %eax
	movl	$.LC0, %esi
	movl	$1, %edi
	addl	$1, %r12d
	call	__printf_chk
	cmpl	$64, %r12d
	je	.L7
.L4:
	movq	%rbp, %rax
	movl	%r12d, %ecx
	salq	%cl, %rax
	testq	%rbx, %rax
	jne	.L8
	xorl	%eax, %eax
	movl	$.LC1, %esi
	movl	$1, %edi
	addl	$1, %r12d
	call	__printf_chk
	cmpl	$64, %r12d
	jne	.L4
.L7:
	movq	%rbx, %rdx
	movl	$.LC2, %esi
	movl	$1, %edi
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	jmp	__printf_chk
	.cfi_endproc
.LFE63:
	.size	dumpBits, .-dumpBits
	.p2align 4,,15
	.globl	doWork
	.type	doWork, @function
doWork:
.LFB64:
	.cfi_startproc
	movq	%rcx, %rax
	shrq	%rax
	cmpq	%rax, %rdx
	ja	.L10
	addq	%r8, %r8
	movl	$1, %r10d
	.p2align 4,,10
	.p2align 3
.L11:
	movq	%rsi, %r9
	movl	%esi, %ecx
	movq	%r10, %r11
	shrq	$6, %r9
	salq	%cl, %r11
	movl	%edx, %ecx
	orq	%r11, (%rdi,%r9,8)
	movq	%rdx, %r9
	movq	%r10, %r11
	shrq	$6, %r9
	addq	%r8, %rdx
	salq	%cl, %r11
	addq	%r8, %rsi
	orq	%r11, (%rdi,%r9,8)
	cmpq	%rax, %rdx
	jbe	.L11
.L10:
	cmpq	%rax, %rsi
	jae	.L9
	movq	%rsi, %rdx
	movl	$1, %eax
	movl	%esi, %ecx
	shrq	$6, %rdx
	salq	%cl, %rax
	orq	%rax, (%rdi,%rdx,8)
.L9:
	rep
	ret
	.cfi_endproc
.LFE64:
	.size	doWork, .-doWork
	.section	.rodata.str1.1
.LC5:
	.string	"\n%llu %llu %llu \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB65:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	movq	max(%rip), %rax
	testq	%rax, %rax
	js	.L15
	cvtsi2sdq	%rax, %xmm0
	movsd	%xmm0, 16(%rsp)
.L16:
	call	log
	movq	max(%rip), %rax
	movsd	%xmm0, 24(%rsp)
	testq	%rax, %rax
	js	.L17
	cvtsi2sdq	%rax, %xmm1
.L18:
	movapd	%xmm1, %xmm0
	movsd	%xmm1, (%rsp)
	call	log
	call	log
	subsd	.LC3(%rip), %xmm0
	movsd	16(%rsp), %xmm2
	movsd	(%rsp), %xmm1
	mulsd	24(%rsp), %xmm2
	mulsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm2
	movsd	.LC4(%rip), %xmm0
	ucomisd	%xmm0, %xmm2
	jae	.L19
	cvttsd2siq	%xmm2, %rbp
.L20:
	movq	%rbp, %r12
	movl	$8, %esi
	shrq	$7, %r12
	leaq	3(%r12), %rdi
	call	calloc
	movq	%rbp, %rcx
	movq	%rax, %rdi
	movl	$5, %r8d
	movl	$10, %edx
	movl	$7, %esi
	movq	%rax, %rbx
	movl	$5, p(%rip)
	movq	$7, j(%rip)
	movq	$10, k(%rip)
	call	doWork
	movq	k(%rip), %rdx
	movq	%rbp, %rcx
	movq	%rbx, %rdi
	movl	$7, %r8d
	movl	$15, %esi
	movl	$7, p(%rip)
	movq	$15, j(%rip)
	addq	$14, %rdx
	movq	%rdx, k(%rip)
	call	doWork
	movq	k(%rip), %rdx
	movq	%rbp, %rcx
	leaq	-8(%rbx,%r12,8), %rbp
	movq	%rbx, %rdi
	movl	$11, %r8d
	movl	$39, %esi
	movl	$11, p(%rip)
	movq	$39, j(%rip)
	addq	$22, %rdx
	movq	%rdx, k(%rip)
	call	doWork
	movq	136(%rbx), %rcx
	movq	0(%rbp), %r8
	movl	$.LC5, %esi
	movq	(%rbx), %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	(%rbx), %rdi
	call	dumpBits
	movq	136(%rbx), %rdi
	call	dumpBits
	movq	0(%rbp), %rdi
	call	dumpBits
	movq	%rbx, %rdi
	call	free
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	subsd	%xmm0, %xmm2
	movabsq	$-9223372036854775808, %rax
	cvttsd2siq	%xmm2, %rbp
	xorq	%rax, %rbp
	jmp	.L20
.L15:
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	movsd	%xmm0, 16(%rsp)
	jmp	.L16
.L17:
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L18
	.cfi_endproc
.LFE65:
	.size	main, .-main
	.comm	k,8,8
	.comm	j,8,8
	.comm	p,4,4
	.globl	max
	.data
	.align 8
	.type	max, @object
	.size	max, 8
max:
	.quad	80000000
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	652835029
	.long	1072564273
	.align 8
.LC4:
	.long	0
	.long	1138753536
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
