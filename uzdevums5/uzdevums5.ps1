$sakums = (Get-Date).AddHours(-48)
$kludas = @(Get-WinEvent -FilterHashtable @{ LogName = 'System'; Level = 2; StartTime = $sakums } -ErrorAction SilentlyContinue)
Write-Output "Sistēmas žurnāla kļūdas pēdējās 48 stundās: $($kludas.Count)"
if ($kludas.Count -gt 0) {
    $avots = $kludas | Group-Object -Property ProviderName | Sort-Object -Property Count -Descending | Select-Object -First 1
    Write-Output "Biežākais avots: $($avots.Name)"
    Write-Output "Reižu skaits: $($avots.Count)"
} else {
    Write-Output 'Biežākais avots: nav (0 kļūdu)'
}
