# Step 3 — Observasi Round Robin Distribution

## 3.1 Hit 9x Request Berturut-turut
```bash
for i in {1..9}; do
  RESP=$(curl -s http://localhost | grep -o 'App-[0-9]')
  echo "Request $i → $RESP"
done
```

Perhatikan pola: **App-1 → App-2 → App-3 → App-1 → App-2 → App-3 → ...**

Itulah Round Robin!

## 3.2 Buka di Browser & Refresh Berulang
Klik tab **"NGINX Load Balancer"** di atas, lalu refresh beberapa kali.
Kamu akan lihat tampilan berganti antara App-1, App-2, dan App-3.

## 3.3 Cek Distribusi via Access Log
```bash
# Di terminal baru, lihat log realtime
tail -f /var/log/nginx/access.log
```

## 3.4 Eksperimen: Ganti ke Least Connections
```bash
# Edit config
nano /etc/nginx/sites-available/load-balancer.conf
```

Tambahkan `least_conn;` di baris pertama dalam `upstream` block:
```nginx
upstream backend_pool {
    least_conn;
    server localhost:8081;
    server localhost:8082;
    server localhost:8083;
}
```

```bash
nginx -t && systemctl reload nginx

# Test lagi
for i in {1..9}; do
  RESP=$(curl -s http://localhost | grep -o 'App-[0-9]')
  echo "Request $i → $RESP"
done
```
