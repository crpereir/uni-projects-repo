#include <stdio.h>
#include <limits.h>

unsigned long max_value(unsigned nchars) {		
	if (nchars > sizeof(unsigned long))
		return 0;
		
	// "macro CHAR_BIT, definida em limits.h, para obter o número de bits de um char"
		
	unsigned long total = CHAR_BIT * nchars;     // "número de bits de um char, vezes o valor indicado pelo parâmetro nchars"
		
	unsigned long max_value = (1UL << total) - 1;        // máscara         
		
	return max_value;
}


int main() {
	for (int nchars = 0; nchars < 21; nchars++) {
		unsigned long max = max_value(nchars);
		printf("Com %d chars, o maior valor é: %ld\n", nchars, max);
	}
}
