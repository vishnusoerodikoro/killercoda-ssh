# SSH — Secure Remote Access

## Kenapa SSH Penting untuk DevOps?

Sebagai DevOps engineer, kamu **hampir tidak pernah** duduk di depan server secara fisik.
Semua pengelolaan server — deploy aplikasi, cek log, update config — dilakukan dari jarak jauh via **SSH**.

## SSH vs Telnet

Sebelum SSH, admin server pakai **Telnet**. Masalahnya?

```
Telnet: username=admin password=rahasia123  ← dikirim as plain text!
SSH:    ██████████████████████████████████  ← terenkripsi end-to-end
```

Siapapun yang "mendengarkan" jaringan bisa mencuri credential Telnet.
SSH mengenkripsi seluruh komunikasi — aman meskipun lewat jaringan publik.

## Setup Lab Ini

Lab ini mensimulasikan koneksi **client → server** menggunakan **2 user berbeda** di satu mesin:

```
┌─────────────────────────────────────┐
│           Ubuntu Node               │
│                                     │
│  root        ──SSH──►  sshserver    │
│  (kamu/client)  :22    (remote)     │
│                                     │
└─────────────────────────────────────┘
```

Meskipun di satu mesin, **SSH tetap berjalan nyata** — handshake, enkripsi, key authentication — semua proses yang sama persis dengan SSH ke server production.

## Yang Akan Dipelajari

| Step | Topik |
|------|-------|
| 1 | Setup user `sshserver` sebagai target |
| 2 | Koneksi pertama dengan password |
| 3 | Generate SSH key pair |
| 4 | Copy public key ke server |
| 5 | Login tanpa password (key-based auth) + bonus SSH config |

Durasi: ~30 menit
