cmake_minimum_required(VERSION 3.15)
cmake_policy(SET CMP0091 NEW)

add_executable(testCmStringUtils
    testCmStringUtils.cpp
)

target_include_directories(testCmStringUtils PUBLIC
    ${CMAKE_SOURCE_DIR}/Source/Utils
)

CMAKE_SET_TARGET_FOLDER(testCmStringUtils "Tests")

if (WIN32)
    target_compile_options(testCmStringUtils PRIVATE "/W4")
endif()

target_link_libraries(testCmStringUtils cmutils gtest)

set_target_properties(testCmStringUtils
    PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/Tests/CMakeLib/testCmStringUtils
)