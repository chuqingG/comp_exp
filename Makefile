# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

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

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /homes/sun1017/research/MultiThreadBTree/CMakeFiles /homes/sun1017/research/MultiThreadBTree//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /homes/sun1017/research/MultiThreadBTree/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named Benchmark

# Build rule for target.
Benchmark: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 Benchmark
.PHONY : Benchmark

# fast build rule for target.
Benchmark/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Benchmark.dir/build.make CMakeFiles/Benchmark.dir/build
.PHONY : Benchmark/fast

#=============================================================================
# Target rules for targets named BenchmarkMT

# Build rule for target.
BenchmarkMT: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 BenchmarkMT
.PHONY : BenchmarkMT

# fast build rule for target.
BenchmarkMT/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/BenchmarkMT.dir/build.make CMakeFiles/BenchmarkMT.dir/build
.PHONY : BenchmarkMT/fast

#=============================================================================
# Target rules for targets named BenchmarkDSK

# Build rule for target.
BenchmarkDSK: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 BenchmarkDSK
.PHONY : BenchmarkDSK

# fast build rule for target.
BenchmarkDSK/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/BenchmarkDSK.dir/build.make CMakeFiles/BenchmarkDSK.dir/build
.PHONY : BenchmarkDSK/fast

#=============================================================================
# Target rules for targets named btree_std

# Build rule for target.
btree_std: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 btree_std
.PHONY : btree_std

# fast build rule for target.
btree_std/fast:
	$(MAKE) $(MAKESILENT) -f tree/CMakeFiles/btree_std.dir/build.make tree/CMakeFiles/btree_std.dir/build
.PHONY : btree_std/fast

#=============================================================================
# Target rules for targets named btree_db2

# Build rule for target.
btree_db2: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 btree_db2
.PHONY : btree_db2

# fast build rule for target.
btree_db2/fast:
	$(MAKE) $(MAKESILENT) -f tree/CMakeFiles/btree_db2.dir/build.make tree/CMakeFiles/btree_db2.dir/build
.PHONY : btree_db2/fast

#=============================================================================
# Target rules for targets named btree_myisam

# Build rule for target.
btree_myisam: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 btree_myisam
.PHONY : btree_myisam

# fast build rule for target.
btree_myisam/fast:
	$(MAKE) $(MAKESILENT) -f tree/CMakeFiles/btree_myisam.dir/build.make tree/CMakeFiles/btree_myisam.dir/build
.PHONY : btree_myisam/fast

#=============================================================================
# Target rules for targets named btree_wt

# Build rule for target.
btree_wt: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 btree_wt
.PHONY : btree_wt

# fast build rule for target.
btree_wt/fast:
	$(MAKE) $(MAKESILENT) -f tree/CMakeFiles/btree_wt.dir/build.make tree/CMakeFiles/btree_wt.dir/build
.PHONY : btree_wt/fast

#=============================================================================
# Target rules for targets named btree_pkb

# Build rule for target.
btree_pkb: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 btree_pkb
.PHONY : btree_pkb

# fast build rule for target.
btree_pkb/fast:
	$(MAKE) $(MAKESILENT) -f tree/CMakeFiles/btree_pkb.dir/build.make tree/CMakeFiles/btree_pkb.dir/build
.PHONY : btree_pkb/fast

#=============================================================================
# Target rules for targets named btree_std_mt

# Build rule for target.
btree_std_mt: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 btree_std_mt
.PHONY : btree_std_mt

# fast build rule for target.
btree_std_mt/fast:
	$(MAKE) $(MAKESILENT) -f tree_mt/CMakeFiles/btree_std_mt.dir/build.make tree_mt/CMakeFiles/btree_std_mt.dir/build
.PHONY : btree_std_mt/fast

#=============================================================================
# Target rules for targets named btree_disk_std

# Build rule for target.
btree_disk_std: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 btree_disk_std
.PHONY : btree_disk_std

# fast build rule for target.
btree_disk_std/fast:
	$(MAKE) $(MAKESILENT) -f tree_disk/CMakeFiles/btree_disk_std.dir/build.make tree_disk/CMakeFiles/btree_disk_std.dir/build
.PHONY : btree_disk_std/fast

benchmark/benchmark.o: benchmark/benchmark.cpp.o
.PHONY : benchmark/benchmark.o

# target to build an object file
benchmark/benchmark.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Benchmark.dir/build.make CMakeFiles/Benchmark.dir/benchmark/benchmark.cpp.o
.PHONY : benchmark/benchmark.cpp.o

benchmark/benchmark.i: benchmark/benchmark.cpp.i
.PHONY : benchmark/benchmark.i

# target to preprocess a source file
benchmark/benchmark.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Benchmark.dir/build.make CMakeFiles/Benchmark.dir/benchmark/benchmark.cpp.i
.PHONY : benchmark/benchmark.cpp.i

benchmark/benchmark.s: benchmark/benchmark.cpp.s
.PHONY : benchmark/benchmark.s

# target to generate assembly for a file
benchmark/benchmark.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Benchmark.dir/build.make CMakeFiles/Benchmark.dir/benchmark/benchmark.cpp.s
.PHONY : benchmark/benchmark.cpp.s

benchmark/benchmark_disk.o: benchmark/benchmark_disk.cpp.o
.PHONY : benchmark/benchmark_disk.o

# target to build an object file
benchmark/benchmark_disk.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/BenchmarkDSK.dir/build.make CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.o
.PHONY : benchmark/benchmark_disk.cpp.o

benchmark/benchmark_disk.i: benchmark/benchmark_disk.cpp.i
.PHONY : benchmark/benchmark_disk.i

# target to preprocess a source file
benchmark/benchmark_disk.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/BenchmarkDSK.dir/build.make CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.i
.PHONY : benchmark/benchmark_disk.cpp.i

benchmark/benchmark_disk.s: benchmark/benchmark_disk.cpp.s
.PHONY : benchmark/benchmark_disk.s

# target to generate assembly for a file
benchmark/benchmark_disk.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/BenchmarkDSK.dir/build.make CMakeFiles/BenchmarkDSK.dir/benchmark/benchmark_disk.cpp.s
.PHONY : benchmark/benchmark_disk.cpp.s

benchmark/benchmark_mt.o: benchmark/benchmark_mt.cpp.o
.PHONY : benchmark/benchmark_mt.o

# target to build an object file
benchmark/benchmark_mt.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/BenchmarkMT.dir/build.make CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.o
.PHONY : benchmark/benchmark_mt.cpp.o

benchmark/benchmark_mt.i: benchmark/benchmark_mt.cpp.i
.PHONY : benchmark/benchmark_mt.i

# target to preprocess a source file
benchmark/benchmark_mt.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/BenchmarkMT.dir/build.make CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.i
.PHONY : benchmark/benchmark_mt.cpp.i

benchmark/benchmark_mt.s: benchmark/benchmark_mt.cpp.s
.PHONY : benchmark/benchmark_mt.s

# target to generate assembly for a file
benchmark/benchmark_mt.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/BenchmarkMT.dir/build.make CMakeFiles/BenchmarkMT.dir/benchmark/benchmark_mt.cpp.s
.PHONY : benchmark/benchmark_mt.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... Benchmark"
	@echo "... BenchmarkDSK"
	@echo "... BenchmarkMT"
	@echo "... btree_db2"
	@echo "... btree_disk_std"
	@echo "... btree_myisam"
	@echo "... btree_pkb"
	@echo "... btree_std"
	@echo "... btree_std_mt"
	@echo "... btree_wt"
	@echo "... benchmark/benchmark.o"
	@echo "... benchmark/benchmark.i"
	@echo "... benchmark/benchmark.s"
	@echo "... benchmark/benchmark_disk.o"
	@echo "... benchmark/benchmark_disk.i"
	@echo "... benchmark/benchmark_disk.s"
	@echo "... benchmark/benchmark_mt.o"
	@echo "... benchmark/benchmark_mt.i"
	@echo "... benchmark/benchmark_mt.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

