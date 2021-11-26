FROM httpd:2.4.51

RUN apt-get  update -y \
    && apt-get  install -y apt-utils

RUN apt-get  update -y\
    && DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server procps vim --allow-unauthenticated ca-certificates libapache2-mod-auth-openidc \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /var/run/sshd \
    # SSH login fix. Otherwise user is kicked off after login
    && sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

COPY entrypoint.sh /entrypoint.sh
#COPY conf/oidc.conf /usr/local/apache2/conf/
#COPY conf/workers.properties /usr/local/apache2/conf/
#COPY conf/httpd.conf /usr/local/apache2/conf/
COPY mod_jk.so /usr/local/apache2/modules/mod_jk.so
COPY conf/sshd_config /etc/ssh/sshd_config

RUN chmod 755 /entrypoint.sh


EXPOSE 80 22
ENTRYPOINT ["/entrypoint.sh"]

