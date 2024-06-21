#pragma once

#include <iostream> 
#include <cstdio>
#include <vector>
#include <cmath>
#include <Eigen/Dense>
#include <Eigen/LU>
#include <Eigen/Sparse>
#include <Eigen/Core>

#include "elements.h"
#include "types.h"

struct meshData {
    Eigen::MatrixXd xMat;
    MatrixXidx ixMat;
    Eigen::MatrixXd materialMat;
    Eigen::VectorXd thkVec;   
    Eigen::MatrixXd eidMat;
    Eigen::MatrixXd constraintMat;
    Eigen::VectorXd xVec;
    double vfrac;
    double tMin;
    double tMax;
    double q_thk;
    Eigen::Index nel;
    Eigen::Index nn;
    Eigen::Index ndof;    
    const int nen = 2;
    const int ldof = 6;
};

Eigen::SparseMatrix<double>
    assemble_tangent_stiffness(const Eigen::MatrixXd &xMat, 
                               const MatrixXidx &ixMat,
                               const Eigen::MatrixXd &materialMat,
                               const Eigen::VectorXd &thkVec);

std::tuple<double, std::vector<Eigen::Index>, Eigen::VectorXd, 
           Eigen::SparseMatrix<double>>
    get_prescribed_constraint_indicators(const Eigen::MatrixXd &constraintMat,
                                         Eigen::Index ndof);
                                        
Eigen::VectorXd assemble_load_vector(const Eigen::MatrixXd &loadMat,
                                     const Eigen::Index ndof);

