import sys
import cppimport
import numpy as np

cpp = cppimport.imp("computation")

ixMat = np.array([[1, 2, 3],
                  [3, 4, 5],
                  [6, 7, 8],
                  [9, 11, 12]])

print(ixMat)

a = cpp.test_indices(ixMat)

