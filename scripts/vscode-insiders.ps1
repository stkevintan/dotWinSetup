#Requires -RunAsAdministrator

$ErrorActionPreference = 'Stop'

Write-Host -ForegroundColor Cyan Install vscode-insiders...

choco install vscode-insiders

Write-Host -ForegroundColor Cyan Configure the environment variables
. RefreshEnv.cmd
$path = "$env:PATH"
if ($path.Contains("VS Code Insiders")) {
	Write-Host -ForegroundColor Yellow Environment path already set
} else {
	[System.Environment]::SetEnvironmentVariable('PATH', "$path;C:\Program Files\Microsoft VS Code Insiders\bin")
}

Write-Host -ForegroundColor Cyan  Set "codei" as the alias of "code-insiders"
$folder = "C:\Program Files\Microsoft VS Code Insiders\bin" 
New-Item -ItemType SymbolicLink -Path "$folder\codei.cmd" -Target "$folder\code-insiders.cmd" -ErrorAction SilentlyContinue

Write-Host -ForegroundColor Green Done