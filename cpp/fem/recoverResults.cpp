#include "recoverResults.h"

std::unordered_map<std::string, Eigen::MatrixXd>
    recover_results(const Eigen::MatrixXd &xMat, const MatrixXidx &ixMat,
                    const Eigen::MatrixXd &materialMat, 
                    const Eigen::VectorXd &thkVec,
                    const Eigen::VectorXd &uVec)
{
     // Initialize variables
    Eigen::Index nel = ixMat.rows();
    Eigen::Index nn = xMat.rows();
    Eigen::Index ndof = nn*3;
    int nen = 2;
    int ldof = nen*3;

    // Initialize arrays
    Eigen::VectorXd fintVec(ndof);
    fintVec.setZero();

    // Get element material data
    std::vector<elementMaterial> eMat = get_element_materials(materialMat);

    // Variables for storing results
    Eigen::MatrixXd resMat(nel, 5);
    resMat.setZero();
    std::unordered_map<std::string, Eigen::MatrixXd> res;

    #pragma omp parallel for
    for (int e = 0; e < nel; e++)  {
        int matID = ixMat(e, 3);
        VectorXidx enodes = ixMat(e, Eigen::seq(1, nen));
        Eigen::MatrixXd xyMat = xMat(enodes, Eigen::seq(1, 2));

        if (matID == 0) {
            continue;
        }

        VectorXidx edof(ldof);
        for (int i = 0; i < nen; i++) {
            edof(3*i + 0) = 3*enodes(i) + 0;
            edof(3*i + 1) = 3*enodes(i) + 1;
            edof(3*i + 2) = 3*enodes(i) + 2;
        }

        const Eigen::VectorXd ueVec = uVec(edof);

        auto [sigma_x, sigma_a, sigma_b, tau_y, W, feintVec] = 
            get_element_results(xyMat, ueVec, eMat[matID], thkVec[e]); 

        // Store results 
        resMat.row(e) << sigma_x, sigma_a, sigma_b, tau_y, W;

        #pragma omp critical
        fintVec(edof) += feintVec;
    }


    // Save results
    res["uVec"] = uVec;    
    res["sigma_x"] = resMat.col(0);
    res["sigma_a"] = resMat.col(1);
    res["sigma_b"] = resMat.col(2);
    res["tau_y"] = resMat.col(3);
    res["W"] = resMat.col(4);
    res["fintVec"] = fintVec;
    
    return res;
}
