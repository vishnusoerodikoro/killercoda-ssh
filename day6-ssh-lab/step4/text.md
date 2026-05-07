# Step 4 — Login Tanpa Password (Key-Based Auth)

> Jalankan dari node **client**.

## Saatnya Buktikan!

```bash
# Jalankan di node: client
ssh root@server
```

Kali ini... **tidak ada prompt password!** Langsung masuk. 

Itulah key-based authentication.

## 4.1 Verifikasi Kamu di Server

```bash
hostname
whoami
```

Output harus menunjukkan kamu berada di node **server**.

## 4.2 Jalankan Command Remote Tanpa Masuk Shell

Kamu bisa jalankan command di server **tanpa perlu masuk dulu**:

```bash
# Jalankan di node: client (tanpa masuk ke server)
ssh root@server "hostname && uptime && df -h /"
```

Ini sangat berguna untuk scripting dan otomasi — misalnya deploy script yang perlu cek status server.

## 4.3 Copy File via SCP

SSH juga punya tool untuk transfer file: **SCP (Secure Copy)**

```bash
# Buat file test di client
echo "File dari client - $(date)" > /tmp/test-transfer.txt

# Kirim ke server
scp /tmp/test-transfer.txt root@server:/tmp/

# Verifikasi file sampai di server
ssh root@server "cat /tmp/test-transfer.txt"
```

## 4.4 Disable Password Auth (Best Practice)

Setelah key-based auth jalan, matikan password auth di server agar lebih aman:

```bash
# Jalankan di node: server
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart ssh
```

Test: coba login dengan password sekarang seharusnya **ditolak**:
```bash
# Jalankan di node: client
ssh -o PasswordAuthentication=yes -o PubkeyAuthentication=no root@server
# Harusnya: Permission denied (publickey)
```

Tapi login dengan key tetap jalan:
```bash
ssh root@server  # tetap bisa masuk!
```

> Ini standard security di production server — matikan password auth, wajibkan key.
