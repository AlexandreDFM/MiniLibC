;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; strncmp.asm
;

global strcasecmp

strcasecmp:
    push rbp                    ; Prologue
    mov rbp, rsp                ; Stack Frame Setup
    push rdi                    ; On sauvegarde rdi
    push rsi                    ; On sauvegarde rsi
    xor rax, rax                ; On initialise rax à 0

strcasecmp_loop:
    mov al, [rdi]               ; On met dans al le caractère de rdi
    mov bl, [rsi]               ; On met dans bl le caractère de rsi
    cmp al, 0                   ; On compare al à 0
    je strcasecmp_end           ; Si al est égal à 0, on sort de la boucle
    cmp bl, 0                   ; On compare bl à 0
    je strcasecmp_end           ; Si bl est égal à 0, on sort de la boucle
    inc rdi                     ; On incrémente rdi
    inc rsi                     ; On incrémente rsi
    cmp al, bl                  ; On compare al à bl
    je strcasecmp_loop          ; Si al est égal à bl, on continue la boucle
    add bl, 32                  ; On ajoute 32 à bl
    cmp al, bl                  ; On compare al à bl
    je strcasecmp_loop          ; Si al est égal à bl, on continue la boucle
    sub bl, 64                  ; On soustrait 32 à bl
    cmp al, bl                  ; On compare al à bl
    je strcasecmp_loop          ; Si al est égal à bl, on continue la boucle
    add bl, 32                  ; On ajoute 32 à bl

strcasecmp_end:
    sub al, bl                  ; On soustrait al à bl
    movsx rax, al               ; On met dans rax le signe étendu de al
    pop rsi                     ; On restaure rsi
    pop rdi                     ; On restaure rdi
    mov rbp, rsp                ; Stack Frame Teardown
    pop rbp                     ; Epilogue
    ret                         ; Return
