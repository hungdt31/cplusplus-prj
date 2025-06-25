# NewBieProject

A simple C++ project demonstrating basic mathematical operations and CMake configuration for beginners.

[Back to language selection](README.md)

## Project Structure

```
[root]/
  ├── CMakeLists.txt    # CMake configuration file
  ├── includes/         # Header files directory
  │   ├── common.h      # Common includes and namespaces
  │   └── math_utils.h  # Math utility function declarations
  ├── inputs/           # Directory for test input files
  │   └── input_*.txt   # Input data files
  ├── outputs/          # Directory for program output
  │   └── output_*.txt  # Output result files
  ├── solutions/        # Directory for sample solutions
  │   └── solution_*.txt # Solution files
  ├── README.md         # Language selection file
  ├── README_EN.md      # This file (English documentation)
  ├── README_VI.md      # Vietnamese documentation
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
- Automated testing system with multiple test cases

## Building and Running

The project includes a convenient shell script for building and running:

```bash
./run.sh [option]
```

Options:

- `g++`: Quick build using g++
- `cmake`: Professional build with CMake
- `test`: Run test cases (auto build if needed)
- `help`: Show help message

### Testing Mode

To run tests:

```bash
./run.sh test
```

The script will ask which build method to use (default is g++) and then:
1. Run the program with each input file in the `inputs/` directory
2. Save results to the `outputs/` directory
3. Compare results with solutions in `solutions/`
4. Report a summary of test results

## Requirements

- C++ compiler (g++ recommended)
- CMake (version 3.10 or higher) for professional build

## Implementation Details

The project implements two basic mathematical functions:

- `add(int a, int b)`: Returns the sum of two integers
- `multiply(int a, int b)`: Returns the product of two integers

The program reads input data from stdin, allowing for processing multiple test cases.

## License

This project is available for educational purposes. 