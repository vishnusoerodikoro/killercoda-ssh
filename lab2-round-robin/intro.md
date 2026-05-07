# Lab 2 — Round Robin Load Balancing

## Tujuan
- Menjalankan 3 backend server sekaligus
- Konfigurasi NGINX `upstream` block
- Observasi bagaimana Round Robin mendistribusikan traffic secara merata
- Eksperimen ganti algoritma ke `least_conn`

## Arsitektur

```
curl / Browser
      │
      ▼
  NGINX :80
      │
   upstream
  ┌───┴───┬───────┐
  ▼       ▼       ▼
:8081   :8082   :8083
(App-1) (App-2) (App-3)
```

## Catatan
Masing-masing backend akan memberikan response berbeda sehingga kamu bisa melihat distribusi traffic secara visual.

Durasi: ~20 menit
