# SQL (MS-MySQL-MariaDB)

### Move database files in MS SQL Server

##### Get current location of system databases

```
USE master;

SELECT * FROM sys.master_files;
```

##### Set new database location

```
USE master;

ALTER DATABASE db_name
MODIFY FILE (name='DB_test',filename='E:\DB_Folder\DB_test.mdf');

ALTER DATABASE db_name
MODIFY FILE (name='DB_test_log',filename='E:\DB_Folder\DB_test.ldf');
```
> Note: The filename  is the new location. You do not need to declare the old location in this command. Changing this path does not take effect immediately, but will be used the next time the database starts up.

##### Set the database offline

Using `WITH ROLLBACK IMMEDIATE` will force everyone offline and rollback their open transactions

`ALTER DATABASE db_name SET OFFLINE WITH ROLLBACK IMMEDIATE;`

##### Move files to new location

Self-explanatory

##### Bring database back online

`ALTER DATABASE db_name SET ONLINE;`

### Repair 'Recovery Pending' databases

> This will remove corrupt data, and may cause data loss

```
ALTER DATABASE [DB_Name] SET EMERGENCY;
GO
ALTER DATABASE [DB_Name] set single_user
GO
DBCC CHECKDB ([DB_Name], REPAIR_ALLOW_DATA_LOSS) WITH ALL_ERRORMSGS;
GO
ALTER DATABASE [DB_Name] set multi_user
GO
```

### Reset mySQL/MariaDB 'root' password

##### Stop current services

```
systemctl stop mariadb
```
or
```
systemctl stop mysqld
```

##### Start in safe mode

```
mysqld_safe --skip-grant-tables --skip-networking &
```

##### Login as 'root' and change to 'mysql' DB

```
mysql -u root
USE mysql;
```

##### Use one of the following options to reset the password

```
ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';
```

```
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('new_password');
```

```
UPDATE user SET password=PASSWORD('new_password') WHERE User='root' AND Host = 'localhost';
```

##### Flush privileges and quit

```
FLUSH PRIVILEGES;
quit
```
