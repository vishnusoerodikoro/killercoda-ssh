# Step 1 — Setup: Buat User "sshserver"

Sebelum mulai, kita perlu menyiapkan environment lab.
Kita akan membuat user `sshserver` yang berperan sebagai **remote server** yang akan kita akses.

> Semua perintah di step ini dijalankan sebagai **root** (sudah login otomatis).

## 1.1 Buat User sshserver

```bash
useradd -m -s /bin/bash sshserver
echo "sshserver:devops123" | chpasswd
```

- `useradd -m` → buat user beserta home directory `/home/sshserver`
- `-s /bin/bash` → set default shell ke bash
- `echo "sshserver:devops123" | chpasswd` → set password `devops123`

## 1.2 Pastikan SSH Service Berjalan

```bash
systemctl status ssh
```

Jika belum jalan:
```bash
apt-get install -y openssh-server
systemctl start ssh
systemctl enable ssh
```

## 1.3 Aktifkan Password Authentication

```bash
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart ssh
```

## 1.4 Verifikasi Setup

```bash
# Pastikan user ada
id sshserver

# Pastikan SSH listen di port 22
ss -tlnp | grep :22
```

Output yang diharapkan:
```
uid=1000(sshserver) gid=1000(sshserver) groups=1000(sshserver)
LISTEN  0  128  0.0.0.0:22  ...
```

> Setup selesai! Sekarang kita punya "client" (root) dan "server" (sshserver) di satu mesin. SSH tetap berjalan nyata lewat localhost.
