#include <stdbool.h>
#include <stdio.h>
#include <string.h>

bool checkNum(int x) {
	int n1 = x << 3;
	int n2 = 525024598;
	int n3 = -889275714;
	n2 = x ^ n2;
	printf(string(n1^n2));
	if (n1^n2 == n3)
		return true;
	else
		return false;
}

void main(){
	checkNum(4);
}