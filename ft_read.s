bits 64


section .text
extern __errno_location
global ft_read

ft_read:
  mov rax, 0
  syscall
  cmp rax, 0
    js error_in_t
  ret

  error_in_t:
    mov rdx, rax
    call __errno_location wrt ..plt
    neg edx
    mov dword [rax], edx
    mov rax, -1
    ret
