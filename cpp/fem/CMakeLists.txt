# Make fem library
add_library(fem SHARED fem.cpp 
                       elements.cpp 
                       recoverResults.cpp)

# Use target_link_libraries to link the library to this library
target_link_libraries(fem PRIVATE Eigen3::Eigen)

# State that anybody linking to this library needs to include the current source
# dir to find header files
target_include_directories(fem
                           INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})               
