#include <unistd.h>
#include <stdio.h>

typedef struct t_list {
    void *t_list;
    void *data
}t_list;

int main(void)
{
    dprintf(2, "%zu\n", sizeof(t_list));
    return (0);
}