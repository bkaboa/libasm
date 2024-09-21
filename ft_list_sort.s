bits 64

section .data
NULL: equ 0

section .text
global ft_list_sort

;void ft_list_sort(t_list **begin_list, int (*cmp)())
ft_list_sort:
    cmp rdi, NULL
        jz end
    mov r8, [rdi]
    mov r9, r8
    mov rdx, rsi

    sort_loop:
        cmp r8, NULL
            jz end
        cmp r8, r9
            jz increment
        push rdi
        push rsi
        push rdx
        push r8
        push r9
        mov rsi, [r8]
        mov rdi, [r9]
        call rdx
        pop r9
        pop r8
        pop rdx
        pop rsi
        pop rdi
        cmp rax, 0
            jg data_swap
        end_data_swap:
        mov r9, [r9 + 8]
        jmp sort_loop

    increment:
        mov r8, [r8 + 8]
        mov r9, [rdi]
        jmp sort_loop

    data_swap:
        mov r10, [r9]
        mov r11, [r8]
        mov [r9], r11
        mov [r8], r10
        jmp end_data_swap

    end:
        ret
