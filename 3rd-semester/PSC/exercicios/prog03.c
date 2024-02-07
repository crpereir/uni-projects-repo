# include <stdio.h>

int main() {
    int c;
    printf("Introduz um número: ");
    scanf("%d", &c);

    int i = 1;
    while ( i <= c ) {
        printf("*\n");
        i++;
    }
    
}