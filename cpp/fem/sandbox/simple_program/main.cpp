
#include "computation.h"


int main() {

    double a = 4;
    double b = 9;
    
    double c = add(a, b);
    double d = multiply(a, b);
    double e = add_squareroots(a, b);

    std::cout << " c = " << c << std::endl;
    std::cout << " d = " << d << std::endl;
    std::cout << " e = " << e << std::endl;   

}