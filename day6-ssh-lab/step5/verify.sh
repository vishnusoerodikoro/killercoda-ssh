#!/bin/bash
# Verify: config file ada, permission benar, dan alias bisa dipakai
CONFIG="$HOME/.ssh/config"

if [ ! -f "$CONFIG" ]; then
  echo "File ~/.ssh/config belum ada. Jalankan step 5.1 dulu."
  exit 1
fi

PERM=$(stat -c "%a" "$CONFIG")
if [ "$PERM" != "600" ]; then
  echo "Permission config salah: $PERM (harus 600). Jalankan: chmod 600 ~/.ssh/config"
  exit 1
fi

if ! grep -q "Host myserver" "$CONFIG"; then
  echo "Config 'myserver' belum ditemukan. Pastikan isi file config sudah benar."
  exit 1
fi

# Test koneksi via alias
RESULT=$(ssh -o BatchMode=yes -o ConnectTimeout=5 myserver "hostname" 2>/dev/null)
if echo "$RESULT" | grep -q "server"; then
  echo "SSH config berjalan! Alias 'myserver' berhasil terhubung ke server."
  exit 0
else
  echo "Alias myserver belum bisa digunakan. Cek isi ~/.ssh/config"
  exit 1
fi
