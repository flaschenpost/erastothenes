# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 13.1.1.163 Build 2013031";
# mark_description "3";
# mark_description "-march=native -O3 -S -lm";
	.file "tl.c"
	.text
..TXTST0:
# -- Begin  main
# mark_begin;
       .align    16,0x90
	.globl main
main:
..B1.1:                         # Preds ..B1.0
..___tag_value_main.1:                                          #61.11
        pushq     %rbp                                          #61.11
..___tag_value_main.3:                                          #
        movq      %rsp, %rbp                                    #61.11
..___tag_value_main.4:                                          #
        andq      $-128, %rsp                                   #61.11
        pushq     %r12                                          #61.11
        pushq     %r13                                          #61.11
        pushq     %r14                                          #61.11
        pushq     %r15                                          #61.11
        pushq     %rbx                                          #61.11
        subq      $216, %rsp                                    #61.11
        movl      $3, %edi                                      #61.11
..___tag_value_main.6:                                          #61.11
        call      __intel_new_proc_init_T                       #61.11
..___tag_value_main.7:                                          #
                                # LOE rbx r12 r15
..B1.122:                       # Preds ..B1.1
        fildq     max(%rip)                                     #62.26
        stmxcsr   16(%rsp)                                      #61.11
        movq      max(%rip), %rax                               #62.26
        shrq      $63, %rax                                     #62.26
        orl       $32832, 16(%rsp)                              #61.11
        ldmxcsr   16(%rsp)                                      #61.11
        faddl     .L_2il0floatpacket.71(,%rax,8)                #62.26
        fstpl     8(%rsp)                                       #62.22
        movsd     8(%rsp), %xmm0                                #62.22
        movsd     %xmm0, (%rsp)                                 #62.22
        call      log                                           #62.22
                                # LOE rbx r12 r15 xmm0
..B1.121:                       # Preds ..B1.122
        movaps    %xmm0, %xmm3                                  #62.22
        movsd     %xmm3, 8(%rsp)                                #62.40
        call      log                                           #62.40
                                # LOE rbx r12 r15 xmm0
..B1.120:                       # Preds ..B1.121
        movsd     8(%rsp), %xmm3                                #
        movl      $8, %esi                                      #63.13
        movsd     .L_2il0floatpacket.70(%rip), %xmm2            #62.56
        movaps    %xmm2, %xmm1                                  #62.56
        subsd     .L_2il0floatpacket.68(%rip), %xmm0            #62.56
        addsd     %xmm0, %xmm3                                  #62.56
        mulsd     (%rsp), %xmm3                                 #62.56
        movaps    %xmm3, %xmm4                                  #62.56
        cmplesd   %xmm3, %xmm1                                  #62.56
        subsd     %xmm2, %xmm4                                  #62.56
        movd      %xmm1, %eax                                   #62.56
        andl      $-2147483648, %eax                            #62.56
        jne       ..L13         # Prob 50%                      #62.56
        movaps    %xmm3, %xmm4                                  #62.56
..L13:                                                          #
        cvttsd2si %xmm4, %r14                                   #62.56
        shlq      $32, %rax                                     #62.56
        addq      %rax, %r14                                    #62.56
        shrq      $7, %r14                                      #63.27
        lea       3(%r14), %rdi                                 #63.13
        call      calloc                                        #63.13
                                # LOE rax rbx r12 r14 r15
..B1.119:                       # Preds ..B1.120
        movq      %rax, %r13                                    #63.13
                                # LOE rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.119
        movl      $5, p(%rip)                                   #65.5
        movl      $7, %eax                                      #70.5
        movq      $7, j(%rip)                                   #67.5
        pxor      %xmm0, %xmm0                                  #70.5
        movq      $10, k(%rip)                                  #68.5
        movl      $10, %edx                                     #70.5
        movaps    %xmm0, 128(%rsp)                              #70.5
        movl      $128, %ecx                                    #70.5
                                # LOE rax rdx rcx rbx r12 r13 r14 r15 xmm0
..B1.114:                       # Preds ..B1.114 ..B1.2
        movaps    %xmm0, -16(%rsp,%rcx)                         #70.5
        movaps    %xmm0, -32(%rsp,%rcx)                         #70.5
        movaps    %xmm0, -48(%rsp,%rcx)                         #70.5
        movaps    %xmm0, -64(%rsp,%rcx)                         #70.5
        subq      $64, %rcx                                     #70.5
        jne       ..B1.114      # Prob 50%                      #70.5
        .align    16,0x90
                                # LOE rax rdx rcx rbx r12 r13 r14 r15 xmm0
..B1.3:                         # Preds ..B1.114 ..B1.3
        movq      %rax, %rdi                                    #70.5
        movq      %rdx, %r9                                     #70.5
        shrq      $6, %rdi                                      #70.5
        movl      %eax, %ecx                                    #70.5
        shrq      $6, %r9                                       #70.5
        movl      $1, %esi                                      #70.5
        shlq      %cl, %rsi                                     #70.5
        movl      %edx, %ecx                                    #70.5
        movl      $1, %r8d                                      #70.5
        addq      $10, %rdx                                     #70.5
        orq       %rsi, (%r13,%rdi,8)                           #70.5
        addq      $10, %rax                                     #70.5
        orq       %rsi, (%rsp,%rdi,8)                           #70.5
        shlq      %cl, %r8                                      #70.5
        orq       %r8, (%r13,%r9,8)                             #70.5
        orq       %r8, (%rsp,%r9,8)                             #70.5
        cmpq      $384, %rdx                                    #70.5
        jb        ..B1.3        # Prob 94%                      #70.5
                                # LOE rax rdx rbx r12 r13 r14 r15 xmm0
..B1.4:                         # Preds ..B1.3
        cmpq      $384, %rax                                    #70.5
        jae       ..B1.6        # Prob 50%                      #70.5
                                # LOE rax rbx r12 r13 r14 r15 xmm0
..B1.5:                         # Preds ..B1.4
        movq      %rax, %rsi                                    #70.5
        movl      %eax, %ecx                                    #70.5
        shrq      $6, %rsi                                      #70.5
        movl      $1, %edx                                      #70.5
        shlq      %cl, %rdx                                     #70.5
        orq       %rdx, (%r13,%rsi,8)                           #70.5
        orq       %rdx, (%rsp,%rsi,8)                           #70.5
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.6:                         # Preds ..B1.4 ..B1.5
        movq      40(%rsp), %rax                                #70.5
        movl      $5, %esi                                      #70.5
        movq      %rax, (%rsp)                                  #70.5
        cmpq      $5, %r14                                      #70.5
        jbe       ..B1.10       # Prob 10%                      #70.5
                                # LOE rbx rsi r12 r13 r14 r15 xmm0
..B1.7:                         # Preds ..B1.6
        movq      $0xcccccccccccccccd, %rcx                     #70.5
                                # LOE rcx rbx rsi r12 r13 r14 r15 xmm0
..B1.8:                         # Preds ..B1.8 ..B1.7
        movq      %rsi, %rax                                    #70.5
        mulq      %rcx                                          #70.5
        shrq      $2, %rdx                                      #70.5
        lea       (%rdx,%rdx,4), %rdi                           #70.5
        negq      %rdi                                          #70.5
        addq      %rsi, %rdi                                    #70.5
        movq      (%rsp,%rdi,8), %r8                            #70.5
        movq      %r8, (%r13,%rsi,8)                            #70.5
        addq      $2, %rsi                                      #70.5
        cmpq      %r14, %rsi                                    #70.5
        jb        ..B1.8        # Prob 94%                      #70.5
                                # LOE rcx rbx rsi r12 r13 r14 r15 xmm0
..B1.10:                        # Preds ..B1.8 ..B1.6
        movq      k(%rip), %r8                                  #73.5
        movl      $15, %esi                                     #75.5
        movl      $7, p(%rip)                                   #71.5
        movl      $128, %edx                                    #75.5
        movq      $15, j(%rip)                                  #72.5
        lea       14(%r8), %rcx                                 #73.5
        movq      %rcx, k(%rip)                                 #73.5
        movaps    %xmm0, 128(%rsp)                              #75.5
                                # LOE rdx rcx rbx rsi r8 r12 r13 r14 r15 xmm0
..B1.115:                       # Preds ..B1.115 ..B1.10
        movaps    %xmm0, -16(%rsp,%rdx)                         #75.5
        movaps    %xmm0, -32(%rsp,%rdx)                         #75.5
        movaps    %xmm0, -48(%rsp,%rdx)                         #75.5
        movaps    %xmm0, -64(%rsp,%rdx)                         #75.5
        subq      $64, %rdx                                     #75.5
        jne       ..B1.115      # Prob 50%                      #75.5
                                # LOE rdx rcx rbx rsi r8 r12 r13 r14 r15 xmm0
..B1.11:                        # Preds ..B1.115
        cmpq      $512, %rcx                                    #75.5
        jae       ..B1.15       # Prob 50%                      #75.5
                                # LOE rcx rbx rsi r8 r12 r13 r14 r15 xmm0
..B1.12:                        # Preds ..B1.11
        negq      %rcx                                          #
        movq      $0x2492492492492493, %r9                      #
        addq      $525, %rcx                                    #
        xorl      %edi, %edi                                    #75.5
        movq      %rcx, %rax                                    #
        mulq      %r9                                           #
        movq      %rcx, %rax                                    #
        movq      %rdx, %rsi                                    #
        mulq      %r9                                           #
        subq      %rdx, %rcx                                    #
        xorl      %eax, %eax                                    #
        shrq      $1, %rcx                                      #
        addq      %rcx, %rsi                                    #
        shrq      $3, %rsi                                      #
        .align    16,0x90
                                # LOE rax rbx rsi rdi r8 r12 r13 r14 r15 xmm0
..B1.13:                        # Preds ..B1.13 ..B1.12
        movl      $1, %r9d                                      #75.5
        lea       15(%rax), %r10                                #75.5
        movl      %r10d, %ecx                                   #75.5
        movl      $1, %r11d                                     #75.5
        shrq      $6, %r10                                      #75.5
        incq      %rdi                                          #75.5
        shlq      %cl, %r9                                      #75.5
        orq       %r9, (%r13,%r10,8)                            #75.5
        orq       %r9, (%rsp,%r10,8)                            #75.5
        lea       14(%rax,%r8), %r9                             #75.5
        movl      %r9d, %ecx                                    #75.5
        addq      $14, %rax                                     #75.5
        shrq      $6, %r9                                       #75.5
        shlq      %cl, %r11                                     #75.5
        orq       %r11, (%r13,%r9,8)                            #75.5
        orq       %r11, (%rsp,%r9,8)                            #75.5
        cmpq      %rsi, %rdi                                    #75.5
        jb        ..B1.13       # Prob 94%                      #75.5
                                # LOE rax rbx rsi rdi r8 r12 r13 r14 r15 xmm0
..B1.14:                        # Preds ..B1.13
        movq      %rdi, %rsi                                    #75.5
        shlq      $4, %rsi                                      #75.5
        subq      %rdi, %rsi                                    #75.5
        subq      %rdi, %rsi                                    #75.5
        addq      $15, %rsi                                     #75.5
        cmpq      $512, %rsi                                    #75.5
        jae       ..B1.16       # Prob 50%                      #75.5
                                # LOE rbx rsi r12 r13 r14 r15 xmm0
..B1.15:                        # Preds ..B1.11 ..B1.14
        movq      %rsi, %rdx                                    #75.5
        movl      %esi, %ecx                                    #75.5
        shrq      $6, %rdx                                      #75.5
        movl      $1, %eax                                      #75.5
        shlq      %cl, %rax                                     #75.5
        orq       %rax, (%r13,%rdx,8)                           #75.5
        orq       %rax, (%rsp,%rdx,8)                           #75.5
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.16:                        # Preds ..B1.14 ..B1.15
        movq      56(%rsp), %rax                                #75.5
        movl      $7, %esi                                      #75.5
        movq      %rax, (%rsp)                                  #75.5
        cmpq      $7, %r14                                      #75.5
        jbe       ..B1.20       # Prob 10%                      #75.5
                                # LOE rbx rsi r12 r13 r14 r15 xmm0
..B1.17:                        # Preds ..B1.16
        movq      $0x2492492492492493, %rcx                     #
                                # LOE rcx rbx rsi r12 r13 r14 r15 xmm0
..B1.18:                        # Preds ..B1.18 ..B1.17
        movq      %rsi, %rax                                    #75.5
        mulq      %rcx                                          #75.5
        movq      %rsi, %rax                                    #75.5
        movq      %rdx, %r8                                     #75.5
        mulq      %rcx                                          #75.5
        negq      %rdx                                          #75.5
        addq      %rsi, %rdx                                    #75.5
        shrq      $1, %rdx                                      #75.5
        addq      %rdx, %r8                                     #75.5
        shrq      $2, %r8                                       #75.5
        lea       (,%r8,8), %rdi                                #75.5
        subq      %rdi, %r8                                     #75.5
        addq      %rsi, %r8                                     #75.5
        movq      (%rsp,%r8,8), %r9                             #75.5
        movq      %r9, (%r13,%rsi,8)                            #75.5
        addq      $2, %rsi                                      #75.5
        cmpq      %r14, %rsi                                    #75.5
        jb        ..B1.18       # Prob 94%                      #75.5
                                # LOE rcx rbx rsi r12 r13 r14 r15 xmm0
..B1.20:                        # Preds ..B1.18 ..B1.16
        movq      k(%rip), %rsi                                 #78.5
        movl      $39, %ecx                                     #80.5
        movl      $11, p(%rip)                                  #76.5
        movl      $128, %edx                                    #80.5
        movq      $39, j(%rip)                                  #77.5
        lea       22(%rsi), %rax                                #78.5
        movq      %rax, k(%rip)                                 #78.5
        movaps    %xmm0, 128(%rsp)                              #80.5
                                # LOE rax rdx rcx rbx rsi r12 r13 r14 r15 xmm0
..B1.116:                       # Preds ..B1.116 ..B1.20
        movaps    %xmm0, -16(%rsp,%rdx)                         #80.5
        movaps    %xmm0, -32(%rsp,%rdx)                         #80.5
        movaps    %xmm0, -48(%rsp,%rdx)                         #80.5
        movaps    %xmm0, -64(%rsp,%rdx)                         #80.5
        subq      $64, %rdx                                     #80.5
        jne       ..B1.116      # Prob 50%                      #80.5
                                # LOE rax rdx rcx rbx rsi r12 r13 r14 r15 xmm0
..B1.21:                        # Preds ..B1.116
        cmpq      $768, %rax                                    #80.5
        jae       ..B1.25       # Prob 50%                      #80.5
                                # LOE rax rcx rbx rsi r12 r13 r14 r15 xmm0
..B1.22:                        # Preds ..B1.21
        negq      %rax                                          #
        movq      $0x2e8ba2e8ba2e8ba3, %rcx                     #
        addq      $789, %rax                                    #
        xorl      %edi, %edi                                    #80.5
        mulq      %rcx                                          #
        shrq      $2, %rdx                                      #
        xorl      %eax, %eax                                    #
        .align    16,0x90
                                # LOE rax rdx rbx rsi rdi r12 r13 r14 r15 xmm0
..B1.23:                        # Preds ..B1.23 ..B1.22
        movl      $1, %r8d                                      #80.5
        lea       39(%rax), %r9                                 #80.5
        movl      %r9d, %ecx                                    #80.5
        lea       22(%rax,%rsi), %r11                           #80.5
        shrq      $6, %r9                                       #80.5
        movl      $1, %r10d                                     #80.5
        shlq      %cl, %r8                                      #80.5
        movl      %r11d, %ecx                                   #80.5
        shrq      $6, %r11                                      #80.5
        incq      %rdi                                          #80.5
        shlq      %cl, %r10                                     #80.5
        addq      $22, %rax                                     #80.5
        orq       %r8, (%r13,%r9,8)                             #80.5
        orq       %r8, (%rsp,%r9,8)                             #80.5
        orq       %r10, (%r13,%r11,8)                           #80.5
        orq       %r10, (%rsp,%r11,8)                           #80.5
        cmpq      %rdx, %rdi                                    #80.5
        jb        ..B1.23       # Prob 94%                      #80.5
                                # LOE rax rdx rbx rsi rdi r12 r13 r14 r15 xmm0
..B1.24:                        # Preds ..B1.23
        imulq     $22, %rdi, %rcx                               #80.5
        addq      $39, %rcx                                     #80.5
        cmpq      $768, %rcx                                    #80.5
        jae       ..B1.26       # Prob 50%                      #80.5
                                # LOE rcx rbx r12 r13 r14 r15 xmm0
..B1.25:                        # Preds ..B1.21 ..B1.24
        movq      %rcx, %rdx                                    #80.5
        movl      $1, %eax                                      #80.5
        shrq      $6, %rdx                                      #80.5
        shlq      %cl, %rax                                     #80.5
        orq       %rax, (%r13,%rdx,8)                           #80.5
        orq       %rax, (%rsp,%rdx,8)                           #80.5
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.26:                        # Preds ..B1.24 ..B1.25
        movq      88(%rsp), %rax                                #80.5
        movl      $11, %esi                                     #80.5
        movq      %rax, (%rsp)                                  #80.5
        cmpq      $11, %r14                                     #80.5
        jbe       ..B1.30       # Prob 10%                      #80.5
                                # LOE rbx rsi r12 r13 r14 r15 xmm0
..B1.27:                        # Preds ..B1.26
        movq      $0x2e8ba2e8ba2e8ba3, %rcx                     #
                                # LOE rcx rbx rsi r12 r13 r14 r15 xmm0
..B1.28:                        # Preds ..B1.28 ..B1.27
        movq      %rsi, %rax                                    #80.5
        mulq      %rcx                                          #80.5
        shrq      $1, %rdx                                      #80.5
        imulq     $-11, %rdx, %rdi                              #80.5
        addq      %rsi, %rdi                                    #80.5
        movq      (%rsp,%rdi,8), %r8                            #80.5
        movq      %r8, (%r13,%rsi,8)                            #80.5
        addq      $2, %rsi                                      #80.5
        cmpq      %r14, %rsi                                    #80.5
        jb        ..B1.28       # Prob 94%                      #80.5
                                # LOE rcx rbx rsi r12 r13 r14 r15 xmm0
..B1.30:                        # Preds ..B1.28 ..B1.26
        movl      $.L_2__STRING.3, %edi                         #81.5
        xorl      %eax, %eax                                    #81.5
        movq      (%r13), %rsi                                  #81.5
        movq      136(%r13), %rdx                               #81.5
        movq      -8(%r13,%r14,8), %rcx                         #81.5
..___tag_value_main.14:                                         #81.5
        call      printf                                        #81.5
..___tag_value_main.15:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.31:                        # Preds ..B1.30
        xorl      %edx, %edx                                    #82.5
        xorl      %eax, %eax                                    #
        movq      (%r13), %rsi                                  #82.14
        movq      %rax, %rbx                                    #
        pxor      %xmm0, %xmm0                                  #
        movl      %edx, %r12d                                   #
        movq      %r14, %r15                                    #
        movq      %r13, %r14                                    #
        movq      %rsi, %r13                                    #
                                # LOE rbx r13 r14 r15 r12d
..B1.32:                        # Preds ..B1.35 ..B1.31
        btq       %r12, %r13                                    #82.5
        jnc       ..B1.34       # Prob 50%                      #82.5
                                # LOE rbx r13 r14 r15 r12d
..B1.33:                        # Preds ..B1.32
        movl      $.L_2__STRING.0, %edi                         #82.5
        xorl      %eax, %eax                                    #82.5
..___tag_value_main.16:                                         #82.5
        call      printf                                        #82.5
..___tag_value_main.17:                                         #
        jmp       ..B1.35       # Prob 100%                     #82.5
                                # LOE rbx r13 r14 r15 r12d
..B1.34:                        # Preds ..B1.32
        movl      $.L_2__STRING.1, %edi                         #82.5
        xorl      %eax, %eax                                    #82.5
..___tag_value_main.18:                                         #82.5
        call      printf                                        #82.5
..___tag_value_main.19:                                         #
                                # LOE rbx r13 r14 r15 r12d
..B1.35:                        # Preds ..B1.33 ..B1.34
        incq      %rbx                                          #82.5
        incl      %r12d                                         #82.5
        cmpq      $64, %rbx                                     #82.5
        jb        ..B1.32       # Prob 82%                      #82.5
                                # LOE rbx r13 r14 r15 r12d
..B1.36:                        # Preds ..B1.35
        movq      %r13, %rsi                                    #
        movl      $.L_2__STRING.2, %edi                         #82.5
        pxor      %xmm0, %xmm0                                  #
        xorl      %eax, %eax                                    #82.5
        movq      %r14, %r13                                    #
        movq      %r15, %r14                                    #
..___tag_value_main.20:                                         #82.5
        call      printf                                        #82.5
..___tag_value_main.21:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.37:                        # Preds ..B1.36
        xorl      %edx, %edx                                    #82.20
        xorl      %eax, %eax                                    #
        movq      %rax, %rbx                                    #
        movl      %edx, %r12d                                   #
        movq      136(%r13), %rsi                               #82.29
        movq      %r14, %r15                                    #
        pxor      %xmm0, %xmm0                                  #
        movq      %r13, %r14                                    #
        movq      %rsi, %r13                                    #
                                # LOE rbx r13 r14 r15 r12d
..B1.38:                        # Preds ..B1.41 ..B1.37
        btq       %r12, %r13                                    #82.20
        jnc       ..B1.40       # Prob 50%                      #82.20
                                # LOE rbx r13 r14 r15 r12d
..B1.39:                        # Preds ..B1.38
        movl      $.L_2__STRING.0, %edi                         #82.20
        xorl      %eax, %eax                                    #82.20
..___tag_value_main.22:                                         #82.20
        call      printf                                        #82.20
..___tag_value_main.23:                                         #
        jmp       ..B1.41       # Prob 100%                     #82.20
                                # LOE rbx r13 r14 r15 r12d
..B1.40:                        # Preds ..B1.38
        movl      $.L_2__STRING.1, %edi                         #82.20
        xorl      %eax, %eax                                    #82.20
..___tag_value_main.24:                                         #82.20
        call      printf                                        #82.20
..___tag_value_main.25:                                         #
                                # LOE rbx r13 r14 r15 r12d
..B1.41:                        # Preds ..B1.39 ..B1.40
        incq      %rbx                                          #82.20
        incl      %r12d                                         #82.20
        cmpq      $64, %rbx                                     #82.20
        jb        ..B1.38       # Prob 82%                      #82.20
                                # LOE rbx r13 r14 r15 r12d
..B1.42:                        # Preds ..B1.41
        movq      %r13, %rsi                                    #
        movl      $.L_2__STRING.2, %edi                         #82.20
        pxor      %xmm0, %xmm0                                  #
        xorl      %eax, %eax                                    #82.20
        movq      %r14, %r13                                    #
        movq      %r15, %r14                                    #
..___tag_value_main.26:                                         #82.20
        call      printf                                        #82.20
..___tag_value_main.27:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.43:                        # Preds ..B1.42
        xorl      %edx, %edx                                    #82.36
        xorl      %eax, %eax                                    #
        movq      %rax, %rbx                                    #
        movl      %edx, %r12d                                   #
        movq      -8(%r13,%r14,8), %rsi                         #82.45
        movq      %r14, %r15                                    #
        pxor      %xmm0, %xmm0                                  #
        movq      %r13, %r14                                    #
        movq      %rsi, %r13                                    #
                                # LOE rbx r13 r14 r15 r12d
..B1.44:                        # Preds ..B1.47 ..B1.43
        btq       %r12, %r13                                    #82.36
        jnc       ..B1.46       # Prob 50%                      #82.36
                                # LOE rbx r13 r14 r15 r12d
..B1.45:                        # Preds ..B1.44
        movl      $.L_2__STRING.0, %edi                         #82.36
        xorl      %eax, %eax                                    #82.36
..___tag_value_main.28:                                         #82.36
        call      printf                                        #82.36
..___tag_value_main.29:                                         #
        jmp       ..B1.47       # Prob 100%                     #82.36
                                # LOE rbx r13 r14 r15 r12d
..B1.46:                        # Preds ..B1.44
        movl      $.L_2__STRING.1, %edi                         #82.36
        xorl      %eax, %eax                                    #82.36
..___tag_value_main.30:                                         #82.36
        call      printf                                        #82.36
..___tag_value_main.31:                                         #
                                # LOE rbx r13 r14 r15 r12d
..B1.47:                        # Preds ..B1.45 ..B1.46
        incq      %rbx                                          #82.36
        incl      %r12d                                         #82.36
        cmpq      $64, %rbx                                     #82.36
        jb        ..B1.44       # Prob 82%                      #82.36
                                # LOE rbx r13 r14 r15 r12d
..B1.48:                        # Preds ..B1.47
        movq      %r13, %rsi                                    #
        movl      $.L_2__STRING.2, %edi                         #82.36
        pxor      %xmm0, %xmm0                                  #
        xorl      %eax, %eax                                    #82.36
        movq      %r14, %r13                                    #
        movq      %r15, %r14                                    #
..___tag_value_main.32:                                         #82.36
        call      printf                                        #82.36
..___tag_value_main.33:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.49:                        # Preds ..B1.48
        movq      j(%rip), %rsi                                 #84.15
        movl      $128, %eax                                    #84.5
        pxor      %xmm0, %xmm0                                  #
        movq      k(%rip), %r8                                  #84.18
        movaps    %xmm0, 128(%rsp)                              #84.5
                                # LOE rax rbx rsi r8 r12 r13 r14 r15 xmm0
..B1.117:                       # Preds ..B1.117 ..B1.49
        movaps    %xmm0, -16(%rsp,%rax)                         #84.5
        movaps    %xmm0, -32(%rsp,%rax)                         #84.5
        movaps    %xmm0, -48(%rsp,%rax)                         #84.5
        movaps    %xmm0, -64(%rsp,%rax)                         #84.5
        subq      $64, %rax                                     #84.5
        jne       ..B1.117      # Prob 50%                      #84.5
                                # LOE rax rbx rsi r8 r12 r13 r14 r15 xmm0
..B1.50:                        # Preds ..B1.117
        cmpq      $896, %r8                                     #84.5
        jae       ..B1.54       # Prob 50%                      #84.5
                                # LOE rbx rsi r8 r12 r13 r14 r15 xmm0
..B1.51:                        # Preds ..B1.50
        movq      %r8, %rax                                     #
        movq      $0x4ec4ec4ec4ec4ec5, %rcx                     #
        negq      %rax                                          #
        xorl      %edi, %edi                                    #84.5
        addq      $921, %rax                                    #
        mulq      %rcx                                          #
        shrq      $3, %rdx                                      #
        xorl      %eax, %eax                                    #
        .align    16,0x90
                                # LOE rax rdx rbx rsi rdi r8 r12 r13 r14 r15 xmm0
..B1.52:                        # Preds ..B1.52 ..B1.51
        movl      $1, %r9d                                      #84.5
        lea       (%rsi,%rax), %r10                             #84.5
        movl      %r10d, %ecx                                   #84.5
        movl      $1, %r11d                                     #84.5
        shrq      $6, %r10                                      #84.5
        incq      %rdi                                          #84.5
        shlq      %cl, %r9                                      #84.5
        orq       %r9, (%r13,%r10,8)                            #84.5
        orq       %r9, (%rsp,%r10,8)                            #84.5
        lea       (%r8,%rax), %r9                               #84.5
        movl      %r9d, %ecx                                    #84.5
        addq      $26, %rax                                     #84.5
        shrq      $6, %r9                                       #84.5
        shlq      %cl, %r11                                     #84.5
        orq       %r11, (%r13,%r9,8)                            #84.5
        orq       %r11, (%rsp,%r9,8)                            #84.5
        cmpq      %rdx, %rdi                                    #84.5
        jb        ..B1.52       # Prob 94%                      #84.5
                                # LOE rax rdx rbx rsi rdi r8 r12 r13 r14 r15 xmm0
..B1.53:                        # Preds ..B1.52
        imulq     $26, %rdi, %rax                               #84.5
        addq      %rax, %rsi                                    #84.5
                                # LOE rbx rsi r12 r13 r14 r15 xmm0
..B1.54:                        # Preds ..B1.53 ..B1.50
        cmpq      $896, %rsi                                    #84.5
        jae       ..B1.56       # Prob 50%                      #84.5
                                # LOE rbx rsi r12 r13 r14 r15 xmm0
..B1.55:                        # Preds ..B1.54
        movq      %rsi, %rdx                                    #84.5
        movl      %esi, %ecx                                    #84.5
        shrq      $6, %rdx                                      #84.5
        movl      $1, %eax                                      #84.5
        shlq      %cl, %rax                                     #84.5
        orq       %rax, (%r13,%rdx,8)                           #84.5
        orq       %rax, (%rsp,%rdx,8)                           #84.5
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.56:                        # Preds ..B1.54 ..B1.55
        movq      104(%rsp), %rax                               #84.5
        movl      $13, %esi                                     #84.5
        movq      %rax, (%rsp)                                  #84.5
        cmpq      $13, %r14                                     #84.5
        jbe       ..B1.60       # Prob 10%                      #84.5
                                # LOE rbx rsi r12 r13 r14 r15 xmm0
..B1.57:                        # Preds ..B1.56
        movq      $0x4ec4ec4ec4ec4ec5, %rcx                     #
                                # LOE rcx rbx rsi r12 r13 r14 r15 xmm0
..B1.58:                        # Preds ..B1.58 ..B1.57
        movq      %rsi, %rax                                    #84.5
        mulq      %rcx                                          #84.5
        shrq      $2, %rdx                                      #84.5
        imulq     $-13, %rdx, %rdi                              #84.5
        addq      %rsi, %rdi                                    #84.5
        movq      (%rsp,%rdi,8), %r8                            #84.5
        movq      %r8, (%r13,%rsi,8)                            #84.5
        addq      $2, %rsi                                      #84.5
        cmpq      %r14, %rsi                                    #84.5
        jb        ..B1.58       # Prob 94%                      #84.5
                                # LOE rcx rbx rsi r12 r13 r14 r15 xmm0
..B1.60:                        # Preds ..B1.58 ..B1.56
        movl      $.L_2__STRING.3, %edi                         #85.5
        xorl      %eax, %eax                                    #85.5
        movq      (%r13), %rsi                                  #85.5
        movq      136(%r13), %rdx                               #85.5
        movq      -8(%r13,%r14,8), %rcx                         #85.5
..___tag_value_main.34:                                         #85.5
        call      printf                                        #85.5
..___tag_value_main.35:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.61:                        # Preds ..B1.60
        xorl      %edx, %edx                                    #86.5
        xorl      %eax, %eax                                    #
        movq      (%r13), %rsi                                  #86.14
        movq      %rax, %rbx                                    #
        pxor      %xmm0, %xmm0                                  #
        movl      %edx, %r12d                                   #
        movq      %r14, %r15                                    #
        movq      %r13, %r14                                    #
        movq      %rsi, %r13                                    #
                                # LOE rbx r13 r14 r15 r12d
..B1.62:                        # Preds ..B1.65 ..B1.61
        btq       %r12, %r13                                    #86.5
        jnc       ..B1.64       # Prob 50%                      #86.5
                                # LOE rbx r13 r14 r15 r12d
..B1.63:                        # Preds ..B1.62
        movl      $.L_2__STRING.0, %edi                         #86.5
        xorl      %eax, %eax                                    #86.5
..___tag_value_main.36:                                         #86.5
        call      printf                                        #86.5
..___tag_value_main.37:                                         #
        jmp       ..B1.65       # Prob 100%                     #86.5
                                # LOE rbx r13 r14 r15 r12d
..B1.64:                        # Preds ..B1.62
        movl      $.L_2__STRING.1, %edi                         #86.5
        xorl      %eax, %eax                                    #86.5
..___tag_value_main.38:                                         #86.5
        call      printf                                        #86.5
..___tag_value_main.39:                                         #
                                # LOE rbx r13 r14 r15 r12d
..B1.65:                        # Preds ..B1.63 ..B1.64
        incq      %rbx                                          #86.5
        incl      %r12d                                         #86.5
        cmpq      $64, %rbx                                     #86.5
        jb        ..B1.62       # Prob 82%                      #86.5
                                # LOE rbx r13 r14 r15 r12d
..B1.66:                        # Preds ..B1.65
        movq      %r13, %rsi                                    #
        movl      $.L_2__STRING.2, %edi                         #86.5
        pxor      %xmm0, %xmm0                                  #
        xorl      %eax, %eax                                    #86.5
        movq      %r14, %r13                                    #
        movq      %r15, %r14                                    #
..___tag_value_main.40:                                         #86.5
        call      printf                                        #86.5
..___tag_value_main.41:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.67:                        # Preds ..B1.66
        xorl      %edx, %edx                                    #86.20
        xorl      %eax, %eax                                    #
        movq      %rax, %rbx                                    #
        movl      %edx, %r12d                                   #
        movq      136(%r13), %rsi                               #86.29
        movq      %r14, %r15                                    #
        pxor      %xmm0, %xmm0                                  #
        movq      %r13, %r14                                    #
        movq      %rsi, %r13                                    #
                                # LOE rbx r13 r14 r15 r12d
..B1.68:                        # Preds ..B1.71 ..B1.67
        btq       %r12, %r13                                    #86.20
        jnc       ..B1.70       # Prob 50%                      #86.20
                                # LOE rbx r13 r14 r15 r12d
..B1.69:                        # Preds ..B1.68
        movl      $.L_2__STRING.0, %edi                         #86.20
        xorl      %eax, %eax                                    #86.20
..___tag_value_main.42:                                         #86.20
        call      printf                                        #86.20
..___tag_value_main.43:                                         #
        jmp       ..B1.71       # Prob 100%                     #86.20
                                # LOE rbx r13 r14 r15 r12d
..B1.70:                        # Preds ..B1.68
        movl      $.L_2__STRING.1, %edi                         #86.20
        xorl      %eax, %eax                                    #86.20
..___tag_value_main.44:                                         #86.20
        call      printf                                        #86.20
..___tag_value_main.45:                                         #
                                # LOE rbx r13 r14 r15 r12d
..B1.71:                        # Preds ..B1.69 ..B1.70
        incq      %rbx                                          #86.20
        incl      %r12d                                         #86.20
        cmpq      $64, %rbx                                     #86.20
        jb        ..B1.68       # Prob 82%                      #86.20
                                # LOE rbx r13 r14 r15 r12d
..B1.72:                        # Preds ..B1.71
        movq      %r13, %rsi                                    #
        movl      $.L_2__STRING.2, %edi                         #86.20
        pxor      %xmm0, %xmm0                                  #
        xorl      %eax, %eax                                    #86.20
        movq      %r14, %r13                                    #
        movq      %r15, %r14                                    #
..___tag_value_main.46:                                         #86.20
        call      printf                                        #86.20
..___tag_value_main.47:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.73:                        # Preds ..B1.72
        xorl      %edx, %edx                                    #86.36
        xorl      %eax, %eax                                    #
        movq      %rax, %rbx                                    #
        movl      %edx, %r12d                                   #
        movq      -8(%r13,%r14,8), %rsi                         #86.45
        movq      %r14, %r15                                    #
        pxor      %xmm0, %xmm0                                  #
        movq      %r13, %r14                                    #
        movq      %rsi, %r13                                    #
                                # LOE rbx r13 r14 r15 r12d
..B1.74:                        # Preds ..B1.77 ..B1.73
        btq       %r12, %r13                                    #86.36
        jnc       ..B1.76       # Prob 50%                      #86.36
                                # LOE rbx r13 r14 r15 r12d
..B1.75:                        # Preds ..B1.74
        movl      $.L_2__STRING.0, %edi                         #86.36
        xorl      %eax, %eax                                    #86.36
..___tag_value_main.48:                                         #86.36
        call      printf                                        #86.36
..___tag_value_main.49:                                         #
        jmp       ..B1.77       # Prob 100%                     #86.36
                                # LOE rbx r13 r14 r15 r12d
..B1.76:                        # Preds ..B1.74
        movl      $.L_2__STRING.1, %edi                         #86.36
        xorl      %eax, %eax                                    #86.36
..___tag_value_main.50:                                         #86.36
        call      printf                                        #86.36
..___tag_value_main.51:                                         #
                                # LOE rbx r13 r14 r15 r12d
..B1.77:                        # Preds ..B1.75 ..B1.76
        incq      %rbx                                          #86.36
        incl      %r12d                                         #86.36
        cmpq      $64, %rbx                                     #86.36
        jb        ..B1.74       # Prob 82%                      #86.36
                                # LOE rbx r13 r14 r15 r12d
..B1.78:                        # Preds ..B1.77
        movq      %r13, %rsi                                    #
        movl      $.L_2__STRING.2, %edi                         #86.36
        pxor      %xmm0, %xmm0                                  #
        xorl      %eax, %eax                                    #86.36
        movq      %r14, %r13                                    #
        movq      %r15, %r14                                    #
..___tag_value_main.52:                                         #86.36
        call      printf                                        #86.36
..___tag_value_main.53:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.79:                        # Preds ..B1.78
        movq      j(%rip), %rsi                                 #88.15
        movl      $128, %eax                                    #88.5
        pxor      %xmm0, %xmm0                                  #
        movq      k(%rip), %r8                                  #88.18
        movaps    %xmm0, 128(%rsp)                              #88.5
                                # LOE rax rbx rsi r8 r12 r13 r14 r15 xmm0
..B1.118:                       # Preds ..B1.118 ..B1.79
        movaps    %xmm0, -16(%rsp,%rax)                         #88.5
        movaps    %xmm0, -32(%rsp,%rax)                         #88.5
        movaps    %xmm0, -48(%rsp,%rax)                         #88.5
        movaps    %xmm0, -64(%rsp,%rax)                         #88.5
        subq      $64, %rax                                     #88.5
        jne       ..B1.118      # Prob 50%                      #88.5
                                # LOE rax rbx rsi r8 r12 r13 r14 r15 xmm0
..B1.80:                        # Preds ..B1.118
        cmpq      $1152, %r8                                    #88.5
        jae       ..B1.84       # Prob 50%                      #88.5
                                # LOE rbx rsi r8 r12 r13 r14 r15
..B1.81:                        # Preds ..B1.80
        movq      %r8, %rax                                     #
        movq      $0xf0f0f0f0f0f0f0f1, %rcx                     #
        negq      %rax                                          #
        xorl      %edi, %edi                                    #88.5
        addq      $1185, %rax                                   #
        mulq      %rcx                                          #
        shrq      $5, %rdx                                      #
        xorl      %eax, %eax                                    #
        .align    16,0x90
                                # LOE rax rdx rbx rsi rdi r8 r12 r13 r14 r15
..B1.82:                        # Preds ..B1.82 ..B1.81
        movl      $1, %r9d                                      #88.5
        lea       (%rsi,%rax), %r10                             #88.5
        movl      %r10d, %ecx                                   #88.5
        movl      $1, %r11d                                     #88.5
        shrq      $6, %r10                                      #88.5
        incq      %rdi                                          #88.5
        shlq      %cl, %r9                                      #88.5
        orq       %r9, (%r13,%r10,8)                            #88.5
        orq       %r9, (%rsp,%r10,8)                            #88.5
        lea       (%r8,%rax), %r9                               #88.5
        movl      %r9d, %ecx                                    #88.5
        addq      $34, %rax                                     #88.5
        shrq      $6, %r9                                       #88.5
        shlq      %cl, %r11                                     #88.5
        orq       %r11, (%r13,%r9,8)                            #88.5
        orq       %r11, (%rsp,%r9,8)                            #88.5
        cmpq      %rdx, %rdi                                    #88.5
        jb        ..B1.82       # Prob 94%                      #88.5
                                # LOE rax rdx rbx rsi rdi r8 r12 r13 r14 r15
..B1.83:                        # Preds ..B1.82
        movq      %rdi, %rax                                    #88.5
        shlq      $5, %rax                                      #88.5
        lea       (%rax,%rdi,2), %rdx                           #88.5
        addq      %rdx, %rsi                                    #88.5
                                # LOE rbx rsi r12 r13 r14 r15
..B1.84:                        # Preds ..B1.83 ..B1.80
        cmpq      $1152, %rsi                                   #88.5
        jae       ..B1.86       # Prob 50%                      #88.5
                                # LOE rbx rsi r12 r13 r14 r15
..B1.85:                        # Preds ..B1.84
        movq      %rsi, %rdx                                    #88.5
        movl      %esi, %ecx                                    #88.5
        shrq      $6, %rdx                                      #88.5
        movl      $1, %eax                                      #88.5
        shlq      %cl, %rax                                     #88.5
        orq       %rax, (%r13,%rdx,8)                           #88.5
        orq       %rax, (%rsp,%rdx,8)                           #88.5
                                # LOE rbx r12 r13 r14 r15
..B1.86:                        # Preds ..B1.84 ..B1.85
        movq      136(%rsp), %rax                               #88.5
        movl      $17, %esi                                     #88.5
        movq      %rax, (%rsp)                                  #88.5
        cmpq      $17, %r14                                     #88.5
        jbe       ..B1.90       # Prob 10%                      #88.5
                                # LOE rbx rsi r12 r13 r14 r15
..B1.87:                        # Preds ..B1.86
        movq      $0xf0f0f0f0f0f0f0f1, %rcx                     #
                                # LOE rcx rbx rsi r12 r13 r14 r15
..B1.88:                        # Preds ..B1.88 ..B1.87
        movq      %rsi, %rax                                    #88.5
        mulq      %rcx                                          #88.5
        shrq      $4, %rdx                                      #88.5
        movq      %rdx, %rdi                                    #88.5
        shlq      $4, %rdi                                      #88.5
        addq      %rdx, %rdi                                    #88.5
        negq      %rdi                                          #88.5
        addq      %rsi, %rdi                                    #88.5
        movq      (%rsp,%rdi,8), %r8                            #88.5
        movq      %r8, (%r13,%rsi,8)                            #88.5
        addq      $2, %rsi                                      #88.5
        cmpq      %r14, %rsi                                    #88.5
        jb        ..B1.88       # Prob 94%                      #88.5
                                # LOE rcx rbx rsi r12 r13 r14 r15
..B1.90:                        # Preds ..B1.88 ..B1.86
        movl      $.L_2__STRING.3, %edi                         #89.5
        xorl      %eax, %eax                                    #89.5
        movq      (%r13), %rsi                                  #89.5
        movq      136(%r13), %rdx                               #89.5
        movq      -8(%r13,%r14,8), %rcx                         #89.5
..___tag_value_main.54:                                         #89.5
        call      printf                                        #89.5
..___tag_value_main.55:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.91:                        # Preds ..B1.90
        xorl      %edx, %edx                                    #90.5
        xorl      %eax, %eax                                    #
        movq      (%r13), %rsi                                  #90.14
        movq      %rax, %rbx                                    #
        movl      %edx, %r12d                                   #
        movq      %r14, %r15                                    #
        movq      %r13, %r14                                    #
        movq      %rsi, %r13                                    #
                                # LOE rbx r13 r14 r15 r12d
..B1.92:                        # Preds ..B1.95 ..B1.91
        btq       %r12, %r13                                    #90.5
        jnc       ..B1.94       # Prob 50%                      #90.5
                                # LOE rbx r13 r14 r15 r12d
..B1.93:                        # Preds ..B1.92
        movl      $.L_2__STRING.0, %edi                         #90.5
        xorl      %eax, %eax                                    #90.5
..___tag_value_main.56:                                         #90.5
        call      printf                                        #90.5
..___tag_value_main.57:                                         #
        jmp       ..B1.95       # Prob 100%                     #90.5
                                # LOE rbx r13 r14 r15 r12d
..B1.94:                        # Preds ..B1.92
        movl      $.L_2__STRING.1, %edi                         #90.5
        xorl      %eax, %eax                                    #90.5
..___tag_value_main.58:                                         #90.5
        call      printf                                        #90.5
..___tag_value_main.59:                                         #
                                # LOE rbx r13 r14 r15 r12d
..B1.95:                        # Preds ..B1.93 ..B1.94
        incq      %rbx                                          #90.5
        incl      %r12d                                         #90.5
        cmpq      $64, %rbx                                     #90.5
        jb        ..B1.92       # Prob 82%                      #90.5
                                # LOE rbx r13 r14 r15 r12d
..B1.96:                        # Preds ..B1.95
        movq      %r13, %rsi                                    #
        movl      $.L_2__STRING.2, %edi                         #90.5
        xorl      %eax, %eax                                    #90.5
        movq      %r14, %r13                                    #
        movq      %r15, %r14                                    #
..___tag_value_main.60:                                         #90.5
        call      printf                                        #90.5
..___tag_value_main.61:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.97:                        # Preds ..B1.96
        xorl      %edx, %edx                                    #90.20
        xorl      %eax, %eax                                    #
        movq      136(%r13), %rsi                               #90.29
        movq      %rax, %rbx                                    #
        movl      %edx, %r12d                                   #
        movq      %r14, %r15                                    #
        movq      %r13, %r14                                    #
        movq      %rsi, %r13                                    #
                                # LOE rbx r13 r14 r15 r12d
..B1.98:                        # Preds ..B1.101 ..B1.97
        btq       %r12, %r13                                    #90.20
        jnc       ..B1.100      # Prob 50%                      #90.20
                                # LOE rbx r13 r14 r15 r12d
..B1.99:                        # Preds ..B1.98
        movl      $.L_2__STRING.0, %edi                         #90.20
        xorl      %eax, %eax                                    #90.20
..___tag_value_main.62:                                         #90.20
        call      printf                                        #90.20
..___tag_value_main.63:                                         #
        jmp       ..B1.101      # Prob 100%                     #90.20
                                # LOE rbx r13 r14 r15 r12d
..B1.100:                       # Preds ..B1.98
        movl      $.L_2__STRING.1, %edi                         #90.20
        xorl      %eax, %eax                                    #90.20
..___tag_value_main.64:                                         #90.20
        call      printf                                        #90.20
..___tag_value_main.65:                                         #
                                # LOE rbx r13 r14 r15 r12d
..B1.101:                       # Preds ..B1.99 ..B1.100
        incq      %rbx                                          #90.20
        incl      %r12d                                         #90.20
        cmpq      $64, %rbx                                     #90.20
        jb        ..B1.98       # Prob 82%                      #90.20
                                # LOE rbx r13 r14 r15 r12d
..B1.102:                       # Preds ..B1.101
        movq      %r13, %rsi                                    #
        movl      $.L_2__STRING.2, %edi                         #90.20
        xorl      %eax, %eax                                    #90.20
        movq      %r14, %r13                                    #
        movq      %r15, %r14                                    #
..___tag_value_main.66:                                         #90.20
        call      printf                                        #90.20
..___tag_value_main.67:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.103:                       # Preds ..B1.102
        xorl      %edx, %edx                                    #90.36
        xorl      %eax, %eax                                    #
        movq      %rax, %r12                                    #
        movl      %edx, %r15d                                   #
        movq      -8(%r13,%r14,8), %r14                         #90.45
                                # LOE rbx r12 r13 r14 r15d
..B1.104:                       # Preds ..B1.107 ..B1.103
        btq       %r15, %r14                                    #90.36
        jnc       ..B1.106      # Prob 50%                      #90.36
                                # LOE rbx r12 r13 r14 r15d
..B1.105:                       # Preds ..B1.104
        movl      $.L_2__STRING.0, %edi                         #90.36
        xorl      %eax, %eax                                    #90.36
..___tag_value_main.68:                                         #90.36
        call      printf                                        #90.36
..___tag_value_main.69:                                         #
        jmp       ..B1.107      # Prob 100%                     #90.36
                                # LOE rbx r12 r13 r14 r15d
..B1.106:                       # Preds ..B1.104
        movl      $.L_2__STRING.1, %edi                         #90.36
        xorl      %eax, %eax                                    #90.36
..___tag_value_main.70:                                         #90.36
        call      printf                                        #90.36
..___tag_value_main.71:                                         #
                                # LOE rbx r12 r13 r14 r15d
..B1.107:                       # Preds ..B1.105 ..B1.106
        incq      %r12                                          #90.36
        incl      %r15d                                         #90.36
        cmpq      $64, %r12                                     #90.36
        jb        ..B1.104      # Prob 82%                      #90.36
                                # LOE rbx r12 r13 r14 r15d
..B1.108:                       # Preds ..B1.107
        movl      $.L_2__STRING.2, %edi                         #90.36
        movq      %r14, %rsi                                    #90.36
        xorl      %eax, %eax                                    #90.36
..___tag_value_main.72:                                         #90.36
        call      printf                                        #90.36
..___tag_value_main.73:                                         #
                                # LOE rbx r12 r13 r15
..B1.109:                       # Preds ..B1.108
        movq      %r13, %rdi                                    #93.5
        call      free                                          #93.5
                                # LOE rbx r12 r15
..B1.110:                       # Preds ..B1.109
        xorl      %eax, %eax                                    #94.12
        addq      $216, %rsp                                    #94.12
..___tag_value_main.74:                                         #94.12
        popq      %rbx                                          #94.12
..___tag_value_main.75:                                         #94.12
        popq      %r15                                          #94.12
..___tag_value_main.76:                                         #94.12
        popq      %r14                                          #94.12
..___tag_value_main.77:                                         #94.12
        popq      %r13                                          #94.12
..___tag_value_main.78:                                         #94.12
        popq      %r12                                          #94.12
        movq      %rbp, %rsp                                    #94.12
        popq      %rbp                                          #94.12
..___tag_value_main.79:                                         #
        ret                                                     #94.12
        .align    16,0x90
..___tag_value_main.81:                                         #
                                # LOE
# mark_end;
	.type	main,@function
	.size	main,.-main
	.data
# -- End  main
	.text
# -- Begin  doWork
# mark_begin;
       .align    16,0x90
	.globl doWork
doWork:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
..B2.1:                         # Preds ..B2.0
..___tag_value_doWork.82:                                       #30.47
        subq      $152, %rsp                                    #30.47
..___tag_value_doWork.84:                                       #
        movq      %rcx, %r9                                     #30.47
        pxor      %xmm0, %xmm0                                  #34.19
        movl      $128, %eax                                    #34.19
        movaps    %xmm0, 128(%rsp)                              #34.19
                                # LOE rax rdx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 xmm0
..B2.15:                        # Preds ..B2.15 ..B2.1
        movaps    %xmm0, -16(%rsp,%rax)                         #34.19
        movaps    %xmm0, -32(%rsp,%rax)                         #34.19
        movaps    %xmm0, -48(%rsp,%rax)                         #34.19
        movaps    %xmm0, -64(%rsp,%rax)                         #34.19
        subq      $64, %rax                                     #34.19
        jne       ..B2.15       # Prob 50%                      #34.19
                                # LOE rax rdx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 xmm0
..B2.2:                         # Preds ..B2.15
        movq      %r8, %r11                                     #38.21
        shlq      $6, %r11                                      #38.21
        addq      $64, %r11                                     #38.21
        cmpq      %r11, %rdx                                    #38.21
        jae       ..B2.6        # Prob 10%                      #38.21
                                # LOE rdx rbx rbp rsi rdi r8 r9 r11 r12 r13 r14 r15
..B2.4:                         # Preds ..B2.2 ..B2.4
        movq      %rsi, %r10                                    #39.15
        movl      %esi, %ecx                                    #39.37
        shrq      $6, %r10                                      #39.15
        movl      $1, %eax                                      #39.37
        shlq      %cl, %rax                                     #39.37
        lea       (%rsi,%r8,2), %rsi                            #41.9
        orq       %rax, (%rdi,%r10,8)                           #39.9
        orq       %rax, (%rsp,%r10,8)                           #40.9
        movq      %rdx, %rax                                    #42.15
        shrq      $6, %rax                                      #42.15
        movl      %edx, %ecx                                    #42.37
        movl      $1, %r10d                                     #42.37
        lea       (%rdx,%r8,2), %rdx                            #44.9
        shlq      %cl, %r10                                     #42.37
        orq       %r10, (%rdi,%rax,8)                           #42.9
        orq       %r10, (%rsp,%rax,8)                           #43.9
        cmpq      %r11, %rdx                                    #38.21
        jb        ..B2.4        # Prob 94%                      #38.21
                                # LOE rdx rbx rbp rsi rdi r8 r9 r11 r12 r13 r14 r15
..B2.6:                         # Preds ..B2.4 ..B2.2
        cmpq      %r11, %rsi                                    #46.18
        jae       ..B2.8        # Prob 50%                      #46.18
                                # LOE rbx rbp rsi rdi r8 r9 r12 r13 r14 r15
..B2.7:                         # Preds ..B2.6
        movq      %rsi, %rdx                                    #48.15
        movl      %esi, %ecx                                    #48.37
        shrq      $6, %rdx                                      #48.15
        movl      $1, %eax                                      #48.37
        shlq      %cl, %rax                                     #48.37
        orq       %rax, (%rdi,%rdx,8)                           #48.9
        orq       %rax, (%rsp,%rdx,8)                           #49.9
                                # LOE rbx rbp rdi r8 r9 r12 r13 r14 r15
..B2.8:                         # Preds ..B2.6 ..B2.7
        shrq      $7, %r9                                       #53.30
        movq      %r8, %rsi                                     #53.9
        movq      (%rsp,%r8,8), %rax                            #52.17
        cmpq      %r9, %r8                                      #53.30
        jae       ..B2.12       # Prob 10%                      #53.30
                                # LOE rax rbx rbp rsi rdi r8 r9 r12 r13 r14 r15
..B2.9:                         # Preds ..B2.8
        movq      %rax, (%rsp)                                  #52.5
                                # LOE rbx rbp rsi rdi r8 r9 r12 r13 r14 r15
..B2.10:                        # Preds ..B2.10 ..B2.9
        movq      %rsi, %rax                                    #55.29
        xorl      %edx, %edx                                    #55.29
        divq      %r8                                           #55.29
        movq      (%rsp,%rdx,8), %r10                           #55.18
        movq      %r10, (%rdi,%rsi,8)                           #55.9
        addq      $2, %rsi                                      #56.9
        cmpq      %r9, %rsi                                     #53.30
        jb        ..B2.10       # Prob 94%                      #53.30
                                # LOE rbx rbp rsi rdi r8 r9 r12 r13 r14 r15
..B2.12:                        # Preds ..B2.10 ..B2.8
        addq      $152, %rsp                                    #59.1
..___tag_value_doWork.85:                                       #
        ret                                                     #59.1
        .align    16,0x90
..___tag_value_doWork.86:                                       #
                                # LOE
# mark_end;
	.type	doWork,@function
	.size	doWork,.-doWork
	.data
# -- End  doWork
	.text
# -- Begin  dumpBits
# mark_begin;
       .align    16,0x90
	.globl dumpBits
dumpBits:
# parameter 1: %rdi
..B3.1:                         # Preds ..B3.0
..___tag_value_dumpBits.87:                                     #17.20
        pushq     %r12                                          #17.20
..___tag_value_dumpBits.89:                                     #
        pushq     %r13                                          #17.20
..___tag_value_dumpBits.91:                                     #
        pushq     %r14                                          #17.20
..___tag_value_dumpBits.93:                                     #
        movq      %rdi, %rsi                                    #17.20
        xorl      %edx, %edx                                    #19.10
        xorl      %eax, %eax                                    #
        movq      %rax, %r12                                    #
        movl      %edx, %r13d                                   #
        movq      %rsi, %r14                                    #
                                # LOE rbx rbp r12 r14 r15 r13d
..B3.2:                         # Preds ..B3.5 ..B3.1
        btq       %r13, %r14                                    #20.24
        jnc       ..B3.4        # Prob 50%                      #20.24
                                # LOE rbx rbp r12 r14 r15 r13d
..B3.3:                         # Preds ..B3.2
        movl      $.L_2__STRING.0, %edi                         #21.13
        xorl      %eax, %eax                                    #21.13
..___tag_value_dumpBits.95:                                     #21.13
        call      printf                                        #21.13
..___tag_value_dumpBits.96:                                     #
        jmp       ..B3.5        # Prob 100%                     #21.13
                                # LOE rbx rbp r12 r14 r15 r13d
..B3.4:                         # Preds ..B3.2
        movl      $.L_2__STRING.1, %edi                         #24.13
        xorl      %eax, %eax                                    #24.13
..___tag_value_dumpBits.97:                                     #24.13
        call      printf                                        #24.13
..___tag_value_dumpBits.98:                                     #
                                # LOE rbx rbp r12 r14 r15 r13d
..B3.5:                         # Preds ..B3.3 ..B3.4
        incq      %r12                                          #19.27
        incl      %r13d                                         #19.27
        cmpq      $64, %r12                                     #19.21
        jb        ..B3.2        # Prob 82%                      #19.21
                                # LOE rbx rbp r12 r14 r15 r13d
..B3.6:                         # Preds ..B3.5
        movq      %r14, %rsi                                    #
        movl      $.L_2__STRING.2, %edi                         #27.5
        xorl      %eax, %eax                                    #27.5
..___tag_value_dumpBits.99:                                     #27.5
        popq      %r14                                          #27.5
..___tag_value_dumpBits.100:                                    #
        popq      %r13                                          #27.5
..___tag_value_dumpBits.102:                                    #
        popq      %r12                                          #27.5
..___tag_value_dumpBits.104:                                    #
        jmp       printf                                        #27.5
        .align    16,0x90
..___tag_value_dumpBits.105:                                    #
                                # LOE
# mark_end;
	.type	dumpBits,@function
	.size	dumpBits,.-dumpBits
	.data
# -- End  dumpBits
	.data
	.align 8
	.align 8
	.globl max
max:
	.long	0x04c4b400,0x00000000
	.type	max,@object
	.size	max,8
	.section .rodata, "a"
	.align 16
	.align 16
.L_2il0floatpacket.71:
	.long	0x00000000,0x00000000,0x00000000,0x43f00000
	.type	.L_2il0floatpacket.71,@object
	.size	.L_2il0floatpacket.71,16
	.align 8
.L_2il0floatpacket.68:
	.long	0x26e978d5,0x3fee0831
	.type	.L_2il0floatpacket.68,@object
	.size	.L_2il0floatpacket.68,8
	.align 8
.L_2il0floatpacket.70:
	.long	0x00000000,0x43e00000
	.type	.L_2il0floatpacket.70,@object
	.size	.L_2il0floatpacket.70,8
	.align 4
.L_2il0floatpacket.69:
	.long	0x5f000000
	.type	.L_2il0floatpacket.69,@object
	.size	.L_2il0floatpacket.69,4
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.3:
	.byte	10
	.byte	37
	.byte	108
	.byte	108
	.byte	117
	.byte	32
	.byte	37
	.byte	108
	.byte	108
	.byte	117
	.byte	32
	.byte	37
	.byte	108
	.byte	108
	.byte	117
	.byte	32
	.byte	10
	.byte	0
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,18
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.byte	48
	.byte	32
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,3
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.0:
	.byte	49
	.byte	32
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,3
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.byte	9
	.byte	32
	.byte	37
	.byte	108
	.byte	108
	.byte	117
	.byte	32
	.byte	10
	.byte	0
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,9
	.data
	.comm p,4,4
	.comm j,8,8
	.comm k,8,8
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
	.4byte 0x00000014
	.8byte 0x7801000100000000
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x000000ac
	.4byte 0x0000001c
	.8byte ..___tag_value_main.1
	.8byte ..___tag_value_main.81-..___tag_value_main.1
	.byte 0x04
	.4byte ..___tag_value_main.3-..___tag_value_main.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.7-..___tag_value_main.4
	.8byte 0xff800d1c380e0310
	.8byte 0xffffffd80d1affff
	.8byte 0x800d1c380e0c1022
	.8byte 0xfffff80d1affffff
	.8byte 0x0d1c380e0d1022ff
	.8byte 0xfff00d1affffff80
	.8byte 0x1c380e0e1022ffff
	.8byte 0xe80d1affffff800d
	.8byte 0x380e0f1022ffffff
	.8byte 0x0d1affffff800d1c
	.4byte 0xffffffe0
	.2byte 0x0422
	.4byte ..___tag_value_main.74-..___tag_value_main.7
	.2byte 0x04c3
	.4byte ..___tag_value_main.75-..___tag_value_main.74
	.2byte 0x04cf
	.4byte ..___tag_value_main.76-..___tag_value_main.75
	.2byte 0x04ce
	.4byte ..___tag_value_main.77-..___tag_value_main.76
	.2byte 0x04cd
	.4byte ..___tag_value_main.78-..___tag_value_main.77
	.2byte 0x04cc
	.4byte ..___tag_value_main.79-..___tag_value_main.78
	.8byte 0x00000000c608070c
	.2byte 0x0000
	.4byte 0x00000024
	.4byte 0x000000cc
	.8byte ..___tag_value_doWork.82
	.8byte ..___tag_value_doWork.86-..___tag_value_doWork.82
	.byte 0x04
	.4byte ..___tag_value_doWork.84-..___tag_value_doWork.82
	.4byte 0x0401a00e
	.4byte ..___tag_value_doWork.85-..___tag_value_doWork.84
	.2byte 0x080e
	.byte 0x00
	.4byte 0x0000004c
	.4byte 0x000000f4
	.8byte ..___tag_value_dumpBits.87
	.8byte ..___tag_value_dumpBits.105-..___tag_value_dumpBits.87
	.byte 0x04
	.4byte ..___tag_value_dumpBits.89-..___tag_value_dumpBits.87
	.4byte 0x028c100e
	.byte 0x04
	.4byte ..___tag_value_dumpBits.91-..___tag_value_dumpBits.89
	.4byte 0x038d180e
	.byte 0x04
	.4byte ..___tag_value_dumpBits.93-..___tag_value_dumpBits.91
	.4byte 0x048e200e
	.byte 0x04
	.4byte ..___tag_value_dumpBits.99-..___tag_value_dumpBits.93
	.2byte 0x04ce
	.4byte ..___tag_value_dumpBits.100-..___tag_value_dumpBits.99
	.4byte 0x04cd180e
	.4byte ..___tag_value_dumpBits.102-..___tag_value_dumpBits.100
	.4byte 0x04cc100e
	.4byte ..___tag_value_dumpBits.104-..___tag_value_dumpBits.102
	.2byte 0x080e
# End
