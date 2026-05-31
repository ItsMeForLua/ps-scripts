scoop install uutils-coreutils

coreutils --list

$coreutilsList = @(coreutils.exe --list)
foreach ($util in $coreutilsList) {
    $util_path =Join-Path $env:USERPROFILE\scoop\shims "$util.exe"
    if (-not (Test-Path $util_path)) {
        New-Item -ItemType SymbolicLink -Path $util_path -Target "$env:USERPROFILE\scoop\apps\uutils-coreutils\current\coreutils.exe" -Force
    }
}

refreshenv
