bits 64

section .text
  global ft_write

ft_write:
  mov rax, 1
  syscall
  cmp rax, 0
  js error_in_t
  ret
  error_in_t:
  mov rax, -1
  ret

