%include "tlist.inc"

extern free

section .text

global ft_list_remove_if

ft_list_remove_if:
    push rbp
    mov rbp,rsp
    sub rsp,32
    mov [rbp - 8],rdi ;store begin_list
    mov [rbp - 16],rsi ;store data*
    mov [rbp - 24],rdx ;store cmp* 
    mov [rbp - 32],rcx ;store free_fct*
    push r13
    push r12
    cmp rdi,0x0
    je end
    cmp qword [rdi],0x0
    je end
    cmp rsi,0x0
    je end
    cmp rdx,0x0
    je end
    cmp rcx,0x0
    je end
    mov r12,[rbp - 8]
    mov r12,[r12]
loop:
    cmp r12,0x0 ;r12 = node
    je end_loop
    mov r13,[r12 + t_list.next] ;r13 = node->next
    cmp r13,0x0
    je next
    mov rdi,[r13] ;load node->next->data
    mov rsi,[rbp - 16] ;load data_ref
    call [rbp - 24] ;call cmp
    cmp rax,0x0 ;are they equal?
    jne next
    mov rdi, r13 ;move node->next in first arg for free_func
    mov rdi,[rdi] ;load node->next->data
    call [rbp - 32]
    mov r8,[r13 + t_list.next]
    mov [r12 + t_list.next],r8 ;update node->next
    mov rdi,r13
    call free wrt ..plt
    jmp loop
next:
    mov r12,[r12 + t_list.next]
    jmp loop
end_loop:
    mov r12,[rbp - 8]
    mov rdi,[r12]
    mov rdi,[rdi]
    mov rsi,[rbp - 16]
    call [rbp - 24]
    cmp rax,0x0
    jne end
    mov rdi,[r12]
    mov rdi,[rdi]
    call [rbp - 32]
    mov rdi,[r12]
    mov r8,[rdi + t_list.next]
    mov [r12],r8
    call free wrt ..plt
end:
    pop r12
    pop r13
    mov rsp,rbp
    pop rbp
    ret
