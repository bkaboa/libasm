bits 64

section .text
global ft_strlen

;ft_strlen(const char *str)
;rdi = str
ft_strlen:
  xor rax, rax
  cmp rdi, 0
    jz end

  loop:
  cmp byte [rdi], 0
    jz end
  inc rax
  inc rdi
  jmp loop

  end:
    ret
