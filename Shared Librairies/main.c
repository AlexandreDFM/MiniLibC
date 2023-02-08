/*
** EPITECH PROJECT, 2023
** B-ASM-400-NCE-4-1-bsasmminilibc-alexandre-kevin.de-freitas-martins
** File description:
** main.c
*/

#include "prints.h"
#include <dlfcn.h>

int main(void)
{
    void *handle;
    void (*my_putstr)(char const *str);
    handle = dlopen("./libprints.so", RTLD_LAZY);
    if (!handle) return 84;
    *(void **) (&my_putstr) = dlsym(handle, "my_putstr");
    my_putstr("Hello World!");
    dlclose(handle);
    return 0;
}
