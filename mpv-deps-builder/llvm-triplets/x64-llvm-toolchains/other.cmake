if(PORT MATCHES "^(spirv-tools)$")
    set(VCPKG_CXX_FLAGS "-Wno-error=unused-command-line-argument")
    set(VCPKG_C_FLAGS "-Wno-error=unused-command-line-argument")
endif()
