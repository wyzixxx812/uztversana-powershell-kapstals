$procesuSkaits = @(Get-Process).Count
$darbojas = 0
$aptureti = 0
foreach ($serviss in Get-Service) {
    if ($serviss.Status -eq 'Running') { $darbojas++ }
    elseif ($serviss.Status -eq 'Stopped') { $aptureti++ }
}
$kluduSkaits = @(Get-WinEvent -FilterHashtable @{ LogName = 'System'; Level = 2; StartTime = (Get-Date).AddHours(-48) } -ErrorAction SilentlyContinue).Count
Write-Output "Procesu skaits: $procesuSkaits"
Write-Output "Darbojošies servisi: $darbojas"
Write-Output "Apturētie servisi: $aptureti"
Write-Output "Sistēmas kļūdas pēdējās 48 h: $kluduSkaits"
foreach ($disks in (Get-CimInstance -ClassName Win32_LogicalDisk -Filter 'DriveType = 3')) {
    Write-Output "Disks $($disks.DeviceID): brīvs $([math]::Round($disks.FreeSpace / 1GB, 1)) GB"
}
