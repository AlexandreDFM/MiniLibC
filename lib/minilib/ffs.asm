;
; EPITECH PROJECT, 2023
; B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
; File description:
; ffs.asm
;

bits 64
global ffs

ffs:
    push rbp                   ; Prologue
    mov rbp, rsp               ; Stack Frame Setup
    push rdi                   ; On sauvegarde rdi
    push rdx                   ; On sauvegarde rdx
    xor rdx, rdx               ; On initialise rdx à 0
    cmp rdi, 0                 ; On regarde si rdi est égal à 0
    je ffs_end_null            ; Si oui, on sort de la boucle

ffs_loop:
    cmp byte [rdi], 0          ; On regarde si rdi est égal à 0
    je ffs_end_null            ; Si oui, on sort de la boucle
    and rdi, 1                 ; On regarde si le bit de poids faible est à 1
    jz ffs_end                 ; Si oui, on sort de la boucle
    shr rdi, 1                 ; Sinon, on décale rdi de 1 bit vers la droite
    inc rdi                    ; On incrémente rdi
    inc rdx                    ; On incrémente rdx
    jmp ffs_loop               ; On boucle

ffs_end_null:
    mov rax, 0                 ; On met 0 dans rax
    pop rdx                    ; On restaure rdx
    pop rdi                    ; On restaure rdi
    mov rsp, rbp               ; Stack Frame Cleanup
    pop rbp                    ; Epilogue
    ret                        ; Return

ffs_end:
    add rdx, 1                 ; On incrémente rdi
    mov rax, rdx               ; On met rdx dans rax
    pop rdx                    ; On restaure rdx
    pop rdi                    ; On restaure rdi
    mov rsp, rbp               ; Stack Frame Cleanup
    pop rbp                    ; Epilogue
    ret                        ; Return
