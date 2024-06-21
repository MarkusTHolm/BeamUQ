import numpy as np
from scipy.linalg import lu_factor, lu_solve

class hydraulic_class():
    def __init__(self, N, L=1, source_idx=0):
        self.L = L
        self.N = N
        self.x = np.linspace(self.L/self.N,1,self.N)
        self.dx = self.L/self.N
        self.source_idx = source_idx
        self.source()

    def forward(self, a):
        diag1 = -(a[1:] + a[:-1])
        diag1 = np.concatenate([diag1,[-a[-1]]])
        diag2 = a[1:]

        Dxx = np.diag(diag1) + np.diag(diag2,-1) + np.diag(diag2,1)
        Dxx /= self.dx*self.dx

        lu, piv = lu_factor(Dxx)

        sol = lu_solve((lu, piv), self.b_terms) 

        return np.array(sol)

    def source(self, n_source=5, std=0.02):
        dist = self.L/(n_source+1)
        source_coords = np.linspace( dist,self.L-dist, n_source )
        self.b_terms =  np.exp( -0.5*(self.x - source_coords[self.source_idx])**2/std/std )/std/np.sqrt(2*np.pi) 
