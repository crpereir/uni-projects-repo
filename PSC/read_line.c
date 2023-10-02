#include <stdio.h>
#include <stddef.h>
#include <string.h>
/*
size_t strlen
*/

/*
typedef	unsigned long int size_t;
*/

#define	TEXT_DIM	10

#define ARRAY_SIZE(a) sizeof a / sizeof a[0]

size_t string_length(const char text[]) {
	size_t length = 0;
	while (text[length] != 0)
		length++;
	return length;
}

void read_line(char buffer[], size_t buffer_size) {
	int index = 0;
	char car = getchar();
	while (car != '\n' && index < (buffer_size - 1) && car != EOF) {
		buffer[index] = car;
		index++;
		car = getchar();
	}
	buffer[index] = 0;  // '0'
}

int main() {
	char text[TEXT_DIM];
	
	read_line(text, ARRAY_SIZE(text));
	size_t text_size = string_length(text);
	printf("%s, length = %ld\n", text, text_size);
}
