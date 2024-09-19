#!/bin/bash

pg_dump backend_db -U admin -h localhost --schema-only
