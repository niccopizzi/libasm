extern ft_write
extern ft_strlen

section .text

global ft_putnbr_base

is_char_not_dup:
    push rbp
    mov rbp,rsp
    mov rcx,rax
    jmp cnp_condition

cnp_loop:
    inc rcx
    cmp sil, byte [rdi + rcx]
    je cnd_false
cnp_condition:
    cmp byte [rdi + rcx],0x0
    je cnd_true
    jmp cnp_loop

cnd_false:
    mov rax,0
    jmp cnd_end

cnd_true:
    mov rax,1

cnd_end:
    pop rbp
    ret

is_valid_char:
    push rbp
    mov rbp,rsp
    cmp byte [rdi + rax], '+'
    je not_valid_char
    cmp byte [rdi + rax], '-'
    je not_valid_char
    movzx rsi, byte [rdi + rax] ;put char to compare in second arg
    call is_char_not_dup
    jmp nvc_end

not_valid_char:
    mov rax,0

nvc_end:
    pop rbp
    ret

is_valid_str:
    push rbp
    mov rbp,rsp
    xor rax,rax
    cmp rdi,0x0 ; is null str?
    je ivs_not_valid
    cmp byte [rdi],0x0 ; is empty str?
    je ivs_not_valid
    cmp byte [rdi + 1],0x0
    je ivs_not_valid
    jmp ivs_condition
ivs_loop:
    mov r8,rax
    mov r9,rsi
    mov r10,rdi
    call is_valid_char
    cmp rax,0x0
    je ivs_not_valid
    mov rdi,r10
    mov rsi,r9
    mov rax,r8
    inc rax

ivs_condition:
    cmp byte [rdi + rax], 0x0
    je ivs_valid
    jmp ivs_loop

ivs_not_valid:
    mov rax,0x0
    jmp ivs_end

ivs_valid:
    mov rax,0x1

ivs_end:
    pop rbp
    ret

ft_putnbr_base:
    push rbp
    mov rbp,rsp
    movsxd r12,edi ;save int in register
    mov rdi,rsi ;move the base into the first arg
    call is_valid_str
    cmp rax,1
    jne error
    mov rdi,rsi
    call ft_strlen ;rax stores now the len_base
    mov rdi,r12 ;get back int passed
    test rdi,rdi
    js handle_negative


putnbr:
    push rbp
    mov rbp,rsp
    mov r12,rdi
    mov r13,rsi
    mov r14,rax
    cmp rdi,rax
    jg  handle_greater
    mov rax,1
    mov rdi,1
    lea rsi,rsi + rdi
    mov rdx,1
    syscall
    jmp putnbr_end
    
handle_greater:
    mov r8,rdi
    div 

handle_negative:
    sub rsp,0x1
    mov byte [rsp], '-'
    mov r8,rdi
    mov rsi,rsp
    mov rdi,1
    mov rdx,1
    mov rax,1
    syscall
    mov rdi,r8
    neg rdi
    add rsp,0x1
    call putnbr
    
putnbr_end:
    mov rax,1
    pop rbp
    ret

error:
    mov rax,0
    pop rbp
    ret
