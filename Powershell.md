# Powershell Scriptlets

### Install-Module fails due to cert

> Issue this command in your script to enforce TLS 1.2

```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
```

### Convert bitwise mask to day of week

> Build the table

```
# Bitwise weekday table
[flags()] Enum DayTable
{
  Sunday = 0x01    # 1
  Monday = 0x02    # 2
  Tuesday = 0x04   # 4
  Wednesday = 0x08 # 8
  Thursday = 0x10  # 16
  Friday = 0x20    # 32
  Saturday = 0x40  # 64
}

```

> Now you can call on a decimal value to show the days of the week

```
PS C:\> [DayTable]62
Monday, Tuesday, Wednesday, Thursday, Friday
```

# Registry Tweaks

### Allow 'Run As Administrator' on Powershell Scripts

```
Windows Registry Editor Version 5.00

[-HKEY_CLASSES_ROOT\Microsoft.PowerShellScript.1\Shell\runas]
[HKEY_CLASSES_ROOT\Microsoft.PowerShellScript.1\Shell\runas]
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\Microsoft.PowerShellScript.1\Shell\runas\command]
@="powershell \"-Command\" \"if((Get-ExecutionPolicy ) -ne 'AllSigned') { Set-ExecutionPolicy -Scope Process Bypass }; & '%1'\""
```
