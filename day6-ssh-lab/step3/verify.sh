#!/bin/bash
# Verify di server: authorized_keys ada dan permission benar
SSH_DIR="$HOME/.ssh"
AUTH_KEYS="$SSH_DIR/authorized_keys"

if [ ! -f "$AUTH_KEYS" ]; then
  echo "File authorized_keys belum ada di server. Jalankan ssh-copy-id dari client."
  exit 1
fi

DIR_PERM=$(stat -c "%a" "$SSH_DIR")
KEY_PERM=$(stat -c "%a" "$AUTH_KEYS")

if [ "$DIR_PERM" != "700" ]; then
  echo "Permission .ssh salah: $DIR_PERM (harus 700). Jalankan: chmod 700 ~/.ssh"
  exit 1
fi

if [ "$KEY_PERM" != "600" ]; then
  echo "Permission authorized_keys salah: $KEY_PERM (harus 600). Jalankan: chmod 600 ~/.ssh/authorized_keys"
  exit 1
fi

COUNT=$(wc -l < "$AUTH_KEYS")
echo "Public key terdaftar di server! ($COUNT key ditemukan, permission OK)"
exit 0
