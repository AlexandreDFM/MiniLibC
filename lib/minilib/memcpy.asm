;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; memcpy.asm
;

global memcpy

memcpy:
    push rbp                ; Prologue
    mov rbp, rsp            ; Stack Frame Setup
    push rdi                ; On sauvegarde rdi
    push rsi                ; On sauvegarde rsi
    push rdx                ; On sauvegarde rdx

memcpy_loop:
    cmp rdx, 0              ; On compare rdx à 0
    je memcpy_loop_end   ; Si rdx = 0, on sort de la boucle
    mov al, [rsi]           ; On copie le contenu de rsi dans al
    mov [rdi], al           ; On copie le contenu de al dans rdi
    inc rsi                 ; On incrémente rsi
    inc rdi                 ; On incrémente rdi
    dec rdx                 ; On décrémente rdx
    jmp memcpy_loop      ; On boucle

memcpy_loop_end:
    pop rdx                 ; On restaure rdx
    pop rsi                 ; On restaure rsi
    pop rdi                 ; On restaure rdi
    mov rbp, rsp            ; Stack Frame Cleanup
    pop rbp                 ; Epilogue
    ret                     ; Return
