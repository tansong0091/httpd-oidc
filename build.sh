#!/bin/bash
dockerfile_path=$PWD/Dockerfile

echo Building ${APPLICATION_NAME} ${application_version}.
#  build the application and then execute container build
docker build \
    --file ${dockerfile_path} \
    --tag proxy-apache:0.1 \
    .
docker tag httpd-oidc:0.1 tansong0091/httpd-oidc:0.1
docker tag httpd-oidc:0.1 corpdtshdbstg.corporate.ge.com/httpd-oidc:0.1
docker push corpdtshdbstg.corporate.ge.com/httpd-oidc:0.1
