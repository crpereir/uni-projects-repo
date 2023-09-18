// Funções int count_ones( int val ) e int count_zeros( int val ),
// as quais, respetivamente, retornam o número de bits a 1 e a 0 
// no valor inteiro val, passado como parâmetro.

int count_ones( int val ) {
    int count = 0;
    while ( val != 0) {
        if ((val & 1) == 1){
            count ++;
        }
        val >>= 1;
    }
    return count;
}

int count_zeros(int val) {
    int count = 0;
    while (val != 0) {
        if ((val & 1) == 0) {
            count++;
        }
        val = val >> 1;
    }
    return count;
}

int main () {
    int ones;
    int zeros;
    int n, value;
    printf("Choose a decimal number: ");
    scanf("%d", &n);
    ones = count_ones(n);
    zeros = count_zeros(n);
    printf ("ones = %d || zeros = %d \n", ones, zeros);
}

