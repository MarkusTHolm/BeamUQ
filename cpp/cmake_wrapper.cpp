#include <pybind11/pybind11.h>
#include <pybind11/eigen.h>
#include <pybind11/numpy.h>
#include <pybind11/stl.h>

namespace py = pybind11;

#include "fem/fem.h"
#include "fem/recoverResults.h"
#include "util/writeVTU.h"

PYBIND11_MODULE(cppFem, m) 
{
    m.doc() = "CMake compiled C++ FEM extension";
    m.def("assemble_tangent_stiffness", &assemble_tangent_stiffness);
    m.def("recover_results", &recover_results);
}

