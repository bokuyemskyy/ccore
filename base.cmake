cmake_minimum_required(VERSION 3.20)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED YES)

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
