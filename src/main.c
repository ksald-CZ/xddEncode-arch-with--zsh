#include <stdio.h>
#include "extensions.h"

int Encrypt(char * FILENAME, char * NEW_FILENAME, int key[])
{
    FILE *inFile;   //Declare inFile
    FILE *outFile;  //Declare outFile
    int byte;
    int i = 0;

    inFile = fopen(FILENAME,"rb");
    outFile = fopen(NEW_FILENAME, "wb");

    while ((byte = fgetc(inFile)) != EOF) {
        byte += key[i%(sizeof(key)/4)];  // shift the byte by 50
        fputc(byte, outFile);  // write the byte to the output file
        i++;
    }

    fclose(inFile);
    fclose(outFile);
    return 0;
}

int Decrypt (char *FILENAME, char *NEW_FILENAME, int key[])
{
    FILE *inFile;   //Declare inFile
    FILE *outFile;  //Declare outFile
    int byte;
    int i = 0;

    inFile = fopen(FILENAME,"rb");
    outFile = fopen(NEW_FILENAME, "wb");

    while ((byte = fgetc(inFile)) != EOF) {
        byte -= key[i%(sizeof(key)/4)];  // shift the byte by 50
        fputc(byte, outFile);  // write the byte to the output file
        i++;
    }

    fclose(inFile);
    fclose(outFile);
    return 0;
}

int main(int argc, char* argv[]) {
    int klic[] = {7,2,7};
    if (argc == 4) {
        if (strcmp(argv[3], "encrypt") == 0) {
            printf("Encrypting\n");
            Encrypt(argv[1], argv[2], klic);
            printf("Encrypted\n");
        } else if (strcmp(argv[3], "decrypt") == 0) {
            printf("Decrypting\n");
            Decrypt(argv[1], argv[2], klic);
            printf("Decrypted\n");
        } else {
            printf("%s, %s, %s", argv[1], argv[2], argv[3]);
        }
        return 0;
    }
    char * newname[50];
    strcpy(newname, argv[1]);
    remove_extension(newname);
    printf("%s",newname);
    return 0;
}