/*
** EPITECH PROJECT, 2023
** B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
** File description:
** file.c
*/

#include <unistd.h>

void my_putchar(char c)
{
    write(1, &c, 1);
}

int my_strlen(char const *str)
{
    return *str ? my_strlen(++str) + 1 : 0;
}

void my_putstr(char const *str)
{
    write(1, str, my_strlen(str));
}

void *malloc(size_t size)
{
    (void) size;
    write(2, "Flying cats are the best!!!", 27);
    return NULL;
}
