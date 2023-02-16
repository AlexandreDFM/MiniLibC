;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; memmove.asm
;

bits 64
global memmove

memmove:
    push rbp                      ; Prologue
    mov rbp, rsp                  ; Stack Frame Setup
    xor rcx, rcx                  ; On initialise rcx à 0
    cmp rdi, 0                    ; On compare rdi à 0
    je memmove_loop_end           ; Si rdi = 0, on sort de la boucle
    cmp rsi, 0                    ; On compare rsi à 0
    je memmove_loop_end           ; Si rsi = 0, on sort de la boucle

memmove_loop:
    cmp rdx, rcx                  ; On compare rdx à 0
    je memmove_loop_end           ; Si rdx = 0, on sort de la boucle
    mov al, byte [rsi + rcx]      ; On copie le contenu de rsi dans al
    mov byte [rdi + rcx], al      ; On copie le contenu de al dans rdi
    inc rcx                       ; On incrémente rcx
    jmp memmove_loop              ; On boucle

memmove_loop_end:
    mov rbp, rsp                  ; Stack Frame Cleanup
    pop rbp                       ; Epilogue
    ret                           ; Return
