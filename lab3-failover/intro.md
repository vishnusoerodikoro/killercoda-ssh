# Lab 3 — Failover Simulation

## Tujuan
- Pahami bagaimana NGINX mendeteksi backend yang down
- Konfigurasi `max_fails` dan `fail_timeout`
- Simulasikan server crash di tengah traffic
- Lihat recovery ketika server hidup kembali

## Skenario
Kita punya 3 backend yang melayani traffic. Di tengah load test, **App-2 tiba-tiba crash**. Apakah service tetap up? Apakah user merasakan gangguan?

## Jenis Health Check di NGINX

| Tipe | Deskripsi |
|------|-----------|
| **Passive** (open-source) | Deteksi dari failed request — tidak ada polling aktif |
| **Active** (NGINX Plus) | Polling berkala ke endpoint health check |

Lab ini menggunakan **passive health check** (open-source).

Durasi: ~15 menit
