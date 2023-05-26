#!/bin/sh
cat catalogdb.sql | docker exec -i  stac-db psql -U stacuser -d catalogdb
