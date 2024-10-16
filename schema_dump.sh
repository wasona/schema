#!/bin/bash

rm schema.sql
pg_dump backend_db -U admin -h localhost --schema-only >> schema.sql
