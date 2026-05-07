# Step 1 — Koneksi Pertama via Password

> Semua perintah di step ini dijalankan dari node **client**.

## 1.1 Cek IP Address Server

Pertama, kita perlu tau IP address node **server**. Jalankan di node **client**:

```bash
# Lihat IP dari /etc/hosts yang sudah di-setup Killercoda
cat /etc/hosts | grep server
```

Atau langsung pakai hostname yang sudah tersedia:
```bash
ping -c 2 server
```

Catat IP address node server — kita akan pakai ini.

## 1.2 Setup Password di Node Server

Buka terminal node **server**, lalu set password untuk user root:

```bash
# Jalankan di node: server
echo "root:devops123" | chpasswd
```

Aktifkan password authentication di SSH server:

```bash
# Jalankan di node: server
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart ssh
```

## 1.3 SSH dengan Password dari Client

Kembali ke terminal node **client**, lalu SSH ke server:

```bash
# Jalankan di node: client
ssh root@server
```

Ketika muncul prompt:
```
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```
Ketik `yes` lalu tekan Enter.

Masukkan password: `devops123`

## 1.4 Eksplor Remote Server

Sekarang kamu sudah berada di dalam node **server** lewat SSH!

```bash
# Kamu sekarang di dalam server — coba perintah ini:
hostname
whoami
uname -a
```

Perhatikan prompt berubah — nama hostname menunjukkan kamu sedang di **server**.

## 1.5 Keluar dari SSH

```bash
exit
```

Prompt kembali ke **client**. Itulah SSH dengan password — fungsional, tapi ada masalahnya...

> **Masalah password auth:** Setiap login harus ketik password. Di automasi (CI/CD, scripts), ini tidak praktis — dan password bisa di-brute force. Solusinya? **Key-based authentication** — yang kita pelajari di step berikutnya!
