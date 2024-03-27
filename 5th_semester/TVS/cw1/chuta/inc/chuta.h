////////////////////////////////////////////
//
// ISEL - System Virtualization Techniques
// Autumn/Winter 2023/24
//
// Coursework Assignment #1
//

#ifndef CHUTA_H
#define CHUTA_H

#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <stdio.h>

// Used to include test function name in test report.
#define INCLUDE_FUNCTION_NAME_IN_REPORT \
	do { puts(__func__); } while(0)

#define CH_ASSERT(test_expression) \
	do { if (!(test_expression)) { exit(EXIT_FAILURE); } } while (0)

// Same as CH_ASSERT, including also file and line of test function that failed in error_msg.
#define CH_ASSERT_MSG(test_expression, error_msg) \
	do { \
		if (!(test_expression)) { \
			fprintf(stderr, "In file %s, line %d:\n	%s", __FILE__, __LINE__, error_msg); \
			exit(EXIT_FAILURE); \
		} \
	} while (0)

typedef void (*test_function)();

typedef struct {
	const char *test_name;
	const char *program_cmd_with_args;
	const char *input_file_name;
	const char *expected_output_file_name;
} prog_test_spec;


void run_function_tests(test_function tests[], size_t num_tests, bool stop_at_first_failure);

void run_stdio_program_tests(prog_test_spec tests[], size_t num_tests, bool stop_at_first_failure);

#endif // CHUTA_H
