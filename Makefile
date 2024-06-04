NAME :=			libasm.a
TEST :=			test

OBJ_DIR :=		.obj
SRC_ASM	:=	ft_write \
						ft_strlen \
						ft_strcpy \
						ft_strcmp
ASM :=			.s
SRC :=			$(addsuffix $(ASM),$(SRC_ASM))
OBJ :=			$(addprefix $(OBJ_DIR)/,$(SRC:.s=.o))

ASM_FLAGS :=	-f elf64
DEBUG_FLAGS :=	-g -F dwarf

HEADER :=		libasm.h
all: $(NAME)

$(NAME): $(OBJ)
	@ar rc $(NAME) $(OBJ)
	@# @ranlib $(NAME)
	@echo "\033[32m$(NAME) created\033[0m"

$(OBJ_DIR)/%.o: %.s $(HEADER) Makefile
	@mkdir -p $(OBJ_DIR)
	@nasm -f elf64 $< -o $@
	@echo "\033[32m$@ created\033[0m"

clean:
	@rm -rf $(OBJ_DIR)
	@echo "\033[31m$(OBJ_DIR) deleted\033[0m"

fclean: clean
	@rm -f $(NAME)
	@rm -f $(TEST)
	@echo "\033[31m$(NAME) deleted\033[0m"

compile:
	gcc main.c -Ilibasm.h libasm.a -o $(TEST)

re: fclean all

debug: ASM_FLAGS += $(DEBUG_FLAGS)
debug: re

PHONY: all clean fclean re
