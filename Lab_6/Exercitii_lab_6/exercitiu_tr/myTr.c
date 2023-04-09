#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char *argv[]) 
{
    // Verificăm că numărul de argumente este corect
    if (argc != 5) 
    {
        printf("Utilizare: %s <fisier_intrare> <fisier_iesire> <caracter_vechi> <caracter_nou>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    // Deschidem fișierul de intrare
    int fileIn = open(argv[1], O_RDONLY);
    if (fileIn < 0) 
    {
        printf("Nu s-a putut deschide fisierul %s\n", argv[1]);
        exit(EXIT_FAILURE);
    }

    // Verificăm dacă fișierul de ieșire există
    int fileOut = open(argv[2], O_WRONLY | O_CREAT | O_EXCL, 0600);
    if (fileOut < 0) 
    {
        // Dacă fișierul există, cerem confirmarea de suprascriere
        printf("Fisierul %s exista. Suprascriem? (y/n) ", argv[2]);
        char answer = getchar();
        if (answer != 'y' && answer != 'Y') 
        {
            printf("Nu s-a suprascris fisierul.\n");
            exit(EXIT_FAILURE);
        }

        // În caz contrar, deschidem fișierul de ieșire pentru scriere
        fileOut = open(argv[2], O_WRONLY | O_TRUNC);
        if (fileOut < 0) 
        {
            printf("Nu s-a putut deschide fisierul %s\n", argv[2]);
            exit(EXIT_FAILURE);
        }
    }

    // Deschidem fișierul de ieșire
    fileOut = open(argv[2], O_WRONLY | O_TRUNC);
    if (fileOut < 0) 
    {
        printf("Nu s-a putut deschide fisierul %s\n", argv[2]);
        exit(EXIT_FAILURE);
    }

    // Parcurgem fișierul de intrare și scriem în fișierul de ieșire
    char c;
    while (read(fileIn, &c, 1) > 0) 
    {
        if (c == argv[3][0])
            c = argv[4][0];

        write(fileOut, &c, 1);
    }

    // Închidem fișierele deschise
    close(fileIn);
    close(fileOut);

    return 0;
}