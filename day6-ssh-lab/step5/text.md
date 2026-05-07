# Step 5 — SSH Config File (Bonus)

> Jalankan dari node **client**.

## Masalah: Command SSH Terlalu Panjang

Di dunia nyata, kamu mungkin punya banyak server dengan IP berbeda-beda:

```bash
ssh -i ~/.ssh/id_ed25519 -p 2222 deploy@192.168.10.45
ssh -i ~/.ssh/id_rsa     -p 22   admin@10.0.0.123
ssh -i ~/.ssh/id_ed25519 -p 22   root@172.16.5.10
```

Capek ketik panjang-panjang setiap hari? Ada solusinya — **SSH Config File**.

## 5.1 Buat SSH Config

```bash
# Jalankan di node: client
cat > ~/.ssh/config << 'EOF'
# Server utama lab
Host myserver
    HostName server
    User root
    IdentityFile ~/.ssh/id_ed25519

# Contoh server production (placeholder)
Host prod-app
    HostName 10.0.0.1
    User deploy
    Port 2222
    IdentityFile ~/.ssh/id_ed25519

# Contoh server database (placeholder)
Host prod-db
    HostName 10.0.0.2
    User dbadmin
    IdentityFile ~/.ssh/id_ed25519
EOF
```

Atur permission:
```bash
chmod 600 ~/.ssh/config
```

## 5.2 Test — Login Pakai Alias

Sekarang cukup ketik:
```bash
ssh myserver
```

Bukan lagi:
```bash
ssh root@server
```

Hasilnya sama — tapi jauh lebih singkat!

## 5.3 Jalankan Command Remote via Alias

```bash
ssh myserver "uptime && free -h"
```

## 5.4 Wildcard Config (Pro Tip)

Bisa set default untuk semua host:

```bash
cat >> ~/.ssh/config << 'EOF'

# Default untuk semua host
Host *
    ServerAliveInterval 60
    ServerAliveCountMax 3
    StrictHostKeyChecking accept-new
EOF
```

| Setting | Fungsi |
|---------|--------|
| `ServerAliveInterval 60` | Kirim keepalive setiap 60 detik — cegah koneksi timeout |
| `ServerAliveCountMax 3` | Disconnect setelah 3x keepalive tidak direspons |
| `StrictHostKeyChecking accept-new` | Auto-accept host baru, tapi tolak jika key berubah |

> `StrictHostKeyChecking accept-new` berguna untuk automasi — tidak perlu ketik "yes" manual, tapi tetap proteksi dari host spoofing.
