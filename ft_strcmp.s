bits 64

NULL: equ 0

section .text
global ft_strcmp

;int strcmp( const char * first, const char * second );
;rdi == first
;rsi == second

ft_strcmp:
  xor rax, rax
  xor rcx, rcx
  cmp rdi, NULL
    je end
  cmp rsi, NULL
    je end

  loop:
    mov cl, byte [rsi]
    mov al, byte [rdi]
    cmp al, cl
      jne end
    cmp cl, 0
      je end
    inc rdi
    inc rsi
    jmp loop

  end:
    sub rax, rcx
    ret
