if(PORT MATCHES "^(spirv-tools)$")
    set(VCPKG_CXX_FLAGS "-Wno-error=unused-command-line-argument")
    set(VCPKG_C_FLAGS "-Wno-error=unused-command-line-argument")
endif()

if(PORT MATCHES "^(opus)$")
    set(VCPKG_CXX_FLAGS "-mssse3 -msse4.1")
    set(VCPKG_C_FLAGS "-mssse3 -msse4.1")
endif()

if(PORT MATCHES "^(libvpx)$")
    set(VCPKG_CXX_FLAGS "-msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2")
    set(VCPKG_C_FLAGS "-msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2")
endif()