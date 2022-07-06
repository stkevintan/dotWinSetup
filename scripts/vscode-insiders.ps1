$ErrorActionPreference = 'Stop'

Write-Host -ForegroundColor Cyan Install vscode-insiders...

if ($null -eq (scoop bucket list |Where-Object Name -eq "versions")) {
	scoop bucket add versions
}

scoop install vscode-insiders


Write-Host -f Cyan "Associate file extensions..."
reg "$env:USERPROFILE\scoop\apps\vscode-insiders\current\install-associations.reg"

Write-Host -f Cyan "Install context command..."
reg "$env:USERPROFILE\scoop\apps\vscode-insiders\current\install-context.reg"

Write-Host -ForegroundColor Cyan  Set "ci" as the alias of "code-insiders"

$ProfilePath = $PROFILE.CurrentUserAllHosts
$AliasCommand = "New-Alias ci code-insiders"

if (Test-Path "$ProfilePath") {
	Add-Content "$ProfilePath" "$AliasCommand"
} else {
	New-Item -Path "$ProfilePath" -ItemType File -Value "$AliasCommand"
}

Write-Host -ForegroundColor Green Done