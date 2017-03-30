#include "stdafx.h"
#include "CppUnitTest.h"
#include "../Errand_testdll/Errand_testdll.h"

using namespace Microsoft::VisualStudio::CppUnitTestFramework;

namespace UnitTest1
{		
	TEST_CLASS(UnitTest1)
	{
	public:
		
		TEST_METHOD(realTest1)
		{
			// TODO: Your test code here

			//First parameter: expected answer
			
			int x = 60, y = 5;
			CErrand_testdll obj;

			//First parameter: expected answer
			Assert::AreEqual(12, obj.divideTwoNumbers(x, y));
		
		}

		TEST_METHOD(realTest2)
		{
			// TODO: Your test code here

			int x = 5, y = 7;
			CErrand_testdll obj;

			//First parameter: expected answer
			Assert::AreEqual(12, obj.addTwoNumbers(x, y));

		}

	};
}