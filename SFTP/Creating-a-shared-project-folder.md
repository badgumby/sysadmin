# Creating an SFTP shared project folder
### Key for examples in this document

 - Example project group/directory: Example-Project
 - Example external group/directory: Example-External-Group

##### Create project folder under /home/SFTP

`mkdir /home/SFTP/Example-Project`

##### Set default ACL for all directories you just created (command is recursive, so you only have to do it at the root)

```
setfacl -Rm d:user::rwx /home/SFTP/Example-Project
setfacl -Rm d:group::rx /home/SFTP/Example-Project
setfacl -Rm d:other::rx /home/SFTP/Example-Project
```

##### Create External users folder under project folder

`mkdir /home/SFTP/Example-Project/Example-External-Group`

##### Create a "Share" folder underneath this folder

`mkdir /home/SFTP/Example-Project/Example-External-Group/Share`

##### Assign open permissions the "Share" folder

`chmod 777 /home/SFTP/Example-Project/Example-External-Group/Share`

##### Create groups with the same names as the directories

```
groupadd Example-Project
groupadd Example-External-Group
```

##### Change directory group (do not change owner from root - it will break CHROOT)

```
chgrp Example-Project /home/SFTP/Example-Project
chgrp Example-External-Group /home/SFTP/Example-Project/Example-External-Group
```

##### Edit SSH config file

`vim /etc/ssh/sshd_config`

##### Add new match group options to end of file:

```
Match Group Example-Project
	ChrootDirectory /home/SFTP/Example-Project
	ForceCommand internal-sftp
	AllowTcpForwarding no

Match Group Example-External-Group
	ChrootDirectory /home/SFTP/Example-Project/Example-External-Group
	ForceCommand internal-sftp
	AllowTcpForwarding no
```

##### Restart SSHD

`systemctl restart sshd`

##### Verify it is running properly after changes

`systemctl status sshd`

##### Create new user creation script:

```
cd /bin/scripts
cp Project-Template.sh Example-Project.sh
```

##### Edit file contents to point to proper directories and place new users in correct groups.

 Run bash script to create Project and External users
