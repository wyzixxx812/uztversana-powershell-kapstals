$darbojas = 0
$aptureti = 0
$parejie = 0
$servisi = @(Get-Service)
foreach ($serviss in $servisi) {
    if ($serviss.Status -eq 'Running') {
        $darbojas++
    } elseif ($serviss.Status -eq 'Stopped') {
        $aptureti++
    } else {
        $parejie++
    }
}
Write-Output "Darbojas: $darbojas"
Write-Output "Apturēti: $aptureti"
Write-Output "Summa (darbojas + apturēti): $($darbojas + $aptureti)"
Write-Output "Visi servisi: $($servisi.Count)"
Write-Output "Citi statusi: $parejie"
