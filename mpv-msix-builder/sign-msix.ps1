if (-not (Test-Path -Path "Appx/AppxManifest.xml")) {
    Write-Error "Appx/AppxManifest.xml not found!"
    exit 1
}
[xml]$manifest = Get-Content -Path "Appx/AppxManifest.xml"

$publisher = $manifest.Package.Identity.Publisher 
$version = $manifest.Package.Identity.Version
Write-Host "publisher: $publisher"
Write-Host "version: $version"

$msixPath = "mpv-$version.msix"
if (-not (Test-Path -Path "$msixPath")) {
    Write-Error "$msixPath not found!"
    exit 1
}

# sign msix
$pfxPath = $env:MPV_SIGN_PFX_PATH
if ((Test-Path -Path "$pfxPath")) {
    Write-Host "Sign msix"
    if (-not $env:MPV_SIGN_PFX_PW) {
        Write-Host "no password or not set env MPV_SIGN_PFX_PW"
        & SignTool sign /fd SHA256 /a /f "$pfxPath" "$msixPath"
    }
    else {
        & SignTool sign /fd SHA256 /a /f "$pfxPath" /p "$env:MPV_SIGN_PFX_PW" "$msixPath"
    }
}