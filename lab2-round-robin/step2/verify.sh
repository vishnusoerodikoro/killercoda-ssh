#!/bin/bash
if nginx -t 2>&1 | grep -q "syntax is ok" && systemctl is-active nginx | grep -q "active"; then
  echo "NGINX upstream config aktif!"
  exit 0
fi
echo "Cek config NGINX: nginx -t"
exit 1
