extern __errno_location

section .text

global ft_read

ft_read:
    push rbp
    mov rbp,rsp
    xor rax,rax
    syscall
    cmp rax, 0
    jge end
    mov r11,rax
    neg r11
    call __errno_location wrt ..plt
    mov [rax], r11
    mov rax,-1
end: 
    pop rbp
    ret