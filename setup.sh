#!/bin/bash

source ~/.bash_aliases && \
docker-compose down; \
docker-compose up -d && \
sleep 3s && \
sed -i 's|/config/nginx/proxy-confs/|/config/nginx/proxy-confs/sgdevlab.duckdns.org/|g' ./var/swag/nginx/site-confs/default && \
mkdir -p var/swag/nginx/proxy-confs/sgdevlab.duckdns.org/

cd etc/swag/_init/ && \
./init.sh && cd ../../../

docker restart devops_stack_swag_1
