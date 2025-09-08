$env:workspace = (Get-Location).Path
Set-Location mpv-builder

.\env-win.ps1
.\env-clang.ps1
.\deps-vcpkg.ps1

if(-not (Test-Path "mpv-windows"))
{
    git clone -b master --depth 1 https://github.com/mpv-player/mpv.git mpv-windows
    xcopy /y /c /h /r /s "mpv\*.*" "mpv-windows\"
    git clone -b master --depth 1 https://github.com/haasn/libplacebo.git mpv-windows/subprojects/libplacebo
}

Set-Location mpv-windows
..\setup-cl.ps1
..\compile.ps1
..\install.ps1