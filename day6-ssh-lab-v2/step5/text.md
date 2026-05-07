# Step 5 — Login Tanpa Password + SSH Config

> Jalankan sebagai **root** (simulasi "client").

## 5.1 Login Tanpa Password — Buktikan!

```bash
ssh sshserver@localhost
```

Kali ini... **tidak ada prompt password!** Langsung masuk.

```bash
whoami
# Output: sshserver
```

Keluar:
```bash
exit
```

## 5.2 Jalankan Command Remote Tanpa Masuk Shell

Sekarang tanpa password pun bisa:

```bash
ssh sshserver@localhost "whoami && uptime && df -h /"
```

Inilah yang dipakai CI/CD pipeline untuk deploy otomatis ke server — tidak ada interaksi manual sama sekali.

## 5.3 Transfer File via SCP

SSH juga bisa dipakai untuk transfer file aman:

```bash
# Buat file di client (root)
echo "File dari client - $(date)" > /tmp/deploy-package.txt

# Kirim ke server (sshserver)
scp /tmp/deploy-package.txt sshserver@localhost:/tmp/

# Verifikasi file sampai
ssh sshserver@localhost "cat /tmp/deploy-package.txt"
```

## 5.4 Disable Password Auth (Best Practice Production)

Setelah key-based auth jalan, matikan password auth:

```bash
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart ssh
```

Test — login dengan password sekarang **ditolak**:
```bash
ssh -o PasswordAuthentication=yes -o PubkeyAuthentication=no sshserver@localhost
# Output: Permission denied (publickey)
```

Tapi key tetap bisa:
```bash
ssh sshserver@localhost
# Masuk tanpa masalah!
```

---

## BONUS: SSH Config File

Capek ketik `sshserver@localhost` setiap saat? Buat alias:

```bash
cat > /root/.ssh/config << 'EOF'
Host myserver
    HostName localhost
    User sshserver
    IdentityFile /root/.ssh/id_ed25519

Host *
    ServerAliveInterval 60
    ServerAliveCountMax 3
EOF

chmod 600 /root/.ssh/config
```

Sekarang cukup:
```bash
ssh myserver
```

Bukan lagi `ssh sshserver@localhost` — berguna banget kalau punya banyak server dengan IP panjang!
