# Step 2 — Konfigurasi NGINX sebagai Reverse Proxy

## 2.1 Buat Config File
```bash
cat > /etc/nginx/sites-available/reverse-proxy.conf << 'EOF'
server {
    listen 80;
    server_name localhost;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
EOF
```

## 2.2 Aktifkan Config & Reload NGINX
```bash
# Disable default config
rm -f /etc/nginx/sites-enabled/default

# Enable config baru
ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/

# Test config — pastikan tidak ada syntax error
nginx -t

# Reload
systemctl reload nginx
```

## Penjelasan Direktif

| Direktif | Fungsi |
|----------|--------|
| `proxy_pass` | Alamat tujuan forward request |
| `X-Real-IP` | IP asli client diteruskan ke backend |
| `X-Forwarded-For` | Chain IP jika melewati multiple proxy |
| `Host` | Meneruskan hostname asli dari client |
