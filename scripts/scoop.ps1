
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod get.scoop.sh | Invoke-Expression

# add well-known buckets

scoop bucket add extras
scoop bucket add versions

Write-Host -ForegroundColor Green "Scoop is ready to use."