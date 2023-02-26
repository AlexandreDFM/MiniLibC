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
    xor rax, rax               ; On met 0 dans rdx
    cmp rdi, 0                 ; On compare à 0
    je ffs_end                 ; Si c'est 0, on sort
    inc rax                    ; On incrémente rdx

ffs_loop:
    and rdi, 1                 ; On compare à 1
    jne ffs_end                ; Si c'est 1, on sort
    shr rdi, 1                 ; On fait un shift right de 1
    inc rax                    ; On incrémente rdx
    cmp rdi, 0                 ; On compare à 0
    je ffs_end                 ; Si c'est 0, on sort
    jmp ffs_loop               ; On boucle

ffs_end:
    mov rsp, rbp               ; Stack Frame Cleanup
    pop rbp                    ; Epilogue
    ret                        ; Return

