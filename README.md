

# mpv-windows-builder

## Overview
- Deps by vcpkg with clang-cl
- Only d3d11


## Requirements
- [vcpkg](https://github.com/microsoft/vcpkg)
- Visual Studio 2022 (with C++ llvm toolset)

## Build 
- see action/build-mpv.yml
- use --genvslite=vs2022 for visual studio ide


## References
- [Custom vcpkg triplets](https://github.com/Neumann-A/my-vcpkg-triplets)
- [mpv official Windows build script](https://github.com/mpv-player/mpv/blob/master/ci/build-win32.ps1)