#include <iostream>
using namespace std;
class Student {
   public:
       int roll;
       string name;
       float marks;
       Employee(int i, string n, float m)  
        {  
            roll = i;  
            name = n;  
            marks = s;
        }  
       void display()  
        {  
            cout<<roll<<"  "<<name<<"  "<<marks<<endl;  
        }  
};
int main(void) {
    Student s1 = Student(1, "John", 89); 
    Student s2 = Student(2, "Victor", 59); 
    s1.display();  
    s2.display();  
    return 0;
}

