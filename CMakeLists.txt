cmake_minimum_required(VERSION 3.10)   # Yêu cầu version CMake tối thiểu

project(NewBieProject)                 # Tên project

# Khai báo thư mục chứa file .h
include_directories(includes)

# Tìm toàn bộ file .cpp trong src
file(GLOB SOURCES src/*.cpp)

# Tạo file thực thi từ danh sách SOURCES
add_executable(program ${SOURCES})
