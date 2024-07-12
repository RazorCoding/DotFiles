#ifndef CLASS_H
#define CLASS_H

#include <cstdlib>
class Box{
	private:
		std::string name;
		int number;
	public:
		void print();
		void input();
};
void Box::print()
{
	std::cout << "--Entered--" << std::endl;
	std::cout << name << std::endl;
	std::cout << number << std::endl;	
}

void Box::input()
{
	std::cout << "Enter your name: ";
	std::getline(std::cin, name);
	std::cout << "Enter your ID Number: ";
	std::cin >> number;
}
#endif
