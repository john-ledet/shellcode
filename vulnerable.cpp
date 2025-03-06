#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void vulnerable_function(char *input) {
    char buffer[64];  
    printf("Address of num: %p\n", &buffer);
    strcpy(buffer, input);  

    printf("Received input: %s\n", buffer);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <payload>\n", argv[0]);
        return 1;
    }

    vulnerable_function(argv[1]);  
    printf("Exiting safely...\n");

    return 0;
}
