bits 64


section .data
NULL: equ 0

section .text
extern ft_strlen
extern ft_strcpy
extern malloc
extern __errno_location
global ft_strdup

;char *strdup(const char *s);
;rdi == s

ft_strdup:

  xor rax, rax
  mov rax, rdi
  push rdi

  ;ft_strlen(char *)
  call ft_strlen
  mov rdi, rax
  inc rdi
  ;malloc(size_t number of bytes)
  call malloc wrt ..plt
    cmp rax, NULL
    jz error
  mov rdi, rax
  pop rsi
  call ft_strcpy

  end:
    ret

  error:
    neg rax
    mov rdi, rax
    call __errno_location wrt ..plt
    mov rax, NULL
    ret

