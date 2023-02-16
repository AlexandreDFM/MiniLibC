;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; memset.asm
;

bits 64
global my_memset

my_memset:
    push rbp                  ; Prologue
    mov rbp, rsp              ; Stack Frame Setup
    cmp rdx, 0                ; On compare rdx à 0
    je memset_end             ; Si rdx est égal à 0, on sort de la fonction

memset_loop:
    mov byte [rdi], sil       ; On copie sil dans rdi
    inc rdi                   ; On incrémente rdi
    dec rdx                   ; On décrémente rdx
    jnz memset_loop           ; On boucle tant que rdx n'est pas nul

memset_end:
    mov rax, rdi              ; On met rdi dans rax
    pop rbp                   ; Epilogue
    ret                       ; On retourne
