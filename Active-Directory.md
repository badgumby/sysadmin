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
