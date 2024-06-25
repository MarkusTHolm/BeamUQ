# Install script for directory: /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen

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
  set(CMAKE_OBJDUMP "/home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen" TYPE FILE FILES
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/AdolcForward"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/AlignedVector3"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/ArpackSupport"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/AutoDiff"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/BVH"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/EulerAngles"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/FFT"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/IterativeSolvers"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/KroneckerProduct"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/LevenbergMarquardt"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/MatrixFunctions"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/MPRealSupport"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/NNLS"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/NonLinearOptimization"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/NumericalDiff"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/OpenGLSupport"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/Polynomials"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/SparseExtra"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/SpecialFunctions"
    "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/Splines"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen" TYPE DIRECTORY FILES "/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/lib/eigen/unsupported/Eigen/src" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/lib/eigen/unsupported/Eigen/CXX11/cmake_install.cmake")

endif()

