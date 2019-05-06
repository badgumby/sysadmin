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
