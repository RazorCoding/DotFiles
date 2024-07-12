#include<iostream>
#include<string>
#include<cstdlib>
#include <system_error>

// Gloabal variables
char B[9] = {'1','2','3','4','5','6','7','8','9'};
const char p1 = 'x';
const char p2 = 'o';

// Function Definations
void printBorad();
void insertP(int, char );
bool check(int);
int printuserinput();
void win();

// functions definations.
void win()
{
	if(B[0] == 'x' && B[1] == 'x' && B[2] == 'x' || B[0] == 'o' && B[1] == 'o' && B[2] == 'o')
	{
		std::cout << "GameOver" << std::endl;
		std::cout << "Player " << B[0] << " IS WINNNER! :)" << std::endl;
		exit(1);
	}else if(B[3] == 'x' && B[4] == 'x' && B[5] == 'x' || B[3] == 'o' && B[4] == 'o' && B[5] == 'o')
	{
		std::cout << "GameOver" << std::endl;
		std::cout << "Player " << B[0] << " IS WINNNER! :)" << std::endl;
		exit(1);

	}
	else if(B[6] == 'x' && B[7] == 'x' && B[8] == 'x' || B[6] == 'o' && B[7] == 'o' && B[8] == 'o')
	{
		std::cout << "GameOver" << std::endl;
		std::cout << "Player " << B[0] << " IS WINNNER! :)" << std::endl;
		exit(1);
	}else
	{
		std::cout << "No Match!" << std::endl;
	}
}

int printuserinput()
{
	int input = 0;
	std::cout << "Input: ";
	std::cin >> input;
	return input;
}

void insertP(int x, char p)
{
	if(B[x] == p1 || B[x] == p2)
	{
		std::cout << "Blocked" << std::endl;
	}else{
		switch(x)
		{
			case 0:
				B[x] = p;
				break;
			case 1:
				B[x] = p;
				break;
			case 2:
				B[x] = p;
				break;
			case 3:
				B[x] = p;
				break;
			case 4:
				B[x] = p;
				break;
			case 5:
				B[x] = p;
				break;
			case 6:
				B[x] = p;
				break;
			case 7:
				B[x] = p;
				break;
			case 8:
				B[x] = p;
				break;
			default:
				std::cout << "Out Of Bound!" << std::endl;
				break;
		}  
	}
}

void printBorad()
{
	for(int i=0;i<=8;i++)
	{
		std::cout << "|" << B[i] << "|";

		if(i == 2 || i == 5 || i == 8)
		{
			std::cout << std::endl;
		}
	}
}

std::string n = "Hello World!";

int main()
{
	bool GameOver = false;
	bool Flag = false;
	while(!GameOver){
		printBorad();
		int i = 0;
		i = printuserinput();
		insertP(i,p1);
		printBorad();
		win(); 
		i = printuserinput();
		insertP(i,p2);
		win();
	}
	return 0;
}
