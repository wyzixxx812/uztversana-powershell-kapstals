$robezaGB = 20
$diski = Get-CimInstance -ClassName Win32_LogicalDisk -Filter 'DriveType = 3'
foreach ($disks in $diski) {
    $kopā = [math]::Round($disks.Size / 1GB, 1)
    $brivs = [math]::Round($disks.FreeSpace / 1GB, 1)
    Write-Output "Disks $($disks.DeviceID): kopā $kopā GB; brīvs $brivs GB"
    if ($disks.FreeSpace -lt ($robezaGB * 1GB)) {
        Write-Output "BRĪDINĀJUMS: diskā $($disks.DeviceID) ir mazāk par $robezaGB GB brīvas vietas!"
    }
}
