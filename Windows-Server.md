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

> Once completed, got to the parent folder, and re-propagate permissions down the tree.
