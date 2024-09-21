bits 64

section .data
NULL: equ 0

section .text
global ft_list_size
;int ft_list_size(t_list *list)

ft_list_size:
    xor rax, rax
    loop:
        cmp rdi, 0
            jz end
        inc eax
        mov rdi, [rdi + 8]
        jmp loop
    end:
        ret
