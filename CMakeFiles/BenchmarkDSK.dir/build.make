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
include CMakeFiles/BenchmarkDSK.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/BenchmarkDSK.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/BenchmarkDSK.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/BenchmarkDSK.dir/flags.make

CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.o: CMakeFiles/BenchmarkDSK.dir/flags.make
CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.o: benchmark/benchmark_disk.cpp
CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.o: CMakeFiles/BenchmarkDSK.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/homes/sun1017/research/MultiThreadBTree/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.o -MF CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.o.d -o CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.o -c /homes/sun1017/research/MultiThreadBTree/benchmark/benchmark_disk.cpp

CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /homes/sun1017/research/MultiThreadBTree/benchmark/benchmark_disk.cpp > CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.i

CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /homes/sun1017/research/MultiThreadBTree/benchmark/benchmark_disk.cpp -o CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.s

# Object files for target BenchmarkDSK
BenchmarkDSK_OBJECTS = \
"CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.o"

# External object files for target BenchmarkDSK
BenchmarkDSK_EXTERNAL_OBJECTS =

BenchmarkDSK: CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.o
BenchmarkDSK: CMakeFiles/BenchmarkDSK.dir/build.make
BenchmarkDSK: tree_disk/libbtree_disk_std.a
BenchmarkDSK: CMakeFiles/BenchmarkDSK.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/homes/sun1017/research/MultiThreadBTree/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable BenchmarkDSK"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/BenchmarkDSK.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/BenchmarkDSK.dir/build: BenchmarkDSK
.PHONY : CMakeFiles/BenchmarkDSK.dir/build

CMakeFiles/BenchmarkDSK.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/BenchmarkDSK.dir/cmake_clean.cmake
.PHONY : CMakeFiles/BenchmarkDSK.dir/clean

CMakeFiles/BenchmarkDSK.dir/depend:
	cd /homes/sun1017/research/MultiThreadBTree && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /homes/sun1017/research/MultiThreadBTree /homes/sun1017/research/MultiThreadBTree /homes/sun1017/research/MultiThreadBTree /homes/sun1017/research/MultiThreadBTree /homes/sun1017/research/MultiThreadBTree/CMakeFiles/BenchmarkDSK.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/BenchmarkDSK.dir/depend

