NAME =				libft.a

NAME_DEBUG =		libft_debug.a

NAME_TEST =			libft_test

NAME_TEST_DEBUG =	libft_test_debug


SRCS_PATH =		srcs/

SRCS =\
				bools/reverse_bool.c	\
\
\
				char/isalnum.c	\
				char/isalpha.c	\
				char/isascii.c	\
				char/isdigit.c	\
				char/isprint.c	\
				char/isspace.c	\
				char/toupper.c	\
				char/tolower.c	\
\
\
				io/get_next_line/get_next_line_multi_fd.c		\
				io/get_next_line/get_next_line_utils_multi_fd.c	\
				io/get_next_line/get_next_line_utils.c			\
				io/get_next_line/get_next_line.c				\
\
				io/putchar_fd.c		\
				io/putendl_fd.c		\
				io/putnbr_fd.c		\
				io/putstr_fd.c		\
				io/putstr.c			\
\
				io/printf/printf.c			\
				io/printf/get_final_str.c	\
				io/printf/formating/format.c		\
				io/printf/formating/format_u_x.c	\
\
\
				linked_list/int/lsti_add_back.c					\
				linked_list/int/lsti_add_front.c				\
				linked_list/int/lsti_clear.c					\
				linked_list/int/lsti_cmp.c						\
				linked_list/int/lsti_cpy.c						\
				linked_list/int/lsti_delone.c					\
				linked_list/int/lsti_get_next_free_current.c	\
				linked_list/int/lsti_iter.c						\
				linked_list/int/lsti_last.c						\
				linked_list/int/lsti_map.c						\
				linked_list/int/lsti_new.c						\
				linked_list/int/lsti_push.c						\
				linked_list/int/lsti_reverse.c					\
				linked_list/int/lsti_size.c						\
\
				linked_list/lst_get_next_free_current.c	\
				linked_list/lst_push.c					\
				linked_list/lst_reverse.c				\
				linked_list/lstadd_back.c				\
				linked_list/lstadd_front.c				\
				linked_list/lstclear.c					\
				linked_list/lstdelone.c					\
				linked_list/lstiter.c					\
				linked_list/lstlast.c					\
				linked_list/lstmap.c					\
				linked_list/lstnew.c					\
				linked_list/lstsize.c					\
\
\
				math/angle_to_theta.c	\
\
\
				mem/bzero.c			\
				mem/calloc.c		\
				mem/memchr.c		\
				mem/memcmp.c		\
				mem/memcpy.c		\
				mem/memmove.c		\
				mem/memset.c		\
\
\
				numbers/swap/swap_double.c	\
				numbers/swap/swap_int.c		\
				numbers/swap/swap_long.c	\
				numbers/swap/swap_size_t.c	\
				numbers/swap/swap_ssize_t.c	\
				numbers/swap/swap_uint.c	\
\
				numbers/abs.c	\
				numbers/atoi.c	\
				numbers/atoll.c	\
				numbers/itoa.c	\
\
\
				string/split/free_split.c	\
				string/split/split_set.c	\
				string/split/split_size.c	\
				string/split/split.c		\
\
				string/join/join_strs.c	\
				string/join/strjoin.c	\
\
				string/skip_char.c	\
				string/strchr.c		\
				string/strcmp.c		\
				string/strdup.c		\
				string/striteri.c	\
				string/strlcat.c	\
				string/strlcpy.c	\
				string/strlen.c		\
				string/strmapi.c	\
				string/strncmp.c	\
				string/strnstr.c	\
				string/strrchr.c	\
				string/strtrim.c	\
				string/substr.c


TEST_DIR = test/

SRCS_TEST =\
				headers/test/ft_string_test.h.c	\
\
\
				includes/ft_bools.h.c		\
				includes/ft_char.h.c		\
				includes/ft_io.h.c			\
				includes/ft_linked_list.h.c	\
				includes/ft_math.h.c		\
				includes/ft_mem.h.c			\
				includes/ft_numbers.h.c		\
				includes/ft_string.h.c		\
				includes/libft.h.c			\
\
\
				srcs/string/join/join_strs_test.c	\
\
\
				main.c


HEADERS =\
				${INCLUDES}ft_bools.h		\
				${INCLUDES}ft_char.h		\
				${INCLUDES}ft_io.h			\
				${INCLUDES}ft_linked_list.h	\
				${INCLUDES}ft_math.h		\
				${INCLUDES}ft_mem.h			\
				${INCLUDES}ft_numbers.h		\
				${INCLUDES}ft_string.h		\
				${INCLUDES}libft.h

INCLUDES =		includes/


TEST_OBJS_DIR = ${DIR_OBJS}test/

DIR_OBJS = 		build/

OBJS =			${addprefix ${DIR_OBJS},${SRCS:.c=.o}}

OBJS_DEBUG =	${addprefix ${DIR_OBJS},${SRCS:.c=_debug.o}}

OBJS_TEST =		${addprefix ${TEST_OBJS_DIR},${SRCS_TEST:.c=.o}}

OBJS_TEST_DEBUG =	${addprefix ${TEST_OBJS_DIR},${SRCS_TEST:.c=_debug.o}}


FLAGS_NO_O3 =	-Wall -Wextra -Werror

FLAGS =			${FLAGS_NO_O3} -O3

DEBUG_FLAGS	=	${FLAGS_NO_O3} -g3 -fsanitize=address


RMF =	 		rm -f

MKDIR = 		mkdir -p


all:			${DIR_OBJS}
				@${MAKE} ${NAME}

$(NAME):		${OBJS}
				ar rcs ${NAME} ${OBJS}

${DIR_OBJS}: Makefile
			@echo ${OBJS} ${OBJS_TEST} | tr ' ' '\n'\
				| sed 's|\(.*\)/.*|\1|'\
				| sed 's/^/${MKDIR} /'\
				| sh -s
			@# Prints all OBJS. 1 per line
				@# Removes the .o file names
				@# Adds mkdir -p at start of each lines
				@# Executes the script (Creates all folders)

${DIR_OBJS}%.o: ${SRCS_PATH}%.c ${HEADERS} Makefile
				${CC} ${FLAGS} -I ${INCLUDES} -c $< -o $@

${DIR_OBJS}%_debug.o: ${SRCS_PATH}%.c ${HEADERS} Makefile
				${CC} ${DEBUG_FLAGS} -I ${INCLUDES} -c $< -o $@

clean:
				${RMF} ${OBJS} ${OBJS_DEBUG}

fclean:			clean
				${RMF} ${NAME} ${NAME_DEBUG}

re:				fclean
				${MAKE} all

re_debug:		fclean
				${MAKE} debug

echo_objs:
				@echo ${OBJS}

debug:			${DIR_OBJS}
				@${MAKE} ${NAME_DEBUG}

${NAME_DEBUG}: ${OBJS_DEBUG}
				ar rcs ${NAME_DEBUG} ${OBJS_DEBUG}

test:			${DIR_OBJS}
				${MAKE} all
				${MAKE} debug
				${MAKE} ${NAME_TEST}
				${MAKE} ${NAME_TEST_DEBUG}
				./${NAME_TEST}
				./${NAME_TEST_DEBUG}

${NAME_TEST}:	${OBJS_TEST}
				${CC} ${FLAGS} -I ${INCLUDES} -L. -lft ${OBJS_TEST}\
					-o ${NAME_TEST}

${NAME_TEST_DEBUG}: ${OBJS_TEST_DEBUG}
				${CC} ${DEBUG_FLAGS} -I ${INCLUDES} -L. -lft_debug\
					${OBJS_TEST_DEBUG} -o ${NAME_TEST_DEBUG}

${TEST_OBJS_DIR}%.o: ${TEST_DIR}%.c ${HEADERS} Makefile
				${CC} ${FLAGS} -I ${INCLUDES} -I test/headers -c $< -o $@

${TEST_OBJS_DIR}%_debug.o: ${TEST_DIR}%.c ${HEADERS} Makefile
				${CC} ${DEBUG_FLAGS} -I ${INCLUDES} -I test/headers -c $< -o $@

.PHONY:			all clean fclean re re_debug echo_objs debug test
