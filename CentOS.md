# CentOS

### Package conflict in yum

Example: `grub2-tools gives a conflict when attempting to update`

> Output:

```
Error: Package: 1:grub2-tools-2.02-0.64.el7.centos.x86_64 (@anaconda)
           Requires: grub2-common = 1:2.02-0.64.el7.centos
           Installed: 1:grub2-common-2.02-0.76.el7.centos.1.noarch (@centos-7-base)
               grub2-common = 1:2.02-0.76.el7.centos.1
           Available: 1:grub2-common-2.02-0.64.el7.centos.noarch (centos-7-base)
               grub2-common = 1:2.02-0.64.el7.centos
           Available: 1:grub2-common-2.02-0.65.el7.centos.2.noarch (centos-7-base)
               grub2-common = 1:2.02-0.65.el7.centos.2
           Available: 1:grub2-common-2.02-0.76.el7.centos.noarch (base)
               grub2-common = 1:2.02-0.76.el7.centos
 You could try using --skip-broken to work around the problem
```

Find conflict RPM package

`sudo rpm -qa 'grub2*'`

Output:

```
grub2-pc-2.02-0.76.el7.centos.1.x86_64
grub2-pc-modules-2.02-0.76.el7.centos.1.noarch
grub2-tools-minimal-2.02-0.76.el7.centos.1.x86_64
grub2-tools-extra-2.02-0.76.el7.centos.1.x86_64
grub2-2.02-0.76.el7.centos.1.x86_64
grub2-common-2.02-0.76.el7.centos.1.noarch
grub2-tools-2.02-0.64.el7.centos.x86_64
```

Remove the offending package manually, without touching the dependencies

`sudo rpm -e --nodeps --justdb grub2-tools`

Manually reinstall from repo

`sudo yum install grub2-tools`

It should have successfully installed the package
