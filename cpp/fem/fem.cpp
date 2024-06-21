#include "fem.h"

Eigen::SparseMatrix<double>
    assemble_tangent_stiffness(const Eigen::MatrixXd &xMat, 
                               const MatrixXidx &ixMat,
                               const Eigen::MatrixXd &materialMat,
                               const Eigen::VectorXd &thkVec)
{
    /* Assemble the global stiffness matrix */

    // Initialize variables
    Eigen::Index nel = ixMat.rows();
    Eigen::Index nn = xMat.rows();
    Eigen::Index ndof = nn*3;
    const int nen = 2;
    const int ldof = nen*3;

    // Initialize arrays
    Eigen::SparseMatrix<double> kMat(ndof, ndof);
    kMat.setZero();
    VectorXidx edof(ldof), enodes(nen);
    Eigen::MatrixXd xyMat(nen, 2);

    // Get element material data
    std::vector<elementMaterial> eMat = get_element_materials(materialMat);

    // Initialize triplet list
    typedef Eigen::Triplet<double> T;
    std::vector<T> tripletList;
    tripletList.reserve(nel*ldof*ldof);
    
    #pragma omp parallel for
    for (int e = 0; e < nel; e++)  {
        int matID = ixMat(e, 3);
        VectorXidx enodes = ixMat(e, Eigen::seq(1, nen));
        Eigen::MatrixXd xyMat = xMat(enodes, Eigen::seq(1, 2));

        VectorXidx edof(nen*3);
        for (int i = 0; i < nen; i++) {
            edof(3*i + 0) = 3*enodes(i) + 0;
            edof(3*i + 1) = 3*enodes(i) + 1;
            edof(3*i + 2) = 3*enodes(i) + 2;
        }

        // Get element stiffness matrix
        auto keMat = get_element_stiffness(xyMat, eMat[matID], thkVec[e]);

        // Add to the global system
        std::vector<T> localTripletList;
        for (int krow = 0; krow < ldof; krow++) {
            for (int kcol = 0; kcol < ldof; kcol++) {
                int m = edof(krow);
                int n = edof(kcol);
                double kval = keMat(krow, kcol);
                localTripletList.push_back(T(m, n, kval));
            }
        }        

        #pragma omp critical
        tripletList.insert(tripletList.end(), localTripletList.begin(), localTripletList.end());
    }


    // Form global stiffness matrix from triplets
    kMat.setFromTriplets(tripletList.begin(), tripletList.end());  
    // kMat.makeCompressed();      // Store in compressed column format       

    return kMat;
};

std::tuple<double, std::vector<Eigen::Index>, Eigen::VectorXd, 
           Eigen::SparseMatrix<double>>
    get_prescribed_constraint_indicators(const Eigen::MatrixXd &constraintMat,
                                         Eigen::Index ndof)
{
    // Initialize
    double nconstDofs = constraintMat.rows();
    Eigen::MatrixXd prescVals = Eigen::MatrixXd::Zero(nconstDofs, 1);
    std::vector<Eigen::Index> prescInds(nconstDofs);

    // Find values and indices of prescribed displacements
    for (Eigen::Index i = 0; i < nconstDofs; i++) {
        Eigen::Index idx = 3*constraintMat(i, 0) + constraintMat(i, 1);
        prescInds[i] = idx;
        prescVals(i) = constraintMat(i, 2);
    }
    
    // Initialize constraint matrix
    Eigen::Index nfreeDof = ndof - nconstDofs;
    typedef Eigen::Triplet<double> T;
    std::vector<T> tripletList;
    tripletList.reserve(nconstDofs*nfreeDof);
    Eigen::SparseMatrix<double> constMat(ndof, nfreeDof);
    Eigen::Index j = 0;

    // Create constraint matrix
    for (Eigen::Index i = 0; i < ndof; i++) {

        // Go to next index if i is in prescInds
        auto result = std::find(prescInds.begin(), prescInds.end(), i);
        if ( result != std::end(prescInds) ) {

        } else {
            tripletList.push_back(T(i, j, 1));
            j += 1;
        }        
    }

    constMat.setFromTriplets(tripletList.begin(), tripletList.end());  
    constMat.makeCompressed();      // Store in compressed column format       

    return {nconstDofs, prescInds, prescVals, constMat};
}

Eigen::VectorXd assemble_load_vector(const Eigen::MatrixXd &loadMat,
                                     const Eigen::Index ndof)
{
    // Assemble global load vector (right-hand side vector)
    Eigen::VectorXd fVec = Eigen::VectorXd::Zero(ndof);
    for (int i = 0; i < loadMat.rows(); i++) {
        Eigen::Index idx = 3*loadMat(i, 0) + loadMat(i, 1);
        fVec(idx) = loadMat(i, 2);
    }
    return fVec;
}