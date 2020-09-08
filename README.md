
https://github.com/tansong0091/httpd-oidc

This is apache2.4 with open id module. you can use it as a reverse-proxy with open id authentication.

Example:

1. generate a container
>docker run -d --name proxy_apache tansong0091/httpd-oidc:0.1

2. copy configure files and others on your local host
>docker cp proxy_apache:/usr/local/apache2/conf ./
>docker cp proxy_apache:/usr/local/apache2/htdocs ./
>docker cp proxy_apache:/usr/local/apache2/logs ./

3. stop container and delete it
>docker stop proxy_apache
>docker rm proxy_apache

4. create a new container with volume on host
>docker run -d --name proxy_apache -p 10090:80 --restart=always -v /data/docker/appdata/proxy_apache/conf:/usr/local/apache2/conf -v /data/docker/appdata/proxy_apache/logs:/usr/local/apache2/logs -v /data/docker/appdata/proxy_apache/htdocs:/usr/local/apache2/htdocs tansong0091/httpd-oidc:0.1

5. uncomment following to enable open id in httpd.conf
#Include conf/oidc.conf

6. change following openid parameters in  oidc.conf

>OIDCProviderMetadataURL https://example.com/fss/.well-known/openid-configuration
>
>#for stage
>#OIDCProviderMetadataURL https://fssfed.stage.ge.com/fss/.well-known/openid-configuration
>
>#Client ID. Obtain from example.com/*oidc
>OIDCClientID your_client_id
>
>#Client secret. Must keep secret. Obtain from example.com/*oidc
>OIDCClientSecret  your_client_id_secret
>
>#Redirect URI. Empty location where mod_auth_openidc can accept tokens from Ping.
>#IMPORTANT: must be inside of "protected resource" path above.
>#IMPORTANT: must be registered exactly with Ping. To change, please visit example.com/*oidc
>OIDCRedirectURI http://your_website_regesitered_in_clinet_center/redirect_uri
>
>OIDCCryptoPassphrase p23gfe0rd
>
>#variable where SSO is passed
>OIDCAuthNHeader SM_USER

