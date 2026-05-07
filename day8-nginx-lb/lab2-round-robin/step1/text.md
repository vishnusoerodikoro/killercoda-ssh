# Step 1 — Jalankan 3 Backend Server

## 1.1 Install NGINX
```bash
apt-get update -y && apt-get install -y nginx
```

## 1.2 Buat Halaman untuk Masing-masing Backend
```bash
for i in 1 2 3; do
  mkdir -p /var/www/app$i
  cat > /var/www/app$i/index.html << EOF
<!DOCTYPE html>
<html>
<head>
  <style>
    body { font-family: Arial, sans-serif; display: flex; justify-content: center;
           align-items: center; height: 100vh; margin: 0;
           background: #1a1a2e; color: white; }
    .card { text-align: center; padding: 40px; border-radius: 12px;
            border: 2px solid #00d4ff; background: rgba(255,255,255,0.05); }
    .server { font-size: 2.5em; font-weight: bold; color: #00d4ff; }
    .port   { font-size: 1em; color: #aaa; margin-top: 8px; }
  </style>
</head>
<body>
  <div class="card">
    <div class="server">Backend App-$i</div>
    <div class="port">Running on port 808$i</div>
  </div>
</body>
</html>
EOF
done
```

## 1.3 Jalankan 3 Server di Port Berbeda
```bash
cd /var/www/app1 && nohup python3 -m http.server 8081 > /tmp/app1.log 2>&1 &
cd /var/www/app2 && nohup python3 -m http.server 8082 > /tmp/app2.log 2>&1 &
cd /var/www/app3 && nohup python3 -m http.server 8083 > /tmp/app3.log 2>&1 &
sleep 1
```

## 1.4 Verifikasi Semua Jalan
```bash
for PORT in 8081 8082 8083; do
  echo "Port $PORT: $(curl -s http://localhost:$PORT | grep -o 'App-[0-9]')"
done
```

Klik tab **Backend App-1**, **App-2**, **App-3** di atas untuk preview masing-masing di browser!
