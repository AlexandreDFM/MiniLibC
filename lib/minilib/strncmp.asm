;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; strncmp.asm
;

bits 64
global strncmp

strncmp:
    push rbp              ; Prologue
    mov rbp, rsp          ; Stack Frame Setup
    push rdi              ; On sauvegarde rdi
    push rsi              ; On sauvegarde rsi
    push rdx              ; On sauvegarde rdx
    push rcx              ; On sauvegarde rcx
    xor rcx, rcx          ; On initialise rcx à 0
    xor rax, rax          ; On initialise rax à 0

strncmp_loop:
    mov al, [rdi + rcx]   ; On met dans al le caractère de rdi
    mov bl, [rsi + rcx]   ; On met dans bl le caractère de rsi
    cmp al, 0             ; On compare al à 0
    je strncmp_value      ; Si al est égal à 0, on sort de la fonction
    cmp bl, 0             ; On compare bl à 0
    je strncmp_value      ; Si bl est égal à 0, on sort de la fonction
    cmp al, bl            ; On compare al et bl
    jne strncmp_value     ; Si ils sont différents, on sort de la fonction
    inc rcx               ; On incrémente rax
    cmp rcx, rdx          ; On compare rax et rdx
    jne strncmp_loop      ; Si rax est différent de rdx, on boucle

strncmp_value:
    cmp rcx, rdx          ; On compare rax et rdx
    je strncmp_pre_end    ; Si rax est égal à rdx, on va à la fin de la fonction
    cmp al, 0             ; On compare al à 0
    je strncmp_al_null    ; Si al est égal à 0, on va à strcmp_al_null
    cmp bl, 0             ; On compare bl à 0
    je strncmp_bl_null    ; Si bl est égal à 0, on va à strcmp_bl_null
    sub al, bl            ; On soustrait bl à al
    movsx rax, al         ; On met al dans rax
    jmp strncmp_end       ; On va à la fin de la fonction

strncmp_al_null:
    mov al, bl            ; On met -1 dans rax
    mov r8, -1            ; On met -1 dans r8
    mul r8                ; On multiplie rax par r8
    jmp strncmp_end       ; On va à la fin de la fonction

strncmp_bl_null:
    mov al, al            ; On met -1 dans rax
    jmp strncmp_end       ; On va à la fin de la fonction

strncmp_pre_end:
    mov rax, 0            ; On met rdx dans rax

strncmp_end:
    pop rcx               ; On restaure rcx
    pop rdx               ; On restaure rdx
    pop rsi               ; On restaure rsi
    pop rdi               ; On restaure rdi
    mov rbp, rsp          ; Stack Frame Cleanup
    pop rbp               ; Epilogue
    ret                   ; Return
