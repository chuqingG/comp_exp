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
CMAKE_SOURCE_DIR = /homes/sun1017/research/MultiThreadBTree

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /homes/sun1017/research/MultiThreadBTree

# Include any dependencies generated for this target.
include CMakeFiles/BenchmarkMT.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/BenchmarkMT.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/BenchmarkMT.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/BenchmarkMT.dir/flags.make

CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.o: CMakeFiles/BenchmarkMT.dir/flags.make
CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.o: benchmark/benchmark_mt.cpp
CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.o: CMakeFiles/BenchmarkMT.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/homes/sun1017/research/MultiThreadBTree/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.o -MF CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.o.d -o CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.o -c /homes/sun1017/research/MultiThreadBTree/benchmark/benchmark_mt.cpp

CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /homes/sun1017/research/MultiThreadBTree/benchmark/benchmark_mt.cpp > CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.i

CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /homes/sun1017/research/MultiThreadBTree/benchmark/benchmark_mt.cpp -o CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.s

# Object files for target BenchmarkMT
BenchmarkMT_OBJECTS = \
"CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.o"

# External object files for target BenchmarkMT
BenchmarkMT_EXTERNAL_OBJECTS =

BenchmarkMT: CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.o
BenchmarkMT: CMakeFiles/BenchmarkMT.dir/build.make
BenchmarkMT: tree_mt/libbtree_std_mt.a
BenchmarkMT: CMakeFiles/BenchmarkMT.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/homes/sun1017/research/MultiThreadBTree/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable BenchmarkMT"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/BenchmarkMT.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/BenchmarkMT.dir/build: BenchmarkMT
.PHONY : CMakeFiles/BenchmarkMT.dir/build

CMakeFiles/BenchmarkMT.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/BenchmarkMT.dir/cmake_clean.cmake
.PHONY : CMakeFiles/BenchmarkMT.dir/clean

CMakeFiles/BenchmarkMT.dir/depend:
	cd /homes/sun1017/research/MultiThreadBTree && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /homes/sun1017/research/MultiThreadBTree /homes/sun1017/research/MultiThreadBTree /homes/sun1017/research/MultiThreadBTree /homes/sun1017/research/MultiThreadBTree /homes/sun1017/research/MultiThreadBTree/CMakeFiles/BenchmarkMT.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/BenchmarkMT.dir/depend

