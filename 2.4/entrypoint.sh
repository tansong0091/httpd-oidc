#!/bin/sh
/usr/local/apache2/bin/httpd -f /usr/local/apache2/conf/httpd.conf -k start
tail -f /dev/null
