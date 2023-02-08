;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; disp_string.asm
;

bits 64
extern printf
extern my_strlen

section .text
    global disp_string

disp_string:
    push rdi                ; On sauvegarde rdi
    call my_strlen          ; On appelle la fonction
    mov rdx, rax            ; On met le résultat dans rdx
    pop rdi                 ; On restaure rdi
    mov	rsi, rdi            ; On mets rdi dans rsi
    mov	rdi, fmt            ; Rdi prends la valeur de fmt (Printf format)
    mov rax, 0              ; rax = 0
    call printf             ; Call printf
    ret                     ; Return

section .data
    fmt: db "%s: %d", 10, 0
