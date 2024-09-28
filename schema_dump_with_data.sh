#!/bin/bash

pg_dump backend_db -U admin -h localhost >> data_dump.sql
