#include <stdio.h>

int main(void) {
	int car = getchar(); //ler o char
	while (car != EOF) {
		putchar(car);
		car = getchar();
	}
}
