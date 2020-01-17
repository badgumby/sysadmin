# User Accounts

### Account lockout

Tools from Microsoft

[Account Lockout and Management Tools](https://www.microsoft.com/en-us/download/details.aspx?id=18465)

### Netlogon Debugging

Enable debugging on Windows Server 2003 or newer.
Logs are written to `%windir%/debug/Netlogon.log`

```
Nltest /DBFlag:2080FFFF
```

Disable debugging

```
Nltest /DBFlag:0x0
```

### OID Generation for AD Schema

```
$Prefix="1.2.840.113556.1.8000.2554"
$GUID=[System.Guid]::NewGuid().ToString()
$Parts=@()
$Parts+=[UInt64]::Parse($guid.SubString(0,4),"AllowHexSpecifier")
$Parts+=[UInt64]::Parse($guid.SubString(4,4),"AllowHexSpecifier")
$Parts+=[UInt64]::Parse($guid.SubString(9,4),"AllowHexSpecifier")
$Parts+=[UInt64]::Parse($guid.SubString(14,4),"AllowHexSpecifier")
$Parts+=[UInt64]::Parse($guid.SubString(19,4),"AllowHexSpecifier")
$Parts+=[UInt64]::Parse($guid.SubString(24,6),"AllowHexSpecifier")
$Parts+=[UInt64]::Parse($guid.SubString(30,6),"AllowHexSpecifier")
$OID=[String]::Format("{0}.{1}.{2}.{3}.{4}.{5}.{6}.{7}",$prefix,$Parts[0],$Parts[1],$Parts[2],$Parts[3],$Parts[4],$Parts[5],$Parts[6])
$oid
```
