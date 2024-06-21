#include <iostream>
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>

#include <pybind11/embed.h> // <= You need this header


namespace py = pybind11;
// using namespace py::literals;


std::map<std::string, int> convert_dict_to_map(py::dict dictionary)
{
    std::map<std::string, int> result;
    for (std::pair<py::handle, py::handle> item : dictionary)
    {
        auto key = item.first.cast<std::string>();
        auto value = item.second.cast<int>();
        //cout << key << " : " << value;
        result[key] = value;
    }
    return result;
}

int print_dicts(py::dict dictionary)
{

    //py::scoped_interpreter guard{}; // <= Initialize the interpreter

    for (auto item : dictionary)
    {
        std::cout << "key: " << item.first << ", value=" << item.second << std::endl;
    };
    // system("pause");
    // auto result = convert_dict_to_map(dictionary);

    // auto a = dictionary[py::cast("A")];

    // std::cout << "C++: A = " << dictionary.cast<int>() << std::endl;

    return 0;
}


PYBIND11_MODULE(test, m) 
{
    m.doc() = "auto-compiled c++ extension";
    m.def("test_fun", &print_dicts);
}

/*
<%
cfg['compiler_args'] = ['-std=c++17']
setup_pybind11(cfg)
%>
*/

