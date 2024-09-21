#ifndef LIBASM_H
# define LIBASM_H

# include <sys/types.h>
# include <stdio.h>
# include <unistd.h>
# include <errno.h>
# include <string.h>

typedef struct t_list{
    void *data;
    void *next;
} t_list;

extern ssize_t ft_write(int fd, const void *buf, size_t count);
extern size_t ft_strlen(const char *s);
extern char *ft_strcpy(char *dest, const char *src);
extern int ft_strcmp(const char *s1, const char *s2);
extern ssize_t ft_read(int fd, void *buf, size_t count);
extern char *ft_strdup(const char *s);
extern long truc(long n);
extern int ft_atoi_base(char *str, char *base);
extern void ft_list_push_front(t_list **addr, void *data);
extern int ft_list_size(t_list *list);
extern void *ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
extern void ft_list_sort(t_list **begin_list, int (*cmp)());

#endif
