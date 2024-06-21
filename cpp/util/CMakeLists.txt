
# add_subdirectory(../lib/pybind11 ${CMAKE_CURRENT_BINARY_DIR}/../)

# # Make fem library
# add_library(writeVTU SHARED writeVTU.cpp)

# # Use target_link_libraries to link the library to this library
# target_link_libraries(writeVTU PRIVATE Eigen3::Eigen vtu11)

# # State that anybody linking to this library needs to include the current source
# # dir to find header files
# target_include_directories(writeVTU
#                            INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})               
