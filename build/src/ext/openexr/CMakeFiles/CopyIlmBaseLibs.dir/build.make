# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.18.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.18.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/vivian/work/betta

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/vivian/work/betta/build

# Utility rule file for CopyIlmBaseLibs.

# Include the progress variables for this target.
include src/ext/openexr/CMakeFiles/CopyIlmBaseLibs.dir/progress.make

src/ext/openexr/CMakeFiles/CopyIlmBaseLibs:
	cd /Users/vivian/work/betta/build/src/ext/openexr && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E copy_directory /Users/vivian/work/betta/build/src/ext/openexr/IlmBase/Half/ /Users/vivian/work/betta/build/src/ext/openexr/OpenEXR/IlmImf/
	cd /Users/vivian/work/betta/build/src/ext/openexr && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E copy_directory /Users/vivian/work/betta/build/src/ext/openexr/IlmBase/IlmThread/ /Users/vivian/work/betta/build/src/ext/openexr/OpenEXR/IlmImf/
	cd /Users/vivian/work/betta/build/src/ext/openexr && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E copy_directory /Users/vivian/work/betta/build/src/ext/openexr/IlmBase/Iex/ /Users/vivian/work/betta/build/src/ext/openexr/OpenEXR/IlmImf/
	cd /Users/vivian/work/betta/build/src/ext/openexr && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E copy_directory /Users/vivian/work/betta/build/src/ext/openexr/IlmBase/Imath/ /Users/vivian/work/betta/build/src/ext/openexr/OpenEXR/IlmImf/

CopyIlmBaseLibs: src/ext/openexr/CMakeFiles/CopyIlmBaseLibs
CopyIlmBaseLibs: src/ext/openexr/CMakeFiles/CopyIlmBaseLibs.dir/build.make

.PHONY : CopyIlmBaseLibs

# Rule to build all files generated by this target.
src/ext/openexr/CMakeFiles/CopyIlmBaseLibs.dir/build: CopyIlmBaseLibs

.PHONY : src/ext/openexr/CMakeFiles/CopyIlmBaseLibs.dir/build

src/ext/openexr/CMakeFiles/CopyIlmBaseLibs.dir/clean:
	cd /Users/vivian/work/betta/build/src/ext/openexr && $(CMAKE_COMMAND) -P CMakeFiles/CopyIlmBaseLibs.dir/cmake_clean.cmake
.PHONY : src/ext/openexr/CMakeFiles/CopyIlmBaseLibs.dir/clean

src/ext/openexr/CMakeFiles/CopyIlmBaseLibs.dir/depend:
	cd /Users/vivian/work/betta/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/vivian/work/betta /Users/vivian/work/betta/src/ext/openexr /Users/vivian/work/betta/build /Users/vivian/work/betta/build/src/ext/openexr /Users/vivian/work/betta/build/src/ext/openexr/CMakeFiles/CopyIlmBaseLibs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/ext/openexr/CMakeFiles/CopyIlmBaseLibs.dir/depend

