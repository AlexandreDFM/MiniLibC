;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; strstr.asm
;

bits 64
global strstr

strstr:
    push rbp                  ; Prologue
    mov rbp, rsp              ; Stack Frame Setup
    push rdi                  ; On sauvegarde rdi
    push rsi                  ; On sauvegarde rsi
    mov r8, rsi               ; On copie rsi dans r8
    mov r9, rdi               ; On copie rdi dans r9

strstr_bloop:
    xor rax, rax              ; On met 0 dans rax
    mov rsi, r8               ; On copie rdi dans r8
    mov r9, rdi               ; On copie rdi dans r9

strstr_loop:
    mov al, [rdi]             ; On met dans al le caractère de rdi
    mov bl, [rsi]             ; On met dans bl le caractère de rsi
    inc rdi                   ; On incrémente rdi
    cmp bl, 0                 ; On compare bl et 0
    je strstr_end             ; Si ils sont égaux, on sort de la fonction
    cmp al, 0                 ; On compare al et 0
    je strstr_check           ; Si ils sont égaux, on sort de la fonction
    cmp al, bl                ; On compare al et bl
    jne strstr_bloop          ; Si ils sont différents, on sort de la fonction
    inc rsi                   ; On incrémente rsi
    inc rax                   ; On incrémente rax
    jmp strstr_loop           ; On boucle

strstr_check:
    cmp bl, 0                 ; On compare rax et 0
    je strstr_end             ; Si ils sont égaux, on sort de la fonction
    mov r9, 0                 ; On met 0 dans rdi

strstr_end:
    mov rax, r9               ; On copie rdi dans rax
    pop rsi                   ; On restaure rsi
    pop rdi                   ; On restaure rdi
    mov rsp, rbp              ; Stack Frame Cleanup
    pop rbp                   ; Epilogue
    ret                       ; Return
