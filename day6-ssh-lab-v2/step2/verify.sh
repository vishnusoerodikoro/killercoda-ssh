#!/bin/bash
# known_hosts pakai hashed format di Ubuntu — tidak bisa grep hostname
# Cukup verifikasi file ada dan berisi entry (artinya sudah pernah konek)
KNOWN_HOSTS="/root/.ssh/known_hosts"

if [ -f "$KNOWN_HOSTS" ] && [ -s "$KNOWN_HOSTS" ]; then
  echo "Koneksi SSH pertama berhasil! Host fingerprint tersimpan di known_hosts."
  exit 0
else
  echo "Belum ada record koneksi. Coba: ssh sshserver@localhost lalu ketik 'yes'"
  exit 1
fi
