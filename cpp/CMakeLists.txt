################################################################################
cmake_minimum_required(VERSION 3.22)
################################################################################

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_BUILD_TYPE "Release")

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_CXX_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -march=native -finline-functions -fopenmp")

################################################################################
# Initialize project
################################################################################

# Project name and version
project(cppFem)

# Add the subdirectories
add_subdirectory(fem)
add_subdirectory(util)
add_subdirectory(lib/eigen)
add_subdirectory(lib/vtu11)

find_package(Eigen3 3.4 REQUIRED NO_MODULE)

################################################################################
# Make wraper for python with pybind11
################################################################################

# Add pybind11
add_subdirectory(lib/pybind11)

# Make pybind11 module (equivalent to add executable)
pybind11_add_module(cppFem cmake_wrapper.cpp 
                           util/writeVTU.cpp 
                           util/writeVTU.h)

# Link libraries to the executable
target_link_libraries(cppFem PUBLIC Eigen3::Eigen vtu11 fem)

################################################################################
# Install program (Not applicable)
################################################################################

# set(PYTHON_LIBRARY_DIR "/home/mtaho/Code/LatOpt/venv/lib/python3.10/site-packages")
# set(PYTHON_EXECUTABLE "/home/mtaho/Code/LatOpt/venv/bin/python3")

# install(TARGETS cppFem
#   COMPONENT python
#   LIBRARY DESTINATION "${PYTHON_LIBRARY_DIR}"
#   )

################################################################################