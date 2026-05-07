# Step 1 — Install NGINX & Jalankan Backend

## 1.1 Install NGINX
```bash
apt-get update -y && apt-get install -y nginx
```

## 1.2 Jalankan Backend Sederhana
Kita pakai Python HTTP server sebagai simulasi backend app:

```bash
mkdir -p /var/www/backend
echo "<h1>Hello from Backend Server!</h1>" > /var/www/backend/index.html

cd /var/www/backend && nohup python3 -m http.server 8080 > /tmp/backend.log 2>&1 &
```

## 1.3 Verifikasi Backend Jalan
```bash
curl http://localhost:8080
```

Harusnya lo lihat: `Hello from Backend Server!`

> Klik tombol **"Backend (Port 8080)"** di tab atas untuk preview di browser!
