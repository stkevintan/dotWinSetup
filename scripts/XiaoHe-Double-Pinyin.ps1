[CmdletBinding()]
param()


$ErrorActionPreference = 'Stop'

$FieldName = "UserDefinedDoublePinyinScheme0"
$FieldValue = "小鹤双拼*2*^*iuvdjhcwfg^xmlnpbksqszxkrltvyovt"

Write-Host -ForegroundColor Green  "Adding xiaohe pinyin scheme to MS pinyin"

$SettingPath = "Registry::HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS"

if (Get-ItemProperty -Path $SettingPath -Name $FieldName -ErrorAction SilentlyContinue) {
	Write-Host -ForegroundColor Yellow "Schema already existed"
	return
} 

New-ItemProperty -Path $SettingPath -Name $FieldName -PropertyType String -Value $FieldValue
Write-Host -ForegroundColor Green "Done"


