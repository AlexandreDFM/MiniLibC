;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; strchr.asm
;

bits 64
global strchr

strchr:
    push rbp           ; Prologue
    mov rbp, rsp       ; Stack Frame Setup
    push rdi           ; On sauvegarde rdi
    push rsi           ; On sauvegarde rsi
    cmp rdi, 0         ; On compare rdi avec 0 (NULL)
    je strchr_end      ; Si c'est NULL, on sort de la fonction

strchr_loop:
    cmp byte [rdi], 0
    je strchr_end
    cmp rdi, rsi
    jmp strchr_found
    inc rdi
    jmp strchr_loop

strchr_found:
    mov rax, rdi
    pop rsi
    pop rdi
    mov rsp, rbp
    pop rbp
    ret

strchr_end:
    mov rax, 0
    pop rsi
    pop rdi
    mov rsp, rbp
    pop rbp
    ret

section .data
    msg: db "Hello, World!", 10, 0
