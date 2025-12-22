include(FetchContent)
include(cmake/fetch-abseil.cmake)

function(fetch_re2 target)
    fetch_absl(${target})

    set(RE2_BUILD_TESTING OFF CACHE BOOL "" FORCE)
    set(RE2_BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
    set(RE2_INSTALL OFF CACHE BOOL "" FORCE)

    FetchContent_Declare(
        re2
        GIT_REPOSITORY https://github.com/google/re2.git
        GIT_TAG 2025-11-05
    )

    FetchContent_GetProperties(re2)
    if (NOT re2_POPULATED)
        FetchContent_MakeAvailable(re2)
    endif()

    target_link_libraries(${target} PUBLIC re2::re2)
endfunction(fetch_re2 target)
