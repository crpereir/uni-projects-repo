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

int count_zeros( int val ) {
    return 32 - count_ones(val);
}


int main () {
    int count1;
    int count2;
    count1 = count_ones(19);
    count2 = count_zeros(19);
    printf ("ones = %d || zeros = %d \n", count1, count2);
    //printf ("count = %d \n", count2);
}