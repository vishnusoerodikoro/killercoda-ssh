# Step 2 — Koneksi Pertama via Password

> Jalankan sebagai **root** (simulasi "client").

## 2.1 SSH ke User sshserver

```bash
ssh sshserver@localhost
```

Pertama kali konek, SSH akan menampilkan:
```
The authenticity of host 'localhost (127.0.0.1)' can't be established.
ED25519 key fingerprint is SHA256:xxxxxxxxxxxx...
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

Ketik `yes` lalu tekan Enter. Ini adalah **host key verification** — SSH menyimpan fingerprint server agar bisa deteksi jika server berganti di masa depan (proteksi dari man-in-the-middle attack).

Masukkan password: `devops123`

## 2.2 Kamu Sekarang di "Server"

```bash
whoami
hostname
pwd
```

Output:
```
sshserver
ubuntu
/home/sshserver
```

Perhatikan prompt berubah dari `root@ubuntu` menjadi `sshserver@ubuntu` — kamu sudah "masuk" ke user yang berbeda via SSH.

## 2.3 Keluar dari SSH

```bash
exit
```

Prompt kembali ke `root@ubuntu`.

## 2.4 Jalankan Command Remote Tanpa Masuk Shell

SSH bisa eksekusi command langsung tanpa perlu masuk ke shell:

```bash
ssh sshserver@localhost "whoami && hostname && date"
```

Masukkan password lagi: `devops123`

> **Masalah password auth:** Setiap koneksi harus ketik password. Di automasi (CI/CD, scripts), ini tidak praktis — dan rentan brute force. Solusinya? **Key-based authentication** di step berikutnya!
