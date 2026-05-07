#!/bin/bash
# Verify dari sisi server: pastikan SSH service jalan dan password auth aktif
if systemctl is-active ssh | grep -q "active"; then
  if grep -q "PasswordAuthentication yes" /etc/ssh/sshd_config; then
    echo "SSH server siap dengan password authentication!"
    exit 0
  fi
fi
echo "SSH server belum dikonfigurasi dengan benar. Jalankan ulang step 1.2 di node server."
exit 1
