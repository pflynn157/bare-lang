.intel_syntax noprefix
.data
    str1: .string "Hello!\n\0"

.text
.global test1

test1:
    mov rax, 1
    mov rdi, 1
    mov rsi, OFFSET FLAT:str1
    mov rdx, 7
    syscall
    
    ret
    
