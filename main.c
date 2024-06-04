#include "libasm.h"

int main(void)
{
  char str[30];
  char *str2 = "Hello World";
  printf("\nret = %zu\n", write(1,"Hello World\n", 12));
  dprintf(2, "\n\nerrno = %d\n\n", errno);
  printf("\nret = %zu\n", ft_write(1,"Hello World\n", 12));
  dprintf(2, "\n\nerrno = %d\n\n", errno);

  printf("strlen = %zu\n", strlen(str2));
  printf("ft_strlen = %zu\n", ft_strlen(str2));

  printf("strcpy = %s\n", strcpy(str, str2));
  printf("ft_strcpy = %s\n", ft_strcpy(str, str2));

  printf("strcmp = %d\n", strcmp("Hello", "truc"));
  printf("ft_strcmp = %d\n", ft_strcmp("Hello", "truc"));

}
