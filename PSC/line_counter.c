#include <stdio.h>

int main(void) {
	int counter = 0;
	int car = getchar();
	while(car != EOF) {
		if(car == '\n')
			counter++;
		car = getchar();
	}
	printf("Número de linhas = %d\n", counter);
}
