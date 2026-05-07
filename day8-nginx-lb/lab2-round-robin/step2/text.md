# Step 2 — Konfigurasi NGINX Upstream (Round Robin)

## 2.1 Buat Config dengan Upstream Block
```bash
cat > /etc/nginx/sites-available/load-balancer.conf << 'EOF'
upstream backend_pool {
    # Round Robin adalah default — tidak perlu keyword tambahan
    server localhost:8081;
    server localhost:8082;
    server localhost:8083;
}

server {
    listen 80;
    server_name localhost;

    location / {
        proxy_pass http://backend_pool;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
EOF
```

## 2.2 Aktifkan & Reload
```bash
rm -f /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/load-balancer.conf /etc/nginx/sites-enabled/
nginx -t && systemctl reload nginx
```

## Perbandingan Algoritma

| Algoritma | Keyword | Cocok untuk |
|-----------|---------|-------------|
| Round Robin | *(default, tidak perlu keyword)* | Traffic merata, server homogen |
| Least Connections | `least_conn;` | Request dengan durasi bervariasi |
| IP Hash | `ip_hash;` | Sticky session, perlu konsistensi user |
| Weighted | `weight=N` per server | Server dengan kapasitas berbeda |
