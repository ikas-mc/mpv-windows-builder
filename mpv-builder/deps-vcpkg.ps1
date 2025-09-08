Write-Output "==deps vcpkg"

if (-not $env:workspace) {
    $env:workspace = (Resolve-Path -Path "../").Path
}
Write-Host "Using workspace: $env:workspace"

$libPath = "${env:workspace}\mpv-deps-builder\vcpkg_installed\x64-llvm-windows-static-mt"
$env:C_INCLUDE_PATH = "$libPath\include"
$env:CPLUS_INCLUDE_PATH = "$libPath\include"
$env:LIBRARY_PATH = "$libPath\lib"
$env:PKG_CONFIG_PATH = "$libPath\lib\pkgconfig"
$env:PKG_CONFIG = "${env:workspace}\pkg-config\mingw64\bin\pkg-config.exe"

if (-not (Test-Path -Path $env:LIBRARY_PATH)) {
    Write-Error "x64-llvm-windows-static-md libs not found"
    exit 1
}

if (-not (Test-Path -Path $env:PKG_CONFIG)) {
    Write-Error "pkg-config.exe not found"
    exit 1
}
else {
    & $env:PKG_CONFIG --version
}

#fix meson iconv
$env:LIB += ";$env:LIBRARY_PATH"