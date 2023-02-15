;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; strpbrk.asm
;

bits 64
global strpbrk

strpbrk:
    push rbp               ; Prologue
    mov rbp, rsp           ; Stack Frame Setup
    push rdi               ; On sauvegarde rdi
    push rsi               ; On sauvegarde rsi
    mov r8, rsi            ; On sauvegarde rsi dans r8
    cmp rdi, 0             ; Compare le byte à l'adresse rdi avec 0 (NULL)
    je strpbrk_pre_end     ; Si c'est le cas, on sort de la boucle
    cmp rsi, 0             ; Compare le byte à l'adresse rsi avec 0 (NULL)
    je strpbrk_pre_end     ; Si c'est le cas, on sort de la boucle

strpbrk_loop:
    cmp byte [rsi], 0      ; Compare le byte à l'adresse rsi avec 0 (NULL)
    je strpbrk_bloop       ; Si c'est le cas, on sort de la boucle
    mov al, [rdi]          ; On met dans al le caractère de rdi
    mov bl, [rsi]          ; On met dans bl le caractère de rsi
    cmp al, bl             ; Compare le byte al avec le byte bl
    je strpbrk_pre_end     ; Si c'est le cas, on sort de la boucle
    inc rsi                ; On incrémente rsi pour passer au byte suivant
    jmp strpbrk_loop       ; On revient au début de la boucle

strpbrk_bloop:
    cmp byte [rdi], 0      ; Compare le byte à l'adresse rdi avec 0 (NULL)
    je strpbrk_pre_end     ; Si c'est le cas, on sort de la boucle
    mov rsi, r8            ; On remet rsi à sa valeur initiale
    inc rdi                ; On incrémente rdi pour passer au byte suivant
    jmp strpbrk_loop       ; On revient au début de la boucle

strpbrk_pre_end:
    cmp byte [rdi], 0      ; Compare le byte à l'adresse rdi avec 0 (NULL)
    je strpbrk_null        ; Si c'est le cas, on va à strpbrk_null
    jne strpbrk_notnull    ; Si ce n'est pas le cas, on va à strpbrk_notnull

strpbrk_null:
    mov rax, 0             ; On met dans rax 0
    jmp strpbrk_end        ; On sort de la boucle

strpbrk_notnull:
    mov rax, rdi           ; On met dans rax l'adresse de rdi

strpbrk_end:
    pop rsi                ; On restaure rsi
    pop rdi                ; On restaure rdi
    mov rsp, rbp           ; Stack Frame Cleanup
    pop rbp                ; Epilogue
    ret                    ; Return
