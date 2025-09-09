%include "tlist.inc"

section .text

global ft_list_sort

ft_list_sort:
    push rbp
    mov rbp,rsp
    push r12
    push r13
    push r14
    cmp qword rdi,0x0 ;check that begin_list != NULL
    je end
    cmp qword [rdi],0x0 ;check that *begin_list != NULL
    je end
    cmp qword rsi,0x0 ;check that *f != NULL
    je end 
    mov r12,[rdi]
    mov r13,rsi ;save function pointer in r13
loop:
    cmp r12,0x0
    je end
    mov r14,[r12 + t_list.next]
inner_loop:
    cmp r14,0x0
    je inner_loop_end
    mov rdi,[r12] ;first arg of cmp node->data
    mov rsi,[r14] ;second arg of cmp node->next->data
    call r13 ;function pointer
    cmp rax,0x0
    jl next
    mov r8,[r12] ;save node->data
    mov r9,[r14] ;save next->data
    mov [r12],r9
    mov [r14],r8
next:
    mov r14,[r14 + t_list.next]
    jmp inner_loop 
inner_loop_end:
    mov r12,[r12 + t_list.next]
    jmp loop
end:
    pop r14
    pop r13
    pop r12
    pop rbp
    ret