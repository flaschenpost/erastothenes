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
..___tag_value_main.1:                                          #65.11
        pushq     %rbp                                          #65.11
..___tag_value_main.3:                                          #
        movq      %rsp, %rbp                                    #65.11
..___tag_value_main.4:                                          #
        andq      $-128, %rsp                                   #65.11
        pushq     %r12                                          #65.11
        pushq     %r13                                          #65.11
        pushq     %r14                                          #65.11
        pushq     %r15                                          #65.11
        pushq     %rbx                                          #65.11
        subq      $216, %rsp                                    #65.11
        movl      $3, %edi                                      #65.11
..___tag_value_main.6:                                          #65.11
        call      __intel_new_proc_init_T                       #65.11
..___tag_value_main.7:                                          #
                                # LOE
..B1.82:                        # Preds ..B1.1
        fildq     max(%rip)                                     #66.26
        stmxcsr   16(%rsp)                                      #65.11
        movq      max(%rip), %rax                               #66.26
        shrq      $63, %rax                                     #66.26
        orl       $32832, 16(%rsp)                              #65.11
        ldmxcsr   16(%rsp)                                      #65.11
        faddl     .L_2il0floatpacket.59(,%rax,8)                #66.26
        fstpl     8(%rsp)                                       #66.22
        movsd     8(%rsp), %xmm0                                #66.22
        movsd     %xmm0, (%rsp)                                 #66.22
        call      log                                           #66.22
                                # LOE xmm0
..B1.81:                        # Preds ..B1.82
        movaps    %xmm0, %xmm3                                  #66.22
        movsd     %xmm3, 8(%rsp)                                #66.40
        call      log                                           #66.40
                                # LOE xmm0
..B1.80:                        # Preds ..B1.81
        movsd     8(%rsp), %xmm3                                #
        movl      $8, %esi                                      #67.13
        movsd     .L_2il0floatpacket.58(%rip), %xmm2            #66.56
        movaps    %xmm2, %xmm1                                  #66.56
        subsd     .L_2il0floatpacket.56(%rip), %xmm0            #66.56
        addsd     %xmm0, %xmm3                                  #66.56
        mulsd     (%rsp), %xmm3                                 #66.56
        movaps    %xmm3, %xmm4                                  #66.56
        cmplesd   %xmm3, %xmm1                                  #66.56
        subsd     %xmm2, %xmm4                                  #66.56
        movd      %xmm1, %eax                                   #66.56
        andl      $-2147483648, %eax                            #66.56
        jne       ..L13         # Prob 50%                      #66.56
        movaps    %xmm3, %xmm4                                  #66.56
..L13:                                                          #
        cvttsd2si %xmm4, %r12                                   #66.56
        shlq      $32, %rax                                     #66.56
        addq      %rax, %r12                                    #66.56
        shrq      $7, %r12                                      #67.27
        lea       3(%r12), %rdi                                 #67.13
        call      calloc                                        #67.13
                                # LOE rax r12
..B1.79:                        # Preds ..B1.80
        movq      %rax, %rbx                                    #67.13
                                # LOE rbx r12
..B1.2:                         # Preds ..B1.79
        movl      $5, p(%rip)                                   #70.5
        movl      $7, %r14d                                     #74.5
        movq      $7, j(%rip)                                   #71.5
        pxor      %xmm0, %xmm0                                  #74.5
        movq      $10, k(%rip)                                  #72.5
        movl      $10, %r15d                                    #74.5
        movaps    %xmm0, 160(%rsp)                              #74.5
        movl      $160, %eax                                    #74.5
                                # LOE rax rbx r12 r14 r15
..B1.74:                        # Preds ..B1.74 ..B1.2
        pxor      %xmm0, %xmm0                                  #74.5
        movaps    %xmm0, -16(%rsp,%rax)                         #74.5
        movaps    %xmm0, -32(%rsp,%rax)                         #74.5
        movaps    %xmm0, -48(%rsp,%rax)                         #74.5
        movaps    %xmm0, -64(%rsp,%rax)                         #74.5
        movaps    %xmm0, -80(%rsp,%rax)                         #74.5
        subq      $80, %rax                                     #74.5
        jne       ..B1.74       # Prob 50%                      #74.5
                                # LOE rax rbx r12 r14 r15
..B1.3:                         # Preds ..B1.74
# Begin ASM
# prepare patterns
        .align    16,0x90
# End ASM
                                # LOE rbx r12 r14 r15
..B1.4:                         # Preds ..B1.4 ..B1.3
        movq      %r14, %rdx                                    #74.5
        movq      %r15, %rdi                                    #74.5
        shrq      $6, %rdx                                      #74.5
        movl      %r14d, %ecx                                   #74.5
        shrq      $6, %rdi                                      #74.5
        movl      $1, %eax                                      #74.5
        shlq      %cl, %rax                                     #74.5
        movl      %r15d, %ecx                                   #74.5
        movl      $1, %esi                                      #74.5
        addq      $10, %r15                                     #74.5
        orq       %rax, (%rbx,%rdx,8)                           #74.5
        addq      $10, %r14                                     #74.5
        orq       %rax, (%rsp,%rdx,8)                           #74.5
        shlq      %cl, %rsi                                     #74.5
        orq       %rsi, (%rbx,%rdi,8)                           #74.5
        orq       %rsi, (%rsp,%rdi,8)                           #74.5
        cmpq      $384, %r15                                    #74.5
        jb        ..B1.4        # Prob 95%                      #74.5
                                # LOE rbx r12 r14 r15
..B1.5:                         # Preds ..B1.4
        cmpq      $384, %r14                                    #74.5
        jae       ..B1.7        # Prob 50%                      #74.5
                                # LOE rbx r12 r14
..B1.6:                         # Preds ..B1.5
        movq      %r14, %rdx                                    #74.5
        movl      %r14d, %ecx                                   #74.5
        shrq      $6, %rdx                                      #74.5
        movl      $1, %eax                                      #74.5
        shlq      %cl, %rax                                     #74.5
        orq       %rax, (%rbx,%rdx,8)                           #74.5
        orq       %rax, (%rsp,%rdx,8)                           #74.5
                                # LOE rbx r12
..B1.7:                         # Preds ..B1.5 ..B1.6
        movq      40(%rsp), %rax                                #74.5
        movq      %rax, (%rsp)                                  #74.5
                                # LOE rbx r12
..B1.84:                        # Preds ..B1.7
# Begin ASM
# main loop
# End ASM
                                # LOE rbx r12
..B1.83:                        # Preds ..B1.84
        movl      $5, %esi                                      #74.5
        cmpq      $5, %r12                                      #74.5
        jbe       ..B1.11       # Prob 10%                      #74.5
                                # LOE rbx rsi r12
..B1.8:                         # Preds ..B1.83
        movq      $0xcccccccccccccccd, %rcx                     #74.5
                                # LOE rcx rbx rsi r12
..B1.9:                         # Preds ..B1.9 ..B1.8
        movq      %rsi, %rax                                    #74.5
        mulq      %rcx                                          #74.5
        shrq      $2, %rdx                                      #74.5
        lea       (%rdx,%rdx,4), %rdi                           #74.5
        negq      %rdi                                          #74.5
        addq      %rsi, %rdi                                    #74.5
        movq      (%rsp,%rdi,8), %r8                            #74.5
        orq       %r8, (%rbx,%rsi,8)                            #74.5
        addq      $2, %rsi                                      #74.5
        cmpq      %r12, %rsi                                    #74.5
        jb        ..B1.9        # Prob 95%                      #74.5
                                # LOE rcx rbx rsi r12
..B1.11:                        # Preds ..B1.9 ..B1.83
# Begin ASM
# end of main loop
# End ASM
                                # LOE rbx r12
..B1.85:                        # Preds ..B1.11
        movq      k(%rip), %r15                                 #78.5
        movl      $15, %r13d                                    #80.5
        movl      $7, p(%rip)                                   #76.5
        pxor      %xmm0, %xmm0                                  #80.5
        movq      $15, j(%rip)                                  #77.5
        movl      $160, %eax                                    #80.5
        lea       14(%r15), %r14                                #78.5
        movq      %r14, k(%rip)                                 #78.5
        movaps    %xmm0, 160(%rsp)                              #80.5
                                # LOE rax rbx r12 r13 r14 r15
..B1.75:                        # Preds ..B1.75 ..B1.85
        pxor      %xmm0, %xmm0                                  #80.5
        movaps    %xmm0, -16(%rsp,%rax)                         #80.5
        movaps    %xmm0, -32(%rsp,%rax)                         #80.5
        movaps    %xmm0, -48(%rsp,%rax)                         #80.5
        movaps    %xmm0, -64(%rsp,%rax)                         #80.5
        movaps    %xmm0, -80(%rsp,%rax)                         #80.5
        subq      $80, %rax                                     #80.5
        jne       ..B1.75       # Prob 50%                      #80.5
                                # LOE rax rbx r12 r13 r14 r15
..B1.12:                        # Preds ..B1.75
# Begin ASM
# prepare patterns
# End ASM
                                # LOE rbx r12 r13 r14 r15
..B1.86:                        # Preds ..B1.12
        cmpq      $512, %r14                                    #80.5
        jae       ..B1.16       # Prob 50%                      #80.5
                                # LOE rbx r12 r13 r14 r15
..B1.13:                        # Preds ..B1.86
        negq      %r14                                          #
        movq      $0x2492492492492493, %rcx                     #
        addq      $525, %r14                                    #
        xorl      %edi, %edi                                    #80.5
        movq      %r14, %rax                                    #
        mulq      %rcx                                          #
        movq      %r14, %rax                                    #
        movq      %rdx, %rsi                                    #
        mulq      %rcx                                          #
        subq      %rdx, %r14                                    #
        xorl      %eax, %eax                                    #
        shrq      $1, %r14                                      #
        addq      %r14, %rsi                                    #
        shrq      $3, %rsi                                      #
        .align    16,0x90
                                # LOE rax rbx rsi rdi r12 r15
..B1.14:                        # Preds ..B1.14 ..B1.13
        movl      $1, %r8d                                      #80.5
        lea       15(%rax), %r9                                 #80.5
        movl      %r9d, %ecx                                    #80.5
        lea       14(%rax,%r15), %r11                           #80.5
        shrq      $6, %r9                                       #80.5
        movl      $1, %r10d                                     #80.5
        shlq      %cl, %r8                                      #80.5
        movl      %r11d, %ecx                                   #80.5
        shrq      $6, %r11                                      #80.5
        incq      %rdi                                          #80.5
        shlq      %cl, %r10                                     #80.5
        addq      $14, %rax                                     #80.5
        orq       %r8, (%rbx,%r9,8)                             #80.5
        orq       %r8, (%rsp,%r9,8)                             #80.5
        orq       %r10, (%rbx,%r11,8)                           #80.5
        orq       %r10, (%rsp,%r11,8)                           #80.5
        cmpq      %rsi, %rdi                                    #80.5
        jb        ..B1.14       # Prob 95%                      #80.5
                                # LOE rax rbx rsi rdi r12 r15
..B1.15:                        # Preds ..B1.14
        movq      %rdi, %r13                                    #80.5
        shlq      $4, %r13                                      #80.5
        subq      %rdi, %r13                                    #80.5
        subq      %rdi, %r13                                    #80.5
        addq      $15, %r13                                     #80.5
        cmpq      $512, %r13                                    #80.5
        jae       ..B1.17       # Prob 50%                      #80.5
                                # LOE rbx r12 r13
..B1.16:                        # Preds ..B1.86 ..B1.15
        movq      %r13, %rdx                                    #80.5
        movl      %r13d, %ecx                                   #80.5
        shrq      $6, %rdx                                      #80.5
        movl      $1, %eax                                      #80.5
        shlq      %cl, %rax                                     #80.5
        orq       %rax, (%rbx,%rdx,8)                           #80.5
        orq       %rax, (%rsp,%rdx,8)                           #80.5
                                # LOE rbx r12
..B1.17:                        # Preds ..B1.15 ..B1.16
        movq      56(%rsp), %rax                                #80.5
        movq      %rax, (%rsp)                                  #80.5
                                # LOE rbx r12
..B1.88:                        # Preds ..B1.17
# Begin ASM
# main loop
# End ASM
                                # LOE rbx r12
..B1.87:                        # Preds ..B1.88
        movl      $7, %esi                                      #80.5
        cmpq      $7, %r12                                      #80.5
        jbe       ..B1.21       # Prob 10%                      #80.5
                                # LOE rbx rsi r12
..B1.18:                        # Preds ..B1.87
        movq      $0x2492492492492493, %rcx                     #
                                # LOE rcx rbx rsi r12
..B1.19:                        # Preds ..B1.19 ..B1.18
        movq      %rsi, %rax                                    #80.5
        mulq      %rcx                                          #80.5
        movq      %rsi, %rax                                    #80.5
        movq      %rdx, %r8                                     #80.5
        mulq      %rcx                                          #80.5
        negq      %rdx                                          #80.5
        addq      %rsi, %rdx                                    #80.5
        shrq      $1, %rdx                                      #80.5
        addq      %rdx, %r8                                     #80.5
        shrq      $2, %r8                                       #80.5
        lea       (,%r8,8), %rdi                                #80.5
        subq      %rdi, %r8                                     #80.5
        addq      %rsi, %r8                                     #80.5
        movq      (%rsp,%r8,8), %r9                             #80.5
        orq       %r9, (%rbx,%rsi,8)                            #80.5
        addq      $2, %rsi                                      #80.5
        cmpq      %r12, %rsi                                    #80.5
        jb        ..B1.19       # Prob 95%                      #80.5
                                # LOE rcx rbx rsi r12
..B1.21:                        # Preds ..B1.19 ..B1.87
# Begin ASM
# end of main loop
# End ASM
                                # LOE rbx r12
..B1.89:                        # Preds ..B1.21
        movq      k(%rip), %r14                                 #84.5
        movl      $39, %r13d                                    #86.5
        movl      $11, p(%rip)                                  #82.5
        pxor      %xmm0, %xmm0                                  #86.5
        movq      $39, j(%rip)                                  #83.5
        movl      $160, %eax                                    #86.5
        lea       22(%r14), %r15                                #84.5
        movq      %r15, k(%rip)                                 #84.5
        movaps    %xmm0, 160(%rsp)                              #86.5
                                # LOE rax rbx r12 r13 r14 r15
..B1.76:                        # Preds ..B1.76 ..B1.89
        pxor      %xmm0, %xmm0                                  #86.5
        movaps    %xmm0, -16(%rsp,%rax)                         #86.5
        movaps    %xmm0, -32(%rsp,%rax)                         #86.5
        movaps    %xmm0, -48(%rsp,%rax)                         #86.5
        movaps    %xmm0, -64(%rsp,%rax)                         #86.5
        movaps    %xmm0, -80(%rsp,%rax)                         #86.5
        subq      $80, %rax                                     #86.5
        jne       ..B1.76       # Prob 50%                      #86.5
                                # LOE rax rbx r12 r13 r14 r15
..B1.22:                        # Preds ..B1.76
# Begin ASM
# prepare patterns
# End ASM
                                # LOE rbx r12 r13 r14 r15
..B1.90:                        # Preds ..B1.22
        cmpq      $768, %r15                                    #86.5
        jae       ..B1.26       # Prob 50%                      #86.5
                                # LOE rbx r12 r13 r14 r15
..B1.23:                        # Preds ..B1.90
        negq      %r15                                          #
        movq      $0x2e8ba2e8ba2e8ba3, %rcx                     #
        addq      $789, %r15                                    #
        xorl      %esi, %esi                                    #86.5
        movq      %r15, %rax                                    #
        mulq      %rcx                                          #
        shrq      $2, %rdx                                      #
        xorl      %eax, %eax                                    #
        .align    16,0x90
                                # LOE rax rdx rbx rsi r12 r14
..B1.24:                        # Preds ..B1.24 ..B1.23
        movl      $1, %edi                                      #86.5
        lea       39(%rax), %r8                                 #86.5
        movl      %r8d, %ecx                                    #86.5
        lea       22(%rax,%r14), %r10                           #86.5
        shrq      $6, %r8                                       #86.5
        movl      $1, %r9d                                      #86.5
        shlq      %cl, %rdi                                     #86.5
        movl      %r10d, %ecx                                   #86.5
        shrq      $6, %r10                                      #86.5
        incq      %rsi                                          #86.5
        shlq      %cl, %r9                                      #86.5
        addq      $22, %rax                                     #86.5
        orq       %rdi, (%rbx,%r8,8)                            #86.5
        orq       %rdi, (%rsp,%r8,8)                            #86.5
        orq       %r9, (%rbx,%r10,8)                            #86.5
        orq       %r9, (%rsp,%r10,8)                            #86.5
        cmpq      %rdx, %rsi                                    #86.5
        jb        ..B1.24       # Prob 95%                      #86.5
                                # LOE rax rdx rbx rsi r12 r14
..B1.25:                        # Preds ..B1.24
        imulq     $22, %rsi, %r13                               #86.5
        addq      $39, %r13                                     #86.5
        cmpq      $768, %r13                                    #86.5
        jae       ..B1.27       # Prob 50%                      #86.5
                                # LOE rbx r12 r13
..B1.26:                        # Preds ..B1.90 ..B1.25
        movq      %r13, %rdx                                    #86.5
        movl      %r13d, %ecx                                   #86.5
        shrq      $6, %rdx                                      #86.5
        movl      $1, %eax                                      #86.5
        shlq      %cl, %rax                                     #86.5
        orq       %rax, (%rbx,%rdx,8)                           #86.5
        orq       %rax, (%rsp,%rdx,8)                           #86.5
                                # LOE rbx r12
..B1.27:                        # Preds ..B1.25 ..B1.26
        movq      88(%rsp), %rax                                #86.5
        movq      %rax, (%rsp)                                  #86.5
                                # LOE rbx r12
..B1.92:                        # Preds ..B1.27
# Begin ASM
# main loop
# End ASM
                                # LOE rbx r12
..B1.91:                        # Preds ..B1.92
        movl      $11, %esi                                     #86.5
        cmpq      $11, %r12                                     #86.5
        jbe       ..B1.31       # Prob 10%                      #86.5
                                # LOE rbx rsi r12
..B1.28:                        # Preds ..B1.91
        movq      $0x2e8ba2e8ba2e8ba3, %rcx                     #
                                # LOE rcx rbx rsi r12
..B1.29:                        # Preds ..B1.29 ..B1.28
        movq      %rsi, %rax                                    #86.5
        mulq      %rcx                                          #86.5
        shrq      $1, %rdx                                      #86.5
        imulq     $-11, %rdx, %rdi                              #86.5
        addq      %rsi, %rdi                                    #86.5
        movq      (%rsp,%rdi,8), %r8                            #86.5
        orq       %r8, (%rbx,%rsi,8)                            #86.5
        addq      $2, %rsi                                      #86.5
        cmpq      %r12, %rsi                                    #86.5
        jb        ..B1.29       # Prob 95%                      #86.5
                                # LOE rcx rbx rsi r12
..B1.31:                        # Preds ..B1.29 ..B1.91
# Begin ASM
# end of main loop
# End ASM
                                # LOE rbx r12
..B1.93:                        # Preds ..B1.31
        movq      k(%rip), %r14                                 #90.5
        movl      $55, %r13d                                    #92.5
        movl      $13, p(%rip)                                  #88.5
        pxor      %xmm0, %xmm0                                  #92.5
        movq      $55, j(%rip)                                  #89.5
        movl      $160, %eax                                    #92.5
        lea       26(%r14), %r15                                #90.5
        movq      %r15, k(%rip)                                 #90.5
        movaps    %xmm0, 160(%rsp)                              #92.5
                                # LOE rax rbx r12 r13 r14 r15
..B1.77:                        # Preds ..B1.77 ..B1.93
        pxor      %xmm0, %xmm0                                  #92.5
        movaps    %xmm0, -16(%rsp,%rax)                         #92.5
        movaps    %xmm0, -32(%rsp,%rax)                         #92.5
        movaps    %xmm0, -48(%rsp,%rax)                         #92.5
        movaps    %xmm0, -64(%rsp,%rax)                         #92.5
        movaps    %xmm0, -80(%rsp,%rax)                         #92.5
        subq      $80, %rax                                     #92.5
        jne       ..B1.77       # Prob 50%                      #92.5
                                # LOE rax rbx r12 r13 r14 r15
..B1.32:                        # Preds ..B1.77
# Begin ASM
# prepare patterns
# End ASM
                                # LOE rbx r12 r13 r14 r15
..B1.94:                        # Preds ..B1.32
        cmpq      $896, %r15                                    #92.5
        jae       ..B1.36       # Prob 50%                      #92.5
                                # LOE rbx r12 r13 r14 r15
..B1.33:                        # Preds ..B1.94
        negq      %r15                                          #
        movq      $0x4ec4ec4ec4ec4ec5, %rcx                     #
        addq      $921, %r15                                    #
        xorl      %esi, %esi                                    #92.5
        movq      %r15, %rax                                    #
        mulq      %rcx                                          #
        shrq      $3, %rdx                                      #
        xorl      %eax, %eax                                    #
        .align    16,0x90
                                # LOE rax rdx rbx rsi r12 r14
..B1.34:                        # Preds ..B1.34 ..B1.33
        movl      $1, %edi                                      #92.5
        lea       55(%rax), %r8                                 #92.5
        movl      %r8d, %ecx                                    #92.5
        lea       26(%rax,%r14), %r10                           #92.5
        shrq      $6, %r8                                       #92.5
        movl      $1, %r9d                                      #92.5
        shlq      %cl, %rdi                                     #92.5
        movl      %r10d, %ecx                                   #92.5
        shrq      $6, %r10                                      #92.5
        incq      %rsi                                          #92.5
        shlq      %cl, %r9                                      #92.5
        addq      $26, %rax                                     #92.5
        orq       %rdi, (%rbx,%r8,8)                            #92.5
        orq       %rdi, (%rsp,%r8,8)                            #92.5
        orq       %r9, (%rbx,%r10,8)                            #92.5
        orq       %r9, (%rsp,%r10,8)                            #92.5
        cmpq      %rdx, %rsi                                    #92.5
        jb        ..B1.34       # Prob 95%                      #92.5
                                # LOE rax rdx rbx rsi r12 r14
..B1.35:                        # Preds ..B1.34
        imulq     $26, %rsi, %r13                               #92.5
        addq      $55, %r13                                     #92.5
        cmpq      $896, %r13                                    #92.5
        jae       ..B1.37       # Prob 50%                      #92.5
                                # LOE rbx r12 r13
..B1.36:                        # Preds ..B1.94 ..B1.35
        movq      %r13, %rdx                                    #92.5
        movl      %r13d, %ecx                                   #92.5
        shrq      $6, %rdx                                      #92.5
        movl      $1, %eax                                      #92.5
        shlq      %cl, %rax                                     #92.5
        orq       %rax, (%rbx,%rdx,8)                           #92.5
        orq       %rax, (%rsp,%rdx,8)                           #92.5
                                # LOE rbx r12
..B1.37:                        # Preds ..B1.35 ..B1.36
        movq      104(%rsp), %rax                               #92.5
        movq      %rax, (%rsp)                                  #92.5
                                # LOE rbx r12
..B1.96:                        # Preds ..B1.37
# Begin ASM
# main loop
# End ASM
                                # LOE rbx r12
..B1.95:                        # Preds ..B1.96
        movl      $13, %esi                                     #92.5
        cmpq      $13, %r12                                     #92.5
        jbe       ..B1.41       # Prob 10%                      #92.5
                                # LOE rbx rsi r12
..B1.38:                        # Preds ..B1.95
        movq      $0x4ec4ec4ec4ec4ec5, %rcx                     #
                                # LOE rcx rbx rsi r12
..B1.39:                        # Preds ..B1.39 ..B1.38
        movq      %rsi, %rax                                    #92.5
        mulq      %rcx                                          #92.5
        shrq      $2, %rdx                                      #92.5
        imulq     $-13, %rdx, %rdi                              #92.5
        addq      %rsi, %rdi                                    #92.5
        movq      (%rsp,%rdi,8), %r8                            #92.5
        orq       %r8, (%rbx,%rsi,8)                            #92.5
        addq      $2, %rsi                                      #92.5
        cmpq      %r12, %rsi                                    #92.5
        jb        ..B1.39       # Prob 95%                      #92.5
                                # LOE rcx rbx rsi r12
..B1.41:                        # Preds ..B1.39 ..B1.95
# Begin ASM
# end of main loop
# End ASM
                                # LOE rbx r12
..B1.97:                        # Preds ..B1.41
        movq      k(%rip), %r14                                 #96.5
        movl      $95, %r13d                                    #98.5
        movl      $17, p(%rip)                                  #94.5
        pxor      %xmm0, %xmm0                                  #98.5
        movq      $95, j(%rip)                                  #95.5
        movl      $160, %eax                                    #98.5
        lea       34(%r14), %r15                                #96.5
        movq      %r15, k(%rip)                                 #96.5
        movaps    %xmm0, 160(%rsp)                              #98.5
                                # LOE rax rbx r12 r13 r14 r15
..B1.78:                        # Preds ..B1.78 ..B1.97
        pxor      %xmm0, %xmm0                                  #98.5
        movaps    %xmm0, -16(%rsp,%rax)                         #98.5
        movaps    %xmm0, -32(%rsp,%rax)                         #98.5
        movaps    %xmm0, -48(%rsp,%rax)                         #98.5
        movaps    %xmm0, -64(%rsp,%rax)                         #98.5
        movaps    %xmm0, -80(%rsp,%rax)                         #98.5
        subq      $80, %rax                                     #98.5
        jne       ..B1.78       # Prob 50%                      #98.5
                                # LOE rax rbx r12 r13 r14 r15
..B1.42:                        # Preds ..B1.78
# Begin ASM
# prepare patterns
# End ASM
                                # LOE rbx r12 r13 r14 r15
..B1.98:                        # Preds ..B1.42
        cmpq      $1152, %r15                                   #98.5
        jae       ..B1.46       # Prob 50%                      #98.5
                                # LOE rbx r12 r13 r14 r15
..B1.43:                        # Preds ..B1.98
        negq      %r15                                          #
        movq      $0xf0f0f0f0f0f0f0f1, %rcx                     #
        addq      $1185, %r15                                   #
        xorl      %esi, %esi                                    #98.5
        movq      %r15, %rax                                    #
        mulq      %rcx                                          #
        shrq      $5, %rdx                                      #
        xorl      %eax, %eax                                    #
        .align    16,0x90
                                # LOE rax rdx rbx rsi r12 r14
..B1.44:                        # Preds ..B1.44 ..B1.43
        movl      $1, %edi                                      #98.5
        lea       95(%rax), %r8                                 #98.5
        movl      %r8d, %ecx                                    #98.5
        lea       34(%rax,%r14), %r10                           #98.5
        shrq      $6, %r8                                       #98.5
        movl      $1, %r9d                                      #98.5
        shlq      %cl, %rdi                                     #98.5
        movl      %r10d, %ecx                                   #98.5
        shrq      $6, %r10                                      #98.5
        incq      %rsi                                          #98.5
        shlq      %cl, %r9                                      #98.5
        addq      $34, %rax                                     #98.5
        orq       %rdi, (%rbx,%r8,8)                            #98.5
        orq       %rdi, (%rsp,%r8,8)                            #98.5
        orq       %r9, (%rbx,%r10,8)                            #98.5
        orq       %r9, (%rsp,%r10,8)                            #98.5
        cmpq      %rdx, %rsi                                    #98.5
        jb        ..B1.44       # Prob 95%                      #98.5
                                # LOE rax rdx rbx rsi r12 r14
..B1.45:                        # Preds ..B1.44
        movq      %rsi, %rax                                    #98.5
        shlq      $5, %rax                                      #98.5
        lea       95(%rax,%rsi,2), %r13                         #98.5
        cmpq      $1152, %r13                                   #98.5
        jae       ..B1.47       # Prob 50%                      #98.5
                                # LOE rbx r12 r13
..B1.46:                        # Preds ..B1.98 ..B1.45
        movq      %r13, %rdx                                    #98.5
        movl      %r13d, %ecx                                   #98.5
        shrq      $6, %rdx                                      #98.5
        movl      $1, %eax                                      #98.5
        shlq      %cl, %rax                                     #98.5
        orq       %rax, (%rbx,%rdx,8)                           #98.5
        orq       %rax, (%rsp,%rdx,8)                           #98.5
                                # LOE rbx r12
..B1.47:                        # Preds ..B1.45 ..B1.46
        movq      136(%rsp), %rax                               #98.5
        movq      %rax, (%rsp)                                  #98.5
                                # LOE rbx r12
..B1.100:                       # Preds ..B1.47
# Begin ASM
# main loop
# End ASM
                                # LOE rbx r12
..B1.99:                        # Preds ..B1.100
        movl      $17, %esi                                     #98.5
        cmpq      $17, %r12                                     #98.5
        jbe       ..B1.51       # Prob 10%                      #98.5
                                # LOE rbx rsi r12
..B1.48:                        # Preds ..B1.99
        movq      $0xf0f0f0f0f0f0f0f1, %rcx                     #
                                # LOE rcx rbx rsi r12
..B1.49:                        # Preds ..B1.49 ..B1.48
        movq      %rsi, %rax                                    #98.5
        mulq      %rcx                                          #98.5
        shrq      $4, %rdx                                      #98.5
        movq      %rdx, %rdi                                    #98.5
        shlq      $4, %rdi                                      #98.5
        addq      %rdx, %rdi                                    #98.5
        negq      %rdi                                          #98.5
        addq      %rsi, %rdi                                    #98.5
        movq      (%rsp,%rdi,8), %r8                            #98.5
        orq       %r8, (%rbx,%rsi,8)                            #98.5
        addq      $2, %rsi                                      #98.5
        cmpq      %r12, %rsi                                    #98.5
        jb        ..B1.49       # Prob 95%                      #98.5
                                # LOE rcx rbx rsi r12
..B1.51:                        # Preds ..B1.49 ..B1.99
# Begin ASM
# end of main loop
# End ASM
                                # LOE rbx r12
..B1.101:                       # Preds ..B1.51
        movl      $.L_2__STRING.3, %edi                         #100.5
        xorl      %eax, %eax                                    #100.5
        movq      (%rbx), %rsi                                  #100.5
        movq      136(%rbx), %rdx                               #100.5
        movq      -8(%rbx,%r12,8), %rcx                         #100.5
..___tag_value_main.14:                                         #100.5
        call      printf                                        #100.5
..___tag_value_main.15:                                         #
                                # LOE rbx r12
..B1.52:                        # Preds ..B1.101
        movq      (%rbx), %r15                                  #101.14
        xorl      %r14d, %r14d                                  #101.5
        xorl      %r13d, %r13d                                  #
                                # LOE rbx r12 r13 r15 r14d
..B1.53:                        # Preds ..B1.56 ..B1.52
        btq       %r14, %r15                                    #101.5
        jnc       ..B1.55       # Prob 50%                      #101.5
                                # LOE rbx r12 r13 r15 r14d
..B1.54:                        # Preds ..B1.53
        movl      $.L_2__STRING.0, %edi                         #101.5
        xorl      %eax, %eax                                    #101.5
..___tag_value_main.16:                                         #101.5
        call      printf                                        #101.5
..___tag_value_main.17:                                         #
        jmp       ..B1.56       # Prob 100%                     #101.5
                                # LOE rbx r12 r13 r15 r14d
..B1.55:                        # Preds ..B1.53
        movl      $.L_2__STRING.1, %edi                         #101.5
        xorl      %eax, %eax                                    #101.5
..___tag_value_main.18:                                         #101.5
        call      printf                                        #101.5
..___tag_value_main.19:                                         #
                                # LOE rbx r12 r13 r15 r14d
..B1.56:                        # Preds ..B1.54 ..B1.55
        incq      %r13                                          #101.5
        incl      %r14d                                         #101.5
        cmpq      $64, %r13                                     #101.5
        jb        ..B1.53       # Prob 82%                      #101.5
                                # LOE rbx r12 r13 r15 r14d
..B1.57:                        # Preds ..B1.56
        movl      $.L_2__STRING.2, %edi                         #101.5
        movq      %r15, %rsi                                    #101.5
        xorl      %eax, %eax                                    #101.5
..___tag_value_main.20:                                         #101.5
        call      printf                                        #101.5
..___tag_value_main.21:                                         #
                                # LOE rbx r12
..B1.58:                        # Preds ..B1.57
        movq      136(%rbx), %r15                               #101.29
        xorl      %r14d, %r14d                                  #101.20
        xorl      %r13d, %r13d                                  #
                                # LOE rbx r12 r13 r15 r14d
..B1.59:                        # Preds ..B1.62 ..B1.58
        btq       %r14, %r15                                    #101.20
        jnc       ..B1.61       # Prob 50%                      #101.20
                                # LOE rbx r12 r13 r15 r14d
..B1.60:                        # Preds ..B1.59
        movl      $.L_2__STRING.0, %edi                         #101.20
        xorl      %eax, %eax                                    #101.20
..___tag_value_main.22:                                         #101.20
        call      printf                                        #101.20
..___tag_value_main.23:                                         #
        jmp       ..B1.62       # Prob 100%                     #101.20
                                # LOE rbx r12 r13 r15 r14d
..B1.61:                        # Preds ..B1.59
        movl      $.L_2__STRING.1, %edi                         #101.20
        xorl      %eax, %eax                                    #101.20
..___tag_value_main.24:                                         #101.20
        call      printf                                        #101.20
..___tag_value_main.25:                                         #
                                # LOE rbx r12 r13 r15 r14d
..B1.62:                        # Preds ..B1.60 ..B1.61
        incq      %r13                                          #101.20
        incl      %r14d                                         #101.20
        cmpq      $64, %r13                                     #101.20
        jb        ..B1.59       # Prob 82%                      #101.20
                                # LOE rbx r12 r13 r15 r14d
..B1.63:                        # Preds ..B1.62
        movl      $.L_2__STRING.2, %edi                         #101.20
        movq      %r15, %rsi                                    #101.20
        xorl      %eax, %eax                                    #101.20
..___tag_value_main.26:                                         #101.20
        call      printf                                        #101.20
..___tag_value_main.27:                                         #
                                # LOE rbx r12
..B1.64:                        # Preds ..B1.63
        movq      -8(%rbx,%r12,8), %r14                         #101.45
        xorl      %r13d, %r13d                                  #101.36
        xorl      %r12d, %r12d                                  #
                                # LOE rbx r12 r14 r13d
..B1.65:                        # Preds ..B1.68 ..B1.64
        btq       %r13, %r14                                    #101.36
        jnc       ..B1.67       # Prob 50%                      #101.36
                                # LOE rbx r12 r14 r13d
..B1.66:                        # Preds ..B1.65
        movl      $.L_2__STRING.0, %edi                         #101.36
        xorl      %eax, %eax                                    #101.36
..___tag_value_main.28:                                         #101.36
        call      printf                                        #101.36
..___tag_value_main.29:                                         #
        jmp       ..B1.68       # Prob 100%                     #101.36
                                # LOE rbx r12 r14 r13d
..B1.67:                        # Preds ..B1.65
        movl      $.L_2__STRING.1, %edi                         #101.36
        xorl      %eax, %eax                                    #101.36
..___tag_value_main.30:                                         #101.36
        call      printf                                        #101.36
..___tag_value_main.31:                                         #
                                # LOE rbx r12 r14 r13d
..B1.68:                        # Preds ..B1.66 ..B1.67
        incq      %r12                                          #101.36
        incl      %r13d                                         #101.36
        cmpq      $64, %r12                                     #101.36
        jb        ..B1.65       # Prob 82%                      #101.36
                                # LOE rbx r12 r14 r13d
..B1.69:                        # Preds ..B1.68
        movl      $.L_2__STRING.2, %edi                         #101.36
        movq      %r14, %rsi                                    #101.36
        xorl      %eax, %eax                                    #101.36
..___tag_value_main.32:                                         #101.36
        call      printf                                        #101.36
..___tag_value_main.33:                                         #
                                # LOE rbx
..B1.70:                        # Preds ..B1.69
        movq      %rbx, %rdi                                    #105.5
        call      free                                          #105.5
                                # LOE
..B1.71:                        # Preds ..B1.70
        xorl      %eax, %eax                                    #106.12
        addq      $216, %rsp                                    #106.12
..___tag_value_main.34:                                         #106.12
        popq      %rbx                                          #106.12
..___tag_value_main.35:                                         #106.12
        popq      %r15                                          #106.12
..___tag_value_main.36:                                         #106.12
        popq      %r14                                          #106.12
..___tag_value_main.37:                                         #106.12
        popq      %r13                                          #106.12
..___tag_value_main.38:                                         #106.12
        popq      %r12                                          #106.12
        movq      %rbp, %rsp                                    #106.12
        popq      %rbp                                          #106.12
..___tag_value_main.39:                                         #
        ret                                                     #106.12
        .align    16,0x90
..___tag_value_main.41:                                         #
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
..___tag_value_doWork.42:                                       #30.47
        pushq     %r12                                          #30.47
..___tag_value_doWork.44:                                       #
        pushq     %r13                                          #30.47
..___tag_value_doWork.46:                                       #
        pushq     %r14                                          #30.47
..___tag_value_doWork.48:                                       #
        pushq     %r15                                          #30.47
..___tag_value_doWork.50:                                       #
        pushq     %rbp                                          #30.47
..___tag_value_doWork.52:                                       #
        subq      $176, %rsp                                    #30.47
..___tag_value_doWork.54:                                       #
        movq      %r8, %r14                                     #30.47
        pxor      %xmm0, %xmm0                                  #34.19
        movq      %rcx, %r13                                    #30.47
        movaps    %xmm0, 160(%rsp)                              #34.19
        movq      %rdx, %rbp                                    #30.47
        movq      %rsi, %r12                                    #30.47
        movq      %rdi, %r15                                    #30.47
        movl      $160, %eax                                    #34.19
                                # LOE rax rbx rbp r12 r13 r14 r15 xmm0
..B2.15:                        # Preds ..B2.15 ..B2.1
        movaps    %xmm0, -16(%rsp,%rax)                         #34.19
        movaps    %xmm0, -32(%rsp,%rax)                         #34.19
        movaps    %xmm0, -48(%rsp,%rax)                         #34.19
        movaps    %xmm0, -64(%rsp,%rax)                         #34.19
        movaps    %xmm0, -80(%rsp,%rax)                         #34.19
        subq      $80, %rax                                     #34.19
        jne       ..B2.15       # Prob 50%                      #34.19
                                # LOE rax rbx rbp r12 r13 r14 r15 xmm0
..B2.2:                         # Preds ..B2.15
# Begin ASM
# prepare patterns
# End ASM
                                # LOE rbx rbp r12 r13 r14 r15
..B2.16:                        # Preds ..B2.2
        movq      %r14, %rax                                    #39.21
        shlq      $6, %rax                                      #39.21
        addq      $64, %rax                                     #39.21
        cmpq      %rax, %rbp                                    #39.21
        jae       ..B2.6        # Prob 10%                      #39.21
                                # LOE rax rbx rbp r12 r13 r14 r15
..B2.4:                         # Preds ..B2.16 ..B2.4
        movq      %r12, %rsi                                    #40.15
        movq      %rbp, %r8                                     #43.15
        shrq      $6, %rsi                                      #40.15
        movl      %r12d, %ecx                                   #40.37
        shrq      $6, %r8                                       #43.15
        movl      $1, %edx                                      #40.37
        shlq      %cl, %rdx                                     #40.37
        movl      %ebp, %ecx                                    #43.37
        movl      $1, %edi                                      #43.37
        lea       (%rbp,%r14,2), %rbp                           #45.9
        orq       %rdx, (%r15,%rsi,8)                           #40.9
        lea       (%r12,%r14,2), %r12                           #42.9
        orq       %rdx, (%rsp,%rsi,8)                           #41.9
        shlq      %cl, %rdi                                     #43.37
        orq       %rdi, (%r15,%r8,8)                            #43.9
        orq       %rdi, (%rsp,%r8,8)                            #44.9
        cmpq      %rax, %rbp                                    #39.21
        jb        ..B2.4        # Prob 95%                      #39.21
                                # LOE rax rbx rbp r12 r13 r14 r15
..B2.6:                         # Preds ..B2.4 ..B2.16
        cmpq      %rax, %r12                                    #47.18
        jae       ..B2.8        # Prob 50%                      #47.18
                                # LOE rbx r12 r13 r14 r15
..B2.7:                         # Preds ..B2.6
        movq      %r12, %rdx                                    #49.15
        movl      %r12d, %ecx                                   #49.37
        shrq      $6, %rdx                                      #49.15
        movl      $1, %eax                                      #49.37
        shlq      %cl, %rax                                     #49.37
        orq       %rax, (%r15,%rdx,8)                           #49.9
        orq       %rax, (%rsp,%rdx,8)                           #50.9
                                # LOE rbx r13 r14 r15
..B2.8:                         # Preds ..B2.6 ..B2.7
        movq      (%rsp,%r14,8), %rax                           #53.17
        movq      %rax, (%rsp)                                  #53.5
        shrq      $7, %r13                                      #55.22
                                # LOE rbx r13 r14 r15
..B2.18:                        # Preds ..B2.8
# Begin ASM
# main loop
# End ASM
                                # LOE rbx r13 r14 r15
..B2.17:                        # Preds ..B2.18
        movq      %r14, %rcx                                    #57.9
        cmpq      %r13, %r14                                    #57.22
        jae       ..B2.12       # Prob 10%                      #57.22
                                # LOE rcx rbx r13 r14 r15
..B2.10:                        # Preds ..B2.17 ..B2.10
        movq      %rcx, %rax                                    #59.30
        xorl      %edx, %edx                                    #59.30
        divq      %r14                                          #59.30
        movq      (%rsp,%rdx,8), %rbp                           #59.19
        orq       %rbp, (%r15,%rcx,8)                           #59.9
        addq      $2, %rcx                                      #60.9
        cmpq      %r13, %rcx                                    #57.22
        jb        ..B2.10       # Prob 95%                      #57.22
                                # LOE rcx rbx r13 r14 r15
..B2.12:                        # Preds ..B2.10 ..B2.17
# Begin ASM
# end of main loop
# End ASM
                                # LOE rbx
..B2.19:                        # Preds ..B2.12
        addq      $176, %rsp                                    #63.1
..___tag_value_doWork.55:                                       #
        popq      %rbp                                          #63.1
..___tag_value_doWork.57:                                       #
        popq      %r15                                          #63.1
..___tag_value_doWork.59:                                       #
        popq      %r14                                          #63.1
..___tag_value_doWork.61:                                       #
        popq      %r13                                          #63.1
..___tag_value_doWork.63:                                       #
        popq      %r12                                          #63.1
..___tag_value_doWork.65:                                       #
        ret                                                     #63.1
        .align    16,0x90
..___tag_value_doWork.66:                                       #
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
..___tag_value_dumpBits.67:                                     #17.20
        pushq     %r12                                          #17.20
..___tag_value_dumpBits.69:                                     #
        pushq     %r13                                          #17.20
..___tag_value_dumpBits.71:                                     #
        pushq     %r14                                          #17.20
..___tag_value_dumpBits.73:                                     #
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
..___tag_value_dumpBits.75:                                     #21.13
        call      printf                                        #21.13
..___tag_value_dumpBits.76:                                     #
        jmp       ..B3.5        # Prob 100%                     #21.13
                                # LOE rbx rbp r12 r14 r15 r13d
..B3.4:                         # Preds ..B3.2
        movl      $.L_2__STRING.1, %edi                         #24.13
        xorl      %eax, %eax                                    #24.13
..___tag_value_dumpBits.77:                                     #24.13
        call      printf                                        #24.13
..___tag_value_dumpBits.78:                                     #
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
..___tag_value_dumpBits.79:                                     #27.5
        popq      %r14                                          #27.5
..___tag_value_dumpBits.80:                                     #
        popq      %r13                                          #27.5
..___tag_value_dumpBits.82:                                     #
        popq      %r12                                          #27.5
..___tag_value_dumpBits.84:                                     #
        jmp       printf                                        #27.5
        .align    16,0x90
..___tag_value_dumpBits.85:                                     #
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
.L_2il0floatpacket.59:
	.long	0x00000000,0x00000000,0x00000000,0x43f00000
	.type	.L_2il0floatpacket.59,@object
	.size	.L_2il0floatpacket.59,16
	.align 8
.L_2il0floatpacket.56:
	.long	0x26e978d5,0x3fee0831
	.type	.L_2il0floatpacket.56,@object
	.size	.L_2il0floatpacket.56,8
	.align 8
.L_2il0floatpacket.58:
	.long	0x00000000,0x43e00000
	.type	.L_2il0floatpacket.58,@object
	.size	.L_2il0floatpacket.58,8
	.align 4
.L_2il0floatpacket.57:
	.long	0x5f000000
	.type	.L_2il0floatpacket.57,@object
	.size	.L_2il0floatpacket.57,4
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
	.8byte ..___tag_value_main.41-..___tag_value_main.1
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
	.4byte ..___tag_value_main.34-..___tag_value_main.7
	.2byte 0x04c3
	.4byte ..___tag_value_main.35-..___tag_value_main.34
	.2byte 0x04cf
	.4byte ..___tag_value_main.36-..___tag_value_main.35
	.2byte 0x04ce
	.4byte ..___tag_value_main.37-..___tag_value_main.36
	.2byte 0x04cd
	.4byte ..___tag_value_main.38-..___tag_value_main.37
	.2byte 0x04cc
	.4byte ..___tag_value_main.39-..___tag_value_main.38
	.8byte 0x00000000c608070c
	.2byte 0x0000
	.4byte 0x0000007c
	.4byte 0x000000cc
	.8byte ..___tag_value_doWork.42
	.8byte ..___tag_value_doWork.66-..___tag_value_doWork.42
	.byte 0x04
	.4byte ..___tag_value_doWork.44-..___tag_value_doWork.42
	.4byte 0x028c100e
	.byte 0x04
	.4byte ..___tag_value_doWork.46-..___tag_value_doWork.44
	.4byte 0x038d180e
	.byte 0x04
	.4byte ..___tag_value_doWork.48-..___tag_value_doWork.46
	.4byte 0x048e200e
	.byte 0x04
	.4byte ..___tag_value_doWork.50-..___tag_value_doWork.48
	.4byte 0x058f280e
	.byte 0x04
	.4byte ..___tag_value_doWork.52-..___tag_value_doWork.50
	.4byte 0x0686300e
	.byte 0x04
	.4byte ..___tag_value_doWork.54-..___tag_value_doWork.52
	.4byte 0x0401e00e
	.4byte ..___tag_value_doWork.55-..___tag_value_doWork.54
	.4byte 0x04c6300e
	.4byte ..___tag_value_doWork.57-..___tag_value_doWork.55
	.4byte 0x04cf280e
	.4byte ..___tag_value_doWork.59-..___tag_value_doWork.57
	.4byte 0x04ce200e
	.4byte ..___tag_value_doWork.61-..___tag_value_doWork.59
	.4byte 0x04cd180e
	.4byte ..___tag_value_doWork.63-..___tag_value_doWork.61
	.4byte 0x04cc100e
	.4byte ..___tag_value_doWork.65-..___tag_value_doWork.63
	.4byte 0x0000080e
	.2byte 0x0000
	.4byte 0x0000004c
	.4byte 0x0000014c
	.8byte ..___tag_value_dumpBits.67
	.8byte ..___tag_value_dumpBits.85-..___tag_value_dumpBits.67
	.byte 0x04
	.4byte ..___tag_value_dumpBits.69-..___tag_value_dumpBits.67
	.4byte 0x028c100e
	.byte 0x04
	.4byte ..___tag_value_dumpBits.71-..___tag_value_dumpBits.69
	.4byte 0x038d180e
	.byte 0x04
	.4byte ..___tag_value_dumpBits.73-..___tag_value_dumpBits.71
	.4byte 0x048e200e
	.byte 0x04
	.4byte ..___tag_value_dumpBits.79-..___tag_value_dumpBits.73
	.2byte 0x04ce
	.4byte ..___tag_value_dumpBits.80-..___tag_value_dumpBits.79
	.4byte 0x04cd180e
	.4byte ..___tag_value_dumpBits.82-..___tag_value_dumpBits.80
	.4byte 0x04cc100e
	.4byte ..___tag_value_dumpBits.84-..___tag_value_dumpBits.82
	.2byte 0x080e
# End
