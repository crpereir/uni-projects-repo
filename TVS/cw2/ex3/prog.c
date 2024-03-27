#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <dlfcn.h>

#define DATA_SIZE 16*1024*1024

#define DECREASE_PSS_TIME 30
#define BSS_INCREASE_RSS_1 2*1024*1024
#define DATA_READ_SIZE 128
#define DATA_INCREASE_SIZE 512*1024
#define DATA_INCREASE_RSS 256*1024

char info[DATA_SIZE];
char data[DATA_SIZE] = {1};

int main() {
	printf("PID: %u\n", getpid());

	const long PAGE_SIZE = sysconf(_SC_PAGE_SIZE);
	printf("PAGE_SIZE: %ld\n", PAGE_SIZE);

	printf("#1 (press ENTER to continue)"); getchar();

	// a
	for (int idx = 0; idx < BSS_INCREASE_RSS_1; idx++) {
		info[idx] = 1;
	}
	
	printf("#2 (press ENTER to continue)"); getchar();

	// b
	for (int idx = 0; idx < DATA_READ_SIZE; idx++) {
		data[idx];
	}
	
	printf("#3 (press ENTER to continue)"); getchar();

	// c
	pid_t pid = fork();
	if (pid == 0) {
		printf("Waiting for %d seconds.\n", DECREASE_PSS_TIME);
		sleep(DECREASE_PSS_TIME);
		exit(EXIT_SUCCESS);
	} else {
		int res = 0;
		waitpid(pid, &res, 0);
		printf("%d seconds passed.\n", DECREASE_PSS_TIME);
	}

	printf("#4 (press ENTER to continue)"); getchar();

	// d
	static char extra_data[DATA_INCREASE_SIZE] = {1};

	printf("#5 (press ENTER to continue)"); getchar();

	// e
	for (int idx = 0; idx < DATA_INCREASE_RSS; idx++) {
		extra_data[idx] = 0;
	}

	printf("#6 (press ENTER to continue)"); getchar();

	// f
	void *handle = dlopen("lib.so", RTLD_LAZY);
	if (handle == NULL) {
		fprintf(stderr, "%s\n", dlerror());
		return 1;
	}
	int (*function)() = dlsym(handle, "lib_function");
	char *new_data = dlsym(handle, "new_data");
	
	printf("#7 (press ENTER to continue)"); getchar();

	// g
	function();

	printf("END (press ENTER to continue)"); getchar();

	return 0;
}
