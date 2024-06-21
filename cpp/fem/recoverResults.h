#pragma once

#include <iostream> 
#include <vector>
#include <cmath>
#include <Eigen/Dense>
#include <Eigen/LU>
#include <Eigen/Sparse>
#include <Eigen/Core>
#include <omp.h>

#include "elements.h"
#include "types.h"

std::unordered_map<std::string, Eigen::MatrixXd>
    recover_results(const Eigen::MatrixXd &xMat, const MatrixXidx &ixMat,
                    const Eigen::MatrixXd &materialMat, 
                    const Eigen::VectorXd &thkVec,
                    const Eigen::VectorXd &uVec);