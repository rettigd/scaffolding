#!/usr/bin/env bash

# Bail out on first error
set -e

cat /app/quasar.conf.js | \
awk '/devServer: \{/{f=1} f && !c && /open: true/{c++; $0="      open: false"} 1' | \
awk '/devServer: \{/{f=1} f && !c && /port: 8080/{c++; $0="      port: parseInt(process.env.QUASAR_PORT),"} 1' > /app/quasar.conf.new
mv /app/quasar.conf.new /app/quasar.conf.js