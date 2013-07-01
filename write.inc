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
    mov rcx, 20

    lineloop:
    push rcx
    mov rcx, 64

    bitloop:

    mov r14,1
    shl r14,cl
    shr r14,1
    
    test rcx,7
    jnz writenospace
    mov byte ptr [r15], ' '
    add r15,1
    writenospace:
    
    test qword ptr [rdi], r14
    jz bitzero

    mov byte ptr [r15], 'x'
    add r15, 1
    loop bitloop
    jmp endloop

    bitzero:
    mov byte ptr [r15], '.'
    add r15,1
    loop bitloop

    endloop:

    mov byte ptr [r15], 10
    add r15,1

    add rdi,8
    pop rcx
    loop lineloop

    mov byte ptr [r15], 10

    mov rcx, offset outbuf
    mov rdx, 73*20+1
    mov rbx, 1
    mov rax, 4
    int 80h

    ; mov rax, 1
    ; mov rdi, 1
    ; mov rsi, offset outbuf
    ; mov rdx, 70*20
    ; syscall

    
    pop rcx
    pop rax
    pop rsi
    pop rdi
    pop r14
    pop r15
    ret
    write endp


