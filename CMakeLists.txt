cmake_minimum_required(VERSION 3.20)


set(PROJECT_NAME "main")
set(BINARY_NAME "main")
set(LIBRARY_NAME "main_lib")

project(${PROJECT_NAME})


if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_definitions(-DDEBUG)
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g -O0")
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3")
endif()


file(GLOB MAIN_SOURCE "project/main.cpp")
file(GLOB_RECURSE LIB_SOURCES "project/source/*.cpp")
file(GLOB_RECURSE TEST_SOURCES "project/tests/*.cpp")

find_package(GTest CONFIG REQUIRED)

enable_testing()
include(GoogleTest)

include_directories(${CMAKE_SOURCE_DIR}/project/include)
include_directories(${VCPKG_INCLUDE_DIR})

add_executable(${BINARY_NAME} ${MAIN_SOURCE})

if(LIBS)
    separate_arguments(LIBS)
    target_link_libraries(${BINARY_NAME} PRIVATE ${LIBS})
endif()

if(LIB_SOURCES)
    add_library(${LIBRARY_NAME} ${LIB_SOURCES})
    target_link_libraries(${BINARY_NAME} PRIVATE ${LIBRARY_NAME})
endif()

foreach(TEST_SOURCE ${TEST_SOURCES})
    get_filename_component(TEST_NAME ${TEST_SOURCE} NAME_WE)
    add_executable(${TEST_NAME} ${TEST_SOURCE})
    
    if(LIBS)
        separate_arguments(LIBS)
        target_link_libraries(${BINARY_NAME} PRIVATE ${LIBS})
    endif()

    if(LIB_SOURCES)
        add_library(${LIBRARY_NAME} ${LIB_SOURCES})
        target_link_libraries(${BINARY_NAME} PRIVATE ${LIBRARY_NAME})
    endif()
    
    target_link_libraries(${TEST_NAME} PRIVATE GTest::gtest GTest::gtest_main)
    gtest_discover_tests(${TEST_NAME})
endforeach()


add_compile_options(
  -Wall
  -Werror
  -Wextra
  -Wundef
  -Wunused
  -Weffc++
  -Wshadow
  -Wformat
  -Wcomment
  -Wpedantic
  -Wnarrowing
  -Wlogical-op
  -Wcast-align
  -Wreturn-type
  -Winvalid-pch
  -Wtrampolines
  -Wuseless-cast
  -Wunused-macros
  -Wunused-result
  -Wold-style-cast
  -Wredundant-decls
  -Wduplicated-cond
  -Wredundant-decls
  -Wunused-parameter
  -Wnon-virtual-dtor
  -Wdouble-promotion
  -Wformat-overflow=2
  -Woverloaded-virtual
  -Wmissing-attributes
  -Wduplicated-branches
  -Wimplicit-fallthrough
  -Wno-stringop-overflow
  -Wmissing-declarations
  -Wmissing-include-dirs
  -Wmisleading-indentation
  -Wmissing-format-attribute
  -Wconversion
  -Wsign-conversion
  -Wnull-dereference)