// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the ERRAND_TESTDLL_EXPORTS
// symbol defined on the command line. This symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// ERRAND_TESTDLL_API functions as being imported from a DLL, whereas this DLL sees symbols
// defined with this macro as being exported.
#ifdef ERRAND_TESTDLL_EXPORTS
#define ERRAND_TESTDLL_API __declspec(dllexport)
#else
#define ERRAND_TESTDLL_API __declspec(dllimport)
#endif

// This class is exported from the Errand_testdll.dll
class ERRAND_TESTDLL_API CErrand_testdll {
public:
	CErrand_testdll();
	// TODO: add your methods here.

	int addTwoNumbers(int a, int b);
	int CErrand_testdll::divideTwoNumbers(int a, int b);
};

extern ERRAND_TESTDLL_API int nErrand_testdll;

ERRAND_TESTDLL_API int fnErrand_testdll(void);
