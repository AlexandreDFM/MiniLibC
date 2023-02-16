;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; strchr.asm
;

bits 64
global strchr

strchr:
    push rbp                ; Prologue
    mov rbp, rsp            ; Stack Frame Setup
    push rdi                ; On sauvegarde rdi
    push rsi                ; On sauvegarde rsi
    cmp rdi, 0              ; On compare rdi avec 0 (NULL)
    je strchr_end           ; Si c'est NULL, on sort de la fonction

strchr_loop:
    cmp byte [rdi], sil     ; Compare rdi avec rsi
    je strchr_found         ; Si c'est égal, on sort de la boucle
    cmp byte [rdi], 0       ; Compare le byte à l'adresse rdi avec 0 (NULL)
    je strchr_end           ; Si c'est 0, on sort de la boucle
    inc rdi                 ; On incrémente rdi
    jmp strchr_loop         ; On boucle

strchr_found:
    mov rax, rdi            ; On met l'adresse de rdi dans rax
    pop rsi                 ; On restaure rsi
    pop rdi                 ; On restaure rdi
    mov rsp, rbp            ; Stack Frame Cleanup
    pop rbp                 ; Epilogue
    ret                     ; Return

strchr_end:
    mov rax, 0              ; On met NULL dans rax
    pop rsi                 ; On restaure rsi
    pop rdi                 ; On restaure rdi
    mov rsp, rbp            ; Stack Frame Cleanup
    pop rbp                 ; Epilogue
    ret                     ; Return
