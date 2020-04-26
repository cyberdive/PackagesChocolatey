$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'Archi-Win64-Setup-4.6.0.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE' #only one of these: exe, msi, msu
 file         = $fileLocation
 

  softwareName  = 'archi2*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = ''
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = ''
  checksumType64= 'sha256' #default is checksumType
 validExitCodes= @(0, 3010, 1641)

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup

}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
