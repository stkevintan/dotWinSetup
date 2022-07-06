$ErrorActionPreference = 'Stop'

Write-Host -ForegroundColor Cyan Install fnm ...
scoop install fnm

Write-Host -ForegroundColor Cyan Configure pwsh profile...
Add-Content $PROFILE.CurrentUserAllHosts "`nfnm env --use-on-cd | Out-String | Invoke-Expression"

Write-Host -ForegroundColor Green Done
