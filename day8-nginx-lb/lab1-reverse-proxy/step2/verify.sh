#!/bin/bash
if nginx -t 2>&1 | grep -q "syntax is ok"; then
  echo "NGINX config valid dan aktif!"
  exit 0
else
  echo "Ada error di NGINX config. Jalankan: nginx -t"
  exit 1
fi
