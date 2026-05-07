# Step 4 — Copy Public Key ke "Server"

> Jalankan sebagai **root** (simulasi "client").

## Konsep: authorized_keys

Server menyimpan daftar public key yang diizinkan masuk di file:
```
~/.ssh/authorized_keys
```

Setiap baris = satu public key yang boleh login. Kita perlu menaruh public key milik `root` ke dalam file tersebut di home directory `sshserver`.

## 4.1 Cara Otomatis: ssh-copy-id

```bash
ssh-copy-id sshserver@localhost
```

Masukkan password: `devops123`

Output sukses:
```
Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'sshserver@localhost'"
and check to make sure that only the key(s) you wanted were added.
```

## 4.2 Verifikasi: Lihat authorized_keys di Sisi Server

```bash
cat /home/sshserver/.ssh/authorized_keys
```

Public key dari root sudah terdaftar di sana!

## 4.3 Cek Permission — Ini Kritis!

SSH sangat ketat soal permission file. Jika permission salah, SSH **diam-diam mengabaikan** key auth tanpa error yang jelas.

```bash
ls -la /home/sshserver/.ssh/
```

Permission yang benar:

| Path | Permission | Kenapa |
|------|-----------|--------|
| `/home/sshserver/.ssh/` | `700` (drwx------) | Hanya owner yang boleh akses |
| `/home/sshserver/.ssh/authorized_keys` | `600` (-rw-------) | Hanya owner yang boleh baca/tulis |

Jika ada yang salah, perbaiki:
```bash
chmod 700 /home/sshserver/.ssh
chmod 600 /home/sshserver/.ssh/authorized_keys
chown -R sshserver:sshserver /home/sshserver/.ssh
```

> **Tips troubleshooting:** Jika key auth tidak jalan padahal setup benar, selalu cek permission dulu. Ini penyebab #1 SSH key auth gagal!
