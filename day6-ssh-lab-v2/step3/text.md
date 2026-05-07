# Step 3 — Generate SSH Key Pair

> Jalankan sebagai **root** (simulasi "client").

## Konsep: Public & Private Key

Bayangkan sistem kunci gembok:

```
Private Key  =  Kunci fisik  → RAHASIA, hanya ada di client
Public Key   =  Gembok       → Dipasang di server, boleh dibagi
```

Cara kerjanya saat login:
1. Server challenge: *"Buktikan kamu punya private key yang cocok dengan gembok ini!"*
2. Client jawab dengan tanda tangan kriptografis menggunakan private key
3. Server verifikasi → akses diberikan **tanpa kirim password sama sekali**

## 3.1 Generate Key Pair

```bash
ssh-keygen -t ed25519 -C "devops-bootcamp"
```

Penjelasan flag:
- `-t ed25519` → algoritma enkripsi modern (lebih cepat dan aman dari RSA)
- `-C "devops-bootcamp"` → comment/label untuk identifikasi key

Tekan **Enter** untuk semua prompt (gunakan path default, tanpa passphrase):

```
Enter file in which to save the key (/root/.ssh/id_ed25519): [Enter]
Enter passphrase (empty for no passphrase): [Enter]
Enter same passphrase again: [Enter]
```

## 3.2 Lihat Key yang Dihasilkan

```bash
ls -la /root/.ssh/
```

Dua file baru:
```
-rw-------  id_ed25519      ← PRIVATE KEY — jangan pernah dishare!
-rw-r--r--  id_ed25519.pub  ← Public key — aman untuk disebarkan
```

## 3.3 Lihat Isi Public Key

```bash
cat /root/.ssh/id_ed25519.pub
```

Output:
```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAA... devops-bootcamp
```

Inilah yang akan kita pasang di "server" (user sshserver).

## 3.4 Bandingkan dengan Private Key

```bash
cat /root/.ssh/id_ed25519
```

```
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXkAAAA...
-----END OPENSSH PRIVATE KEY-----
```

> Private key ini seperti master password. Jika bocor, siapapun bisa masuk ke semua server yang punya public key kamu. Jangan pernah commit ke Git!
