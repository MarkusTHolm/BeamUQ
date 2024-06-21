import cppimport

cpp = cppimport.imp("test")


my_dict = {'A':100, 'B':200}

print(my_dict['A'])
print(my_dict['B'])



cpp.test_fun(my_dict)



