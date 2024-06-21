#pragma once

#include <Eigen/Dense>
#include <Eigen/LU>
#include <Eigen/Sparse>
#include <Eigen/Core>

typedef Eigen::Matrix<Eigen::Index, Eigen::Dynamic, Eigen::Dynamic> MatrixXidx;
typedef Eigen::Matrix<Eigen::Index, Eigen::Dynamic, 1> VectorXidx;