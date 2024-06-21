#pragma once

#include <iostream>
#include<Eigen/Dense>
#include<fstream>
 
using namespace std;
using namespace Eigen;

MatrixXd openData(string fileToOpen);

void saveData(string fileName, MatrixXd  matrix);