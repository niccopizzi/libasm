
section .text

global ft_strcpy

ft_strcpy:
    push rbp
    mov rbp,rsp
    xor rax,rax
    jmp condition
loop:
    movzx rdx, byte [rsi + rax]
    mov byte [rdi + rax], dl
    inc rax
condition:
    movzx rcx, byte [rsi + rax]
    cmp rcx,0
    jne loop
    mov byte [rdi + rax], 0
    mov rax,rdi
    pop rbp
    ret