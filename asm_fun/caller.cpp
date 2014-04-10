#define _CRT_SECURE_NO_WARNINGS
#define WIN32_DEFAULT_LIBS

#include <iostream>
#include <windows.h>

using namespace std;

//extern "C" void __cdecl read_syscall();
extern "C" int greet();
/*
extern "C" int __cdecl divv(int a, int b);
extern "C" double __cdecl fact_fpu(int arg);
extern "C" double __cdecl pi();


extern "C" int __cdecl get_hex_value(char c);
extern "C" int __cdecl get_length(char* s);
extern "C" int __cdecl is_minus(char c);

extern "C" double __cdecl series(double x, int n);

extern "C" int __cdecl div_rem_128(int* a, int divisor);

extern "C" int __cdecl make_positive(int* a);

extern "C" void __cdecl print(char *out_buf, const char *format, const char *hex_number);

void test_div_get_rem()
{
	int a[4];
	a[0] = a[1] = a[2] = a[3] = 0x0000000;
	a[0] = 0x000000F1;
	int rem = div_rem_128(a, 16);
	printf("%i %i %i %i, rem = %i\n", a[0], a[1], a[2], a[3], rem);
}

void test_make_positive()
{
	int a[4];
	a[0] = a[1] = a[2] = a[3] = 15;
	int sign = make_positive(a);
}

void test_get_length(char *s)
{
	printf("length of %s is %i\n", s, get_length(s));
}
*/
void main()
{	
	int c = greet();
	printf("%i\n", c);
	scanf("%i", &c);
}

