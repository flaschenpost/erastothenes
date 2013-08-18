
;--- "hello world" for Linux which uses int 80h.
;--- assemble: jwasm -Fo=Linux1.o Linux1.asm
;--- link:     wlink format ELF runtime linux file Linux1.o name Linux1.

.X64
.xmm

include write.inc
stdout    equ 1
SYS_EXIT  equ 1
SYS_WRITE equ 4


    .data
fmthex db 10, "%x "
nonprim dq 0
endmem dq 0
tmp dq 0
st_chk db 10,'c'
st_prm db ' p'

sttest db 10, "., anybody?0", 10
stlen dd $ - sttest
outbuf   dq 1024 DUP(0)

 .data?
bits     dq 128 DUP(?)

    .code


_start:

    ; alloc mem
    mov rax, 45
    mov rbx, 0
    int 80h

    mov nonprim, rax

    mov rbx, 1
    shl rbx, 20
    add rbx, rax

    add r8, r9

    mov tmp, rbx

    mov rax, 45
    int 80h


    ; which bit?

    ; bit-position 
    xor r8,r8
    
    outer_loop:

    add r8,1

    mov edx, 2
    mov rsi, offset st_chk
    mov edi, 1 ; stdout
    mov eax, 1 ; SYS_WRITE
    syscall
    ; extract byte- and bit-number
    
    mov r10,r8
    mov rax,r8
    shr r10, 6
    and rax, 63

    add r10, nonprim

    ; extract byte- and bit-number
    bt [r10], ax
    jc outer_loop

    mov edx, 2
    mov rsi, offset st_prm

    mov edi, 1 ; stdout
    mov eax, 1 ; SYS_WRITE
    syscall

    push r8

    ; here is r8 a prime bit
    ; and r9 is the prime number itself
    mov r9,r8
    add r9,r9
    add r9,1

    inner_loop:
    add r8, r9
    mov r10, r8
    mov rax, r8
    shr r10,6
    and rax,6
    





    mov rax, r8

    pop r8
    cmp r8, 1000
    jl outer_loop

    ; call write 

    ; mov rax, nonprim
    ; mov [rax], r8
    ; mov [rax+1], r9
    ; mov [rax+2], r10

    ; call write 
    ; call write 

    jmp end_prog

    chk_bit:

    xorps xmm0, xmm0
    xorps xmm1, xmm1
    xorps xmm2, xmm2
    xorps xmm3, xmm3
    xorps xmm4, xmm4
    xorps xmm5, xmm5
    xorps xmm6, xmm6
    xorps xmm7, xmm7
    xorps xmm8, xmm8

    mov RDI, offset bits
    mov r9,1

    mov ecx, 128

    init_bits:

    mov [RDI], r9
    add RDI,8
    shl r9,1

    loop init_bits

    mov rdi, nonprim

    mov rsi, nonprim
    add rsi, 8

    mov r9, nonprim
    add r9, 16

    mov r10, nonprim
    add r10, 24

    mov ecx, 1
    shl ecx, 25
    sub ecx,1
  
    zero_bits:
        movdqu [rsi],xmm0
        add rsi, 32
        movdqu [rdi],xmm0
        add rdi, 32
        movdqu [r9],xmm0
        add r9, 32
        movdqu [r10],xmm0
        add r10, 32
    loop zero_bits

    ; call write 

    mov r9, 0  ; j
    mov r10, 0 ; j / 64
    mov r11, 0 ; j % 64
    mov r12, 0 ; work

    ; 2^30 bits / 10 bit per instruction
    mov rcx, 1
    shl rcx,27
    sub rcx,1

    mov rdi, nonprim
    mov [rdi],0

    set_bits:
        mov r10, r9;
        shr r10, 6
        mov r11, r9
        and r11, 63
        mov r12, bits[r11]

        or nonprim[r10], r12

    loop set_bits


    ; call write
    end_prog:

    mov rbx, 0
    mov rax, SYS_EXIT
    int 80h
    end _start

