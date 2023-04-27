#include <stdio.h>
#include "extensions.h"

int Encrypt(char * FILENAME, char * NEW_FILENAME)
{
    FILE *inFile;   //Declare inFile
    FILE *outFile;  //Declare outFile
    int byte;

    inFile = fopen(FILENAME,"rb");
    outFile = fopen(NEW_FILENAME, "wb");

    while ((byte = fgetc(inFile)) != EOF) {
        byte = (byte + 50) % 255;  // shift the byte by 50
        fputc(byte, outFile);  // write the byte to the output file
    }

    fclose(inFile);
    fclose(outFile);
    return 0;
}

int Decrypt (char *FILENAME, char *NEW_FILENAME)
{
    FILE *inFile;   //Declare inFile
    FILE *outFile;  //Declare outFile
    int byte;

    inFile = fopen(FILENAME,"rb");
    outFile = fopen(NEW_FILENAME, "wb");

    while ((byte = fgetc(inFile)) != EOF) {
        byte -= 50;  // shift the byte by 50
        if (byte < 0) {
            byte += 255;
        }
        fputc(byte, outFile);  // write the byte to the output file
    }

    fclose(inFile);
    fclose(outFile);
    return 0;
}

int main(int argc, char* argv[]) {
    if (argc == 4) {
        if (strcmp(argv[3], "encrypt") == 0) {
            printf("Encrypting\n");
            Encrypt(argv[1], argv[2]);
            printf("Encrypted\n");
        } else if (strcmp(argv[3], "decrypt") == 0) {
            printf("Decrypting\n");
            Decrypt(argv[1], argv[2]);
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