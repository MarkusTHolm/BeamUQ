#include "computation.h"
#include <pybind11/pybind11.h>
#include <pybind11/eigen.h>

namespace py = pybind11;


int test_indices(MatrixXidx ixMat) 
{
    // Add two numbers
    std::cout << " ixMat = \n " << ixMat << std::endl;
    
    VectorXidx edof(3);

    edof = ixMat.row(1);

    std::cout << "edof = " << edof << std::endl;

    return 0;
}

PYBIND11_MODULE(computation, m) {
    m.doc() = "auto-compiled c++ extension";
    m.def("test_indices", &test_indices);
}

/*
<%
cfg['compiler_args'] = ['-std=c++17']
cfg['include_dirs'] = ['..\..\..\lib\eigen']
setup_pybind11(cfg)
%>
*/

