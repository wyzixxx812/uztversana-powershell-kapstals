$procesi = Get-CimInstance -ClassName Win32_Process
foreach ($process in $procesi) {
    try {
        $ip = Invoke-CimMethod -InputObject $process -MethodName GetOwner -ErrorAction Stop
        if ($ip.ReturnValue -eq 0) {
            Write-Output "Process: $($process.Name); PID: $($process.ProcessId); Lietotājs: $($ip.Domain)\$($ip.User)"
        } else {
            Write-Output "Process: $($process.Name); PID: $($process.ProcessId); Īpašnieks nav pieejams (kods $($ip.ReturnValue))"
        }
    } catch {
        Write-Output "Process: $($process.Name); PID: $($process.ProcessId); Kļūda: $($_.Exception.Message)"
    }
}
