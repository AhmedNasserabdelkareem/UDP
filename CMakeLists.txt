cmake_minimum_required(VERSION 3.15)
project(UDP)

set(CMAKE_CXX_STANDARD 14)
SET(CMAKE_CXX_FLAGS -pthread)


add_executable(UDP main.cpp client.cpp server.cpp state.cpp state.h params.cpp params.h congestionController.cpp congestionController.h Actions.cpp Actions.h packets.cpp)