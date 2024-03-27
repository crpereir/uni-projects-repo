////////////////////////////////////////////
//
// ISEL - System Virtualization Techniques
// Autumn/Winter 2023/24
//
// Coursework Assignment #1
//

#include "chuta.h"
#include "ftests.h"

///////////////////////////////
// 
// DECLARE ALL FUNCTION TESTS
//
test_function all_function_tests[] = {
	test_add,
	test_sub,
	test_strsize,
	test_add_msg,
	test_sub_msg,
	test_strsize_msg
};

//////////////////////////////
// 
// DECLARE ALL PROGRAM TESTS
//
prog_test_spec all_program_tests[] = {
	// cat
	{"cat correct test", "cat", "demo/test_files/cat/input_file.txt", "demo/test_files/cat/expected_file.txt"},
	{"cat wrong test", "cat", "demo/test_files/cat/input_file_wrong.txt", "demo/test_files/cat/expected_file.txt"},
	// grep
    {"grep correct test", "grep -e isel", "demo/test_files/grep/input_file.txt", "demo/test_files/grep/expected_file.txt"},
    {"grep wrong test", "grep -e pt", "demo/test_files/grep/input_file.txt", "demo/test_files/grep/expected_file.txt"},
    // sort
    {"sort correct test", "sort", "demo/test_files/sort/input_file.txt", "demo/test_files/sort/expected_file.txt"},
    {"sort wrong test", "sort", "demo/test_files/sort/input_file_wrong.txt", "demo/test_files/sort/expected_file.txt"},
    // wc
    {"wc correct test", "wc", "demo/test_files/wc/input_file.txt", "demo/test_files/wc/expected_file.txt"},
    {"wc wrong test", "wc", "demo/test_files/wc/input_file_wrong.txt", "demo/test_files/wc/expected_file.txt"},
    // lusiadas
    {"cat correct lusiadas", "cat", "demo/test_files/lusiadas/lusiadas.txt", "demo/test_files/lusiadas/lusiadas.txt"},
    {"cat wrong lusiadas", "cat", "demo/test_files/lusiadas/lusiadas_wrong.txt", "demo/test_files/lusiadas/lusiadas.txt"},
    {"grep correct lusiadas", "grep -e da", "demo/test_files/lusiadas/lusiadas_short.txt", "demo/test_files/lusiadas/expected_grep_lusiadas_short.txt"},
	{"grep wrong lusiadas", "grep -e isel", "demo/test_files/lusiadas/lusiadas_short.txt", "demo/test_files/lusiadas/expected_grep_lusiadas_short.txt"}
};

////////////////////////
// 
// RUN ALL TESTS
//
// (do not modify, except to add the call to run_stdio_program_tests)
//

#define ARRLEN(arr) (sizeof(arr)/sizeof(arr[0]))

const size_t num_function_tests = ARRLEN(all_function_tests);
const size_t num_program_tests = ARRLEN(all_program_tests);

int main() {
	
	run_function_tests(all_function_tests, num_function_tests, false);
	
	run_stdio_program_tests(all_program_tests, num_program_tests, false);
	
	return 0;
}
