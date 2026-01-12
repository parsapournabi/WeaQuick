#include <QCoreApplication>
#include <iostream>


int main(int argc, char** argv)
{
    QCoreApplication app(argc, argv);
    std::cout << "Example for " << "@MODULE_NAME@" << std::endl;
    return 0;
}
