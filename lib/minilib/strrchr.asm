;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; strrchr.asm
;

bits 64
global strrchr

strrchr:
    push rbp                  ; Prologue
    mov rbp, rsp              ; Stack Frame Setup
    push rdi                  ; On sauvegarde rdi
    push rsi                  ; On sauvegarde rsi
    mov rax, 0                ; On met NULL dans rax
    cmp rdi, 0                ; On compare rdi avec 0 (NULL)
    je strrchr_end            ; Si c'est NULL, on sort de la fonction

strrchr_loop:
    cmp byte [rdi], sil       ; Compare rdi avec rsi
    je strrchr_set            ; Si c'est égal, on met rdi dans rax
    cmp byte [rdi], 0         ; Compare le byte à l'adresse rdi avec 0 (NULL)
    je strrchr_end            ; Si c'est 0, on sort de la boucle
    inc rdi                   ; On incrémente rdi
    jmp strrchr_loop          ; On boucle

strrchr_set:
    mov rax, rdi              ; On met le byte à l'adresse rsi dans sil
    inc rdi                   ; On incrémente rdi
    jmp strrchr_loop          ; On boucle

strrchr_end:
    pop rsi                   ; On restaure rsi
    pop rdi                   ; On restaure rdi
    mov rsp, rbp              ; Stack Frame Cleanup
    pop rbp                   ; Epilogue
    ret                       ; Return
