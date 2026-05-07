#!/bin/bash
if curl -s http://localhost:8080 | grep -q "Hello from Backend Server"; then
  echo "Backend server berjalan dengan benar!"
  exit 0
else
  echo "Backend server belum jalan. Coba ulang step 1.2"
  exit 1
fi
