;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; write.asm
;

bits 64

section .text
    global _start

_start:
    mov rax, 1      ; Write System Call
    mov rdi, 1      ; File Descriptor (stdout)
    mov rsi, msg    ; Set Message in rsi
    mov rdx, 14     ; Set length of message
    syscall         ; Call Kernel to execute write
    mov rax, 60     ; Exit System Call
    mov rdi, 0      ; Set exit code to 0
    syscall         ; Call Kernel to execute exit
    ret             ; Return

section .data
    msg db "Hello, World!", 10, 0
