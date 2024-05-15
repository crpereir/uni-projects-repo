////////////////////////////////////////////
//
// ISEL - System Virtualization Techniques
// Autumn/Winter 2023/24
//
// Coursework Assignment #1
//

#include "ftests.h"

#include "chuta.h"
#include "somecode.h"

void test_add() {
	
	INCLUDE_FUNCTION_NAME_IN_REPORT;
	
	int res = add(2, 2);
	
	CH_ASSERT(res == 4);
}

void test_sub() {
	
	INCLUDE_FUNCTION_NAME_IN_REPORT;
	
	int res = sub(5, 2);
	
	CH_ASSERT(res == 3);
}

void test_strsize() {
	
	INCLUDE_FUNCTION_NAME_IN_REPORT;
	
	size_t size = strsize("ISEL");
	
	CH_ASSERT(size == 4);
}

void test_add_msg() {
	
	INCLUDE_FUNCTION_NAME_IN_REPORT;
	
	int res = add(2, 2);
	
	CH_ASSERT_MSG(res == 4, "Function add() didn't return expected value.");
}

void test_sub_msg() {
	
	INCLUDE_FUNCTION_NAME_IN_REPORT;
	
	int res = sub(5, 2);
	
	CH_ASSERT_MSG(res == 3, "Function sub() didn't return expected value.");
}

void test_strsize_msg() {
	
	INCLUDE_FUNCTION_NAME_IN_REPORT;
	
	size_t size = strsize("ISEL");
	
	CH_ASSERT_MSG(size == 4, "Function strsize() didn't return expected value.");
}
