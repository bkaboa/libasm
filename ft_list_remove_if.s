bits 64

section .data
NULL: equ 0

section .text
extern free
global ft_list_remove_if
;void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *))

;(*cmp)(list_ptr->data, data_ref);
;(*free_fct)(list_ptr->data);
ft_list_remove_if:
    cmp rdi, NULL
        jz end
    mov r8, [rdi]
    mov r9, r8

    remove_loop:
    cmp r8, NULL
        jz end
    push rdi
    push rsi
    push rdx
    push rcx
    mov rdi, [r8]
    call rdx
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    cmp rax, 0
        jz free_data
    mov r9, r8
    mov r8, [r8 + 8]
    jmp remove_loop

    free_data:
        push rdi
        push rsi
        push rdx
        push rcx
        push r8
        push r9
        mov rdi, [r8]
        call rcx
        pop r9
        pop r8
        pop rcx
        pop rdx
        pop rsi
        pop rdi
        cmp r8, r9
            jz advance_pointer
        mov r10, [r8 + 8]
        push rdi
        push rsi
        push rdx
        push rcx
        push r8
        push r9
        push r10
        mov rdi, r8
        call free wrt ..plt
        pop r10
        pop r9
        pop r8
        pop rcx
        pop rdx
        pop rsi
        pop rdi
        mov r8, r10
        mov [r9 + 8], r10
        jmp remove_loop

    advance_pointer:
        mov r10, [r8 + 8]
    push rdi
    push rsi
    push rdx
    push rcx
    push r8
    push r9
    push r10
        mov rdi, r8
        call free wrt ..plt
    pop r10
    pop r9
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
        mov [rdi], r10
        mov r8, r10
        mov r9, r10
        jmp remove_loop

    end:
        ret