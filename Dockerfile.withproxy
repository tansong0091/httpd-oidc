FROM httpd:2.4
#COPY ./dist/ /usr/local/apache2/htdocs/dist
COPY ./test.html/ /usr/local/apache2/htdocs/dist/test.html
COPY conf/htaccess /usr/local/apache2/htdocs/.htaccess
COPY entrypoint.sh /entrypoint.sh
COPY conf/oidc.conf /usr/local/apache2/conf/
COPY conf/httpd.conf /usr/local/apache2/conf/
COPY libapache2-mod-auth-openidc_2.3.11-1.stretch+1_amd64.deb /user/local/libapache2-mod-auth-openidc_2.3.11-1.stretch+1_amd64.deb

RUN apt-get -o Acquire::http::proxy="http://PITC-Zscaler-Americas-Cincinnati3PR.proxy.corporate.ge.com:80/" update\
    && DEBIAN_FRONTEND=noninteractive apt-get  -o Acquire::http::proxy="http://PITC-Zscaler-Americas-Cincinnati3PR.proxy.corporate.ge.com:80/" install -y apt-utils --allow-unauthenticated libapache2-mod-auth-openidc=2.1.6-1 vim procps\
    && dpkg -i /user/local/libapache2-mod-auth-openidc_2.3.11-1.stretch+1_amd64.deb \
    && rm -rf /user/local/libapache2-mod-auth-openidc_2.3.11-1.stretch+1_amd64.deb \
    && DEBIAN_FRONTEND=noninteractive apt-get  -o Acquire::http::proxy="http://PITC-Zscaler-Americas-Cincinnati3PR.proxy.corporate.ge.com:80/" install -y apt-utils --allow-unauthenticated vim procps\
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone
RUN chmod 755 -R /usr/local/apache2/htdocs


EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
