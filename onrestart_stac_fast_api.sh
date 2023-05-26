#!/bin/sh
cd /var/www/stac-fastapi
docker-compose -f docker-compose-io.yml  up -d app-pgstac 
