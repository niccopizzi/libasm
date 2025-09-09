%include "tlist.inc"

extern malloc

section .text

global ft_list_push_front

ft_list_new:
    push rbp
    mov rbp,rsp
    push r12
    mov r12,rdi ;save data*
    mov rdi,t_list_size
    call malloc wrt ..plt
    cmp rax,0x0
    je list_new_end
    mov qword [rax],r12 ; assign data to the new node
    mov qword [rax + t_list.next], 0x0
list_new_end:
    pop r12
    pop rbp
    ret

ft_list_push_front:
    push rbp
    mov rbp,rsp
    push r12
    cmp rdi,0x0 ;is pointer null?
    je ft_lpf_end
    mov r12,rdi ;save t_list** 
    mov rdi,rsi ;move data* into 1st arg
    call ft_list_new
    cmp rax,0x0 ;malloc failed?
    je ft_lpf_end
    cmp qword [r12],0x0 ;is the list head null?
    je create_new_list
    mov rcx, [r12]
    mov [rax + t_list.next], rcx ; assign to new node next the head of the list
    mov qword [r12],rax ;change the beginning of the list
    jmp ft_lpf_end
create_new_list:
    mov [r12], rax

ft_lpf_end:
    pop r12
    pop rbp
    ret