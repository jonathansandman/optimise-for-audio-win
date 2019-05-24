$folders = (Get-ChildItem -Path Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces)

foreach ($folder in $folders) {
    New-ItemProperty -Path $folder.PSPath -Force -Name "TCPNoDelay" -Value 1 -PropertyType "DWord"
    New-ItemProperty -Path $folder.PSPath -Force -Name "TcpAckFrequency" -Value 1 -PropertyType "DWord"
    Write-Output $thing
}