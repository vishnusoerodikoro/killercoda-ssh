#!/bin/bash
# Cek user sshserver ada
if ! id sshserver &>/dev/null; then
  echo "User sshserver belum dibuat. Jalankan: useradd -m -s /bin/bash sshserver"
  exit 1
fi

# Cek SSH service aktif
if ! systemctl is-active ssh &>/dev/null; then
  echo "SSH service belum berjalan. Jalankan: systemctl start ssh"
  exit 1
fi

# Cek password auth aktif
if grep -q "PasswordAuthentication no" /etc/ssh/sshd_config; then
  echo "Password authentication masih disabled. Jalankan step 1.3"
  exit 1
fi

echo "Setup berhasil! User sshserver siap dan SSH service berjalan."
exit 0
