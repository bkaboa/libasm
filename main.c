#include "libasm.h"
#include <stdio.h>
#include <unistd.h>

int main(void)
{
  dprintf(1, "\n%d\n", ft_write(1, "fniuerbgibei", 13));
  dprintf(1, "\n%d\n", write(1, "fniuerbgibei", 13));
}
