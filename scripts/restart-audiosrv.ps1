#Requires -RunAsAdministrator

# This is to resolve no sound when connecting RDP

Restart-Service Audiosrv -Force 
Write-Host “Windows Audio Service restarted successfully.” 