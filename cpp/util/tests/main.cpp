#include <iostream>
#include<Eigen/Dense>
#include<fstream>
 
using namespace std;
using namespace Eigen;

#include "../utilities.h"

int main()
{
    // test matrix to be saved
    MatrixXd matrix_test(4, 4);
     
    // define the test matrix
    matrix_test << 1.2, 1.4, 1.6, 1.8,
        1.5, 1.7, 1.9, 1.10,
        0.8, 1.2, -0.1, -0.2,
        1.3, 99, 100, 112;
 
    // save test matrix
    saveData("matrix.csv", matrix_test);
 
    // matrix to be loaded from a file
    MatrixXd matrix_test2;
 
    // load the matrix from the file
    matrix_test2 = openData("matrix.csv");
     
    // print the matrix in console
    cout << matrix_test2;
     
    // test the load function on a matrix defined outside this environment.
    // make sure that the "matrix_outside.csv" file exhists
    /*MatrixXd matrix_test3;
     
    matrix_test3 = openData("matrix_outside.csv");
 
    cout <<"\n\n"<< matrix_test3<<"\n\n";
 
    cout << 10*matrix_test3 << "\n";*/
}