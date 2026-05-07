# Step 1 — Setup & Simulasikan Server Crash

## 1.1 Setup 3 Backend (jika belum dari Lab 2)
```bash
apt-get update -y && apt-get install -y nginx

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

cd /var/www/app1 && nohup python3 -m http.server 8081 > /tmp/app1.log 2>&1 &
cd /var/www/app2 && nohup python3 -m http.server 8082 > /tmp/app2.log 2>&1 &
cd /var/www/app3 && nohup python3 -m http.server 8083 > /tmp/app3.log 2>&1 &
sleep 1
```

## 1.2 Konfigurasi Upstream dengan Health Check Parameter
```bash
cat > /etc/nginx/sites-available/failover.conf << 'EOF'
upstream backend_pool {
    server localhost:8081 max_fails=2 fail_timeout=10s;
    server localhost:8082 max_fails=2 fail_timeout=10s;
    server localhost:8083 max_fails=2 fail_timeout=10s;
}

server {
    listen 80;
    location / {
        proxy_pass http://backend_pool;
        proxy_connect_timeout 2s;
        proxy_read_timeout 5s;
        proxy_set_header Host $host;
    }
}
EOF

rm -f /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/failover.conf /etc/nginx/sites-enabled/
nginx -t && systemctl reload nginx
```

## 1.3 Verifikasi Semua Jalan Normal
```bash
for i in {1..6}; do
  RESP=$(curl -s http://localhost | grep -o 'App-[0-9]')
  echo "Request $i → $RESP"
done
```

## 1.4 Kill App-2 — Simulasi Server Crash!
```bash
kill $(lsof -t -i:8082) 2>/dev/null
echo "App-2 telah dimatikan! Simulasi crash..."
sleep 1
```

## 1.5 Test Setelah Crash
```bash
for i in {1..6}; do
  RESP=$(curl -s http://localhost | grep -o 'App-[0-9]')
  echo "Request $i → $RESP"
done
```

Perhatikan: **App-2 tidak muncul lagi**, tapi service tetap berjalan!

Buka juga tab **"NGINX (Failover Test)"** di browser dan refresh beberapa kali.
