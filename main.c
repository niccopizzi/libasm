#include "asm.h"

int main(int argc, char* argv[])
{
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

    if (argc > 1)
    {
        int res = ft_putnbr_base(atoi(argv[1]), argv[2]);
        printf("\n");
    }
    return(0);
}