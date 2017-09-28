#include "greeter.hpp"
#include "rectangley.h"
#include "triangley.h"
#include <iostream>

int main(int argc, char* argv[]) {
    Greeter g("Human Folk");
    g.greet();
    std::cout << "Rectangley has " << Rectangley(4, 5).getArea() << " area units." << std::endl;
    std::cout << "Triangley has " << Triangley(4, 5).getArea() << " area units." << std::endl;
    return 0;
}
