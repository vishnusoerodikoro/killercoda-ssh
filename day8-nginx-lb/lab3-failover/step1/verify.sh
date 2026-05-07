#!/bin/bash
# Pastikan port 8082 sudah mati
if curl -s --connect-timeout 1 http://localhost:8082 > /dev/null 2>&1; then
  echo "App-2 masih jalan. Jalankan: kill \$(lsof -t -i:8082)"
  exit 1
fi

# Pastikan NGINX masih melayani request
if curl -s http://localhost | grep -q "App-"; then
  echo "App-2 down, tapi service tetap up! Failover bekerja."
  exit 0
else
  echo "NGINX tidak merespon. Cek: systemctl status nginx"
  exit 1
fi
