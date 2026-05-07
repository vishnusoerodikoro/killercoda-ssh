# Step 3 — Test Reverse Proxy & Buka di Browser

## 3.1 Test via curl
```bash
curl http://localhost
```

Response harus sama persis dengan port 8080 — tapi sekarang sudah lewat NGINX port 80!

## 3.2 Buka di Browser
Klik tombol **"NGINX (Port 80)"** di tab atas.

Kamu akan melihat halaman dengan nama dan batch kamu — sekarang sudah di-serve lewat NGINX.

## 3.3 Buktikan Lewat NGINX
```bash
curl -I http://localhost
```

Perhatikan header `Server: nginx` — bukti request melewati NGINX, bukan langsung ke Python.

## 3.4 Bandingkan Dua Tab
Coba buka keduanya berdampingan:
- **Tab "Backend (Port 8080)"** → langsung ke Python
- **Tab "NGINX (Port 80)"** → lewat reverse proxy

Hasilnya sama, tapi jalurnya berbeda. Inilah inti dari reverse proxy!

## 3.5 Cek Access Log
```bash
tail -f /var/log/nginx/access.log
```

Setiap request tercatat di sini. Tekan **Ctrl+C** untuk keluar.
