﻿$ErrorActionPreference = 'Stop';

$packageName= 'docker-for-windows-edge'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.docker.com/win/edge/14896/Docker%20for%20Windows%20Installer.exe'
$checksum   = '061bce4218134dea776bf6fbfef955394512426544a019ac79fee13699b1d79d'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'docker*'

  checksum      = $checksum
  checksumType  = 'sha256'
 
  silentArgs    = "install --quiet"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
