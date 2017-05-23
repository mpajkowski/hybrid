#include <conio.h>
#include <stdio.h>

extern "C" void printSome();

void main()
{
	clrscr();
	printSome();
	getch();
	clrscr();
}
