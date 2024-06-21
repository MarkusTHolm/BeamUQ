#include "elements.h"


struct elementMaterial get_material_data(const Eigen::VectorXd materialVals)
{
    // Get and insert material data into struct
    struct elementMaterial eMat;

    double E = materialVals(0);
    double nu = materialVals(1);
    double width = materialVals(2);
    
    // Set material parameters
    eMat.E = E;
    eMat.nu = nu;
    eMat.G = E/(2.0*(1.0 + nu));
    eMat.width = width;

    return eMat;
};


struct elementSection get_section_data(const struct elementMaterial eMat,
                                       const double thk)
{
    /* Get cross sectional data. The shear coefficients are from: 
    Cowper, G.R (1966) The Shear Coefficient in Timoshenko's Beam Theory 
    using the definition given in Cook et. al (2002) */

    struct elementSection eSect;

    // Rectangular beam
    eSect.A = thk*eMat.width;
    eSect.ky = (12.0 + 11.0*eMat.nu)/(10.0*(1.0 + eMat.nu));                    
    eSect.Iz = 1.0/12.0*pow(thk,3)*eMat.width;
    eSect.cy = 1.50;
    eSect.ymax = 0.5*thk;
    eSect.Wb = eSect.Iz/eSect.ymax;

    return eSect;
};

std::vector<elementMaterial> 
    get_element_materials(const Eigen::MatrixXd &materialMat)
{
    // Initialize vector of element data structs
    std::vector<elementMaterial> eMat;

    for (int i = 0; i < materialMat.rows(); i++)
    {
        eMat.push_back(get_material_data(materialMat(i, Eigen::placeholders::all)) );
    };

    return eMat;
};

Eigen::MatrixXd get_transformation_matrix(const double dx, const double dy) {
    // Compute the element transformation matrix from the global to local system

    Eigen::MatrixXd tMat = Eigen::MatrixXd::Zero(6, 6);
    Eigen::MatrixXd lamMat = Eigen::MatrixXd::Zero(3, 3);

    double beta = std::atan2(dy, dx);
    double c = std::cos(beta);
    double s = std::sin(beta);
    lamMat.row(0) << c  ,s  ,0;
    lamMat.row(1) << -s ,c  ,0; 
    lamMat.row(2) << 0  ,0  ,1;

    tMat(Eigen::seq(0, 2), Eigen::seq(0, 2)) = lamMat;
    tMat(Eigen::seq(3, 5), Eigen::seq(3, 5)) = lamMat;

    return tMat; 
}


Eigen::MatrixXd 
    get_element_stiffness(const Eigen::MatrixXd &xyMat, 
                          const struct elementMaterial &eMat,
                          const double thk)
{   

    // Initialize variables
    const double E = eMat.E, G = eMat.G;

    // Get cross section data
    const struct elementSection eSect = get_section_data(eMat, thk);
    const double A = eSect.A, Iz = eSect.Iz, ky = eSect.ky;
    
    // Initialize arrays
    Eigen::MatrixXd keMat = Eigen::MatrixXd::Zero(6, 6);
    Eigen::MatrixXd keMat_local = Eigen::MatrixXd::Zero(6, 6);

    // Compute length and section data
    const double dx = xyMat(1, 0) - xyMat(0, 0);
    const double dy = xyMat(1, 1) - xyMat(0, 1);
    const double L = std::sqrt( pow(dx, 2) + pow(dy, 2) );

    // Transformation matrix (between local and global system)
    auto tMat = get_transformation_matrix(dx, dy);

    // Compute element stiffness matrix (in local coordinate system)
    const double phi_y = 12.0*E*Iz*ky/( A*G*pow(L, 2) );
    double X = A*E/L;
    const double Y1 = 12.0*E*Iz/( (1.0 + phi_y)*pow(L, 3) );
    const double Y2 =  6.0*E*Iz/( (1.0 + phi_y)*pow(L, 2) );
    const double Y3 = (4.0 + phi_y)*E*Iz/( (1.0 + phi_y)*L );
    const double Y4 = (2.0 - phi_y)*E*Iz/( (1.0 + phi_y)*L );
    keMat_local.row(0) << X    ,0      ,0      ,-X     ,0      ,0   ;
    keMat_local.row(1) << 0    ,Y1     ,Y2     ,0      ,-Y1    ,Y2  ;
    keMat_local.row(2) << 0    ,Y2     ,Y3     ,0      ,-Y2    ,Y4  ;
    keMat_local.row(3) << -X   ,0      ,0      ,X      ,0      ,0   ;
    keMat_local.row(4) << 0    ,-Y1    ,-Y2    ,0      ,Y1     ,-Y2 ;
    keMat_local.row(5) << 0    ,Y2     ,Y4     ,0      ,-Y2    ,Y3  ;

    // Rotate to global coordinate system
    keMat = tMat.transpose() * keMat_local * tMat;

    return keMat;
}

std::tuple<double, double, double, double, double, Vector6f> 
    get_element_results(const Eigen::MatrixXd &xyMat, const Eigen::VectorXd &ueVec,
                        const struct elementMaterial &eMat, double thk)
{
    // Compute element results (stress, strain, strain energy density) 

    // Get cross section data
    const struct elementSection eSect = get_section_data(eMat, thk);
    const double A = eSect.A, Wb = eSect.Wb, cy = eSect.cy;
    
    // Compute length and section data
    const double dx = xyMat(1, 0) - xyMat(0, 0);
    const double dy = xyMat(1, 1) - xyMat(0, 1);
    const double L = std::sqrt( pow(dx, 2) + pow(dy, 2) );
 
    // Transformation matrix (between local and global system)
    const auto tMat = get_transformation_matrix(dx, dy);

    // Compute strain energy density (W = 1/2*u^T*K*u) and internal forces
    const auto keMat = get_element_stiffness(xyMat, eMat, thk);
    const Vector6f feintVec = keMat*ueVec;
    const Vector6f feintVec_local = tMat*feintVec;
    const double W = 0.5*1/(A*L)*ueVec.transpose()*feintVec;    

    // Compute element forces and stresses
    const double N_x0 = feintVec_local(0);
    // double N_xL = feintVec_local(3);
    const double NMax = std::abs({N_x0});

    const double Vy_x0 = std::abs(feintVec_local(1));
    const double Vy_xL = std::abs(feintVec_local(4));
    const double VyMax = std::max({Vy_x0, Vy_xL});

    const double Mz_x0 = std::abs(feintVec_local(2));
    const double Mz_xL = std::abs(feintVec_local(5));  
    const double MzMax = std::max({Mz_x0, Mz_xL});

    const double tau_y = cy*VyMax/A;

    const double sigma_a = NMax/A;
    const double sigma_b = MzMax/Wb;

    const double sigma_x = sigma_a + sigma_b;
    
    return {sigma_x, sigma_a, sigma_b, tau_y, W, feintVec};
}

Eigen::MatrixXd 
    get_stiffness_sensitivity(const Eigen::MatrixXd &xyMat,
                              const struct elementMaterial &eMat,
                              double xval, double thk, double tMin, 
                              double tMax, double q_thk)
{
    /*  Compute the sensitivity of the element stiffness matrix with respect
    to the element design variable xe (dKedxe)
    */

    // Initialize
    Eigen::MatrixXd dkeMatdte_local = Eigen::MatrixXd::Zero(6, 6);

    // Get section data
    const struct elementSection eSect = get_section_data(eMat, thk);

    // Offload data
    const double E = eMat.E;
    const double G = eMat.G;
    const double width = eMat.width;
    const double ky = eSect.ky;

    // Compute length and section data
    const double dx = xyMat(1, 0) - xyMat(0, 0);
    const double dy = xyMat(1, 1) - xyMat(0, 1);
    const double L = std::sqrt( pow(dx, 2) + pow(dy, 2) );
 
    // Optimized code directly from Maple
    double t1 = 0.1e1 / L;
    double t2 = width * E;
    double t3 = t2 * t1;
    double t4 = 0.1e1 / G;
    double t5 = pow(t1, 0.2e1);
    t1 = t1 * t5;
    double t6 = thk * thk;
    double t7 = E * t6 * ky;
    double t8 = t7 * t4 * t5;
    double t9 = 0.1e1 + t8;
    t9 = 0.1e1 / t9;
    t2 = t2 * t6 * t9;
    double t10 = t2 * t1 * (-0.2e1 * t8 * t9 + 0.3e1);
    t2 = t2 * t5 * (0.3e1 / 0.2e1 - t8 * t9);
    t5 = -t10;
    t8 = (0.4e1 + t8) * t9;
    t1 = E * E * pow(t6, 0.2e1) * ky * t4 * t1 * width * t9 *
         (0.1e1 - t8) / 0.6e1 + t8 * t3 * t6 / 0.4e1;
    t4 = -t2;
    t8 = G * L * L;
    t9 = t7 + t8;
    t9 = pow(t9, -0.2e1);
    t6 = t3 * t6 * (t7 + 0.2e1 * t8) * (t7 - t8) * t9 / 0.4e1;
    dkeMatdte_local(0, 0) = t3;
    dkeMatdte_local(0, 1) = 0;
    dkeMatdte_local(0, 2) = 0;
    dkeMatdte_local(0, 3) = -t3;
    dkeMatdte_local(0, 4) = 0;
    dkeMatdte_local(0, 5) = 0;
    dkeMatdte_local(1, 0) = 0;
    dkeMatdte_local(1, 1) = t10;
    dkeMatdte_local(1, 2) = t2;
    dkeMatdte_local(1, 3) = 0;
    dkeMatdte_local(1, 4) = t5;
    dkeMatdte_local(1, 5) = t2;
    dkeMatdte_local(2, 0) = 0;
    dkeMatdte_local(2, 1) = t2;
    dkeMatdte_local(2, 2) = t1;
    dkeMatdte_local(2, 3) = 0;
    dkeMatdte_local(2, 4) = t4;
    dkeMatdte_local(2, 5) = -t6;
    dkeMatdte_local(3, 0) = -t3;
    dkeMatdte_local(3, 1) = 0;
    dkeMatdte_local(3, 2) = 0;
    dkeMatdte_local(3, 3) = t3;
    dkeMatdte_local(3, 4) = 0;
    dkeMatdte_local(3, 5) = 0;
    dkeMatdte_local(4, 0) = 0;
    dkeMatdte_local(4, 1) = t5;
    dkeMatdte_local(4, 2) = t4;
    dkeMatdte_local(4, 3) = 0;
    dkeMatdte_local(4, 4) = t10;
    dkeMatdte_local(4, 5) = t4;
    dkeMatdte_local(5, 0) = 0;
    dkeMatdte_local(5, 1) = t2;
    dkeMatdte_local(5, 2) = -t6;
    dkeMatdte_local(5, 3) = 0;
    dkeMatdte_local(5, 4) = t4;
    dkeMatdte_local(5, 5) = t1;

    // Use the chain-rule to get the derivative with respect to x
    const double dthkdx = q_thk*pow(xval,q_thk-1)*(tMax - tMin);
    Eigen::MatrixXd dkeMatdxe_local = dkeMatdte_local*dthkdx;

    // Transformation matrix (between local and global system)
    const auto tMat = get_transformation_matrix(dx, dy);

    // Rotate to global coordinate system
    Eigen::MatrixXd dkeMatdxe = tMat.transpose()*dkeMatdxe_local*tMat;

    return dkeMatdxe;
}

std::tuple<double, double, double>
    get_element_volume_sens(const Eigen::MatrixXd &xyMat,
                            const struct elementMaterial &eMat,
                            double xval, double thk, double tMin,
                            double tMax, double q_thk)
{
    /* Compute the element volume (Ve) and its sensitivity with respect to
    the design variable x (dVedx) */

    // Compute element length
    const double dx = xyMat(1, 0) - xyMat(0, 0);
    const double dy = xyMat(1, 1) - xyMat(0, 1);
    const double L = std::sqrt( pow(dx, 2) + pow(dy, 2) );
 
    const double width = eMat.width;
    const double dthkdx = q_thk*pow(xval,q_thk-1)*(tMax - tMin);

    const double Ve = width*L*thk;
    const double dVedx = width*L*dthkdx;
    const double V0e = width*L*tMax;

    return {Ve, dVedx, V0e};
}

std::tuple<double, double, double, double>
    get_element_section_sens(const struct elementMaterial &eMat,
                             double xval, double thk, double tMin,
                             double tMax, double q_thk)
{
    /* Compute the element section data (area=A, section modulus=Wb) and 
    sensitivity with respect to the design variable x */

    const struct elementSection eSect = get_section_data(eMat, thk);
 
    const double width = eMat.width;
    const double dthkdx = q_thk*pow(xval,q_thk-1)*(tMax - tMin);
    
    const double A = eSect.A;
    const double Wb = eSect.Iz/eSect.ymax;

    const double dAdx = dthkdx*width;
    const double dWbdx = thk*width*dthkdx/3.0;

    return {A, Wb, dAdx, dWbdx};
}
