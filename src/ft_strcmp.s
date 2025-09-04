
section .text

global ft_strcmp

ft_strcmp:
    push rbp
    mov rbp,rsp
    xor rax,rax
    jmp cmp_condition
cmp_loop:
    inc rax
cmp_condition:
    movzx rcx, byte [rsi + rax]
    movzx rbx, byte [rdi + rax]
    sub rbx,rcx
    cmp rcx, 0
    je cmp_end
    cmp rbx,0
    je cmp_loop
cmp_end:
    mov rax,rbx
    pop rbp
    ret