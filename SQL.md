# SQL

### Move database files in MS SQL Server

##### Set new database location

> Note, you do not need to declare the old location in this command. Changing this path does not take effect immediately, but will be used the next time the database starts up.

```
USE master;
ALTER DATABASE foo
MODIFY FILE (name='DB_test',filename='E:\DB_Folder\DB_test.mdf');
```
> Note: The filename  is the new location. You do not need to declare the old location in this command. Changing this path does not take effect immediately, but will be used the next time the database starts up.

##### Set the database offline

> WITH ROLLBACK IMMEDIATE will force everyone offline and rollback their open transactions

`ALTER DATABASE foo SET OFFLINE WITH ROLLBACK IMMEDIATE;`

##### Move files to new location

`Self-explanatory`

##### Bring database back online

`ALTER DATABASE foo SET ONLINE;`
