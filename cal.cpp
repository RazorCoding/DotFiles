#include<iostream>
#include<string>
#include<cstdlib>

class Box{
  public:
    int printB();
    int Display();
    int add(int , int);
    int sub(int, int);
    int divide(int,int);
    int modules(int,int);
 private:
   bool line(int); 
};
//Functions
int Box::add(int x, int y)
{
  return x + y;
}
int Box::divide(int x, int y)
{
  return x / y;
}
int Box::sub(int x, int y)
{
  return x - y;
}
int Box::modules(int x,int y)
{
  return x % y;
}
// Other Functions
bool Box::line(int x)
{
  for(int i=0;i<x;i++)
  {
    std::cout << "*";
  }
  std::cout << std::endl;
return true;
}
int Box::printB()
{
  line(30);
  std::cout << "\t\tCALCULATOR" << std::endl;
  line(30);
return 0;
}

int main()
{
  Box B;
  char cal[20];
  std::cout << ": ";
  while(std::cin >> cal)
  {
    B.printB();
    std::cout << "OK!" << std::endl;
  }
return 0;
}
