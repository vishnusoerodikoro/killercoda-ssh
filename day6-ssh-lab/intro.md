# SSH — Secure Remote Access

## Kenapa SSH Penting untuk DevOps?

Sebagai DevOps engineer, kamu **hampir tidak pernah** duduk di depan server secara fisik.
Semua pengelolaan server — deploy aplikasi, cek log, update config — dilakukan dari jarak jauh via **SSH**.

## SSH vs Telnet

Sebelum SSH, admin server pakai **Telnet**. Masalahnya?

```
Telnet: username=admin password=rahasia123  ← dikirim as plain text!
SSH:    ██████████████████████████████████  ← terenkripsi
```

Siapapun yang "mendengarkan" jaringan bisa mencuri credential Telnet.
SSH mengenkripsi seluruh komunikasi — aman meskipun lewat jaringan publik.

## Arsitektur Lab Ini

```
┌─────────────┐         SSH          ┌─────────────┐
│   client    │ ──────────────────►  │   server    │
│  (kamu)     │     port 22          │  (remote)   │
└─────────────┘                      └─────────────┘
```

Kamu akan bekerja dari node **client** untuk mengakses node **server**.

## Yang Akan Dipelajari

| Step | Topik |
|------|-------|
| 1 | Koneksi pertama dengan password |
| 2 | Generate SSH key pair |
| 3 | Copy public key ke server |
| 4 | Login tanpa password (key-based auth) |
| 5 | SSH config file — shortcut alias |

Durasi: ~30 menit
