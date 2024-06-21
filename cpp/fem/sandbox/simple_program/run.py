import sys
import cppimport

cpp = cppimport.imp("computation")

a = 4
b = 9

c = cpp.add(a, b)
d = cpp.multiply(a, b)
e = cpp.add_squareroots(a, b)


print("a = ", a)
print("b = ", b)
print("c = ", c)
print("d = ", d)
print("e = ", e)


print("f = ", cpp.add_squareroots(81, 9))