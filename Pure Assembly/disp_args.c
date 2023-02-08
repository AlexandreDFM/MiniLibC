/*
** EPITECH PROJECT, 2023
** B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
** File description:
** disp_args.c
*/

#include <stdio.h>

extern int my_strlen(const char *str);
extern void disp_string(char *str);

int main(int argc, char **argv) {
    for (int i = 1; i < argc; i++) {
        disp_string(argv[i]);
    }
}
