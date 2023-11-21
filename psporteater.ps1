param (
    [Parameter(Mandatory = $true)]
    [string] $RemoteHost,

    [Parameter(Mandatory = $true)]
    [int] $RemotePort,

    [Parameter(Mandatory = $true)]
    [int] $MillisecondsDelay,

    [Parameter(Mandatory = $true)]
    [int] $IterationCount
)

for ($i = 0; $i -lt $IterationCount; $i++) {
    "#$($i + 1): $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

    $tcpClient = New-Object -TypeName 'System.Net.Sockets.TcpClient'
    $tcpClient.Connect($RemoteHost, $RemotePort)

    if ($tcpClient.Connected) {
        #Write-Host "Connected to $RemoteHost on port $RemotePort"
    }
    else {
        Write-Host "Failed to connect to $RemoteHost on port $RemotePort"
    }

    #$tcpClient.Close()
    Start-Sleep -Milliseconds $MillisecondsDelay
}
