import os
import sys
import datetime
import logging
import timeit
import numpy as np
import scipy
import scipy.sparse as sp
import matplotlib.pyplot as plt

import cvxopt
import cvxopt.cholmod
import cvxopt.umfpack

file_path = os.path.dirname(os.path.abspath(__file__))
module_path = os.path.realpath(file_path + '/cpp/build/')
sys.path.append(module_path)

import cppFem

class BeamModel1D:
    def __init__(self, nelx, L):
        # Parameters
        self.L = L
        self.E = 210e9
        self.nu = 0.3
        self.width = 0.5
        self.Fx = 3.0e9
        self.Fy = 0.5e7 

        self.xMat, self.ixMat = self.create_mesh(nelx)

        self.materialMat = np.array([[self.E, self.nu, self.width],
                                     [self.E, self.nu, self.width]])
        
        # Assemble load vector
        nel = np.shape(self.ixMat)[0]
        nn = np.shape(self.xMat)[0]
        ndof = nn*3
        self.fVec = np.zeros((ndof, ))
        # self.fVec[-3] = Fx
        self.fVec[-2] = self.Fy
       
    def forward(self, thk):

        # Assemble stifness matrix
        kMat = cppFem.assemble_tangent_stiffness(self.xMat, self.ixMat, 
                                                 self.materialMat, thk)

        # Apply Dirichlet BC's
        dofs = [0, 1, 2] 
        kMat[dofs, :] = 0.0
        kMat[:, dofs] = 0.0
        kMat[dofs, dofs] = 1.0

        # Solve system
        # kMat = 0.5 * (kMat.T + kMat)     # Enforce symmetry
        # kMat = kMat.tocoo()
        # K = cvxopt.spmatrix(kMat.data, 
        #                     kMat.row.astype(np.int64), 
        #                     kMat.col.astype(np.int64))
        # B = cvxopt.matrix(self.fVec)
        # cvxopt.cholmod.linsolve(K, B)
        # u = np.array(B)[:, 0]
        kMat = kMat.tocsc()
        u = sp.linalg.spsolve(kMat, self.fVec)
        v = u[1::3]

        return v

    def create_mesh(self, nelx):
        """ Create a line mesh (see example below)"""        
        """
            nelx(=5), nx(=6), L
        o-----o-----o-----o-----o-----o
        """

        # Initialize
        nn = nelx + 1
        nnx = nn
        nel = nelx
        xMat = np.zeros((nn, 2))
        ixMat = np.zeros((nel, 2), dtype=np.int64)

        # Define nodal coordinates
        node = 0
        dx = self.L/nelx
        for nx in range(0, nnx):
            xMat[node, 0] = nx*dx
            node += 1

        # Connectivity
        e = 0
        for nx in range(0, nnx):
            # Current node                
            n = nx
            # Neighboring nodes
            nxp1 = (nx + 1)                 # Right

            # Connect current node to the right node (if it exists)              
            if nx < nnx - 1:
                ixMat[e, 0] = n
                ixMat[e, 1] = nxp1
                e += 1         

        xMat = np.vstack((np.arange(nn), xMat.T)).T
        ixMat = np.vstack((np.arange(nelx), ixMat.T, np.ones(nelx))).T
        ixMat = ixMat.astype(np.int64)

        return xMat, ixMat

if __name__ == '__main__':
    nelx = 3
    beam = BeamModel1D(nelx=nelx, L=1.5)
    v = beam.forward(thkVec=np.ones(nelx))
    print(f"v = {v}")
