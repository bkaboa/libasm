bits 64

NULL: equ 0

section .text
global ft_strcmp

;int strcmp( const char * first, const char * second );
;rdi == first
;rsi == second

ft_strcmp:
  xor rax, rax
  xor rbx, rbx
  cmp rdi, NULL
    jz end
  cmp rsi, NULL
    jz end

  loop:
    mov al, byte [rdi]
    cmp al, byte [rsi]
      jne end
    mov bl, byte [rsi]
    cmp bl, 0
      je end
    inc rdi
    inc rsi
    jmp loop

  end:
    sub rax, rbx
    ret
