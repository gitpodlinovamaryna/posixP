#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){   
    FILE * file;
    putenv("MY_VAR=This is My_VAR: ");
    char* my_var  = getenv("MY_VAR");
    if(!my_var){
        fprintf( stderr, "Error 123\n" );
        return 123;
    }
    else{
        if (argc > 1){
            file = fopen(argv[argc-1], "a");
            if(file){
                if(!fputs(my_var, file))
                    fclose(file);
                else
                    return 1;
            }
            else
                return 1;
        }
        else
            fprintf( stdout, "Var found: %s", my_var );
    }
    return 0;
}