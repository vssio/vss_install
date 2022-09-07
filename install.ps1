#!/usr/bin/env pwsh
# Copyright 2022 TSURUTA Takumi. All rights reserved. MIT license.
# This script uses most of the script from `vss_install` with a few tweaks for vss.
# The original project is here: https://github.com/vssio/vss_install
# 
# Copyright 2019 the Deno authors. All rights reserved. MIT license.
# TODO(everyone): Keep this script simple and easily auditable.

$ErrorActionPreference = 'Stop'

if ($v) {
  $Version = "v${v}"
}
if ($Args.Length -eq 1) {
  $Version = $Args.Get(0)
}

$vssInstall = $env:VSS_INSTALL
$BinDir = if ($vssInstall) {
  "${vssInstall}\bin"
} else {
  "${Home}\.vss\bin"
}

$vssZip = "$BinDir\vss.zip"
$vssExe = "$BinDir\vss.exe"
$Target = "windows_amd64"

$DownloadUrl = if (!$Version) {
  "https://github.com/vssio/vss/releases/latest/download/vss_${Target}.zip"
} else {
  "https://github.com/vssio/vss/releases/download/${Version}/vss_${Target}.zip"
}

if (!(Test-Path $BinDir)) {
  New-Item $BinDir -ItemType Directory | Out-Null
}

curl.exe -Lo $vssZip $DownloadUrl

tar.exe xf $vssZip -C $BinDir

cp.exe "${BinDir}/vss_${Target}/vss.exe" $BinDir

Remove-Item $vssZip
Remove-Item "${BinDir}/vss_${Target}" -Recurse

$User = [System.EnvironmentVariableTarget]::User
$Path = [System.Environment]::GetEnvironmentVariable('Path', $User)
if (!(";${Path};".ToLower() -like "*;${BinDir};*".ToLower())) {
  [System.Environment]::SetEnvironmentVariable('Path', "${Path};${BinDir}", $User)
  $Env:Path += ";${BinDir}"
}

Write-Output "vss was installed successfully to ${vssExe}"
Write-Output "Run 'vss help' to get started"