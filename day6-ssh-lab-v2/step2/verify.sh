#!/bin/bash
# Cek known_hosts sudah ada (artinya pernah konek dan accept fingerprint)
if [ -f /root/.ssh/known_hosts ] && grep -q "localhost" /root/.ssh/known_hosts; then
  echo "Koneksi SSH pertama berhasil! Host fingerprint tersimpan di known_hosts."
  exit 0
else
  echo "Belum ada record koneksi ke localhost. Coba SSH dulu: ssh sshserver@localhost"
  exit 1
fi
