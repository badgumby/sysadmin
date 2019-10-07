# File Server

### Permission issues (cannot view permissions, etc)

> Login to the server as a local administrator account (not a domain account)

> Open command prompt as administrator and issue the following command:

```
takeown /F "Full-path-to-directory" /A /R /D Y
```

```
# Flags
/A (Administrators Group)
/R (Recursive)
/D Y (Prompt answer yes)
```

> Once completed, go to the parent folder, and re-propagate permissions down the tree.

# WSUS

### WSUSPool crashes due to private bytes memory limit

> Internet Information Services (IIS) Manager -> Server -> Application Pools -> Select “WSUSPool” -> Actions Advanced -> Recycling -> Change value of “Private Memory Limit (KB)”

> Set to a higher number, such as 8000000 (8GB)

# RDP

### Remotely enable RDP using Powershell

Open PSSession

```
Enter-PSSession -ComputerName server.domain.local -Credential domain\administrator
```

Edit registry entry to enable RDP

```
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
```

Allow RDP in the Windows Firewall (if the group exists)

```
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
```

Allow RDP in the Windows Firewall (manually)

```
netsh advfirewall firewall add rule name="allow RemoteDesktop" dir=in protocol=TCP localport=3389 action=allow
```

You can also enable RDP NLA, if needed

```
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1
```

Command to test the RDP connection from your machine

```
Test-NetConnection server.domain.local -CommonTCPPort rdp
```
