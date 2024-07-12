#include<iostream>
#include<string>

class Box{
  public:
    void game(int,int, std::string);
    void LoopThroughMe(std::string, int x);  
    void Func();
};
void Box::Func()
{
  while(true)
  {
    std::cout << "Hello World!" << std::endl;
  }
}
void Box::game(int x, int y, std::string name)
{
  std::cout << "Sum Of Numbers: " << x + y  << std::endl;
  std::cout << "Here String you Have Entered: " << name << std::endl;
}

void Box::LoopThroughMe(std::string name, int x)
{
  for(int i=0;i<x;i++)
  {
    std::cout << name << std::endl;
  }
}

int main()
{
  std::cout << "Enter your name: ";
  std::getline(std::cin,name);
  Box V;
return 0; 
}
