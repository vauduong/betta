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
include CMakeFiles/bsdftest.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/bsdftest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bsdftest.dir/flags.make

CMakeFiles/bsdftest.dir/src/tools/bsdftest.cpp.o: CMakeFiles/bsdftest.dir/flags.make
CMakeFiles/bsdftest.dir/src/tools/bsdftest.cpp.o: ../src/tools/bsdftest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/vivian/work/betta/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/bsdftest.dir/src/tools/bsdftest.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bsdftest.dir/src/tools/bsdftest.cpp.o -c /Users/vivian/work/betta/src/tools/bsdftest.cpp

CMakeFiles/bsdftest.dir/src/tools/bsdftest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bsdftest.dir/src/tools/bsdftest.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/vivian/work/betta/src/tools/bsdftest.cpp > CMakeFiles/bsdftest.dir/src/tools/bsdftest.cpp.i

CMakeFiles/bsdftest.dir/src/tools/bsdftest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bsdftest.dir/src/tools/bsdftest.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/vivian/work/betta/src/tools/bsdftest.cpp -o CMakeFiles/bsdftest.dir/src/tools/bsdftest.cpp.s

# Object files for target bsdftest
bsdftest_OBJECTS = \
"CMakeFiles/bsdftest.dir/src/tools/bsdftest.cpp.o"

# External object files for target bsdftest
bsdftest_EXTERNAL_OBJECTS =

bsdftest: CMakeFiles/bsdftest.dir/src/tools/bsdftest.cpp.o
bsdftest: CMakeFiles/bsdftest.dir/build.make
bsdftest: libpbrt.a
bsdftest: src/ext/openexr/OpenEXR/IlmImf/libIlmImf.a
bsdftest: src/ext/openexr/IlmBase/Imath/libImath.a
bsdftest: src/ext/openexr/IlmBase/Half/libHalf.a
bsdftest: src/ext/glog/libglog.a
bsdftest: src/ext/ptex/src/ptex/libPtex.a
bsdftest: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/usr/lib/libz.tbd
bsdftest: src/ext/openexr/IlmBase/IlmThread/libIlmThread.a
bsdftest: src/ext/openexr/IlmBase/Iex/libIex.a
bsdftest: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/usr/lib/libz.tbd
bsdftest: CMakeFiles/bsdftest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/vivian/work/betta/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bsdftest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bsdftest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/bsdftest.dir/build: bsdftest

.PHONY : CMakeFiles/bsdftest.dir/build

CMakeFiles/bsdftest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bsdftest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bsdftest.dir/clean

CMakeFiles/bsdftest.dir/depend:
	cd /Users/vivian/work/betta/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/vivian/work/betta /Users/vivian/work/betta /Users/vivian/work/betta/build /Users/vivian/work/betta/build /Users/vivian/work/betta/build/CMakeFiles/bsdftest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bsdftest.dir/depend

