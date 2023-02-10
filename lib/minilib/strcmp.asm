;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; strcmp.asm
;

global strcmp

strcmp:
    push rbp                ; Prologue
    mov rbp, rsp            ; Stack Frame Setup
    push rdi                ; On sauvegarde rdi
    push rsi                ; On sauvegarde rsi
    mov rax, 0              ; On met 0 dans rax

strcmp_loop:
    mov al, [rdi]           ; On met dans al le caractère de rdi
    mov bl, [rsi]           ; On met dans bl le caractère de rsi
    inc rdi                 ; On incrémente rdi
    inc rsi                 ; On incrémente rsi
    cmp al, 0               ; On compare al et 0
    je strcmp_value         ; Si ils sont égaux, on sort de la fonction
    cmp bl, 0               ; On compare bl et 0
    je strcmp_value         ; Si ils sont égaux, on sort de la fonction
    cmp al, bl              ; On compare al et bl
    je strcmp_loop          ; Si ils sont égaux, on boucle

strcmp_value:
    cmp al, bl              ; On compare al et bl
    je strcmp_end           ; Si ils sont égaux, on sort de la fonction
    jg strcmp_right         ; Si al est plus grand que bl, on va à strcmp_right
    jl strcmp_left          ; Si al est plus petit que bl, on va à strcmp_left

strcmp_left:
    mov rax, -1             ; On met -1 dans rax
    jmp strcmp_end          ; On sort de la fonction

strcmp_right:
    mov rax, 1              ; On met 1 dans rax
    jmp strcmp_end          ; On sort de la fonction

strcmp_end:
    pop rsi                 ; On restaure rsi
    pop rdi                 ; On restaure rdi
    mov rbp, rsp            ; Stack Frame Cleanup
    pop rbp                 ; Epilogue
    ret                     ; Return
