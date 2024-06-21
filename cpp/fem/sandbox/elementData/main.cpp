#include <iostream>
#include <vector>
#include <cmath>
#include <tuple>

#include <cstdio> 

struct elementData {
    int crossSectionID;
    double E;
    double nu;
    double A;
    double ky;
    double Iz;
    double cy;
    double ymax;
};

struct elementData
    get_section_data(int crossSectionID, double E, double nu, double sg1, double sg2)
{
    /* Get cross sectional data. Note, the shear coefficients are from: 
    Cowper, G.R (1966) The Shear Coefficient in Timoshenko's Beam Theory 
    using the definition given in Cook et. al (2002) */

    
    struct elementData eData;
    
    // Set material parameters
    eData.crossSectionID = crossSectionID;
    eData.E = E;
    eData.nu = nu;

    switch (crossSectionID) 
    {  
        case 0: { // Rectangular
            double h = sg1;
            double thk = sg2;
            eData.A = h*thk;
            eData.ky = (12.0 + 11.0*nu)/(10.0*(1.0 + nu));                    
            eData.Iz = 1.0/12.0*pow(h,3)*thk;
            eData.cy = 1.50;
            eData.ymax = 0.5*h;
        }break;
        case 1: { // Circular              
            double r = sg1;
            eData.A = M_PI*pow(r, 2);
            eData.ky = (7.0 + 6.0*nu)/(6.0 + 6.0*nu);
            eData.Iz = M_PI*pow(r, 4)/4.0;
            eData.cy = 4.0/3.0;
            eData.ymax = r;   
            // double K = M_PI*pow(r, 4)*0.5       
        }break;
        default:
            std::cout << "ERROR: Wrong sectionID";
    }

    return eData;
};

std::vector<elementData> get_element_data(std::vector<std::vector<double>> materialMat)
{
    // Initialize vector of element data structs
    std::vector<elementData> eData;
    eData.push_back(elementData());

    for (int i = 0; i < 2; i++)
    {
        eData[i] = get_section_data(materialMat[i][0],materialMat[i][1],materialMat[i][2],
                                    materialMat[i][3],materialMat[i][4]);
    };

    std::cout << "Hello from get_element_data " << std::endl;

    std::cout << "E_0 = " << eData[0].E << " nu_0 = " << eData[0].nu << std::endl;
    std::cout << "E_1 = " << eData[1].E << " nu_1 = " << eData[1].nu << std::endl;

    for (int i = 0; i < 2; i++)
    {
        printf("cID = %d, E = %2.2f, nu = %2.2f, A = %2.2f, ky = %2.2f, "
                "Iz = %2.2e, cy = %2.2f, ymax = %2.2f \n", 
                eData[i].crossSectionID, eData[i].E, eData[i].nu, eData[i].A,
                eData[i].ky, eData[i].Iz, eData[i].cy, eData[i].ymax);
    }

    return eData;
};

int main() {

    std::vector<std::vector<double>> materialMat 
    {
        {0  ,1      ,0.3    ,0.2    ,0.3},
        {0  ,100    ,0.3    ,0.2    ,0.3},
    };

    std::cout << "Hello world" << std::endl;

    for (int i = 0; i < 2; i++)
    {
        for (int j = 0; j < 5; j++)
        {
            std::cout << " " << materialMat[i][j];
        }        
        std::cout << "\n";
    }

    auto eData = get_element_data(materialMat);
}