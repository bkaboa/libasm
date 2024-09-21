#include "libasm.h"
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>

int main(void)
{
  char str[30];
  char *str2 = "Hello World";
  char *str3 = "Hello World";
  printf("ret = %zu\n", write(1,"Hello World\n", 12));
  dprintf(2, "errno = %d\n", errno);
  printf("ret = %zu\n", ft_write(1,"Hello World\n", 12));
  dprintf(2, "errno = %d\n", errno);

  dprintf(1, "\n\n------------------------------------------\n\n");

  printf("strlen = %zu\n", strlen(str2));
  printf("ft_strlen = %zu\n", ft_strlen(str2));

  dprintf(1, "\n\n------------------------------------------\n\n");

  printf("strcpy = %s\n", strcpy(str, str2));
  printf("ft_strcpy = %s\n", ft_strcpy(str, str2));

  dprintf(1, "\n\n------------------------------------------\n\n");

  printf("strcmp = %d\n", strcmp("Hello", "truc"));
  printf("ft_strcmp = %d\n", ft_strcmp("Hello", "truc"));

  dprintf(1, "\n\n------------------------------------------\n\n");

  // printf("read = %zd\n", read(0, str, 10));
  // printf("ft_read = %zd\n", ft_read(0, str, 10));
  
  dprintf(1, "\n\n------------------------------------------\n\n");

  int fd =open("truc", O_RDONLY);
  fcntl(fd, O_NONBLOCK);
  dprintf(2, "%d\n", fd);
  ft_read(fd, str, 30);
  dprintf(2, "errno ft_read = %d\n", errno);
  read(fd, str, 30);
  dprintf(2, "errno read = %d\n", errno);

  dprintf(1, "\n------------------------------------------\n\n");

  printf("read = %zd\n", read(3728, str, 10));
  dprintf(2, "read errno = %d\n", errno);
  printf("ft_read = %zd\n", ft_read(3728, str, 10));
  dprintf(2, "ft_read errno = %d\n", errno);

  dprintf(1, "\n\n------------------------------------------\n\n");
  
  char *test = strdup(str2);
  char *test2 = ft_strdup(str2);
  printf("strdup str: %s\n pointer: %p\n", test, test);
  printf("ft_strdup str: %s\n pointer: %p\n", test2, test2);
}
