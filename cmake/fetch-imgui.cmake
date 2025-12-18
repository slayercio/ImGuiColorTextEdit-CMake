include(FetchContent)

function(fetch_imgui target)
    if (NOT TARGET imgui)
        FetchContent_Declare(
            imgui
            GIT_REPOSITORY https://github.com/ocornut/imgui.git
            GIT_TAG v1.92.5
        )

        FetchContent_GetProperties(imgui)
        if (NOT imgui_POPULATED)
            FetchContent_MakeAvailable(imgui)
        endif()

        add_library(imgui INTERFACE)
        
        target_include_directories(imgui INTERFACE
            ${imgui_SOURCE_DIR}
            ${imgui_SOURCE_DIR}/backends
        )

        set(IMGUI_CORE
            ${imgui_SOURCE_DIR}/imgui.cpp
            ${imgui_SOURCE_DIR}/imgui_draw.cpp
            ${imgui_SOURCE_DIR}/imgui_tables.cpp
            ${imgui_SOURCE_DIR}/imgui_widgets.cpp
        )

        # Win32 + DX11
        set(IMGUI_BACKENDS
            ${imgui_SOURCE_DIR}/backends/imgui_impl_win32.cpp
            ${imgui_SOURCE_DIR}/backends/imgui_impl_dx11.cpp
        )

        target_sources(imgui INTERFACE
            ${IMGUI_CORE}
            ${IMGUI_BACKENDS}
        )

        target_link_libraries(imgui
            INTERFACE
                d3d11
                dxgi
                user32
        )
    endif()

    target_link_libraries(${target} PUBLIC imgui)
endfunction()
