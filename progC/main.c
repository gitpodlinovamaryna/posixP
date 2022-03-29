


#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{   
    FILE * file;
    char* my_var  = getenv("MY_VAR");
    if(!my_var){
       return 123;
    }
    else 
    {
        if (argc > 1)
        {
            file = fopen("env.txt", "a");
            if(file)
            {
                if(!fputs(my_var, file))
                fclose(file);
                else
                    return 1;
            }
            else
            {
                return 1;
        }
        else
        {
            printf("Var found: %s", my_var);
        }
    }
    return 0;
}