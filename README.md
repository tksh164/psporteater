# PSPorteater

PSPorteater is a tool for to exhaustion ephemeral/SNAT ports.

- Run PSPorteater

    ```powershell
    .\psporteater.ps1 -RemoteHost test.example.com -RemotePort 443 -MillisecondsDelay 0 -IterationCount 100000
    ```

- Run multiple PSPorteater

    ```powershell
    1..100 |% { Start-Process -FilePath 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe' -ArgumentList '-NoLogo -NoProfile -NonInteractive -File "C:\work\psporteater.ps1" -RemoteHost test.example.com -RemotePort 443 -MillisecondsDelay 0 -IterationCount 100000' -WindowStyle Minimized }
    ```

- Measure number of connections

    ```powershell
    netstat -ano |? { $_ -like '*203.0.113.123:443*' } | Measure-Object
    ```
