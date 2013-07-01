
;--- "hello world" for Linux which uses int 80h.
;--- assemble: jwasm -Fo=Linux1.o Linux1.asm
;--- link:     wlink format ELF runtime linux file Linux1.o name Linux1.

include write.inc
stdout    equ 1
SYS_EXIT  equ 60
SYS_WRITE equ 1
SYS_BREAK equ 12


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

    ; read old end of mem
    mov rax, SYS_BREAK
    mov rdi, 0
    syscall

    ; old break = new pointer
    mov nonprim, rax

    ; 1 GB + old end
    mov rdi, 1
    shl rdi, 30
    add rdi, rax

    mov rax, SYS_BREAK
    syscall

    ; set the single bitsets instead of shifting around
    mov rdi, offset bits
    mov r9,1

    mov ecx, 128

    init_bits:

    mov [rdi], r9
    add rdi,8
    shl r9,1

    loop init_bits

    mov rsi, nonprim
    mov ecx, 1
    shl ecx, 27
    sub ecx,1
  
    zero_bits:
        movdqu [rsi],xmm0
        add rsi, 8
    loop zero_bits

    mov r9, 0  ; j
    mov r10, 0 ; j / 64
    mov r11, 0 ; j % 64

    mov r12, nonprim
    ; 2^30 bits / 10 bit per instruction
    mov rcx, 1
    shl rcx,26
    sub rcx,1

    set_bits:
        mov r11, r9
        and r11, 63
        lea rsi, [bits + 8*r11]
        mov r11, [rsi]

        mov r10, r9;
        shr r10, 6
        shl r10,3
        add r10, nonprim
        or [r10], r11

        add r9,10

    loop set_bits
    call write


    mov rdi, 6
    mov rax, SYS_EXIT
    syscall
    end _start

