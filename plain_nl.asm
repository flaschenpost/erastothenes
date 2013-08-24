
.X64
.xmm

include write.inc
STDOUT    equ 1
SYS_EXIT  equ 60
SYS_WRITE equ 4
SYS_BRK   equ 12
POT2      equ 28
LINES     equ 30


    .data
fmthex db 10, "hello %x ", 10, 0

fmtprim db "% 5d %09d ",10, 0

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

    EXTRN printf:NEAR
    EXTRN fflush:NEAR

    breakme proc
    ret
    breakme endp

main:

    ; alloc mem
    mov rax, SYS_BRK
    xor rdi, rdi
    syscall

    mov nonprim, rax

    mov rdi, 1
    shl rdi, POT2-3
    add rdi, nonprim
    add rdi,8

    mov rax, SYS_BRK
    syscall
    sub rax, 8
    mov endmem, rax


    ; the counter for the number of prime
    xor r14, r14
    add r14,1
    
    ; prime number 2 is first
    ;; xor rax,rax
    ;; mov rdi, offset fmtprim
    ;; mov rdx, 2
    ;; mov rsi, r14
    ;; call printf


    xor r8,r8
    sub r8,1

    outer_loop:

    add r8,1
    call breakme

    ; extract byte- and bit-number
    ; r10 = byte number (increment by 8 for 64-bit)
    ; rbx is bit-position in byte
    mov r10,r8
    mov rbx,r8
    shr r10, 3
    and r10,-8
    and rbx, 63

    ; now r10 is memory-adress
    add r10, nonprim

    cmp r10, endmem
    jge outer_break

    ; test bit - if set, the number is composite
    bt [r10], bx
    jc outer_loop

    ; still here? So next prime number
    add r14,1

    ; position in bitstream
    push r8

    ; r9 gets the prime number itself
    mov r9,r8
    shl r9,1
    add r9,3


    ; output p
    ;; push r14
    ;; push rbx
    ;; push r10
    ;; push r9
    ;; push r8
    ;; xor rax,rax
    ;; mov rdi, offset fmtprim
    ;; mov rdx, r9
    ;; mov rsi, r14
    ;; call printf
    ;; pop r8
    ;; pop r9
    ;; pop r10
    ;; pop rbx
    ;; pop r14
    ; end of output p

    ; to first relevant bit - square
    mov rax, r9
    imul rax, rax
    jc outer_break
    shr rax, 1
    sub rax,1
    mov rbx, rax

    ; to first relevant bit - simple
    ;; add rbx, r9
    ;; mov rax, rbx

    ; split starting bit
    shr rax, 3
    and rax, -8
    and rbx,63
    mov r10, rax
    add r10, nonprim

    mov rcx, endmem
    sub rcx, r10
    jc inner_break
    jz inner_break

    sub rcx,1
    inner_loop:
        bts [r10], bx

        add rbx, r9
        mov rax, rbx
        shr rax, 3
        and rax, -8
        and rbx,63
        add r10, rax
        sub rcx, rax
        jc inner_break

    jmp inner_loop

    inner_break:
    ;; call write

    pop r8
    jmp outer_loop

    outer_break:

    ;; call write 

    ; mov rax, nonprim
    ; mov [rax], r8
    ; mov [rax+1], r9
    ; mov [rax+2], r10

    call write 

    jmp end_prog

    end_prog:
    ;; xor rax, rax
    ;; call fflush

    mov rbx, 0
    mov rax, SYS_EXIT
    syscall
    end main

