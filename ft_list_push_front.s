bits 64

section .data
NULL: equ 0
ADDR: equ 8
t_list: equ 16

section .text
extern malloc
extern __errno_location
global ft_list_push_front
;ft_list_push_front(t_list **begin_list, void *data)

ft_list_push_front:
    cmp rdi, NULL
        jz end
    mov rcx, [rdi]
    push rsi
    push rdi
    push rcx
    mov rdi, t_list
    call malloc wrt ..plt
    pop rcx
    pop rdi
    pop rsi
    cmp rax, 0
        jz false_end
    mov [rax], rsi
    mov [rax + ADDR], rcx
    mov rcx, rax
    mov [rdi], rcx

    false_end:
        call __errno_location wrt ..plt
        mov qword [rax], 12
        ret

    end:
        ret
    