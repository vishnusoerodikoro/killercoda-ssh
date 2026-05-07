# Lab 1 — Basic Reverse Proxy dengan NGINX

## Tujuan
Setelah lab ini, kamu akan bisa:
- Menjalankan backend server sederhana dengan Python
- Mengkonfigurasi NGINX sebagai reverse proxy
- Memahami alur request: **Client → NGINX (port 80) → Backend (port 8080)**

## Arsitektur

```
Browser / curl
      │
      ▼
  NGINX :80   ◄── reverse proxy
      │
      ▼
 Python :8080  ◄── backend app
```

## Tools yang Digunakan
- **NGINX** — web server / reverse proxy
- **Python HTTP Server** — simulasi backend app
- **curl** — testing dari terminal
- **Browser tab** — preview visual

Durasi: ~20 menit
