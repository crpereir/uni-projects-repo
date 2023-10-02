#include <stdio.h>

int main(void) {
	int counter = 0;
	int car = getchar();
	while (car != EOF){
		counter++;
		car = getchar();	
	}
	printf("Dimensão do ficheiro = %d\n", counter);
}
