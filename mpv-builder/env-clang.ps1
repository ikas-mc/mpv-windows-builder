Write-Output "==using llvm/clang=="

$env:CC = 'clang'
$env:CXX = 'clang++'
$env:CC_LD = 'lld-link'
$env:CXX_LD = 'lld-link'
$env:WINDRES = 'llvm-rc'