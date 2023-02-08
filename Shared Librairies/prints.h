/*
** EPITECH PROJECT, 2023
** B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
** File description:
** file.h
*/

#ifndef FILE_H_
	#define FILE_H_

#include <unistd.h>

extern void my_putchar(char c);
extern int my_strlen(char const *str);
extern void my_putstr(char const *str);
extern void *malloc(size_t size);

#endif /*FILE_H_*/
