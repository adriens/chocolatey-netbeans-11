﻿$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat = Join-Path $content '/bin/netbeans64.exe'

Uninstall-BinFile `
  -Name 'netbeans11' `
  -Path $bat
