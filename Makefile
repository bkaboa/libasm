NAME :=			libasm.a
NAME_BONUS :=	libasm.a
BONUS_TEST :=	bonus_test
TEST :=			test

OBJ_DIR :=		.obj
SRC_ASM	:=				ft_write 	\
						ft_strdup 	\
						ft_strlen 	\
						ft_strcpy 	\
						ft_read		\
						ft_strcmp

SRC_ASM_BONUS :=		ft_atoi_base		\
						ft_list_push_front	\
						ft_list_size		\
						ft_list_remove_if	\
						ft_list_sort

ASM :=			.s
SRC :=			$(addsuffix $(ASM),$(SRC_ASM))
OBJ :=			$(addprefix $(OBJ_DIR)/,$(SRC:.s=.o))

SRC_bonus :=	$(addsuffix $(ASM),$(SRC_ASM_BONUS))
OBJ_bonus :=	$(addprefix $(OBJ_DIR)/,$(SRC_bonus:.s=.o)) $(OBJ)

ASM_FLAGS :=	-f elf64
DEBUG_FLAGS :=	-g -F dwarf

HEADER :=		libasm.h

all: $(NAME)

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)
	# @ranlib $(NAME)
	echo "\033[32m$(NAME) created\033[0m"

bonus:$(NAME_BONUS)

$(NAME_BONUS): $(OBJ_bonus)
	ar rc $(NAME_BONUS) $(OBJ_bonus)
	# @ranlib $(NAME_BONUS)
	echo "\033[32m$(NAME_BONUS) created\033[0m"

$(OBJ_DIR)/%.o: %.s $(HEADER) Makefile
	mkdir -p $(OBJ_DIR)
	nasm $(ASM_FLAGS) $< -o $@
	echo "\033[32m$@ created\033[0m"

clean:
	@rm -rf $(OBJ_DIR)
	@echo "\033[31m$(OBJ_DIR) deleted\033[0m"

fclean: clean
	@rm -f $(NAME)
	@rm -f $(TEST)
	@rm -f $(BONUS_TEST)
	@rm -f $(NAME_BONUS)
	@echo "\033[31m$(NAME) deleted\033[0m"

compile:
	gcc main.c $(NAME) -o $(TEST)
compile_bonus:
	gcc main_bonus.c $(NAME) -o $(BONUS_TEST)

re: fclean all

debug: ASM_FLAGS += $(DEBUG_FLAGS)
debug: re

PHONY: all clean fclean re
