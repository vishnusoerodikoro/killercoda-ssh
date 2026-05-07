#!/bin/bash
if curl -s --connect-timeout 2 http://localhost:8082 | grep -q "App-2"; then
  echo "App-2 recovered! System kembali ke full capacity dengan 3 backend."
  exit 0
else
  echo "App-2 belum recovered. Jalankan step recovery di atas."
  exit 1
fi
