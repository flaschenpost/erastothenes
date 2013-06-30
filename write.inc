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

    mov rcx, offset outbuf
    mov rdx, 69*20
    mov rbx, stdout
    mov rax, 4
    int 80h

    
    pop rcx
    pop rax
    pop rsi
    pop rdi
    pop r14
    pop r15
    ret
    write endp


