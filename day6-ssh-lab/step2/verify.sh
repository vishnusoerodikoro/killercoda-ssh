#!/bin/bash
# Verify dari client: pastikan key pair sudah ada
if [ -f ~/.ssh/id_ed25519 ] && [ -f ~/.ssh/id_ed25519.pub ]; then
  echo "SSH key pair berhasil dibuat!"
  echo "Public key: $(cat ~/.ssh/id_ed25519.pub | cut -c1-40)..."
  exit 0
else
  echo "Key pair belum ditemukan. Jalankan ssh-keygen di node client."
  exit 1
fi
