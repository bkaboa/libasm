#include "libasm.h"
#include <stdio.h>

int cmp (void *i, void *j)
{
    if (*(int*)i == *(int*)j)
        return (0);
}

void free_data(void *data)
{
    data = NULL;
}

int ft_cmp(void *i, void *j)
{
    // dprintf(2, "rdi = %p, rsi = %p\n", (long)i, (long)j);
    return ((long)i > (long)j);
}

int main(void)
{
    t_list *list = NULL;
	ft_list_push_front(&list, (void*)2);
	ft_list_push_front(&list, (void*)3);
	ft_list_push_front(&list, (void*)4);
	ft_list_push_front(&list, (void*)-1);
	ft_list_push_front(&list, (void*)5);
	ft_list_push_front(&list, (void*)-2);
	ft_list_push_front(&list, (void*)6);
	ft_list_push_front(&list, (void*)-3);
	ft_list_push_front(&list, (void*)7);
	ft_list_push_front(&list, (void*)0);
    ft_list_sort(&list, &ft_cmp);
    t_list *tmp = list;
    while (tmp != NULL)
    {
        printf("%ld\n", (long)tmp->data);
        tmp = tmp->next;
    }
}