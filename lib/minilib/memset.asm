;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; memset.asm
;

bits 64
global memset

memset:
    push rbp                  ; Prologue
    mov rbp, rsp              ; Stack Frame Setup
    push rdi                  ; On sauvegarde rdi
    push rsi                  ; On sauvegarde rsi
    push rdx                  ; On sauvegarde rdx

memset_loop:
    mov byte [rdi], sil       ; On copie sil dans rdi
    inc rdi                   ; On incrémente rdi
    dec rdx                   ; On décrémente rdx
    jnz memset_loop           ; On boucle tant que rdx n'est pas nul
    pop rdx                   ; On restaure rdx
    pop rsi                   ; On restaure rsi
    pop rdi                   ; On restaure rdi
    mov rax, rdi              ; On met rdi dans rax
    pop rbp                   ; Epilogue
    ret                       ; On retourne
