#include "asm.h"

void free_func(void *data)
{
    printf("Free func called on data %s\n", (char*)data);
}

int main(int argc, char* argv[])
{
    srand(time(NULL));
/*     //strlen test
    {
        const char str[10] = {0};
        const char* str1 = "AbbaTest";
        const char* str2 = "";
        const char* str3 = "loooooooooooooooooooooooooongstring";
        const unsigned char str4[] = {255, 240, 240, 230, 244, 0};

        ft_strlen(str) == strlen(str) ? printf("Got same result\n") : 
                                        printf("Result did not match, error at %s\n", str);
        ft_strlen(str1) == strlen(str1) ? printf("Got same result\n") : 
                                        printf("Result did not match, error at %s\n", str1);
        ft_strlen(str2) == strlen(str2) ? printf("Got same result\n") : 
                                        printf("Result did not match, error at %s\n", str2);
        ft_strlen(str3) == strlen(str3) ? printf("Got same result\n") : 
                                        printf("Result did not match, error at %s\n", str3);
        ft_strlen(str4) == strlen(str4) ? printf("Got same result\n") : 
                                        printf("Result did not match, error at %s\n", str4);
    }

    //strcmp test
    {
        ft_strcmp("Test111", "Test1") == strcmp("Test111", "Test1") ? 
                printf("Got same result\n") : printf("Error! 1\n");
        ft_strcmp("Test", "Test1") == strcmp("Test", "Test1") ? 
                printf("Got same result\n") : printf("Error! 2\n");
        ft_strcmp("hola", "hol") == strcmp("hola", "hol") ? 
                printf("Got same result\n") : printf("Error! 2\n");
        ft_strcmp("", "") == strcmp("", "") ? 
                printf("Got same result\n") : printf("Error! 3\n");
    }

    //strcpy test
    {
        char dest[100] = {0};
        const char* src = "Thisisatest";
        const char* src2 = "Copythis";
        const unsigned char src3[] = {'A', 'B', 'C', 0};
        
        printf("Dest after copy -> %s\n", ft_strcpy(dest, src));
        printf("Dest after copy -> %s\n", ft_strcpy(dest + ft_strlen(src), src2));
        printf("Dest after copy -> %s\n", ft_strcpy(dest + ft_strlen(src2), src3));


    } */
    
    //strdup test
/*  {
        char *str1 = "This is a test";

        char *str2 = ft_strdup(str1);
        printf ("Result -> %s\n", str2);
        free(str2);

        str1 = "New test";

        str2 = ft_strdup(str1);
        printf ("Result -> %s\n", str2);
        free(str2);

        str1 = "";

        str2 = ft_strdup(str1);
        printf ("Result -> %s\n", str2);
        free(str2);

        str1 = NULL;

        str2 = ft_strdup(str1);
        printf ("Result -> %s\n", str2);
    } */

    /* if (argc > 1)
    {
        int res = ft_putnbr_base(atoi(argv[1]), argv[2]);
        printf("\n");
    } */
/* 
    t_list* head = malloc(sizeof(t_list));

    head->data = (void*)"1";

    head->next = malloc(sizeof(t_list));
    head->next->data = (void*)"2";
    head->next->next = NULL;

    printf("List size before -> %d\n", ft_list_size(head));
    
    char* new_data = "0";
    ft_list_push_front(&head, new_data);

    printf("List size after  -> %d\n", ft_list_size(head));
    
    for (t_list* it = head; it != NULL; it = it->next)
    {
        printf("%s\n", (char*)it->data);
    }

    head = NULL;

    printf("List size before -> %d\n", ft_list_size(head));
    ft_list_push_front(&head, new_data);

    for (t_list* it = head; it != NULL; it = it->next)
    {
        printf("%s\n", (char*)it->data);
    }
    printf("List size after  -> %d\n", ft_list_size(head));

    head = malloc(sizeof(t_list));

    head->data = (void*)"1";

    head->next = malloc(sizeof(t_list));
    head->next->data = (void*)"2";
    head->next->next = NULL;

    ft_list_push_front(&head, NULL);

    for (t_list* it = head; it != NULL; it = it->next)
    {
        printf("%s\n", (char*)it->data);
    }

    ft_list_push_front(NULL, "test");
    
    printf("List size of NULL %d\n", ft_list_size(NULL));
 */
    /* t_list* head = malloc(sizeof(t_list));

    head->data = "0";
    t_list * ptr = head;
    for (int i = 0; i < 22; ++i)
    {
        ptr->next = malloc(sizeof(t_list));
        char* c = malloc(1);
        *c = (rand() % 22) + 65;
        ptr->next->data = c;
        ptr = ptr->next;

    }
    printf("List before sort\n");
    for (t_list* ptr = head; ptr != NULL; ptr = ptr->next)
    {
        printf("%s ", (char*)ptr->data);
    }
    ft_list_sort(&head, &ft_strcmp);
    printf("\nList after sort\n");
    for (t_list* ptr = head; ptr != NULL; ptr = ptr->next)
    {
        printf("%s ", (char*)ptr->data);
    }
    printf("\n");

    ft_list_sort(NULL, &ft_strcmp);
    ft_list_sort(&head, NULL);
    ft_list_sort(NULL,NULL); */

    t_list *head = malloc(sizeof(t_list));

    memset(head,0,sizeof(t_list));
    head->data = (void *)"remove";
    t_list * ptr = head;


    for (int i = 0; i < 10; ++i)
    {
        ptr->next = malloc(sizeof(t_list));
        memset(ptr->next, 0, sizeof(t_list));
        char c = i + 48;
        if (rand() % 2 == 0)
            ptr->next->data = ft_strdup(&c);
        else
            ptr->next->data = "remove";
        ptr = ptr->next;
    }
    printf ("List before remove if\n");
    for (t_list* ptr = head; ptr != NULL; ptr = ptr->next)
    {
        printf("%s\n", (char*)ptr->data);
    }
    ft_list_remove_if(&head, "remove", &ft_strcmp, &free_func);
    printf("\nList after remove if\n");
    for (t_list* ptr = head; ptr != NULL; ptr = ptr->next)
    {
        printf("%s\n", (char*)ptr->data);
    }

    for (t_list* ptr = head; ptr != NULL;)
    {
        t_list* next = ptr->next;
        
        free(ptr->data);
        free (ptr);
        ptr = next;
    }
    return(0);
}