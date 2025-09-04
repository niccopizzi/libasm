extern malloc
extern ft_strlen
extern ft_strcpy

section .text

global ft_strdup

ft_strdup:
    push rbp
    mov rbp,rsp
    xor rax,rax
    cmp rdi,0
    je end
    call ft_strlen
    inc rax
    push rdi
    mov rdi,rax
    call malloc wrt ..plt
    pop rsi
    cmp rax,0
    je end
    mov rdi,rax
    call ft_strcpy
end:
    pop rbp
    ret