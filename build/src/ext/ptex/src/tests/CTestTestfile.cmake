# CMake generated Testfile for 
# Source directory: /Users/vivian/work/betta/src/ext/ptex/src/tests
# Build directory: /Users/vivian/work/betta/build/src/ext/ptex/src/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(wtest "/Users/vivian/work/betta/build/src/ext/ptex/src/tests/wtest")
set_tests_properties(wtest PROPERTIES  _BACKTRACE_TRIPLES "/Users/vivian/work/betta/src/ext/ptex/src/tests/CMakeLists.txt;32;add_test;/Users/vivian/work/betta/src/ext/ptex/src/tests/CMakeLists.txt;0;")
add_test(rtest "/usr/local/Cellar/cmake/3.18.3/bin/cmake" "-DOUT=/Users/vivian/work/betta/build/src/ext/ptex/src/tests/rtest.out" "-DDATA=/Users/vivian/work/betta/src/ext/ptex/src/tests/rtestok.dat" "-DCMD=/Users/vivian/work/betta/build/src/ext/ptex/src/tests/rtest" "-P" "/Users/vivian/work/betta/src/ext/ptex/src/tests/compare_test.cmake")
set_tests_properties(rtest PROPERTIES  _BACKTRACE_TRIPLES "/Users/vivian/work/betta/src/ext/ptex/src/tests/CMakeLists.txt;23;add_test;/Users/vivian/work/betta/src/ext/ptex/src/tests/CMakeLists.txt;33;add_compare_test;/Users/vivian/work/betta/src/ext/ptex/src/tests/CMakeLists.txt;0;")
add_test(ftest "/usr/local/Cellar/cmake/3.18.3/bin/cmake" "-DOUT=/Users/vivian/work/betta/build/src/ext/ptex/src/tests/ftest.out" "-DDATA=/Users/vivian/work/betta/src/ext/ptex/src/tests/ftestok.dat" "-DCMD=/Users/vivian/work/betta/build/src/ext/ptex/src/tests/ftest" "-P" "/Users/vivian/work/betta/src/ext/ptex/src/tests/compare_test.cmake")
set_tests_properties(ftest PROPERTIES  _BACKTRACE_TRIPLES "/Users/vivian/work/betta/src/ext/ptex/src/tests/CMakeLists.txt;23;add_test;/Users/vivian/work/betta/src/ext/ptex/src/tests/CMakeLists.txt;34;add_compare_test;/Users/vivian/work/betta/src/ext/ptex/src/tests/CMakeLists.txt;0;")
add_test(halftest "/Users/vivian/work/betta/build/src/ext/ptex/src/tests/halftest")
set_tests_properties(halftest PROPERTIES  _BACKTRACE_TRIPLES "/Users/vivian/work/betta/src/ext/ptex/src/tests/CMakeLists.txt;35;add_test;/Users/vivian/work/betta/src/ext/ptex/src/tests/CMakeLists.txt;0;")
