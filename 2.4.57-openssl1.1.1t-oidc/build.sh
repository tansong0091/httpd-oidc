#!/bin/bash

application_path=.
application_name=httpd-oidc
application_version=$1
dockerfile_path=$PWD/Dockerfile
#AWSENV=stage
Myaccount=tansong0091

# validation
if [ -z "$application_version" ]; then
    echo 'A version is requried.  Execute as build.sh <version>'
    exit 1
fi

echo Building ${application_name} ${application_version}.
#  build the application and then execute container build
docker build \
    --build-arg app_version=${application_version} \
    --build-arg HTTP_PROXY=${http_proxy} \
    --build-arg HTTPS_PROXY=${https_proxy} \
    --file ${dockerfile_path} \
    --tag ${Myaccount}/${application_name}:${application_version} \
    --tag ${Myaccount}/${application_name}:latest \
    ${application_path}

#docker push ${Myaccount}/${application_name}:${application_version}
#docker push ${Myaccount}/${application_name}:latest
