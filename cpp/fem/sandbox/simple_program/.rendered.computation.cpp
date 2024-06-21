#include <pybind11/pybind11.h>
namespace py = pybind11;

#include "computation.h"
#include "squareroot.h"

double add(double a, double b) {
    // Add two numbers
    double c = a + b;
    return c;
}

double multiply(double a, double b) {
    // Multiply two numbers
    double c = a * b;
    return c;
}

double add_squareroots(double a, double b) {
    // Add the squre roots of two numbers
    double c = squareroot(a) + squareroot(b);
    return c;
}

PYBIND11_MODULE(computation, m) {
    m.doc() = "auto-compiled c++ extension";
    m.def("add", &add);
    m.def("multiply", &multiply);
    m.def("add_squareroots", &add_squareroots);
}

/*

*/