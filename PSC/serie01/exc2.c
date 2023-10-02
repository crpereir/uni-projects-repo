#include <stdio.h> 
#include <limits.h>

#define ULONG_BIT (sizeof(unsigned long) * CHAR_BIT)
 
unsigned long getbits(unsigned long data[], unsigned index, unsigned length) {
	unsigned long mask = (1UL << length) - 1;
	int elem = index / ULONG_BIT;   			// tirar o elemento do array data
	int bit = index % ULONG_BIT;				// tirar o bit do elemento
	
	unsigned long res = (data[elem] >> bit);    //printf("%lx\n", res);
	return (res & mask);
}


void setbits(unsigned long data[], unsigned index, unsigned length, unsigned long val) {
	int elem = index / ULONG_BIT;   // tirar o elemento do array data
	int bit = index % ULONG_BIT;	// tirar o bit do elemento
	
	unsigned long mask = (1UL << length) - 1;
	val <<= bit;
	
	data[elem] ^= (data[elem] & (mask << bit));
	data[elem] ^= val;
	
	/*
	unsigned long mask_inverse = ~(mask << bit);
	
	data[elem] &= mask_inverse;
	data[elem] |= (val & mask) << bit;
	*/
	
}

int main() {
	unsigned long data[] = {0xBFFFFFECABCD1234, 0xC, 2, 3};
	unsigned long res = getbits(data, 29, 8);
	printf("getbits result: 0x%016lx\n", res);
	
	setbits(data, 29, 8, 1);
	printf("setbits result: 0x%016lx\n", data[0]);
	
	for(unsigned long i = 0; i < sizeof(data) / sizeof(unsigned long); i++) {
		printf("%lx\n", data[i]);
	}
	
	return 0;
}



