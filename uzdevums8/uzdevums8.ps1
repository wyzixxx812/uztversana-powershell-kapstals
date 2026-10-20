$laiks1 = Measure-Command { $a = Get-Service -Name Spooler -ErrorAction SilentlyContinue }
$laiks2 = Measure-Command { $b = Get-CimInstance -ClassName Win32_Service -Filter "Name='Spooler'" }
Write-Output "1. veids (Get-Service): $([math]::Round($laiks1.TotalMilliseconds, 3)) ms"
Write-Output "2. veids (Get-CimInstance): $([math]::Round($laiks2.TotalMilliseconds, 3)) ms"
Write-Output "Get-Service statuss: $($a.Status)"
Write-Output "Get-CimInstance statuss: $($b.State)"
if ($laiks1.TotalMilliseconds -lt $laiks2.TotalMilliseconds) {
    Write-Output 'Ātrāks bija 1. veids (vienā mērījumā).'
} elseif ($laiks2.TotalMilliseconds -lt $laiks1.TotalMilliseconds) {
    Write-Output 'Ātrāks bija 2. veids (vienā mērījumā).'
} else {
    Write-Output 'Abi mērījumi bija vienādi.'
}
