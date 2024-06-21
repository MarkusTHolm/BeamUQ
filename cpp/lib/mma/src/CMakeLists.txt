# Make fem library
add_library(mma SHARED MMA.cpp)

# Use target_link_libraries to link the library to this library
target_link_libraries(mma PRIVATE Eigen3::Eigen MPI::MPI_CXX)

# State that anybody linking to this library needs to include the current source
# dir to find header files
target_include_directories(mma
                           INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})               
