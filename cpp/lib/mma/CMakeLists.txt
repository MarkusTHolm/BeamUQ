# ################################################################################
# cmake_minimum_required(VERSION 3.22)
# ################################################################################

# # Set C++ standard
# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED True)

# set(CMAKE_BUILD_TYPE "Release")

# if(NOT CMAKE_BUILD_TYPE)
#   set(CMAKE_BUILD_TYPE Release)
# endif()

# set(CMAKE_CXX_FLAGS "-Wall -Wextra")
# set(CMAKE_CXX_FLAGS_DEBUG "-g")
# set(CMAKE_CXX_FLAGS_RELEASE "-O3")

# ################################################################################
# # Initialize project
# ################################################################################

# # Project name and version
# project(cppMMA)

# #find_package(MPI REQUIRED) 

# # Add the subdirectories
# add_subdirectory(src)
# # add_subdirectory(../eigen build)

# ################################################################################
# # Pure C++ (for testing)
# ################################################################################

# # Add the executable
# add_executable(testMMA tests/testMMA.cpp)

# # Link libraries to the executable
# find_package(Eigen3 3.3 REQUIRED NO_MODULE)
# target_link_libraries(testMMA PUBLIC Eigen3::Eigen MPI::MPI_CXX mma)


