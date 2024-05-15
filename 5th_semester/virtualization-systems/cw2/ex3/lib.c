#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#define DATA_SIZE 256*1024
#define DATA_CHANGE_SIZE 128*1024


char new_data[DATA_SIZE] = {1};

int lib_function() {
	for (int idx = 0; idx < DATA_CHANGE_SIZE; idx++) {
		new_data[idx] = 0;
	}
	return 0;
}
