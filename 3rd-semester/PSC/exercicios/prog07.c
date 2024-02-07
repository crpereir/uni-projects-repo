# include <stdio.h>

int double_value(int *value) {
    int res = *value * 2;
    return res;
}

int main() {
    printf("Valor: ");
    int value;
    scanf("%d", &value);
    printf("Resultado: %d\n", double_value(&value));
}