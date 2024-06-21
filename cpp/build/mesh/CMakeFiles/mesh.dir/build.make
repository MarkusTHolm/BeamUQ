# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/mtaho/anaconda3/envs/fenicsproject/bin/cmake

# The command to remove a file.
RM = /home/mtaho/anaconda3/envs/fenicsproject/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build

# Include any dependencies generated for this target.
include mesh/CMakeFiles/mesh.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include mesh/CMakeFiles/mesh.dir/compiler_depend.make

# Include the progress variables for this target.
include mesh/CMakeFiles/mesh.dir/progress.make

# Include the compile flags for this target's objects.
include mesh/CMakeFiles/mesh.dir/flags.make

mesh/CMakeFiles/mesh.dir/UnitCell.cpp.o: mesh/CMakeFiles/mesh.dir/flags.make
mesh/CMakeFiles/mesh.dir/UnitCell.cpp.o: /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/mesh/UnitCell.cpp
mesh/CMakeFiles/mesh.dir/UnitCell.cpp.o: mesh/CMakeFiles/mesh.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object mesh/CMakeFiles/mesh.dir/UnitCell.cpp.o"
	cd /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build/mesh && /home/mtaho/anaconda3/envs/fenicsproject/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT mesh/CMakeFiles/mesh.dir/UnitCell.cpp.o -MF CMakeFiles/mesh.dir/UnitCell.cpp.o.d -o CMakeFiles/mesh.dir/UnitCell.cpp.o -c /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/mesh/UnitCell.cpp

mesh/CMakeFiles/mesh.dir/UnitCell.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/mesh.dir/UnitCell.cpp.i"
	cd /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build/mesh && /home/mtaho/anaconda3/envs/fenicsproject/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/mesh/UnitCell.cpp > CMakeFiles/mesh.dir/UnitCell.cpp.i

mesh/CMakeFiles/mesh.dir/UnitCell.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/mesh.dir/UnitCell.cpp.s"
	cd /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build/mesh && /home/mtaho/anaconda3/envs/fenicsproject/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/mesh/UnitCell.cpp -o CMakeFiles/mesh.dir/UnitCell.cpp.s

# Object files for target mesh
mesh_OBJECTS = \
"CMakeFiles/mesh.dir/UnitCell.cpp.o"

# External object files for target mesh
mesh_EXTERNAL_OBJECTS =

mesh/libmesh.so: mesh/CMakeFiles/mesh.dir/UnitCell.cpp.o
mesh/libmesh.so: mesh/CMakeFiles/mesh.dir/build.make
mesh/libmesh.so: mesh/CMakeFiles/mesh.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libmesh.so"
	cd /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build/mesh && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mesh.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
mesh/CMakeFiles/mesh.dir/build: mesh/libmesh.so
.PHONY : mesh/CMakeFiles/mesh.dir/build

mesh/CMakeFiles/mesh.dir/clean:
	cd /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build/mesh && $(CMAKE_COMMAND) -P CMakeFiles/mesh.dir/cmake_clean.cmake
.PHONY : mesh/CMakeFiles/mesh.dir/clean

mesh/CMakeFiles/mesh.dir/depend:
	cd /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/mesh /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build/mesh /home/mtaho/Code/Courses/UncertaintyQuantification/BeamUQ/cpp/build/mesh/CMakeFiles/mesh.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : mesh/CMakeFiles/mesh.dir/depend

