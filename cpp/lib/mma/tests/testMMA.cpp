#include <iostream>
#include <mpi.h>
#include <MMA.h>
#include <cmath>
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>

void ObjSens(
    Eigen::VectorXd const& x, 
    int const& n, 
    double &f, Eigen::VectorXd &df,
    Eigen::VectorXd &g, Eigen::MatrixXd &dg);

int main()
{

    // Initialize test problem (from https://github.com/jdumas/mma/blob/master/tests/main.cpp)
    int n = 100;
	int m = 2;

	double Xmin = -1.0;
	double Xmax = 1.0;
	double movlim = 0.1;

    double f;
    Eigen::VectorXd g(m);
    Eigen::VectorXd x(n), xold(n);
    Eigen::VectorXd xmax(n), xmin(n);
    Eigen::VectorXd af(n), bf(n);
    Eigen::VectorXd df(n);
    Eigen::MatrixXd dg(n, m);

	for (int i=0;i<n;i++) {
		x[i] = 0.5;
		xold[i] = 0.5;
	}

    // Initialize MPI
    MPI_Init(NULL, NULL);
    MPI_Comm Opt_Comm = MPI_COMM_WORLD;

    // Initialize MMA
    MMA * optmma = new MMA;
    optmma->Set_Comm(Opt_Comm);
    optmma->Set_Values(x);
    optmma->Set_n(n);
    optmma->Set_It(0);

    // Optimization loop
	double ch = 1.0;
	int itr = 0;
	while (ch > 0.002 && itr<100) {
		itr++;

        // Compute objectives and sensitivities
		ObjSens(x,n,f,df,g,dg);

        // Set outer move limits
        for (int i=0;i<n;i++) {
            xmax[i] = std::min(Xmax, x[i] + movlim);
            xmin[i] = std::max(Xmin, x[i] - movlim);
        }
        optmma->Set_Lower_Bound(xmin);
        optmma->Set_Upper_Bound(xmax);

		// Call the update method
		optmma->Update(df, g, dg);

        x = optmma->Get_x();

		// Compute inf-norm on design change
		ch = 0.0;
		for (int i=0;i<n;i++) {
			ch = std::max(ch,std::abs(x[i]-xold[i]));
			xold[i] = x[i];
		}

		// Print to screen
		printf("it.: %d, obj.: %f, ch.: %f \n",itr, f, ch);
	}

    // Print result
    std::cout << "x = \n" << x.transpose() << std::endl;

	// Deallocate and finalize MPI
	delete optmma;
    MPI_Finalize();

    return 0;
}


void ObjSens(
    Eigen::VectorXd const& x, 
    int const& n, 
    double &f, Eigen::VectorXd &df,
    Eigen::VectorXd &g, Eigen::MatrixXd &dg)
{
	f = 0.0;
	for (int i=0;i<n;i++) {
		f = f + pow(x[i],2.0)+ pow(x[i],3.0);
	}

	for (int i=0;i<n;i++) {
		df[i] = 2*x(i)+ 3*pow(x(i),2.0);
		df[i] = df[i]/((double)n);
	}

	g[0] = 0.0;
	for (int i=0;i<n;i++) {
		g[0] += x[i];
	}
	g[0] = g[0]/((double)n) + 1.0;

	g[1] = 0.0;
	for (int i=0;i<n;i++) {
		g[1] += sin(x[i]);
	}
	g[1] = g[1]/((double)n) - 1.0;

	for (int i=0;i<n;i++) {
		dg(i,0) = 1.0/((double)n);
		dg(i,1) = cos(x[i])/((double)n);
	}

}
