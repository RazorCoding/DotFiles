#include <iostream>
#include <string>

using namespace std;

// Function to calculate years until 100
int yearsUntil100(int age) {
    return 100 - age;
}

int main() {
    // Variable declarations
    string name;
    int age;

    // Ask for user input
    cout << "Enter your name: ";
    getline(cin, name);  // Use getline to allow spaces in the name

    cout << "Enter your age: ";
    cin >> age;

    // Check if age is valid
    if (age < 0) {
        cout << "Invalid age entered." << endl;
        return 1;
    }

    // Calculate years until 100
    int years = yearsUntil100(age);

    // Display the result
    cout << "Hello, " << name << "! You have " << years << " years until you turn 100." << endl;

    // Loop to count down the years until 100
    for (int i = years; i > 0; i--) {
        cout << "In " << i << " years, you will be " << (age + i) << " years old." << endl;
    }

    cout << "Congratulations on your journey to 100 years!" << endl;

    return 0;
}