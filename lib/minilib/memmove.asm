;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; memmove.asm
;

bits 64
global memmove

memmove:
    push rbp                ; Prologue
    mov rbp, rsp            ; Stack Frame Setup
    push rdi                ; On sauvegarde rdi
    push rsi                ; On sauvegarde rsi
    push rdx                ; On sauvegarde rdx

memmove_loop:
    cmp rdx, 0              ; On compare rdx à 0
    je memmove_loop_end     ; Si rdx = 0, on sort de la boucle
    mov al, [rsi]           ; On copie le contenu de rsi dans al
    mov [rdi], al           ; On copie le contenu de al dans rdi
    inc rsi                 ; On incrémente rsi
    inc rdi                 ; On incrémente rdi
    dec rdx                 ; On décrémente rdx
    jmp memmove_loop        ; On boucle

memmove_loop_end:
    mov rax, rdi            ; On copie rdi dans rax
    pop rdx                 ; On restaure rdx
    pop rsi                 ; On restaure rsi
    pop rdi                 ; On restaure rdi
    mov rbp, rsp            ; Stack Frame Cleanup
    pop rbp                 ; Epilogue
    ret                     ; Return
