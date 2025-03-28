cmake_minimum_required(VERSION 3.20)


project(${PROJECT_NAME})


if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_definitions(-DDEBUG)
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -g -O0")
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3")
endif()


file(GLOB MAIN "project/main.cpp")
file(GLOB_RECURSE SOURCES "project/source/*.cpp")
file(GLOB_RECURSE TESTS "project/tests/*.cpp")

separate_arguments(LIBS)

find_package(GTest CONFIG REQUIRED)

enable_testing()
include(GoogleTest)

include_directories(${CMAKE_SOURCE_DIR}/project/include)
include_directories(${VCPKG_INCLUDE_DIR})

#add_library(${LIBRARY_NAME} ${SOURCES})

add_executable(${BINARY_NAME} ${MAIN})
#target_link_libraries(${BINARY_NAME} PRIVATE ${LIBRARY_NAME} ${LIBS})

foreach(TEST_SOURCE ${TESTS})
    get_filename_component(TEST_NAME ${TEST_SOURCE} NAME_WE)
    add_executable(${TEST_NAME} ${TEST_SOURCE})
    target_link_libraries(${TEST_NAME} PRIVATE ${APP_LIB_NAME} ${LIBS} GTest::gtest GTest::gtest_main)
    gtest_discover_tests(${TEST_NAME})
endforeach()
