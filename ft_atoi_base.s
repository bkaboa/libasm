bits 64

section .data
NULL: equ 0


extern ft_strlen
section .text
global ft_atoi_base
;ft_atoi_base(char *base_number, char *base)
ft_atoi_base:
    xor rax, rax
    cmp rdi, NULL
        jz end
    cmp rsi, NULL
        jz end

    push rdi
    mov rdi, rsi
    call ft_strlen
    pop rdi
    mov rdx, rax
    xor rax, rax
    cmp rdx, 1
        jle end

    push rdi
    call ft_strlen
    pop rdi
    cmp rax, 0
        jz end
    xor rax, rax

    mov rcx, rsi
    base_parse:
        mov r10b, byte [rcx]
        cmp r10b, 0
            jz part2
        mov r8, rcx
        cmp r10b, 32
            jz end
        cmp r10b, 45
            jz end
        cmp r10b, 43
            jz end
        cmp r10b, 13
            jle white_base
        end_white_base:
        jmp clone
        end_clone:
        inc rcx
        jmp base_parse
    
    clone:
        inc r8
        cmp byte [r8], 0
            jz end_clone
        cmp byte [r8], r10b
            jz end
        jmp clone

    white_base:
        cmp r10b, 9
            jge end
        jmp end_white_base
    
    part2:
    mov rcx, rdi
    mov r14, 1
    start_number:
        mov r10b, byte [rcx]
        cmp r10b, 0
            jz end
        cmp r10b, 32
            jz inc_base_number
        cmp r10b, 45
            jz negative_base_number
        cmp r10b, 43
            jz inc_base_number
        cmp r10b, 13
            jle white_number
        jmp main_loop

    inc_base_number:
        inc rcx
        jmp start_number

    negative_base_number:
        cmp r14, -1
            jz inc_base_number
        mov r14, -1
        jmp inc_base_number

    white_number:
        cmp r10b, 9
            jge inc_base_number
        jmp main_loop

    main_loop:
        mov r8, rsi
        mov r10b, byte [rcx]
        jmp find_index

    find_index:
        cmp r10b, 0
            jz true_end
        cmp byte [r8], 0
            jz true_end
        cmp byte [r8], r10b
            jz inc_rax
        inc r8
        jmp find_index

    inc_rax:
        mov r9, r8
        sub r9, rsi
        imul eax, edx
        add eax, r9d
        inc rcx
        jmp main_loop

    end:
        ret 
    
    true_end:
        imul eax, r14d
        ret
