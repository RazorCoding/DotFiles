#include<iostream>
#include <pthread.h>
#include<string>

void print(int,std::string);

int number = 10;

char cal[10];

int main()
{
  std::string name;
  int i=0;
  std::cout << "Enter your name: ";
  
  std::getline(std::cin, name);
  std::cout << "How many times: ";
  std::cout << ": ";
  std::cin >> number;

 // print(number,name);
  
  if(number <= 0 )
  {
    std::cout << "Number should be greater than zero " << std::endl;
    exit(1);
  }
  
  for(int i=0;i<number;i++)
  {
    std::cout << "Hello World!" << std::endl;
  }
  return 0;
}

void print(int x, std::string msg)
{
  for(int i=0;i<=x;i++)
  {
    std::cout << msg << std::endl;
  }
}
