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
