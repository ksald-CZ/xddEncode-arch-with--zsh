#include <stdio.h>

int main(int argc, char* argv[]) {
    char * newname[50];
    strcpy(newname, argv[1]);
    strcat(newname,".xdd");
    rename(argv[1], newname);
    return 0;
}
