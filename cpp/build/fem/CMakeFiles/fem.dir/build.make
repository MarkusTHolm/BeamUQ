# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

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
CMAKE_COMMAND = /home/andfr/miniconda3/envs/fenics_cookie/bin/cmake

# The command to remove a file.
RM = /home/andfr/miniconda3/envs/fenics_cookie/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build

# Include any dependencies generated for this target.
include fem/CMakeFiles/fem.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include fem/CMakeFiles/fem.dir/compiler_depend.make

# Include the progress variables for this target.
include fem/CMakeFiles/fem.dir/progress.make

# Include the compile flags for this target's objects.
include fem/CMakeFiles/fem.dir/flags.make

fem/CMakeFiles/fem.dir/fem.cpp.o: fem/CMakeFiles/fem.dir/flags.make
fem/CMakeFiles/fem.dir/fem.cpp.o: /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem/fem.cpp
fem/CMakeFiles/fem.dir/fem.cpp.o: fem/CMakeFiles/fem.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object fem/CMakeFiles/fem.dir/fem.cpp.o"
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem && /home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT fem/CMakeFiles/fem.dir/fem.cpp.o -MF CMakeFiles/fem.dir/fem.cpp.o.d -o CMakeFiles/fem.dir/fem.cpp.o -c /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem/fem.cpp

fem/CMakeFiles/fem.dir/fem.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/fem.dir/fem.cpp.i"
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem && /home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem/fem.cpp > CMakeFiles/fem.dir/fem.cpp.i

fem/CMakeFiles/fem.dir/fem.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/fem.dir/fem.cpp.s"
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem && /home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem/fem.cpp -o CMakeFiles/fem.dir/fem.cpp.s

fem/CMakeFiles/fem.dir/elements.cpp.o: fem/CMakeFiles/fem.dir/flags.make
fem/CMakeFiles/fem.dir/elements.cpp.o: /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem/elements.cpp
fem/CMakeFiles/fem.dir/elements.cpp.o: fem/CMakeFiles/fem.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object fem/CMakeFiles/fem.dir/elements.cpp.o"
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem && /home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT fem/CMakeFiles/fem.dir/elements.cpp.o -MF CMakeFiles/fem.dir/elements.cpp.o.d -o CMakeFiles/fem.dir/elements.cpp.o -c /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem/elements.cpp

fem/CMakeFiles/fem.dir/elements.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/fem.dir/elements.cpp.i"
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem && /home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem/elements.cpp > CMakeFiles/fem.dir/elements.cpp.i

fem/CMakeFiles/fem.dir/elements.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/fem.dir/elements.cpp.s"
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem && /home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem/elements.cpp -o CMakeFiles/fem.dir/elements.cpp.s

fem/CMakeFiles/fem.dir/recoverResults.cpp.o: fem/CMakeFiles/fem.dir/flags.make
fem/CMakeFiles/fem.dir/recoverResults.cpp.o: /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem/recoverResults.cpp
fem/CMakeFiles/fem.dir/recoverResults.cpp.o: fem/CMakeFiles/fem.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object fem/CMakeFiles/fem.dir/recoverResults.cpp.o"
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem && /home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT fem/CMakeFiles/fem.dir/recoverResults.cpp.o -MF CMakeFiles/fem.dir/recoverResults.cpp.o.d -o CMakeFiles/fem.dir/recoverResults.cpp.o -c /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem/recoverResults.cpp

fem/CMakeFiles/fem.dir/recoverResults.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/fem.dir/recoverResults.cpp.i"
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem && /home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem/recoverResults.cpp > CMakeFiles/fem.dir/recoverResults.cpp.i

fem/CMakeFiles/fem.dir/recoverResults.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/fem.dir/recoverResults.cpp.s"
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem && /home/andfr/miniconda3/envs/fenics_cookie/bin/x86_64-conda-linux-gnu-c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem/recoverResults.cpp -o CMakeFiles/fem.dir/recoverResults.cpp.s

# Object files for target fem
fem_OBJECTS = \
"CMakeFiles/fem.dir/fem.cpp.o" \
"CMakeFiles/fem.dir/elements.cpp.o" \
"CMakeFiles/fem.dir/recoverResults.cpp.o"

# External object files for target fem
fem_EXTERNAL_OBJECTS =

fem/libfem.so: fem/CMakeFiles/fem.dir/fem.cpp.o
fem/libfem.so: fem/CMakeFiles/fem.dir/elements.cpp.o
fem/libfem.so: fem/CMakeFiles/fem.dir/recoverResults.cpp.o
fem/libfem.so: fem/CMakeFiles/fem.dir/build.make
fem/libfem.so: fem/CMakeFiles/fem.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library libfem.so"
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fem.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
fem/CMakeFiles/fem.dir/build: fem/libfem.so
.PHONY : fem/CMakeFiles/fem.dir/build

fem/CMakeFiles/fem.dir/clean:
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem && $(CMAKE_COMMAND) -P CMakeFiles/fem.dir/cmake_clean.cmake
.PHONY : fem/CMakeFiles/fem.dir/clean

fem/CMakeFiles/fem.dir/depend:
	cd /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/fem /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem /home/andfr/A_course_exercises/beam_project/BeamUQ/cpp/build/fem/CMakeFiles/fem.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : fem/CMakeFiles/fem.dir/depend

