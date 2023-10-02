#include <stdio.h>

void sort(int array[], int array_size) {
	for (int i = 0; i < array_size - 1; ++i)
		for (int j = 0; j < array_size - 1 - i; ++j)
			if(array[j] > array[j+1]) {
				int tmp = array[j];
				array[j] = array[j+1];
				array[j + 1] = tmp;
			}
}

void print(int array[], int array_size) {
	for(int i = 0; i < array_size; ++i)
		printf("[%d] = %d\n", i, array[i]);
}

#define ARRAY_SIZE(a) sizeof a / sizeof a[0]

int ints[] = {3, 5, 29, 13, 1, 7};

int main() {
	print(ints, ARRAY_SIZE(ints));
	sort(ints, ARRAY_SIZE(ints));
	print(ints, ARRAY_SIZE(ints));
}
