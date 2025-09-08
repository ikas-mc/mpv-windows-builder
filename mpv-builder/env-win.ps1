
if (-not $env:VS_ROOT) {
    $env:VS_ROOT="C:\Program Files\Microsoft Visual Studio\2022\Community"
}

& "$env:VS_ROOT\Common7\Tools\Launch-VsDevShell.ps1" -Arch amd64 -HostArch amd64 -SkipAutomaticLocation | Out-Null
