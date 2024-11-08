bits 64

extern __errno_location
global ft_write

section .text

ft_write:
  mov rax, 1
  syscall
  cmp rax, 0
    js error_in_t
  ret

  error_in_t:
    mov rdx, rax
    call __errno_location wrt ..plt
    neg rdx
    mov dword [rax], edx
    mov rax, -1
    ret
