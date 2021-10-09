#include <iostream>

using namespace std;

extern "C" double cosine(double);

int main() {
	cout << "The result is " << cosine(2.) << endl;
	return 0; 
};