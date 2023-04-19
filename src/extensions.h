#include <stdio.h>
#include <string.h>

void remove_extension(char *filename) {
    char *dot = strrchr(filename, '.');
    if (dot != NULL) {
        *dot = '\0';
    }
}