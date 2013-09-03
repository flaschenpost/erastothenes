
.X64
.xmm


;; marking bitwise numbers as "Composed"
;; every bit is an uneven number, so bit 0 stands for Number 3, bit 1 for Number 5 etc.
;; number = 2*bit + 3
;; bit = number/2 - 1

;; simple bit-printer
include write.inc

;; syscall 64-bit linux
STDOUT    equ 1
SYS_EXIT  equ 60
SYS_WRITE equ 4
SYS_BRK   equ 12
; output - lines, see write.inc
LINES equ 10
; scan & mark  2^POT2 bits
POT2      equ 18

    .data
;; output format: n-th prime is number ...
fmtprim db "% 5d %09d ",10, 0

; main memory pointer, also used by write.inc
nonprim dq 0
; end of memory
endmem dq 0

; buffer for output
outbuf   dq LINES*76 DUP(0)

.code

EXTRN printf:NEAR
EXTRN fflush:NEAR

;; dirty hack to set breakpoint in gdb, int 3 is too heavy
breakme proc
ret
breakme endp

;; print out two values with format fmt, 
xprint macro fmt, num1, num2
    ; not sure which registers are destroyed in printf
    push r14
    push rbx
    push r10
    push r9
    push r8
    xor rax,rax
    mov rdi, offset fmt
    mov rsi, num1
    mov rdx, num2
    call printf
    pop r8
    pop r9
    pop r10
    pop rbx
    pop r14
    endm

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
    ; end alloc mem


    ; the counter for the number of prime
    xor r14, r14
    add r14,1
    
    ; prime number 2 is first
    xprint fmtprim, r14, 2 


    ;; r8 is the bit-position
    xor r8,r8
    sub r8,1

    ;; loop through the prime numbers already found
    outer_loop:

    add r8,1
    ;; call breakme

    ; extract byte- and bit-number
    ; r10 = byte number (increment by 8 for 64-bit)
    ; rbx is bit-position in byte
    ; r10 = r8 / 64; rbx = r8 % 64
    mov r10,r8
    mov rbx,r8
    shr r10, 3
    and r10,-8
    and rbx, 63

    ; now r10 is memory-adress
    add r10, nonprim

    ; r10 at end? ready
    cmp r10, endmem
    jge outer_break

    ; test bit - if it has been already set, the number is composite
    bt [r10], bx
    jc outer_loop

    ; still here? So next prime number
    add r14,1

    ; position in bitstream
    mov r12, r8

    ; r9 gets the prime number itself
    mov r9,r8
    shl r9,1
    add r9,3


    ; output p - disable for timing, enable for checking
    xprint fmtprim, r14, r9

    ; to first relevant bit - square and recalc; if p = 7, the composite 5*7 has been already marked during p=5
    ; so we can start at 7*7
    mov rax, r9
    imul rax, rax
    jc outer_break
    shr rax, 1
    sub rax,1
    mov rbx, rax


    ; split starting bit %64 and /64
    shr rax, 3
    and rax, -8
    and rbx,63
    mov r10, rax
    add r10, nonprim

    ; how far should we go?
    mov rcx, endmem
    sub rcx, r10
    jc inner_break
    jz inner_break

    sub rcx,1
    ; run (or walk) through the Megabits!
    inner_loop:
        ; set bit
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

    mov r8, r12
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

