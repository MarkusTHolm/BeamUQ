# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build

# Include any dependencies generated for this target.
include CMakeFiles/cppFem.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/cppFem.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/cppFem.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cppFem.dir/flags.make

CMakeFiles/cppFem.dir/cmake_wrapper.cpp.o: CMakeFiles/cppFem.dir/flags.make
CMakeFiles/cppFem.dir/cmake_wrapper.cpp.o: ../cmake_wrapper.cpp
CMakeFiles/cppFem.dir/cmake_wrapper.cpp.o: CMakeFiles/cppFem.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/cppFem.dir/cmake_wrapper.cpp.o"
	/home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/cppFem.dir/cmake_wrapper.cpp.o -MF CMakeFiles/cppFem.dir/cmake_wrapper.cpp.o.d -o CMakeFiles/cppFem.dir/cmake_wrapper.cpp.o -c /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/cmake_wrapper.cpp

CMakeFiles/cppFem.dir/cmake_wrapper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cppFem.dir/cmake_wrapper.cpp.i"
	/home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/cmake_wrapper.cpp > CMakeFiles/cppFem.dir/cmake_wrapper.cpp.i

CMakeFiles/cppFem.dir/cmake_wrapper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cppFem.dir/cmake_wrapper.cpp.s"
	/home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/cmake_wrapper.cpp -o CMakeFiles/cppFem.dir/cmake_wrapper.cpp.s

CMakeFiles/cppFem.dir/util/writeVTU.cpp.o: CMakeFiles/cppFem.dir/flags.make
CMakeFiles/cppFem.dir/util/writeVTU.cpp.o: ../util/writeVTU.cpp
CMakeFiles/cppFem.dir/util/writeVTU.cpp.o: CMakeFiles/cppFem.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/cppFem.dir/util/writeVTU.cpp.o"
	/home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/cppFem.dir/util/writeVTU.cpp.o -MF CMakeFiles/cppFem.dir/util/writeVTU.cpp.o.d -o CMakeFiles/cppFem.dir/util/writeVTU.cpp.o -c /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/util/writeVTU.cpp

CMakeFiles/cppFem.dir/util/writeVTU.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cppFem.dir/util/writeVTU.cpp.i"
	/home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/util/writeVTU.cpp > CMakeFiles/cppFem.dir/util/writeVTU.cpp.i

CMakeFiles/cppFem.dir/util/writeVTU.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cppFem.dir/util/writeVTU.cpp.s"
	/home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/util/writeVTU.cpp -o CMakeFiles/cppFem.dir/util/writeVTU.cpp.s

# Object files for target cppFem
cppFem_OBJECTS = \
"CMakeFiles/cppFem.dir/cmake_wrapper.cpp.o" \
"CMakeFiles/cppFem.dir/util/writeVTU.cpp.o"

# External object files for target cppFem
cppFem_EXTERNAL_OBJECTS =

cppFem.cpython-312-x86_64-linux-gnu.so: CMakeFiles/cppFem.dir/cmake_wrapper.cpp.o
cppFem.cpython-312-x86_64-linux-gnu.so: CMakeFiles/cppFem.dir/util/writeVTU.cpp.o
cppFem.cpython-312-x86_64-linux-gnu.so: CMakeFiles/cppFem.dir/build.make
cppFem.cpython-312-x86_64-linux-gnu.so: fem/libfem.so
cppFem.cpython-312-x86_64-linux-gnu.so: /home/andfr/miniconda3/envs/fenics_cookie/lib/libz.so
cppFem.cpython-312-x86_64-linux-gnu.so: CMakeFiles/cppFem.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared module cppFem.cpython-312-x86_64-linux-gnu.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cppFem.dir/link.txt --verbose=$(VERBOSE)
	/home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-strip /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/cppFem.cpython-312-x86_64-linux-gnu.so

# Rule to build all files generated by this target.
CMakeFiles/cppFem.dir/build: cppFem.cpython-312-x86_64-linux-gnu.so
.PHONY : CMakeFiles/cppFem.dir/build

CMakeFiles/cppFem.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cppFem.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cppFem.dir/clean

CMakeFiles/cppFem.dir/depend:
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/CMakeFiles/cppFem.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/cppFem.dir/depend

