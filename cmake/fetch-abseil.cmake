include(FetchContent)

function(fetch_absl target)
    FetchContent_Declare(
        absl
        GIT_REPOSITORY https://github.com/abseil/abseil-cpp.git
        GIT_TAG        20250814.1
    )

    FetchContent_GetProperties(absl)
    if(NOT absl_POPULATED)
        FetchContent_MakeAvailable(absl)
    endif()
    
    target_link_libraries(${target} PUBLIC absl::base absl::strings)
endfunction()