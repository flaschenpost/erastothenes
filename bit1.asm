
;--- "hello world" for Linux which uses int 80h.
;--- assemble: jwasm -Fo=Linux1.o Linux1.asm
;--- link:     wlink format ELF runtime linux file Linux1.o name Linux1.

include write.inc
stdout    equ 1
SYS_EXIT  equ 1
SYS_WRITE equ 4


    .data
string  db 10,"Hello, world!",10
len dd $ - string
fmthex db 10, "%x "
nonprim dq 0
endmem dq 0
tmp dq 0

 .data?
bits     dq 128 DUP(?)
outbuf   dq 512*1024 DUP(?)
shift5   dq 64  DUP(?)
shift7   dq 64  DUP(?)
shift11  dq 64  DUP(?)
shift13  dq 64  DUP(?)
shift17  dq 64  DUP(?)

    .code


_start:

    ; alloc mem
    mov rax, 45
    mov rbx, 0
    int 80h

    mov nonprim, rax

    mov rbx, 1
    shl rbx, 30
    add rbx, rax
    add rdi, 2048
    add rdi, rax

    mov tmp, rbx

    mov rax, 45
    int 80h

    mov rax, nonprim
    add rax, 0ffh
    and rax, -100h

    mov nonprim, rax

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

    mov [rdi], r9
    add rdi,8
    shl r9,1

    loop init_bits

    mov rdi, nonprim

    mov rsi, nonprim
    add rsi, 16

    mov r9, nonprim
    add r9, 32

    mov r10, nonprim
    add r10, 48

    mov ecx, 1
    shl ecx, 22
    sub ecx,1
  
    zero_bits:
        movaps [rsi],xmm0
        add rsi, 64
        movdqa [rdi],xmm0
        add rdi, 64
        movaps [r9],xmm0
        add r9, 64
        movdqa [r10],xmm0
        add r10, 64
    loop zero_bits

    ; call write 

    mov r9, 0  ; j
    mov r10, 0 ; j / 64
    mov r11, 0 ; j % 64
    mov r12, 0 ; work

    ; 2^30 bits / 10 bit per instruction
    mov edx,0

    mov rax, 1
    shl rax, 33
    sub rax, 1

    mov r9, 10

    div r9

    mov rcx, rax

    mov r9, 0
    mov r10, 0
    mov rdi, nonprim

    set_bits:

        mov rsi, r9
        shr rsi, 3
        and rsi, -8
        add rdi, rsi

        and r9, 63

        lea rsi, [bits + 8*r9]
        mov r10, [rsi]

        or [rdi], r10
        add r9,10

    loop set_bits


    call write

    mov rbx, 0
    mov rax, SYS_EXIT
    int 80h
    end _start

