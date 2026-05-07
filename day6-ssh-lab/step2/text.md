# Step 2 — Generate SSH Key Pair

> Semua perintah di step ini dijalankan dari node **client**.

## Konsep: Public & Private Key

Bayangkan sistem kunci gembok:

```
Private Key  =  Kunci fisik (RAHASIA, jangan pernah dibagi!)
Public Key   =  Gembok (boleh dipasang di server mana saja)
```

Cara kerjanya:
1. Kamu punya **private key** di laptop/client
2. **Public key** dipasang di server
3. Saat login, SSH membuktikan kamu punya private key yang cocok — tanpa kirim password!

## 2.1 Generate Key Pair

```bash
# Jalankan di node: client
ssh-keygen -t ed25519 -C "devops-bootcamp"
```

Penjelasan flag:
- `-t ed25519` → algoritma enkripsi modern (lebih baik dari RSA untuk use case ini)
- `-C "devops-bootcamp"` → comment/label untuk identifikasi key

Ketika muncul prompt, tekan **Enter** saja untuk semua (gunakan default path, tanpa passphrase):

```
Enter file in which to save the key (/root/.ssh/id_ed25519): [Enter]
Enter passphrase (empty for no passphrase): [Enter]
Enter same passphrase again: [Enter]
```

## 2.2 Lihat Key yang Dihasilkan

```bash
ls -la ~/.ssh/
```

Kamu akan lihat 2 file baru:
```
id_ed25519      ← PRIVATE KEY — jangan pernah dibagi!
id_ed25519.pub  ← Public key — boleh dipasang di server
```

## 2.3 Lihat Isi Public Key

```bash
cat ~/.ssh/id_ed25519.pub
```

Output-nya kira-kira seperti ini:
```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAA... devops-bootcamp
```

Inilah yang nanti akan kita taruh di server.

## 2.4 Lihat Isi Private Key (jangan dishare!)

```bash
cat ~/.ssh/id_ed25519
```

```
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXkAAAA...
-----END OPENSSH PRIVATE KEY-----
```

> Private key ini seperti password master kamu. Jika bocor, siapapun bisa masuk ke semua server yang punya public key kamu!
