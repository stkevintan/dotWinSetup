$ErrorActionPreference = 'Stop'

$UserLaguage = Get-WinUserLanguageList

$zhHansCN = "zh-Hans-CN"

Write-Host -ForegroundColor Cyan "Adding ZH Hans CN to lanuage list..."

if (($UserLanguage | Where-Object LanguageTag -eq "$zhHansCN").Count -eq 0) {
	$UserLaguage.add($zhHansCN)
	Set-WinUserLanguageList -LanguageList $UserLaguage
	Write-Host -ForegroundColor Green Done
} else {
	Write-Host -ForegroundColor Yellow "Already added"
}

Write-Host -ForegroundColor Cyan "Adding MS Pinyin input method..."

