# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

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
CMAKE_COMMAND = /snap/clion/98/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/98/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ahmednasser/CLionProjects/UDP

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ahmednasser/CLionProjects/UDP/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/UDP.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/UDP.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/UDP.dir/flags.make

CMakeFiles/UDP.dir/main.cpp.o: CMakeFiles/UDP.dir/flags.make
CMakeFiles/UDP.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahmednasser/CLionProjects/UDP/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/UDP.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UDP.dir/main.cpp.o -c /home/ahmednasser/CLionProjects/UDP/main.cpp

CMakeFiles/UDP.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UDP.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahmednasser/CLionProjects/UDP/main.cpp > CMakeFiles/UDP.dir/main.cpp.i

CMakeFiles/UDP.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UDP.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahmednasser/CLionProjects/UDP/main.cpp -o CMakeFiles/UDP.dir/main.cpp.s

CMakeFiles/UDP.dir/client.cpp.o: CMakeFiles/UDP.dir/flags.make
CMakeFiles/UDP.dir/client.cpp.o: ../client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahmednasser/CLionProjects/UDP/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/UDP.dir/client.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UDP.dir/client.cpp.o -c /home/ahmednasser/CLionProjects/UDP/client.cpp

CMakeFiles/UDP.dir/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UDP.dir/client.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahmednasser/CLionProjects/UDP/client.cpp > CMakeFiles/UDP.dir/client.cpp.i

CMakeFiles/UDP.dir/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UDP.dir/client.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahmednasser/CLionProjects/UDP/client.cpp -o CMakeFiles/UDP.dir/client.cpp.s

CMakeFiles/UDP.dir/server.cpp.o: CMakeFiles/UDP.dir/flags.make
CMakeFiles/UDP.dir/server.cpp.o: ../server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahmednasser/CLionProjects/UDP/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/UDP.dir/server.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UDP.dir/server.cpp.o -c /home/ahmednasser/CLionProjects/UDP/server.cpp

CMakeFiles/UDP.dir/server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UDP.dir/server.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahmednasser/CLionProjects/UDP/server.cpp > CMakeFiles/UDP.dir/server.cpp.i

CMakeFiles/UDP.dir/server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UDP.dir/server.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahmednasser/CLionProjects/UDP/server.cpp -o CMakeFiles/UDP.dir/server.cpp.s

CMakeFiles/UDP.dir/state.cpp.o: CMakeFiles/UDP.dir/flags.make
CMakeFiles/UDP.dir/state.cpp.o: ../state.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahmednasser/CLionProjects/UDP/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/UDP.dir/state.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UDP.dir/state.cpp.o -c /home/ahmednasser/CLionProjects/UDP/state.cpp

CMakeFiles/UDP.dir/state.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UDP.dir/state.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahmednasser/CLionProjects/UDP/state.cpp > CMakeFiles/UDP.dir/state.cpp.i

CMakeFiles/UDP.dir/state.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UDP.dir/state.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahmednasser/CLionProjects/UDP/state.cpp -o CMakeFiles/UDP.dir/state.cpp.s

CMakeFiles/UDP.dir/params.cpp.o: CMakeFiles/UDP.dir/flags.make
CMakeFiles/UDP.dir/params.cpp.o: ../params.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahmednasser/CLionProjects/UDP/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/UDP.dir/params.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UDP.dir/params.cpp.o -c /home/ahmednasser/CLionProjects/UDP/params.cpp

CMakeFiles/UDP.dir/params.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UDP.dir/params.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahmednasser/CLionProjects/UDP/params.cpp > CMakeFiles/UDP.dir/params.cpp.i

CMakeFiles/UDP.dir/params.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UDP.dir/params.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahmednasser/CLionProjects/UDP/params.cpp -o CMakeFiles/UDP.dir/params.cpp.s

CMakeFiles/UDP.dir/congestionController.cpp.o: CMakeFiles/UDP.dir/flags.make
CMakeFiles/UDP.dir/congestionController.cpp.o: ../congestionController.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahmednasser/CLionProjects/UDP/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/UDP.dir/congestionController.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UDP.dir/congestionController.cpp.o -c /home/ahmednasser/CLionProjects/UDP/congestionController.cpp

CMakeFiles/UDP.dir/congestionController.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UDP.dir/congestionController.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahmednasser/CLionProjects/UDP/congestionController.cpp > CMakeFiles/UDP.dir/congestionController.cpp.i

CMakeFiles/UDP.dir/congestionController.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UDP.dir/congestionController.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahmednasser/CLionProjects/UDP/congestionController.cpp -o CMakeFiles/UDP.dir/congestionController.cpp.s

CMakeFiles/UDP.dir/Actions.cpp.o: CMakeFiles/UDP.dir/flags.make
CMakeFiles/UDP.dir/Actions.cpp.o: ../Actions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahmednasser/CLionProjects/UDP/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/UDP.dir/Actions.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UDP.dir/Actions.cpp.o -c /home/ahmednasser/CLionProjects/UDP/Actions.cpp

CMakeFiles/UDP.dir/Actions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UDP.dir/Actions.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahmednasser/CLionProjects/UDP/Actions.cpp > CMakeFiles/UDP.dir/Actions.cpp.i

CMakeFiles/UDP.dir/Actions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UDP.dir/Actions.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahmednasser/CLionProjects/UDP/Actions.cpp -o CMakeFiles/UDP.dir/Actions.cpp.s

CMakeFiles/UDP.dir/packets.cpp.o: CMakeFiles/UDP.dir/flags.make
CMakeFiles/UDP.dir/packets.cpp.o: ../packets.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ahmednasser/CLionProjects/UDP/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/UDP.dir/packets.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UDP.dir/packets.cpp.o -c /home/ahmednasser/CLionProjects/UDP/packets.cpp

CMakeFiles/UDP.dir/packets.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UDP.dir/packets.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ahmednasser/CLionProjects/UDP/packets.cpp > CMakeFiles/UDP.dir/packets.cpp.i

CMakeFiles/UDP.dir/packets.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UDP.dir/packets.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ahmednasser/CLionProjects/UDP/packets.cpp -o CMakeFiles/UDP.dir/packets.cpp.s

# Object files for target UDP
UDP_OBJECTS = \
"CMakeFiles/UDP.dir/main.cpp.o" \
"CMakeFiles/UDP.dir/client.cpp.o" \
"CMakeFiles/UDP.dir/server.cpp.o" \
"CMakeFiles/UDP.dir/state.cpp.o" \
"CMakeFiles/UDP.dir/params.cpp.o" \
"CMakeFiles/UDP.dir/congestionController.cpp.o" \
"CMakeFiles/UDP.dir/Actions.cpp.o" \
"CMakeFiles/UDP.dir/packets.cpp.o"

# External object files for target UDP
UDP_EXTERNAL_OBJECTS =

UDP: CMakeFiles/UDP.dir/main.cpp.o
UDP: CMakeFiles/UDP.dir/client.cpp.o
UDP: CMakeFiles/UDP.dir/server.cpp.o
UDP: CMakeFiles/UDP.dir/state.cpp.o
UDP: CMakeFiles/UDP.dir/params.cpp.o
UDP: CMakeFiles/UDP.dir/congestionController.cpp.o
UDP: CMakeFiles/UDP.dir/Actions.cpp.o
UDP: CMakeFiles/UDP.dir/packets.cpp.o
UDP: CMakeFiles/UDP.dir/build.make
UDP: CMakeFiles/UDP.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ahmednasser/CLionProjects/UDP/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable UDP"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/UDP.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/UDP.dir/build: UDP

.PHONY : CMakeFiles/UDP.dir/build

CMakeFiles/UDP.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/UDP.dir/cmake_clean.cmake
.PHONY : CMakeFiles/UDP.dir/clean

CMakeFiles/UDP.dir/depend:
	cd /home/ahmednasser/CLionProjects/UDP/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ahmednasser/CLionProjects/UDP /home/ahmednasser/CLionProjects/UDP /home/ahmednasser/CLionProjects/UDP/cmake-build-debug /home/ahmednasser/CLionProjects/UDP/cmake-build-debug /home/ahmednasser/CLionProjects/UDP/cmake-build-debug/CMakeFiles/UDP.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/UDP.dir/depend
