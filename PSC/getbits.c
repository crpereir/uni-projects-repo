unsigned getbits(unsigned x, unsigned p, unsigned n) {
	x = x >> p;
	
	unsigned mask = (1 << n) - 1;
	x = x & mask;
	return x;
}

unsigned setbits(unsigned x, unsigned p, unsigned n, unsigned y){
	unsigned mask = (1 << n) - 1;
	
	y= y & mask;
	y = y << p;
	
	mask = ~(mask << p);
	
	x = x & mask;
	
	x = x | y;
	
	return x;
}

int main() {
	unsigned a = getbits(0x12345678, 12, 4);
	unsigned b = setbits(0x12345678, 4, 4, 0xa);
}
