////////////////////////////////////////////
//
// ISEL - System Virtualization Techniques
// Autumn/Winter 2023/24
//
// Coursework Assignment #1
//

#include "chuta.h"

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

// Buffer length used to compare *small* parts of output of program and expected output from a file.
// Must be small in order to reduce the risk of asynchrony between child process writing in pipe and parent
// process reading from pipe.
#define BUFFER_SIZE 4
#define BYTE_SIZE 1

#define PIPE_BUFFER_SIZE 255

static int run_test(test_function tfunc);
static void run_prog_test(prog_test_spec pfunc);

int counter_space(char *str);

void run_function_tests(test_function tests[], size_t num_tests, bool stop_at_first_failure) {
	
	// Variables to keep track of test statuses.
	size_t run_tests = 0; size_t successes = 0; size_t failures = 0;
	// Flag to indicate when to stop the further execution of tests.
	// stop_at_first_failure is not used because pipe needs to be closed beforehand.
	bool stop_tests = false;
	
	// For each test...
	for (int i = 0; i < num_tests; i++) {	
		
		//... pipe is created...
		int pipefd[2];
		pipe(pipefd);
		
		//... and a new process is made, sharing created pipe.
		pid_t pid = fork();
		
		// If the process is child...
		if (pid == 0) {
			
			//... closes the pipe input...
			close(pipefd[0]);
			
			//... and redirects standard output and standard error to output to pipe.
			dup2(pipefd[1], 2);
			dup2(pipefd[1], 1);
			
			// Closes the pipe output.
			close(pipefd[1]);
			
			int status = run_test(tests[i]);
			exit(status);
		}
		// Else, this process is the parent, keeps track of test. 
		else {
			// Closes the pipe output...
			close(pipefd[1]);
			
			//... and waits for child process to finish the test, storing the exit status of child in res.
			int res = 0;
			waitpid(pid, &res, 0);
			
			// Once child ends, test has finished.
			run_tests++;
			
			char test_info[PIPE_BUFFER_SIZE];
			int m = read(pipefd[0], test_info, PIPE_BUFFER_SIZE - 1);
			
			test_info[m-1] = 0;	// puts ends string in /n, now finishes in /0.
			
			// If child exited...
			if (WIFEXITED(res)) {
				// ...with success...
				if (WEXITSTATUS(res) == EXIT_SUCCESS) {
					successes++;
					
					// Reporting success.
					printf("[%i] SUCCESS ", i);
				}
				// ...with failure... 
				else {
					failures++;
					
					// Reporting failure.
					printf("[%i] ASSERTION_FAILED ", i);
					
					if (stop_at_first_failure) stop_tests = true;
				}
			} 
			// else, child terminated without exiting.
			else {
				// Termination counts as failure.
				failures++;
				
				// Reporting termination.
				printf("[%i] TERMINATED(%d) ", i, WTERMSIG(res));
				
				if (stop_at_first_failure) stop_tests = true;
			}
			// If child wrote to pipe, it is presented in report.
			if (m != 0) printf(": %s", test_info);
			puts("\n\n");
			
			// Closing the pipe input before next test.
			close(pipefd[0]);
			
			if (stop_tests) break;
		}
	}
	
	// Final report.
	printf(
		"\nRun %ld/%ld tests: %ld SUCCEDED, %ld FAILED\n\n", 
		run_tests, num_tests, successes, failures
	);
}

static int run_test(test_function tfunc) {
	tfunc();
	return EXIT_SUCCESS;
}

void run_stdio_program_tests(prog_test_spec tests[], size_t num_tests, bool stop_at_first_failure) {
	
	// Variables to keep track of test statuses.
	size_t run_tests = 0; size_t successes = 0; size_t failures = 0;
	// Flag to indicate when to stop the further execution of tests.
	// stop_at_first_failure is not used because pipe needs to be closed beforehand.
	bool stop_tests = false;
	
	// For each test...
	for (int i = 0; i < num_tests; i++) {
		
		//... boolean flag is reserved to stop in case of comparison failure, ...	
		bool fail = false;
		
		//... pipe is created...
		int pipefd[2];
		pipe(pipefd);
		
		//... and a new process is made, sharing created pipe.
		pid_t pid = fork();
		
		// If the process is child...
		if (pid == 0) {
			
			//... closes the pipe input...
			close(pipefd[0]);
			
			//... and redirects standard output to output to pipe.
			dup2(pipefd[1], 1);
			
			// Closes the pipe output.
			close(pipefd[1]);
			
			run_prog_test(tests[i]);
		} 
		// Else, this process is the parent, keeps track of test. 
		else {
			// Closes the pipe output...
			close(pipefd[1]);
			
			// Assumes test as done.
			run_tests++;
			
			// Opens a file with expected output.
			FILE *expectedFile = fopen(tests[i].expected_output_file_name, "r");
			
			// Most likely error in opening is because file does not exist.
			if (expectedFile == NULL) {
				perror("expected file could not be opened");
				exit(EXIT_FAILURE);
			}
			
			// Preparing buffers for pipe and file with equal size.
			char part_of_test_info[BUFFER_SIZE];
			char part_of_expected_file[BUFFER_SIZE];
			
			// Infinite loop, comparing both buffers
			for (;;) {
			
				int m = read(pipefd[0], part_of_test_info, BUFFER_SIZE-1);
				part_of_test_info[m] = 0;
				
				size_t n = fread(part_of_expected_file, BYTE_SIZE, BUFFER_SIZE-1, expectedFile);
				part_of_expected_file[n] = 0;
				
				// Ending condition: contents of buffers are not equal.
				if (strcmp(part_of_expected_file, part_of_test_info) != 0) {
					fail = true;
					break;
				}
				// Ending condition: pipe has no more content.
				if (m == 0) break;
			}
			
			// Evaluating status of test through fail flag.
			if (fail) {
				failures++;
				
				// Reporting failure.
				printf("[%i] ASSERTION_FAILED : %s", i, tests[i].test_name);
				
				if (stop_at_first_failure) stop_tests = true;
				
			} else {
				successes++;
				
				// Reporting success.
				printf("[%i] SUCCESS : %s", i, tests[i].test_name);
			}
			puts("\n\n");
			
			// Closing the pipe input.
			close(pipefd[0]);
			
			if (stop_tests) break;	
		}
	}
	
	// Final report.
	printf(
		"\nRun %ld/%ld tests: %ld SUCCEDED, %ld FAILED\n\n", 
		run_tests, num_tests, successes, failures
	);
}

static void run_prog_test(prog_test_spec pfunc) {
	
	// Opening file.
	int fd = open(pfunc.input_file_name, O_RDONLY, 0640);
	
	// Most likely error in opening is because file does not exist.
	if (fd == -1) exit(EXIT_FAILURE);
	
	// Redirecting file to standard input.
	dup2(fd, 0);
	close(fd);
	
	// Allocating space and copying command.
	char cmd[strlen(pfunc.program_cmd_with_args)];
	strcpy(cmd, pfunc.program_cmd_with_args);
	
	// Allocating space for command and argument array.
	// Space is calculated via spaces in command plus two.
	// Two, due to the ending NULL and due to starting word.
	char *arguments[counter_space(cmd) + 2];
	
	// Splitting command and arguments by space.
	char *arg = strtok(cmd, " ");
	
	// Program name is *always* first argument - copying to separate string.
	char prog_name[strlen(arg) + 1];
	strcpy(prog_name, arg);
	
	// Retrieving each argument and storing to argument array.
	int counter = 0;
	while (arg != NULL) {
		arguments[counter] = arg;
		arg = strtok(NULL, " ");
		counter++;
	}
	
	// Must always finish with NULL.
	arguments[counter] = NULL;
	
	// Executing program in process.
	execvp(prog_name, arguments);
}

// Function used to count spaces to indirectly count number of words.
int counter_space(char *str) {
	int counter = 0;
	while (*str) {
		if (*str == ' ') counter++;
		str++;
	}
	return counter;
}
