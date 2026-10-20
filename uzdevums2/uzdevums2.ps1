$top = Get-Process | Sort-Object -Property WorkingSet64 -Descending | Select-Object -First 10
$top | Sort-Object -Property WorkingSet64 | ForEach-Object {
    $mb = [math]::Round($_.WorkingSet64 / 1MB, 1)
    Write-Output ("Process: {0}; Id: {1}; Atmiņa: {2:N1} MB" -f $_.ProcessName, $_.Id, $mb)
}
