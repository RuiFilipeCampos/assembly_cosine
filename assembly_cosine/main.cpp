#include <iostream>

using namespace std;

extern "C" double cosine(double);

int main() {
	cout << "The result is " << cosine(1.57079632679) << endl;
	return 0; 
};