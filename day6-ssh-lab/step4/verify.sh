#!/bin/bash
# Verify dari client: bisa SSH ke server tanpa password
RESULT=$(ssh -o BatchMode=yes \
             -o ConnectTimeout=5 \
             -o StrictHostKeyChecking=no \
             root@server "hostname" 2>/dev/null)

if echo "$RESULT" | grep -q "server"; then
  echo "Key-based authentication berhasil! Login ke server tanpa password."
  exit 0
else
  echo "Belum bisa SSH tanpa password. Pastikan step 3 sudah selesai dengan benar."
  exit 1
fi
