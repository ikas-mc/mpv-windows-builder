if (-not (Test-Path -Path 'mpv-windows')) {
    git clone --branch master --depth 1 https://github.com/mpv-player/mpv.git mpv-windows

    git -C 'mpv-windows' apply --whitespace=nowarn (Resolve-Path -Path 'mpv-patch\0001-d3d11-composition-display.patch').Path

    if (Test-Path -Path 'mpv') {
       Copy-Item -Path 'mpv\*' -Destination 'mpv-windows\' -Recurse -Force
    }

    New-Item -Path 'mpv-windows\subprojects' -ItemType Directory -Force | Out-Null
    git clone --branch master --depth 1 https://github.com/haasn/libplacebo.git 'mpv-windows/subprojects/libplacebo'
}
