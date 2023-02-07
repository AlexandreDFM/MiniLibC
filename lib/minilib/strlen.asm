;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; strlen.asm
;

bits 64
global strlen

strlen:
    push rbp           ; Prologue
    mov rbp, rsp       ; Stack Frame Setup
    push rdi           ; On sauvegarde rdi
    push rdx           ; On sauvegarde rdx
    xor rdx, rdx       ; On met 0 dans rdx
    cmp rdi, 0         ; On compare rdi avec 0 (NULL)
    je strlen_end      ; Si c'est NULL, on sort de la fonction

strlen_loop:
    cmp byte [rdi], 0  ; Compare le byte à l'adresse rdi avec 0 (NULL)
    je strlen_end      ; Si c'est 0, on sort de la boucle
    inc rdi            ; Sinon, on incrémente rdi
    inc rdx            ; Et on incrémente rax
    jmp strlen_loop    ; On boucle

strlen_end:
    mov rax, rdx       ; On met le résultat dans rax
    pop rdx            ; On restaure rdx
    pop rdi            ; On restaure rdi
    mov rsp, rbp       ; Stack Frame Cleanup
    pop rbp            ; Epilogue
    ret                ; Return
