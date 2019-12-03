# Ubuntu

### Import certificates using ca-certificates

Create a directory for these custom certificates

```
sudo mkdir /usr/share/ca-certificates/custom
```

Copy the `.crt` files to this directory (Must be `.crt` format and extension)

```
sudo cp jibba.crt /usr/share/ca-certificates/custom/jibba.crt
```

Use `ca-certificates` to interactively import/activate the new certificates

```
sudo dpkg-reconfigure ca-certificates
```

Non-interactively

```
sudo update-ca-certificates
```

If you need to import/activate a `.pem` file, convert it to `.crt`

```
openssl x509 -in jabba.pem -inform PEM -out jabba.crt
```
