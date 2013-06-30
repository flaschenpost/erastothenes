
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
outbuf   dq 1024 DUP(?)
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

    mov tmp, rbx

    mov rax, 45
    int 80h

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
    mov rcx, 1
    shl rcx,27

    sub rcx, 1

    zero_bits:
    movdqu [rdi],xmm0
    add rdi, 8
    loop zero_bits

    call write 

    mov rbx, 0
    mov rax, SYS_EXIT
    int 80h

    mov r9, 0  ; j % 64
    mov r10, 0 ; j / 64

    mov r11, 0 ; working var

    mov rcx, 1
    shl rcx,10
    mov rdi, nonprim

    mov [nonprim], rcx
    mov rcx, offset outbuf
    mov rdx, 65*200
    mov rbx, stdout
    mov rax, SYS_WRITE
    int 80h

    set_bits:
        lea rsi, [offset bits + 8*r9]
        mov r11, [rsi]
        or  [rdi], r11 

        add r9,10 

        mov r11, r9
        shr r11, 6 ; /64
        shl r11, 3 ; *8
        add rdi, r11
        and r9, 63
    loop set_bits


    call write

    mov rbx, 0
    mov rax, SYS_EXIT
    int 80h
    end _start

