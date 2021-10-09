#include <iostream>

using namespace std;

extern "C" int cosine();

int main() {
	cout << "The result is " << cosine() << endl; 
	return 0; 
};