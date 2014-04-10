#include <stdio.h>
#include <iostream>

using namespace std;

extern "C" int greet();

void main()
{	
	int c = greet();
	cout << c << endl;
	cin >> c;
}

