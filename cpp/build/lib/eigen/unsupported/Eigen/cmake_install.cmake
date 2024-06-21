# Install script for directory: /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/home/mtaho/anaconda3/envs/fenicsproject/bin/x86_64-conda-linux-gnu-objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen" TYPE FILE FILES
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/AdolcForward"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/AlignedVector3"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/ArpackSupport"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/AutoDiff"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/BVH"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/EulerAngles"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/FFT"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/IterativeSolvers"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/KroneckerProduct"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/LevenbergMarquardt"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/MatrixFunctions"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/MoreVectorization"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/MPRealSupport"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/NNLS"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/NonLinearOptimization"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/NumericalDiff"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/OpenGLSupport"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/Polynomials"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/Skyline"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/SparseExtra"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/SpecialFunctions"
    "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/Splines"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen" TYPE DIRECTORY FILES "/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/lib/eigen/unsupported/Eigen/src" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build/lib/eigen/unsupported/Eigen/CXX11/cmake_install.cmake")

endif()

