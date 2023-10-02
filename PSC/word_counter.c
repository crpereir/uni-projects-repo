#include <stdio.h>

int main(void) {
		int counter = 0;
		int car = getchar();
		while (car != EOF){
			while (car == ' ' && car != EOF)
				car = getchar();
			if(car == EOF)
				break;
			counter++;
			while (car != ' ' && car != EOF)
				car = getchar();
		}
		printf("Número de palavras = %d\n", counter);
}
