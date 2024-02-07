

# include <stdio.h>

int swap_values(int *value1, int *value2) {
    int tmp;
    tmp = *value1;
    *value1 = *value2;
    *value2 = tmp;
}

int main() {
    printf("Introduz dois valores: ");
    int value1, value2;
    scanf("%d %d", &value1, &value2);
    printf("Resultado: %d \n", swap_values(&value1, &value2));
}