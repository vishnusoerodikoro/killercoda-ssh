#!/bin/bash
# Test key-based auth berhasil (tanpa password)
RESULT=$(ssh -o BatchMode=yes \
             -o ConnectTimeout=5 \
             -o StrictHostKeyChecking=no \
             sshserver@localhost "whoami" 2>/dev/null)

if [ "$RESULT" = "sshserver" ]; then
  echo "Key-based authentication berhasil! Login ke sshserver tanpa password."
  exit 0
else
  echo "Belum bisa SSH tanpa password. Pastikan step 4 sudah selesai dengan benar."
  exit 1
fi
