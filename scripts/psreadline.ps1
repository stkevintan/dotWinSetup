$ErrorActionPreference = 'Stop'

function is_admin {
    $admin = [security.principal.windowsbuiltinrole]::administrator
    $id = [security.principal.windowsidentity]::getcurrent()
    ([security.principal.windowsprincipal]($id)).isinrole($admin)
}

if (is_admin) {
	Write-Host "Please run this script in elevated shell" -ForegroundColor Red
	return
}

# if ($null -eq (Get-Module PSReadLine)) {
# 	Write-Host -ForegroundColor Cyan "Install PSReadline..."
# 	Install-Module -Name PowerShellGet -Force -ErrorAction SilentlyContinue
# 	Install-Module PSReadLine
# } else {
# 	Write-Host -ForegroundColor Yellow "PS Readline already installed"
# }

Write-Host -ForegroundColor Cyan Downloading sample ps readline profile...
$content = (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShell/PSReadLine/master/PSReadLine/SamplePSReadLineProfile.ps1');

$P = $PROFILE.CurrentUserAllHosts

if (Test-Path $P -PathType Leaf) {
	$pf = Get-Content $P
	if ($pf.Contains("# This is an example profile for PSReadLine.")) {
		Write-Host -ForegroundColor Yellow "Sample profile already configured"
	} else {
		$usings = @()
		$rests = @()
		(Get-Content $P).Split("`n") | ForEach-Object {
			if ($_ -match "^\s*using\s+namespace.*") {
				$usings += $_
			} else {
				$rests += $_
			}
		}
		$content = ($usings + @($content) + $rests) -Join "`n"
		Set-Content $P $content
	}
} else {
	New-Item -ItemType File -Path "$P" -Value "$content" -Force
}
Write-Host -ForegroundColor Green Done

