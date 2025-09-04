ASM     = nasm
ASFLAGS = -f elf64
GCCFLAGS = -g -O0 -z noexecstack -fno-builtin
LIB = -L./ -lasm

AR      = ar
ARFLAGS = rcs


NAME = libasm.a 

SRC_DIR = src/
OBJ_DIR = obj/

SRC     = 	ft_strcmp.s		\
			ft_strcpy.s		\
			ft_strlen.s		\
			ft_write.s		\
			ft_read.s		\
			ft_strdup.s		\
			ft_putnbr_base.s 


OBJ = $(addprefix $(OBJ_DIR), $(SRC:.s=.o))

$(OBJ_DIR)%.o: $(SRC_DIR)%.s
	@mkdir -p $(OBJ_DIR)
	$(ASM) $(ASFLAGS) -o $@ $<

all: $(NAME)

$(NAME): $(OBJ)
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)
	@echo "$(NAME) compiled."

clean:
	@rm -rf $(OBJ_DIR)
	@echo "Objects files removed."

fclean: clean
	@$(RM) $(NAME)
	@rm -f test
	@echo "$(NAME) removed. Test removed."

test: $(NAME) main.c
	@gcc $(GCCFLAGS) main.c $(LIB) -o test
	@echo "Test compiled!"

re: fclean all test

.PHONY: all clean fclean re bonus