# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mazen/course_ws/src/serial

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mazen/course_ws/src/build/serial

# Include any dependencies generated for this target.
include tests/CMakeFiles/serial-test-timer.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/serial-test-timer.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/serial-test-timer.dir/flags.make

tests/CMakeFiles/serial-test-timer.dir/unit/unix_timer_tests.cc.o: tests/CMakeFiles/serial-test-timer.dir/flags.make
tests/CMakeFiles/serial-test-timer.dir/unit/unix_timer_tests.cc.o: /home/mazen/course_ws/src/serial/tests/unit/unix_timer_tests.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mazen/course_ws/src/build/serial/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/serial-test-timer.dir/unit/unix_timer_tests.cc.o"
	cd /home/mazen/course_ws/src/build/serial/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/serial-test-timer.dir/unit/unix_timer_tests.cc.o -c /home/mazen/course_ws/src/serial/tests/unit/unix_timer_tests.cc

tests/CMakeFiles/serial-test-timer.dir/unit/unix_timer_tests.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/serial-test-timer.dir/unit/unix_timer_tests.cc.i"
	cd /home/mazen/course_ws/src/build/serial/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mazen/course_ws/src/serial/tests/unit/unix_timer_tests.cc > CMakeFiles/serial-test-timer.dir/unit/unix_timer_tests.cc.i

tests/CMakeFiles/serial-test-timer.dir/unit/unix_timer_tests.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/serial-test-timer.dir/unit/unix_timer_tests.cc.s"
	cd /home/mazen/course_ws/src/build/serial/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mazen/course_ws/src/serial/tests/unit/unix_timer_tests.cc -o CMakeFiles/serial-test-timer.dir/unit/unix_timer_tests.cc.s

# Object files for target serial-test-timer
serial__test__timer_OBJECTS = \
"CMakeFiles/serial-test-timer.dir/unit/unix_timer_tests.cc.o"

# External object files for target serial-test-timer
serial__test__timer_EXTERNAL_OBJECTS =

tests/serial-test-timer: tests/CMakeFiles/serial-test-timer.dir/unit/unix_timer_tests.cc.o
tests/serial-test-timer: tests/CMakeFiles/serial-test-timer.dir/build.make
tests/serial-test-timer: gtest/libgtest_main.a
tests/serial-test-timer: gtest/libgtest.a
tests/serial-test-timer: libserial.a
tests/serial-test-timer: tests/CMakeFiles/serial-test-timer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mazen/course_ws/src/build/serial/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable serial-test-timer"
	cd /home/mazen/course_ws/src/build/serial/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/serial-test-timer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/serial-test-timer.dir/build: tests/serial-test-timer

.PHONY : tests/CMakeFiles/serial-test-timer.dir/build

tests/CMakeFiles/serial-test-timer.dir/clean:
	cd /home/mazen/course_ws/src/build/serial/tests && $(CMAKE_COMMAND) -P CMakeFiles/serial-test-timer.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/serial-test-timer.dir/clean

tests/CMakeFiles/serial-test-timer.dir/depend:
	cd /home/mazen/course_ws/src/build/serial && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mazen/course_ws/src/serial /home/mazen/course_ws/src/serial/tests /home/mazen/course_ws/src/build/serial /home/mazen/course_ws/src/build/serial/tests /home/mazen/course_ws/src/build/serial/tests/CMakeFiles/serial-test-timer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/serial-test-timer.dir/depend

