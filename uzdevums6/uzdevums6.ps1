$csv = Join-Path -Path $PSScriptRoot -ChildPath 'draiveri.csv'
$draiveri = @(Get-CimInstance -ClassName Win32_PnPSignedDriver | Where-Object {
    $_.DriverProviderName -and $_.DriverProviderName -notmatch '^Microsoft( Corporation)?$'
} | Select-Object -Property DeviceName, DriverProviderName, DriverVersion, InfName)
$draiveri | Export-Csv -Path $csv -NoTypeInformation -Encoding UTF8
Write-Output "Draiveru ieraksti CSV failā: $($draiveri.Count)"
Write-Output "CSV fails: $csv"
$draiveri | Format-Table -AutoSize | Out-String -Width 240
