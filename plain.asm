

.X64
.xmm

include write.inc
stdout    equ 1
SYS_EXIT  equ 1
SYS_WRITE equ 4
POT2      equ 28


    .data
fmthex db 10, "hello %x ", 10, 0
fmthex_length db $-fmthex
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

    breakme proc
    ret
    breakme endp

main:

    ; alloc mem
    mov rax, 45
    mov rbx, 0
    int 80h

    mov nonprim, rax

    mov rbx, 1
    shl rbx, POT2-3
    add rbx, rax

    add r8, r9

    mov tmp, rbx

    mov rax, 45
    int 80h
    sub rax, 8
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

    push r8

    ; here is r8 a prime bit
    ; and r9 is the prime number itself
    shl r8,1
    add r8,3

    mov rax, r8
    imul rax, rax


    mov rcx, endmem
    sub rcx, r10
    sub rcx,1
    inner_loop:
        add rax, r8
        mov rbx, rax
        shr rbx, 3
        and rbx, -8
        and rax,63
        add r10, rbx
        sub rcx, rbx
        jc inner_break

        bts [r10], ax
    jmp inner_loop

    inner_break:
    ; call write

    pop r8
    jmp outer_loop

    outer_break:

    call write 

    ; mov rax, nonprim
    ; mov [rax], r8
    ; mov [rax+1], r9
    ; mov [rax+2], r10

    ; call write 
    ; call write 

    jmp end_prog

    call write
    end_prog:

    mov rbx, 0
    mov rax, SYS_EXIT
    int 80h
    end main

