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
    xor r8, r8                    ; On initialise r8 à 0
    cmp rdi, 0                    ; On compare rdi à 0
    je memmove_end                ; Si rdi = 0, on sort de la boucle
    cmp rsi, 0                    ; On compare rsi à 0
    je memmove_end                ; Si rsi = 0, on sort de la boucle

memmove_loop:
    cmp rdx, rcx                  ; On compare rdx à rcx
    je memmove_loop_end           ; Si rdx = rcx, on sort de la boucle
    mov r8b, byte [rsi + rcx]     ; On copie le contenu de r8 dans al
    push r8                       ; On empile r8
    inc rcx                       ; On incrémente rcx
    jmp memmove_loop              ; On boucle

memmove_loop_end:
    dec rcx                       ; On décrémente rcx
    pop r8                        ; On dépile r8
    mov byte [rdi + rcx], r8b     ; On copie le contenu de r8 dans rdi
    cmp rcx, 0                    ; On compare rcx à 0
    je memmove_end                ; Si rdx = 0, on sort de la boucle
    jmp memmove_loop_end          ; On boucle

memmove_end:
    mov rax, rdi                  ; On copie rdi dans rax
    mov rbp, rsp                  ; Stack Frame Cleanup
    pop rbp                       ; Epilogue
    ret                           ; Return
