;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; printf.asm
;

bits 64
extern printf

section .text
    global main

main:
    mov rdi, msg    ; rdi = msg
    mov rax, 0      ; rax = 0
    call printf     ; Call printf
    mov rax, 60     ; Exit System Call
    mov rdi, 0      ; Exit code
    syscall         ; Call Kernel to execute exit
    ret             ; Return

section .data
    msg: db "Hello, World!", 10, 0
