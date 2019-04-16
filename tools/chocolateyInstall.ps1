$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$nb_home = Join-Path $package 'netbeans11/netbeans'
$nb_bat = Join-Path $nb_home '/bin/netbeans64.exe'



Install-ChocolateyZipPackage `
  -PackageName 'netbeans11' `
  -Url 'http://mirror.lagoon.nc/pub/apache/incubator/netbeans/incubating-netbeans/incubating-11.0/incubating-netbeans-11.0-bin.zip' `
  -Checksum '9d7fbe5c6bcf781fc1d3f8e2aee62db0435dd716c60dc73ef900ee2817473cc5b0a8e12c1453b7e57aedcece70cff778673a8cf563c1fa4eea816d9636955d4b' `
  -ChecksumType 'SHA512' `
  -UnzipLocation $package

  
Install-BinFile -Name 'netbeans64.exe' -Path $nb_bat
  
Install-ChocolateyEnvironmentVariable `
    -VariableName 'NB_HOME' `
    -VariableValue $nb_home `
    -VariableType 'Machine'


Install-BinFile -Name 'netbeans64.exe' -Path $nb_bat

Update-SessionEnvironment

