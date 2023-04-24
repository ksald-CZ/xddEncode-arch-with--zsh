cmake_minimum_required(VERSION 3.25)
project(xddEncode C)

set(CMAKE_C_STANDARD 11)

include_directories(src)

add_executable(xddEncode
        src/extensions.h
        src/main.c)
