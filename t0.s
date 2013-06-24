	.file	"t0.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"#anchor"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB63:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	max(%rip), %rax
	testq	%rax, %rax
	js	.L2
	cvtsi2sdq	%rax, %xmm0
	movsd	%xmm0, 16(%rsp)
.L3:
	call	log
	movq	max(%rip), %rax
	movsd	%xmm0, 24(%rsp)
	testq	%rax, %rax
	js	.L4
	cvtsi2sdq	%rax, %xmm1
.L5:
	movapd	%xmm1, %xmm0
	movsd	%xmm1, (%rsp)
	call	log
	call	log
	movsd	16(%rsp), %xmm2
	subsd	.LC0(%rip), %xmm0
	movsd	(%rsp), %xmm1
	mulsd	24(%rsp), %xmm2
	mulsd	%xmm1, %xmm0
	addsd	%xmm0, %xmm2
	movsd	.LC1(%rip), %xmm0
	ucomisd	%xmm0, %xmm2
	jae	.L6
	cvttsd2siq	%xmm2, %rbx
.L7:
	movq	%rbx, %rdi
	movl	$8, %esi
	movl	$1, %ebp
	movabsq	$-6148914691236517205, %r13
	shrq	$7, %rdi
	addq	$3, %rdi
	call	calloc
	movq	j(%rip), %r15
	movq	%rax, %r14
	movq	%rbx, %rax
	mulq	%r13
	movq	%r15, %r12
	andl	$63, %r15d
	shrq	$6, %r12
	movq	%rdx, %r13
	shrq	$7, %r13
.L8:
	cmpq	%r13, %r12
	jae	.L13
	xorl	%ebx, %ebx
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L14:
	movl	%eax, %r15d
.L9:
	xorl	%eax, %eax
	movl	$1, %edx
	movl	$.LC2, %esi
	movl	$1, %edi
	call	write
	movq	%rbp, %rax
	movl	%r15d, %ecx
	salq	%cl, %rax
	orq	%rax, %rbx
	leal	10(%r15), %eax
	cmpw	$64, %ax
	jbe	.L14
	orq	%rbx, (%r14,%r12,8)
	subl	$54, %r15d
	addq	$1, %r12
	jmp	.L8
.L13:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	movabsq	$-9223372036854775808, %rax
	subsd	%xmm0, %xmm2
	cvttsd2siq	%xmm2, %rbx
	xorq	%rax, %rbx
	jmp	.L7
.L2:
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	movsd	%xmm0, 16(%rsp)
	jmp	.L3
.L4:
	movq	%rax, %rdx
	andl	$1, %eax
	shrq	%rdx
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L5
	.cfi_endproc
.LFE63:
	.size	main, .-main
	.globl	k
	.data
	.align 8
	.type	k, @object
	.size	k, 8
k:
	.quad	10
	.globl	j
	.align 8
	.type	j, @object
	.size	j, 8
j:
	.quad	7
	.globl	max
	.align 8
	.type	max, @object
	.size	max, 8
max:
	.quad	10000000
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	652835029
	.long	1072564273
	.align 8
.LC1:
	.long	0
	.long	1138753536
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
