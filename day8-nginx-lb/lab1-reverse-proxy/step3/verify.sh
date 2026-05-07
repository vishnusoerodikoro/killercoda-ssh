#!/bin/bash
RESPONSE=$(curl -s http://localhost)

if echo "$RESPONSE" | grep -q "DevOps Bootcamp"; then
  echo "Reverse proxy berjalan! Request dari port 80 berhasil diteruskan ke port 8080."
  exit 0
else
  echo "Reverse proxy belum bekerja. Cek: systemctl status nginx"
  exit 1
fi
