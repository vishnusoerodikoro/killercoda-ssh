#!/bin/bash
AUTH_KEYS="/home/sshserver/.ssh/authorized_keys"

if [ ! -f "$AUTH_KEYS" ]; then
  echo "File authorized_keys belum ada. Jalankan: ssh-copy-id sshserver@localhost"
  exit 1
fi

# Cek permission .ssh dir
DIR_PERM=$(stat -c "%a" /home/sshserver/.ssh)
if [ "$DIR_PERM" != "700" ]; then
  echo "Permission .ssh salah: $DIR_PERM (harus 700). Jalankan: chmod 700 /home/sshserver/.ssh"
  exit 1
fi

# Cek permission authorized_keys
KEY_PERM=$(stat -c "%a" "$AUTH_KEYS")
if [ "$KEY_PERM" != "600" ]; then
  echo "Permission authorized_keys salah: $KEY_PERM (harus 600). Jalankan: chmod 600 $AUTH_KEYS"
  exit 1
fi

COUNT=$(wc -l < "$AUTH_KEYS")
echo "Public key terdaftar di server! ($COUNT key, permission OK)"
exit 0
