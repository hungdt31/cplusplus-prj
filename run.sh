#!/bin/bash

# Màu sắc ANSI
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

OUTPUT=program
SRC_DIR=src
INCLUDE_DIR=includes

# Hàm xóa dòng vừa in
# clear_last_line() {
#     tput el     # Xóa dòng hiện tại
#     echo -ne "\r"
# }

show_help() {
    echo -e "${YELLOW}Usage:${RESET} ./run.sh [option]"
    echo -e "${CYAN}Options:${RESET}"
    echo "  g++      Quick build using g++"
    echo "  cmake    Professional build with CMake"
    echo "  test     Run test cases (auto build if missing)"
    echo "  help     Show this help message"
}

gpp_build() {
    echo -e "${CYAN}Compiling with g++...${RESET}"
    g++ $SRC_DIR/*.cpp -I$INCLUDE_DIR -o $OUTPUT
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Compilation successful.${RESET}"
    else
        echo -e "${RED}Compilation failed.${RESET}"
        exit 1
    fi
}

cmake_build() {
    echo -e "${CYAN}Building with CMake...${RESET}"
    mkdir -p build
    cd build
    cmake ..
    cmake --build .
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Build successful.${RESET}"
    else
        echo -e "${RED}Build failed.${RESET}"
        exit 1
    fi
    cd ..
}

if [ $# -eq 0 ]; then
    show_help
    exit 1
fi

case $1 in
    g++)
        gpp_build
        echo -e "${CYAN}Running program:${RESET}"
        ./$OUTPUT
        ;;
    
    cmake)
        cmake_build
        echo -e "${CYAN}Running program:${RESET}"
        ./build/$OUTPUT
        ;;
    
    test)
        echo -e "${CYAN}Select which build to use for testing:${RESET}"
        echo "  1. Use g++ build (default)"
        echo "  2. Use CMake build"
        read -p "Enter your choice (1 or 2): " build_choice
        build_choice=${build_choice:-1}

        if [ "$build_choice" -eq 1 ]; then
            EXECUTABLE="./$OUTPUT"
            if [ ! -f $EXECUTABLE ]; then
                echo -e "${YELLOW}Executable not found. Auto-compiling with g++...${RESET}"
                gpp_build
            else
                read -p "Executable already exists. Rebuild? (y/n): " rebuild
                if [ "$rebuild" = "y" ] || [ "$rebuild" = "Y" ]; then
                    echo -e "${YELLOW}Rebuilding with g++...${RESET}"
                    gpp_build
                fi
            fi
        elif [ "$build_choice" -eq 2 ]; then
            EXECUTABLE="./build/$OUTPUT"
            if [ ! -f $EXECUTABLE ]; then
                echo -e "${YELLOW}Executable not found. Auto-building with CMake...${RESET}"
                cmake_build
            else
                read -p "Executable already exists. Rebuild? (y/n): " rebuild
                if [ "$rebuild" = "y" ] || [ "$rebuild" = "Y" ]; then
                    echo -e "${YELLOW}Rebuilding with CMake...${RESET}"
                    cmake_build
                fi
            fi
        else
            echo -e "${RED}Invalid choice.${RESET}"
            exit 1
        fi

        if [ -z "$(ls -A inputs/*.txt 2>/dev/null)" ]; then
            echo -e "${RED}Error: No input files found in 'inputs' folder.${RESET}"
            exit 1
        fi

        mkdir -p outputs solutions
        total_tests=0
        passed_tests=0

        printf "\n┌────────────────┬────────────────┐\n"
        printf "│   Test Case    │     Status     │\n"
        printf "├────────────────┼────────────────┤\n"

        for input_file in inputs/*.txt; do
            tc_num=$(basename "$input_file" .txt | sed 's/input_//')
            output_file="outputs/output_${tc_num}.txt"
            solution_file="solutions/solution_${tc_num}.txt"

            $EXECUTABLE < "$input_file" > "$output_file"

            if [ ! -f "$solution_file" ]; then
                echo -e "${YELLOW}Solution for 'input_${tc_num}' not found. Generating...${RESET}"
                cp "$output_file" "$solution_file"
                # sleep 1  # Giữ thông báo lại 1 giây
                # clear_last_line
                printf "│ %-14s │ ${CYAN}%-14s${RESET} │\n" "testcase_${tc_num}" "Generated"
            else
                if diff -q "$output_file" "$solution_file" >/dev/null; then
                    printf "│ %-14s │ ${GREEN}%-14s${RESET} │\n" "testcase_${tc_num}" "PASS"
                    ((passed_tests++))
                else
                    printf "│ %-14s │ ${RED}%-14s${RESET} │\n" "testcase_${tc_num}" "FAIL"
                fi
            fi

            ((total_tests++))
        done

        printf "└────────────────┴────────────────┘\n"

        echo -e "${YELLOW}=========================${RESET}"
        echo -e "Total test cases: $total_tests"
        echo -e "Passed: ${GREEN}$passed_tests${RESET} / $total_tests"

        if [ $total_tests -gt 0 ]; then
            percent=$((passed_tests * 100 / total_tests))
            echo -e "Success rate: ${CYAN}$percent%${RESET}"
        else
            echo -e "${RED}No test cases found.${RESET}"
        fi
        ;;
    
    help)
        show_help
        ;;
    
    *)
        echo -e "${RED}Invalid option!${RESET}"
        show_help
        ;;
esac
