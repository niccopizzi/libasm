
section .text

global ft_strlen

ft_strlen:
    push rbp
    mov rbp,rsp
    xor rax,rax
    jmp condition
loop:
    inc rax
condition:
    cmp byte [rdi + rax],0
    jne loop
    pop rbp
    ret