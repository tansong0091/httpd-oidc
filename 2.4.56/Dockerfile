FROM httpd:2.4.56

RUN apt-get  update -y \
    && apt-get  install -y apt-utils

RUN apt-get  update -y\
    && DEBIAN_FRONTEND=noninteractive apt-get install -y procps vim --allow-unauthenticated ca-certificates libapache2-mod-auth-openidc \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone 

COPY entrypoint.sh /entrypoint.sh
#COPY conf/oidc.conf /usr/local/apache2/conf/
#COPY conf/workers.properties /usr/local/apache2/conf/
#COPY conf/httpd.conf /usr/local/apache2/conf/
COPY mod_jk.so /usr/local/apache2/modules/mod_jk.so

RUN chmod 755 /entrypoint.sh


EXPOSE 80 
ENTRYPOINT ["/entrypoint.sh"]

