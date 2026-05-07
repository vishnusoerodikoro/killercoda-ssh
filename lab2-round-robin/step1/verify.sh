#!/bin/bash
ALL_OK=true
for PORT in 8081 8082 8083; do
  if ! curl -s --connect-timeout 2 http://localhost:$PORT | grep -q "App-"; then
    echo "Backend di port $PORT belum jalan!"
    ALL_OK=false
  fi
done

if $ALL_OK; then
  echo "Semua 3 backend server berjalan!"
  exit 0
else
  exit 1
fi
