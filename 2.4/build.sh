#!/bin/bash
dockerfile_path=$PWD/Dockerfile
version=$1

echo Building ${APPLICATION_NAME} ${application_version}.
#  build the application and then execute container build
docker build \
    --file ${dockerfile_path} \
    --tag httpd-oidc:${version} \
    .
docker tag httpd-oidc:${version} tansong0091/httpd-oidc:${version}
docker push tansong0091/httpd-oidc:${version}
