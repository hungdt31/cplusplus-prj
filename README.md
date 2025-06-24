# NewBieProject

A simple C++ project demonstrating basic mathematical operations and CMake configuration for beginners.

## Project Structure

```[language=C++]
[root]/
  ├── CMakeLists.txt    # CMake configuration file
  ├── includes/         # Header files directory
  │   ├── common.h      # Common includes and namespaces
  │   └── math_utils.h  # Math utility function declarations
  ├── README.md         # This file
  ├── run.sh            # Build and run script
  └── src/              # Source files directory
      ├── main.cpp      # Main program entry point
      └── math_utils.cpp # Math utility implementations
```

## Features

- Simple addition and multiplication functions
- Two build options:
  - Quick build with g++
  - Professional build with CMake

## Building and Running

The project includes a convenient shell script for building and running:

```bash
./run.sh
```

The script will present two options:

- Quick build using g++
- Professional build with CMake

## Requirements

- C++ compiler (g++ recommended)
- CMake (version 3.10 or higher) for professional build

## Implementation Details

The project implements two basic mathematical functions:

- `add(int a, int b)`: Returns the sum of two integers
- `multiply(int a, int b)`: Returns the product of two integers

## License

This project is available for educational purposes.
