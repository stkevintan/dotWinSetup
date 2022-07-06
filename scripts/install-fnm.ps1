#Requires -RunAsAdministrator

$ErrorActionPreference = 'Stop'

Write-Host -ForegroundColor Cyan Install fnm via chocolatey...
choco install fnm -y

Write-Host -ForegroundColor Cyan Configure pwsh profile...
Add-Content $PROFILE "`nfnm env --use-on-cd | Out-String | Invoke-Expression"

Write-Host -ForegroundColor Green Done
