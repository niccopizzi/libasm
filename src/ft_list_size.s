%include "tlist.inc"

section .text

global ft_list_size

ft_list_size:
    push rbp
    mov rbp,rsp
    xor rax,rax
loop:
    cmp qword rdi,0x0
    je end
    inc rax
    mov rdi,[rdi + t_list.next]
    jmp loop

end:
    pop rbp
    ret