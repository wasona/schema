#!/bin/bash
rm -rf ./zod
env $(xargs < .env) pgzod --pghost 127.0.0.1 --pgport 5432 --schema v1 --output=./zod
