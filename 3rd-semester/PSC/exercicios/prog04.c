# include <stdio.h>


int is_digit(char digit){
    return ( digit >= '0' && digit <= '9');
}

int main() {
    char dig;
    printf("Introduza um digito: ");
    scanf("%c", &dig);

    if(is_digit(dig))
        printf("Correto\n");
    else printf("Errado\n");
}