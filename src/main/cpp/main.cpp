#include "greeter.hpp"
#include "timey.h"
#include "rectangley.h"
#include "triangley.h"
#include <iostream>
#include <string>

int main(int argc, char* argv[]) {
    Greeter g("Gradle User");
    g.greet();
    std::cout << "Rectangley has " << Rectangley(4, 5).getArea() << " area units." << std::endl;
    std::cout << "Triangley has " << Triangley(4, 5).getArea() << " area units." << std::endl;
    return 0;
}
