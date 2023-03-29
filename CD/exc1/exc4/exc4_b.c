

// Função void print_bits( int val ), a qual imprime como caracteres 
// os valores dos bits de todos os elementos do valor inteiro val, 
// passado como parâmetro.

// << vai deslocar o número 1 para a esquerda pelo número de bits que diz respeito ao tamanho
//    do int multiplicado 8 ( 1 byte = 8 bits ) 

void print_bits(int val) {
    printf("value %d = ", val);
    while(val > 0){
        if (val % 2 != 0)
            printf("1");
        else 
            printf("0");
        val = val / 2;
    }  
    printf(" bits\n");
}

int main() {
    int val = 16;  // exemplo de valor inteiro para teste
    print_bits(val);
    return 0;
}
