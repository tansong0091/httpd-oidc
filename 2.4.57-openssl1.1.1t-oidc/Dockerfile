#FROM httpd:2.4.56
FROM tansong0091/httpd:2.4.57-openssl1.1.1t

RUN apt-get  update -y \
    && apt-get  install -y apt-utils

RUN apt-get  update -y\
    && DEBIAN_FRONTEND=noninteractive apt-get install -y procps vim --allow-unauthenticated ca-certificates libapache2-mod-auth-openidc \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone 

RUN apt-get remove -y openssl

COPY entrypoint.sh /entrypoint.sh
#COPY conf/oidc.conf /usr/local/apache2/conf/
#COPY conf/workers.properties /usr/local/apache2/conf/
#COPY conf/httpd.conf /usr/local/apache2/conf/
COPY mod_jk.so /usr/local/apache2/modules/mod_jk.so

RUN chmod 755 /entrypoint.sh


EXPOSE 80 443
ENTRYPOINT ["/entrypoint.sh"]

