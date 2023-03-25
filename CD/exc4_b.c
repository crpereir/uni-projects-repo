

// Função void print_bits( int val ), a qual imprime como caracteres 
// os valores dos bits de todos os elementos do valor inteiro val, 
// passado como parâmetro.

// << vai deslocar o número 1 para a esquerda pelo número de bits que diz respeito ao tamanho
//    do int multiplicado 8 ( 1 byte = 8 bits ) 

void print_bits(int val) {
    int mask = 1 << (sizeof(int) * 8 - 1);  // fica com o bit mais à esquerda (que é o mais significativo)
    for (int i = 0; i < sizeof(int) * 8; i++) {
        int bit = (val & mask) ? 1 : 0;  // obtém o valor do bit usando a máscara e a operação bit-a-bit AND
        char c = bit + '0';  // converte o valor do bit para um caracter '0' ou '1'
        printf("%c", c);  // imprime o caractere
        mask >>= 1;  // desloca a máscara para a direita para obter o próximo bit
    }
    printf("\n");  // imprime uma nova linha no final
}

int main() {
    int val = 16;  // exemplo de valor inteiro para teste
    print_bits(val);
    return 0;
}
