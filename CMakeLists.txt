cmake_minimum_required(VERSION 4.0)
project(imgui_text_editor VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(imgui_text_editor STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/TextEditor.cpp
)
target_include_directories(imgui_text_editor PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

include(cmake/fetch-imgui.cmake)
include(cmake/fetch-re2.cmake)
fetch_imgui(imgui_text_editor)
fetch_re2(imgui_text_editor)

option(BUILD_TESTS "Build the tests" ON)
if (BUILD_TESTS)
    add_subdirectory(tests)
endif()