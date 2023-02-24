;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; memmove.asm
;

bits 64
global memmove

memmove:
    push rbp                    ; Prologue
    mov rbp, rsp                ; Stack Frame Setup
    xor r8, r8                  ; On initialise r8 à 0
    mov rax, rdi                ; On copie rdi dans rax
    cmp rdi, rsi                ; On compare rdi et rsi
    je memmove_end              ; Si rdi = rsi, on sort de la boucle
    jb memmove_bforward         ; Si rdi < rsi, on va copier de gauche à droite
    mov rcx, rsi                ; On copie rsi dans rcx
    add rcx, rdx                ; On ajoute rdx à rcx
    cmp rdi, rcx                ; On compare rdi et rcx
    jae memmove_bforward        ; Si rdi >= rcx, on va copier de gauche à droite

memmove_backward:
    cmp rdx, 0                  ; On compare rdx à 0
    je memmove_end              ; Si rdx = 0, on sort de la boucle
    dec rdx                     ; On décrémente rcx
    mov r8b, byte [rsi + rdx]   ; On copie le contenu de rsi dans r8b
    mov byte [rdi + rdx], r8b   ; On copie le contenu de r8b dans rdi
    jmp memmove_backward        ; On boucle

memmove_bforward:
    xor rcx, rcx                ; On initialise rcx à 0

memmove_forward:
    cmp rdx, rcx                ; On compare rdx à 0
    je memmove_end              ; Si rdx = 0, on sort de la boucle
    mov r8b, byte [rsi + rcx]   ; On copie le contenu de rsi dans al
    mov byte [rdi + rcx], r8b   ; On copie le contenu de al dans rdi
    inc rcx                     ; On incrémente rcx
    jmp memmove_forward         ; On boucle

memmove_end:
    mov rbp, rsp                ; Stack Frame Cleanup
    pop rbp                     ; Epilogue
    ret                         ; On retourne
