# Linux (not specific to a distro)

### OpenSSL - Generate a CSR with Subject Alertnate Name (SAN)

> Issue the following command:

`openssl req -new -newkey rsa:2048 -nodes -keyout server.domain.com.key -out server.domain.com.csr -config csr-config.txt`

> csr-config.txt should have the following lines:

```
[req]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C=Country code
ST=State code
L=City name
O=Organization
CN=Domain.com

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = server.domain.com
DNS.2 = alias.domain.com
```

### Test send to a syslog server

Testing with `nmap-ncat`

`echo -n "Test message" | nc -4u -w1 <host/IP> <port>`

Testing with `logger`

`logger -n <host/IP> -P <port> "Testing again"`

### Shipping flat file logs via rsyslog

> Add to /etc/rsyslog.conf

```
$ModLoad imfile
$InputFileName /var/log/logfile
$InputFileTag log-tag
$InputFileStateFile log-state
$InputFileSeverity info
$InputFileFacility local3
$InputRunFileMonitor
local3.* @@syslog.domain.com:port
```

> Ignore writing local3 facility to /var/log/syslog by updating /etc/rsyslog.d/50-default.conf

`*.*;auth,authpriv.none,local3.none -/var/log/syslog`

> Extra: Ship all other active logs to syslog

`*.* @syslog.domain.com:port`
