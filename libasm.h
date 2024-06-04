#ifndef LIBASM_H
# define LIBASM_H

# include <sys/types.h>
# include <stdio.h>
# include <unistd.h>
# include <errno.h>
# include <string.h>

ssize_t ft_write(int fd, const void *buf, size_t count);

size_t ft_strlen(const char *s);

char *ft_strcpy(char *dest, const char *src);

int ft_strcmp(const char *s1, const char *s2);

#endif
