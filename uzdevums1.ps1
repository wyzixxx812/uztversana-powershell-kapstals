$os = Get-CimInstance -ClassName Win32_OperatingSystem
$procesi = @(Get-Process)
Write-Output "Datora nosaukums: $env:COMPUTERNAME"
Write-Output "Operētājsistēma: $($os.Caption)"
Write-Output "OS būvējuma numurs: $($os.BuildNumber)"
Write-Output "PowerShell versija: $($PSVersionTable.PSVersion)"
Write-Output "Datums un laiks: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
Write-Output "Darbojošos procesu skaits: $($procesi.Count)"
