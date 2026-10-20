
# Atskaites ID: RVT-4417

[CmdletBinding(SupportsShouldProcess = $true)]
param()

$servisi = @(Get-Service | Where-Object {
    $_.StartType -eq 'Automatic' -and
    $_.Status -eq 'Stopped'
})

$skaits = $servisi.Count
$veiksmigi = 0
$neizdevusies = 0

Write-Output "Atrasto automātisko, apturēto servisu skaits: $skaits"

if ($skaits -eq 0) {
    Write-Output "Nav atrasts neviens apturēts automātiskais serviss."
}
else {
    foreach ($serviss in $servisi) {
        Write-Output "Serviss: $($serviss.Name)"

        if ($PSCmdlet.ShouldProcess($serviss.Name, "Palaist servisu")) {
            try {
                Start-Service -Name $serviss.Name -ErrorAction Stop
                Write-Output "Serviss veiksmīgi palaists: $($serviss.Name)"
                $veiksmigi++
            }
            catch {
                Write-Output "Servisu neizdevās palaist: $($serviss.Name)"
                Write-Output "Iespējamais iemesls: nepietiekamas piekļuves tiesības, serviss nav pieejams vai ir radušies citi sistēmas ierobežojumi."
                $neizdevusies++
            }
        }
        else {
            Write-Output "Serviss netika palaists."
        }
    }
}

if (-not $WhatIfPreference) {
    Write-Output ""
    Write-Output "Kopsavilkums:"
    Write-Output "Veiksmīgi palaisti servisi: $veiksmigi"
    Write-Output "Neizdevās palaist: $neizdevusies"
}
