# Day 8 Labs — Complete!

## Recap Semua yang Sudah Kamu Pelajari:

### Lab 1 — Reverse Proxy
- NGINX meneruskan request dari port 80 ke backend
- `proxy_pass`, forward headers, access log

### Lab 2 — Round Robin Load Balancing
- `upstream` block dengan 3 backend
- Traffic terdistribusi merata secara otomatis
- Eksperimen `least_conn` dan `ip_hash`

### Lab 3 — Failover
- `max_fails` dan `fail_timeout` untuk passive health check
- Service tetap up meskipun salah satu backend mati
- Recovery otomatis setelah server hidup kembali

## Big Picture

```
Single Server (Lab 1)
       ↓
Multiple Backends (Lab 2)
       ↓
Self-healing System (Lab 3)
```

## Next Steps
- Coba **HAProxy** sebagai alternatif load balancer
- Explore **AWS ALB/NLB** untuk cloud-native LB
- Pelajari **Kubernetes Ingress Controller** — NGINX di skala production

Selamat telah menyelesaikan Day 8!
