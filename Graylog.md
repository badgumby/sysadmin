# Graylog

### SSL/TLS cert issues

Copy the java cacerts to graylog directory

`sudo cp -a /usr/lib/jvm/jre-1.8.0-openjdk/lib/security/cacerts /etc/graylog/server/certs/cacerts.jks`

Import cert and trust it (default store password is: changeit)

`sudo keytool -importcert -keystore /etc/graylog/server/certs/cacerts.jks -storepass changeit -alias server.dns.name -file /etc/graylog/server/certs/certname.crt`

After doing the above, update the `-Djavax.net.ssl.trustStore` argument on `GRAYLOG_SERVER_JAVA_OPTS` line in the `/etc/sysconfig/graylog-server` file

```
# Path to the java executable.
JAVA=/usr/bin/java

# Default Java options for heap and garbage collection.
GRAYLOG_SERVER_JAVA_OPTS="-Xms1g -Xmx1g -XX:NewRatio=1 -server -XX:+ResizeTLAB -XX:+UseConcMarkSweepGC -XX:+CMSConcurrentMTEnabled -XX:+CMSClassUnloadingEnabled -XX:+UseParNewGC -XX:-OmitStackTraceInFastThrow -Djavax.net.ssl.trustStore=/etc/graylog/server/certs/cacerts.jks"

# Pass some extra args to graylog-server. (i.e. "-d" to enable debug mode)
GRAYLOG_SERVER_ARGS=""

# Program that will be used to wrap the graylog-server command. Useful to
# support programs like authbind.
GRAYLOG_COMMAND_WRAPPER=""
```

Now restart Graylog
