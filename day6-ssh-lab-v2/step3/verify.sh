#!/bin/bash
if [ -f /root/.ssh/id_ed25519 ] && [ -f /root/.ssh/id_ed25519.pub ]; then
  echo "SSH key pair berhasil dibuat!"
  echo "Public key: $(cut -c1-40 /root/.ssh/id_ed25519.pub)..."
  exit 0
else
  echo "Key pair belum ditemukan. Jalankan: ssh-keygen -t ed25519 -C devops-bootcamp"
  exit 1
fi
