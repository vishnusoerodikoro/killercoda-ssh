# Step 3 — Copy Public Key ke Server

> Jalankan dari node **client**.

## Konsep: authorized_keys

Server menyimpan daftar public key yang diizinkan masuk di file:
```
~/.ssh/authorized_keys
```

Setiap baris = satu public key yang boleh login. Kita perlu menaruh public key kita di sana.

## 3.1 Cara Otomatis: ssh-copy-id

Cara paling mudah — `ssh-copy-id` otomatis menyalin public key ke server:

```bash
# Jalankan di node: client
ssh-copy-id root@server
```

Masukkan password server saat diminta: `devops123`

Output sukses:
```
Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'root@server'"
```

## 3.2 Verifikasi di Server

Buka terminal node **server**, cek isi `authorized_keys`:

```bash
# Jalankan di node: server
cat ~/.ssh/authorized_keys
```

Kamu akan melihat public key dari client sudah terdaftar di sana!

## 3.3 Cek Permission File (Penting!)

SSH sangat ketat soal permission. Jika permission salah, SSH akan menolak key auth.

```bash
# Jalankan di node: server
ls -la ~/.ssh/
```

Permission yang benar:
```
drwx------  .ssh/              → harus 700
-rw-------  authorized_keys    → harus 600
```

Jika ada yang salah, perbaiki dengan:
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

> **Kenapa permission penting?** SSH sengaja paranoid — jika file bisa dibaca orang lain, berarti server tidak aman dan SSH akan ignore key tersebut.
