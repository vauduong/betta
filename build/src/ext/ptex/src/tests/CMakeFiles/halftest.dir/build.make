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

# Include any dependencies generated for this target.
include src/ext/ptex/src/tests/CMakeFiles/halftest.dir/depend.make

# Include the progress variables for this target.
include src/ext/ptex/src/tests/CMakeFiles/halftest.dir/progress.make

# Include the compile flags for this target's objects.
include src/ext/ptex/src/tests/CMakeFiles/halftest.dir/flags.make

src/ext/ptex/src/tests/CMakeFiles/halftest.dir/halftest.cpp.o: src/ext/ptex/src/tests/CMakeFiles/halftest.dir/flags.make
src/ext/ptex/src/tests/CMakeFiles/halftest.dir/halftest.cpp.o: ../src/ext/ptex/src/tests/halftest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/vivian/work/betta/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/ext/ptex/src/tests/CMakeFiles/halftest.dir/halftest.cpp.o"
	cd /Users/vivian/work/betta/build/src/ext/ptex/src/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/halftest.dir/halftest.cpp.o -c /Users/vivian/work/betta/src/ext/ptex/src/tests/halftest.cpp

src/ext/ptex/src/tests/CMakeFiles/halftest.dir/halftest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/halftest.dir/halftest.cpp.i"
	cd /Users/vivian/work/betta/build/src/ext/ptex/src/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/vivian/work/betta/src/ext/ptex/src/tests/halftest.cpp > CMakeFiles/halftest.dir/halftest.cpp.i

src/ext/ptex/src/tests/CMakeFiles/halftest.dir/halftest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/halftest.dir/halftest.cpp.s"
	cd /Users/vivian/work/betta/build/src/ext/ptex/src/tests && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/vivian/work/betta/src/ext/ptex/src/tests/halftest.cpp -o CMakeFiles/halftest.dir/halftest.cpp.s

# Object files for target halftest
halftest_OBJECTS = \
"CMakeFiles/halftest.dir/halftest.cpp.o"

# External object files for target halftest
halftest_EXTERNAL_OBJECTS =

src/ext/ptex/src/tests/halftest: src/ext/ptex/src/tests/CMakeFiles/halftest.dir/halftest.cpp.o
src/ext/ptex/src/tests/halftest: src/ext/ptex/src/tests/CMakeFiles/halftest.dir/build.make
src/ext/ptex/src/tests/halftest: src/ext/ptex/src/ptex/libPtex.a
src/ext/ptex/src/tests/halftest: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/usr/lib/libz.tbd
src/ext/ptex/src/tests/halftest: src/ext/ptex/src/tests/CMakeFiles/halftest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/vivian/work/betta/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable halftest"
	cd /Users/vivian/work/betta/build/src/ext/ptex/src/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/halftest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/ext/ptex/src/tests/CMakeFiles/halftest.dir/build: src/ext/ptex/src/tests/halftest

.PHONY : src/ext/ptex/src/tests/CMakeFiles/halftest.dir/build

src/ext/ptex/src/tests/CMakeFiles/halftest.dir/clean:
	cd /Users/vivian/work/betta/build/src/ext/ptex/src/tests && $(CMAKE_COMMAND) -P CMakeFiles/halftest.dir/cmake_clean.cmake
.PHONY : src/ext/ptex/src/tests/CMakeFiles/halftest.dir/clean

src/ext/ptex/src/tests/CMakeFiles/halftest.dir/depend:
	cd /Users/vivian/work/betta/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/vivian/work/betta /Users/vivian/work/betta/src/ext/ptex/src/tests /Users/vivian/work/betta/build /Users/vivian/work/betta/build/src/ext/ptex/src/tests /Users/vivian/work/betta/build/src/ext/ptex/src/tests/CMakeFiles/halftest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/ext/ptex/src/tests/CMakeFiles/halftest.dir/depend

