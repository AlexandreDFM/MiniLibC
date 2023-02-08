;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; my_strlen.asm
;

bits 64
global my_strlen

my_strlen:
    push rbp           ; Prologue
    mov rbp, rsp       ; Stack Frame Setup
    push rdx           ; On sauvegarde rdi
    xor rdx, rdx       ; On met 0 dans rdx
    cmp rdi, 0         ; On compare rdi avec 0 (NULL)
    je my_strlen_end   ; Si c'est 0, on sort de la fonction

my_strlen_loop:
    cmp byte [rdi], 0  ; Compare le byte à l'adresse rdi avec 0 (NULL)
    je my_strlen_end   ; Si c'est 0, on sort de la boucle
    inc rdi            ; Sinon, on incrémente rdi
    inc rdx            ; Et on incrémente rax
    jmp my_strlen_loop ; On boucle

my_strlen_end:
    mov rax, rdx       ; On met le résultat dans rax
    pop rdx            ; On restaure rdi
    mov rsp, rbp       ; Stack Frame Cleanup
    pop rbp            ; Epilogue
    ret                ; Return


;section .text
;    global _start
;
;_start:
;    mov rdi, msg       ; On met l'adresse de msg dans rdi
;    call my_strlen     ; On appelle la fonction my_strlen
;    mov rdx, rax       ; On met le résultat dans rdx
;    mov rax, 1         ; Write System Call
;    mov rdi, 1         ; File Descriptor (stdout)
;    mov rsi, msg       ; Set Message in rsi
;    mov rdx, rdx       ; Set Message Length in rdx
;    syscall            ; Call Kernel to execute write
;    mov rax, 60        ; Exit System Call
;    mov rdi, 0         ; Exit code
;    syscall            ; Call Kernel to execute exit
;    ret                ; Return
;
;section .data
;    msg db "Hello World!Hello World!Hello World!", 0
;
