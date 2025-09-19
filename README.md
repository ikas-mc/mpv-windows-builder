

# mpv-windows-builder

## Overview
- Deps by vcpkg with clang-cl
- Only d3d11
- Only mpv.exe, windows >= 24H2(26100), see https://github.com/mpv-player/mpv/pull/15039

```
mpv.exe --v
[cplayer] Command line options: '--v'
[cplayer] mpv v0.40.0-UNKNOWN Copyright © 2000-2025 mpv/MPlayer/mplayer2 projects
```



## Requirements
- [vcpkg](https://github.com/microsoft/vcpkg)
- Visual Studio 2022 (with C++ llvm toolset)

## Build 
- see action/build-mpv.yml
- use --genvslite=vs2022 for visual studio ide


## References
- [Custom vcpkg triplets](https://github.com/Neumann-A/my-vcpkg-triplets)
- [mpv official Windows build script](https://github.com/mpv-player/mpv/blob/master/ci/build-win32.ps1)
