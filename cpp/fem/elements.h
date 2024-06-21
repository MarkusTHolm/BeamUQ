#pragma once

#define _USE_MATH_DEFINES

#include <iostream> 
#include <cstdio> 
#include <vector>
#include <cmath>
#include <tuple>
#include <Eigen/Dense>
#include <Eigen/LU>
#include <Eigen/Sparse>
#include <Eigen/Core>

struct elementMaterial {
    double E;
    double nu;
    double G;
    double width;
};

struct elementSection {
    double A;
    double ky;
    double Iz;
    double cy;
    double ymax;
    double Wb;
};

typedef Eigen::Matrix<double, 6, 1> Vector6f;

struct elementSection get_section_data(const struct elementMaterial eMat,
                                       const double thk);

Eigen::MatrixXd get_transformation_matrix(const double dx, const double dy);

Eigen::MatrixXd 
    get_element_stiffness(const Eigen::MatrixXd &xyMat, 
                          const struct elementMaterial &eMat,
                          const double thk);

std::tuple<double, double, double, double, double, Vector6f> 
    get_element_results(const Eigen::MatrixXd &xyMat, const Eigen::VectorXd &ueVec,
                        const struct elementMaterial &eMat, double thk);

std::vector<elementMaterial> 
    get_element_materials(const Eigen::MatrixXd &materialMat);

Eigen::MatrixXd 
    get_stiffness_sensitivity(const Eigen::MatrixXd &xyMat,
                              const struct elementMaterial &eMat,
                              double xval, double thk, double tMin, 
                              double tMax, double q_thk);

std::tuple<double, double, double>
    get_element_volume_sens(const Eigen::MatrixXd &xyMat,
                            const struct elementMaterial &eMat,
                            double xval, double thk, double tMin,
                            double tMax, double q_thk);

std::tuple<double, double, double, double>
    get_element_section_sens(const struct elementMaterial &eMat,
                             double xval, double thk, double tMin,
                             double tMax, double q_thk);