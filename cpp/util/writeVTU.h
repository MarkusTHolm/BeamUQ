#pragma once

#include <pybind11/pybind11.h>
#include <pybind11/eigen.h>
#include <pybind11/numpy.h>
#include <pybind11/stl.h>

namespace py = pybind11;

#include <cmath>
#include <string>
#include <vector>
#include <tuple>
#include <iostream>

#include <Eigen/Dense>
#include <Eigen/LU>
#include <Eigen/Sparse>
#include <Eigen/Core>

#include "vtu11/vtu11.hpp"

void writeVTU(Eigen::VectorXd points, Eigen::VectorXd connectivity, 
              Eigen::VectorXd offsets, Eigen::VectorXd types,
              py::list cellNames, Eigen::MatrixXd cellData,
              py::list pointNames, Eigen::MatrixXd pointData,
              std::string writeFormat, std::string fullPath);