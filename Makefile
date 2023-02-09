##
## EPITECH PROJECT, 2023
## B-ASM-400-NCE-4-1-asmminilibc-alexandre-kevin.de-freitas-martins
## File description:
## Makefile
##

NAME		=	libasm.so

NASM    	=   nasm

NASMFLAGS	=	-f elf64

LINK 		=	ld

LINKFLAGS 	= 	-shared

RM			=	rm -f

SRC 		=   lib/minilib/strlen.asm 			\
				lib/minilib/strchr.asm 			\
				lib/minilib/strrchr.asm 		\
				lib/minilib/memset.asm 			\
				lib/minilib/memcpy.asm 			\
				lib/minilib/strcmp.asm 			\
#				lib/minilib/memmove.asm 		\
#				lib/minilib/strncmp.asm 		\
#				lib/minilib/strcasecmp.asm 		\
#				lib/minilib/strstr.asm 			\
#				lib/minilib/strpbrk.asm 		\
#				lib/minilib/strcspn.asm			\

OBJ    		=    $(SRC:.asm=.o)

%.o : %.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

all: $(OBJ)
	$(LINK) $(LINKFLAGS) -o $(NAME) $(OBJ)

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re:	fclean all
