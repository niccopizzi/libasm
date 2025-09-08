
extern ft_write
extern ft_strlen

section .text

global ft_putnbr_base

is_char_not_dup:
    push rbp
    mov rbp,rsp
    xor rax,rax
cnp_loop:
    mov r8b, byte [rsi + rax]
    cmp r8b,0x0
    je cnd_true
    cmp dil, r8b
    je cnd_false
    inc rax
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
    cmp dil, '+'
    je not_valid_char
    cmp dil, '-'
    je not_valid_char
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
    cmp rdi,0x0 ; is null str?
    je ivs_not_valid
    cmp byte [rdi],0x0 ; is empty str?
    je ivs_not_valid
    cmp byte [rdi + 1],0x0 ; is one char?
    je ivs_not_valid
    xor rcx,rcx
ivs_loop:
    mov r8b, byte [rdi + rcx]
    cmp r8b, 0x0
    je ivs_valid
    inc rcx
    push rcx
    push rdi
    lea rsi,[rdi + rcx]
    mov dil,r8b
    call is_valid_char
    pop rdi
    pop rcx
    cmp rax,0x0
    je ivs_not_valid
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
    sub rsp,32
    mov [rbp - 8], edi
    mov [rbp - 16], rsi
    mov rdi,rsi ;move the base into the first arg
    call is_valid_str
    cmp rax,0
    je ft_putnbr_base_end
    mov rsi,[rbp - 16]
    mov rdi,rsi
    call ft_strlen ;rax has base_len
    mov [rbp - 24],rax ; save base_len
    mov edi, dword [rbp - 8] ;get back int passed
    test edi,edi
    jnl not_negative
    mov [rbp - 32], byte "-"
    movsx r12,edi ;save sign for min_int
    mov rax,1
    mov rdi,1
    lea rsi,[rbp - 32]
    mov rdx,1
    syscall
    mov rdi, r12
    neg rdi
    mov rsi,[rbp - 16]
not_negative:
    mov edx, [rbp - 24]
    call print_num
ft_putnbr_base_end:
    mov eax,1
    mov rsp,rbp
    pop rbp
    ret

print_num:
    push rbp
    mov rbp,rsp
    sub rsp,24
    mov [rbp - 8],rdi ;save called num
    mov [rbp - 16],rsi ;save base ptr
    mov [rbp - 24],rdx ;save base len
    cmp rdi,rdx
    jl print_num_end
    xor rdx,rdx
    mov rax,[rbp - 8]
    mov rcx,[rbp - 24]
    div rcx
    mov rdi,rax
    push rdx
    mov rdx,[rbp - 24]
    call print_num
    pop rdi
    mov rsi,[rbp - 16]
    mov rdx,[rbp - 24]
    call print_num
    mov rsp,rbp
    pop rbp
    ret
print_num_end:
    mov eax,1
    mov rsi,[rbp - 16]
    add rsi,rdi
    mov rdi,1
    mov rdx,1
    syscall
    mov rsp,rbp
    pop rbp
    ret