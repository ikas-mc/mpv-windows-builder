if (-not (Test-Path -Path "Appx/AppxManifest.xml")) {
    Write-Error "Appx directory not found!"
    exit 1
}

# update build version and cn
[xml]$manifest = Get-Content -Path "Appx/AppxManifest.xml"

$publisher = $env:MPV_SIGN_PUBLISHER
if (-not $publisher) {
    $publisher = "CN=ikas-mc-dev"
}
else {
    $manifest.Package.Identity.Publisher = $publisher
}

$version = $manifest.Package.Identity.Version
$newVersion = $version
$parts = $version -split '\.'
if ($parts.Length -eq 4) {
    $parts[3] = ([int]$parts[3] + 1).ToString()
    $newVersion = "$($parts[0]).$($parts[1]).$($parts[2]).$($parts[3])"
    $manifest.Package.Identity.Version = $newVersion
}
else {
    Write-Error "Version format error: $version"
    exit 1
}
$manifest.Save("Appx/AppxManifest.xml")

$msixPath = "mpv-$newVersion.msix"
Write-Host "start create $msixPath"

# create resources.pri
& makepri.exe createconfig /ConfigXml priconfig.xml /Default en-US /Overwrite
& MakePri.exe new /ProjectRoot Appx /ConfigXml priconfig.xml /OutputFile Appx\resources.pri /Overwrite /Verbose
if (-not (Test-Path -Path "Appx\resources.pri")) {
    Write-Error "create resources.pri error!"
    exit 1
}

# create msix package
& MakeAppx pack /v /o /h SHA256 /d Appx /p "$msixPath"
if (-not (Test-Path -Path "$msixPath")) {
    Write-Error "create msix error!"
    exit 1
}

# clean up
Remove-Item .\priconfig.xml