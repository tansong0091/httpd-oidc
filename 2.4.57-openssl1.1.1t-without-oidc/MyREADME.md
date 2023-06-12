this is based on httpd offical image and replease openssl 1.1.1n with 1.1.1t.
openssl 1.1.1n is manually deleted.
1.1.1t is install from source code.
apache httpd is compiled with openssl 1.1.1t. so the httpd will use module ssl with openssl 1.1.1t

there is 1.1.1n config file left you can use following command to remove it

root@corpdtshwebstg:/usr/local/apache2# dpkg --list|grep openssl
rc  openssl                       1.1.1n-0+deb11u4               amd64        Secure Sockets Layer toolkit - cryptographic utility
root@corpdtshwebstg:/usr/local/apache2# dpkg -r openssl
dpkg: warning: ignoring request to remove openssl, only the config
 files of which are on the system; use --purge to remove them too
root@corpdtshwebstg:/usr/local/apache2# dpkg --purge openssl
(Reading database ... 11295 files and directories currently installed.)
Purging configuration files for openssl (1.1.1n-0+deb11u4) ...
dpkg: warning: while removing openssl, directory '/etc/ssl/certs' not empty so not removed
root@corpdtshwebstg:/usr/local/apache2# openssl
OpenSSL> version
OpenSSL 1.1.1t  7 Feb 2023
OpenSSL>

