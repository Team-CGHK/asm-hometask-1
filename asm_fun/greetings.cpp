#define _CRT_SECURE_NO_WARNINGS

#include <iostream>

using namespace std;

extern "C" int greet();

void main()
{
	int c = greet();
	cout << c;
	cin >> c;
}

