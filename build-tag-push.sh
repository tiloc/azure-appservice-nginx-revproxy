#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Specify a single argument with the version"
    exit -1
fi
docker build . --tag azure-appservice-nginx-revproxy:$1
docker tag azure-appservice-nginx-revproxy:$1 cmtbmregistry.azurecr.io/azure-appservice-nginx-revproxy:latest
docker push cmtbmregistry.azurecr.io/azure-appservice-nginx-revproxy:latest
