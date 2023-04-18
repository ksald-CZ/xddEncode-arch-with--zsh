#include <stdio.h>
#include "extensions.h"

int main(int argc, char* argv[]) {
    char * newname[50];
    strcpy(newname, argv[1]);
    remove_extension(newname);
    printf("%s",newname);
    return 0;
}