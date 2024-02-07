# include <stdio.h>

int main() {
    printf("Introduza um número: ");
    int num;
    scanf("%d", &num);
    int i, j;
    for (i = 1, j = num; i <= num; i++, j--) {
        printf("%d   %d\n", i, j);
    }

    return 0;
}