bits 64

section .data
NULL: equ 0

section .text
global ft_strcpy

ft_strcpy:
;char *strcpy(char *dest, const char *src)
;rdi == dest
;rsi == src
  xor rax, rax
  cmp rdi, NULL
    jz end

  cmp rsi, NULL
    jz end

  mov rax, rdi
  mov rdx, rsi

  loop:
    mov cl, [rsi]
    mov [rdi], cl
    cmp cl, 0
      jz end
    inc rsi
    inc rdi
    jmp loop

  end:
    ret
