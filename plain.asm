
.X64
.xmm

include write.inc
stdout    equ 1
SYS_EXIT  equ 1
SYS_WRITE equ 4
SYS_BRK   equ 12   ; 45 for int80
pot2      equ 25


.data
nonprim dq 0
endmem dq 0
tmp dq 0

outbuf   dq 1024 DUP(0)

.data?
bits     dq 128 DUP(?)

.code

breakme proc
ret
breakme endp

main:

    ; alloc mem
    mov rax, SYS_BRK
    mov rdi, 0
    syscall

    mov nonprim, rax

    mov rdi, 1
    shl rdi, pot2 - 3
    add rdi, rax
    add rdi, 16

    mov tmp, rbx

    mov rax, SYS_BRK
    syscall
    sub rax, 16
    mov endmem, rax


    ; which bit?

    ; bit-position 
    xor r8,r8
    sub r8,1
    
    outer_loop:

    add r8,1

    ; extract byte- and bit-number
    
    mov r10,r8
    mov rax,r8
    shr r10, 6
    and rax, 63

    add r10, nonprim

    cmp r10, endmem
    jge outer_break
    ; extract byte- and bit-number
    bt [r10], ax
    jc outer_loop

    push r10
    push r8

    ; here is r8 a prime bit
    ; and r9 is the prime number itself
    shl r8,1
    add r8,3

    mov rcx, endmem
    sub rcx, r10
    sub rcx,1
    inner_loop:
        add rax, r8
        mov rbx, rax
        shr rbx, 3
        and rbx, -8
        add r10, rbx
        sub rcx, rbx
        jc inner_break
        and rax,63

        bts [r10], ax
    jmp inner_loop

    inner_break:

    pop r8
    pop r10

    cmp r10, endmem
    jl outer_loop

    outer_break:

    call write 

    end_prog:

    mov rbx, 0
    mov rax, SYS_EXIT
    int 80h
    end main

