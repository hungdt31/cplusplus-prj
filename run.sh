#!/bin/bash

OUTPUT=program
SRC_DIR=src
INCLUDE_DIR=includes

echo "Select build mode:"
echo "1. Quick build using g++"
echo "2. Professional build with CMake"
read -p "Enter your choice (1 or 2): " choice

if [ "$choice" -eq 1 ]; then
    echo "Compiling with g++..."
    g++ $SRC_DIR/*.cpp -I$INCLUDE_DIR -o $OUTPUT
    if [ $? -eq 0 ]; then
        echo "Compilation successful. Running program:"
        ./$OUTPUT
    else
        echo "Compilation failed."
    fi

elif [ "$choice" -eq 2 ]; then
    echo "Building with CMake..."
    mkdir -p build
    cd build
    cmake ..
    cmake --build .

    if [ $? -eq 0 ]; then
        echo "Build successful. Running program:"
        ./program
    else
        echo "Build failed."
    fi

else
    echo "Invalid choice!"
fi

