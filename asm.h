#ifndef ASM_H
#define ASM_H

#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <fcntl.h>
#include <sys/types.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>


extern __attribute__((sysv_abi)) int ft_strcmp(const char *s1, const char *s2);
extern __attribute__((sysv_abi)) size_t ft_strlen(const char* s);
extern __attribute__((sysv_abi)) char *ft_strcpy(char *restrict dst, const char *restrict src);
extern __attribute__((sysv_abi)) ssize_t ft_write(int fd, const void *buf, size_t count);
extern __attribute__((sysv_abi)) ssize_t ft_read(int fd, void *buf, size_t count);
extern __attribute__((sysv_abi)) char *ft_strdup(const char *s);


//BONUS

extern __attribute__((sysv_abi)) int ft_putnbr_base(int nbr, char *base);

typedef struct  s_list
{
    void            *data;
    struct s_list   *next;
}               t_list;

extern __attribute__((sysv_abi)) void ft_list_push_front(t_list **begin_list, void *data);
extern __attribute__((sysv_abi)) int ft_list_size(t_list *begin_list);
extern __attribute__((sysv_abi)) void ft_list_sort(t_list **begin_list, int (*cmp)());
extern __attribute__((sysv_abi)) void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

#endif