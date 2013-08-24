.code 
write proc 
    push r15
    push r14
    push rdi
    push rsi
    push rax
    push rcx

    ; nonprim is the block to print out
    mov rdi, nonprim
    ; here to store the output string
    mov r15, offset outbuf
    
    ; just a few lines
    mov rcx, LINES

    lineloop:
    push rcx
    mov rcx, 64
    xor r14, r14
    bts r14, 63

    bitloop:

    test rcx,7
    jnz writenospace
    mov byte ptr [r15], ' '
    add r15,1
    writenospace:
    
    test qword ptr [rdi], r14
    jz bitzero

    mov byte ptr [r15], 'x'
    add r15, 1
    shr r14,1
    loop bitloop
    jmp endloop

    bitzero:
    mov byte ptr [r15], '.'
    add r15,1
    shr r14,1
    loop bitloop

    endloop:

    mov byte ptr [r15], 10
    add r15,1

    add rdi,8
    pop rcx
    loop lineloop

    mov byte ptr [r15], 10

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, offset outbuf
    mov rdx, 73*LINES
    syscall

    
    pop rcx
    pop rax
    pop rsi
    pop rdi
    pop r14
    pop r15
    ret
    write endp


