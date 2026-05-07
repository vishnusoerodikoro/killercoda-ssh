# Step 2 — Observasi Error Log & Recovery

## 2.1 Cek Error Log NGINX
```bash
tail -20 /var/log/nginx/error.log
```

Kamu akan melihat entry seperti:
```
connect() failed (111: Connection refused) while connecting to upstream
```

Ini tanda NGINX mendeteksi App-2 gagal dan otomatis melewatinya.

## 2.2 Pahami Parameter Health Check

| Parameter | Nilai | Artinya |
|-----------|-------|---------|
| `max_fails=2` | 2 | Backend dianggap down setelah 2x gagal |
| `fail_timeout=10s` | 10 detik | Backend di-exclude selama 10 detik, lalu dicoba lagi |
| `proxy_connect_timeout` | 2 detik | NGINX tunggu koneksi maksimal 2 detik |

## 2.3 Hidupkan Kembali App-2 — Recovery!
```bash
cd /var/www/app2 && nohup python3 -m http.server 8082 > /tmp/app2.log 2>&1 &
echo "App-2 hidup kembali!"
sleep 2
```

## 2.4 Test Setelah Recovery
```bash
for i in {1..9}; do
  RESP=$(curl -s http://localhost | grep -o 'App-[0-9]')
  echo "Request $i → $RESP"
done
```

Setelah `fail_timeout` berlalu, App-2 akan masuk kembali ke rotation.

## 2.5 Diskusi: Passive vs Active Health Check

**Passive (yang kita pakai):**
- Deteksi dari failed request — tidak proaktif
- Butuh ada request dulu yang gagal sebelum backend di-exclude
- Artinya: 1-2 request pertama mungkin error sebelum NGINX sadar

**Active (NGINX Plus / module tambahan):**
- Polling berkala ke `/health` endpoint
- Backend langsung di-exclude begitu down
- Tidak ada request yang gagal sampai ke client

> Untuk production banking, active health check sangat direkomendasikan!
