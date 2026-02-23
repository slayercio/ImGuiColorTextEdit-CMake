include(FetchContent)

function(fetch_imgui target)
    if (NOT TARGET imgui)
        FetchContent_Declare(
            imgui
            GIT_REPOSITORY https://github.com/slayercio/imgui-cmake.git
            GIT_TAG master
        )

        FetchContent_GetProperties(imgui)
        if (NOT imgui_POPULATED)
            FetchContent_MakeAvailable(imgui)
        endif()
    endif()

    target_link_libraries(${target} PUBLIC imgui)
endfunction()
