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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/build

# Include any dependencies generated for this target.
include TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/depend.make

# Include the progress variables for this target.
include TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/progress.make

# Include the compile flags for this target's objects.
include TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/flags.make

TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/exo1_triangle_vertex_shader.cpp.o: TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/flags.make
TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/exo1_triangle_vertex_shader.cpp.o: ../TP2/exo1_triangle_vertex_shader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/exo1_triangle_vertex_shader.cpp.o"
	cd /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/build/TP2 && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/exo1_triangle_vertex_shader.cpp.o -c /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/TP2/exo1_triangle_vertex_shader.cpp

TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/exo1_triangle_vertex_shader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/exo1_triangle_vertex_shader.cpp.i"
	cd /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/build/TP2 && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/TP2/exo1_triangle_vertex_shader.cpp > CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/exo1_triangle_vertex_shader.cpp.i

TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/exo1_triangle_vertex_shader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/exo1_triangle_vertex_shader.cpp.s"
	cd /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/build/TP2 && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/TP2/exo1_triangle_vertex_shader.cpp -o CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/exo1_triangle_vertex_shader.cpp.s

# Object files for target TP2_exo1_triangle_vertex_shader
TP2_exo1_triangle_vertex_shader_OBJECTS = \
"CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/exo1_triangle_vertex_shader.cpp.o"

# External object files for target TP2_exo1_triangle_vertex_shader
TP2_exo1_triangle_vertex_shader_EXTERNAL_OBJECTS =

TP2/TP2_exo1_triangle_vertex_shader: TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/exo1_triangle_vertex_shader.cpp.o
TP2/TP2_exo1_triangle_vertex_shader: TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/build.make
TP2/TP2_exo1_triangle_vertex_shader: glimac/libglimac.a
TP2/TP2_exo1_triangle_vertex_shader: /usr/lib/x86_64-linux-gnu/libSDLmain.a
TP2/TP2_exo1_triangle_vertex_shader: /usr/lib/x86_64-linux-gnu/libSDL.so
TP2/TP2_exo1_triangle_vertex_shader: /usr/lib/x86_64-linux-gnu/libGL.so.1
TP2/TP2_exo1_triangle_vertex_shader: ../third-party/libGLEW.a
TP2/TP2_exo1_triangle_vertex_shader: TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable TP2_exo1_triangle_vertex_shader"
	cd /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/build/TP2 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/build: TP2/TP2_exo1_triangle_vertex_shader

.PHONY : TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/build

TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/clean:
	cd /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/build/TP2 && $(CMAKE_COMMAND) -P CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/cmake_clean.cmake
.PHONY : TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/clean

TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/depend:
	cd /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/TP2 /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/build /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/build/TP2 /home/6ima2/flavie.enrico/Documents/SyntheseImageS4/GLImac-Template/build/TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : TP2/CMakeFiles/TP2_exo1_triangle_vertex_shader.dir/depend
