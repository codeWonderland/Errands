// Errand_testdll.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "Errand_testdll.h"


// This is an example of an exported variable
ERRAND_TESTDLL_API int nErrand_testdll=0;

// This is an example of an exported function.
ERRAND_TESTDLL_API int fnErrand_testdll(void)
{
    return 42;
}

// This is the constructor of a class that has been exported.
// see Errand_testdll.h for the class definition
CErrand_testdll::CErrand_testdll()
{
    return;
}


int CErrand_testdll::addTwoNumbers(int a, int b)
{
	int result = 0; 

	result = a + b;

	return result;
}

int CErrand_testdll::divideTwoNumbers(int a, int b)
{
	int result = 0;

	result = a / b;

	return result;
}