# Step 1B — Personalisasi Halaman Backend Kamu

Sebelum setup reverse proxy, yuk bikin halaman yang personal!

## Buat HTML dengan Placeholder
```bash
cat > /var/www/backend/index.html << 'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>My Backend Server</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background: linear-gradient(135deg, #1a1a2e, #16213e);
      color: white;
    }
    .card {
      text-align: center;
      padding: 40px;
      border: 2px solid #00d4ff;
      border-radius: 12px;
      background: rgba(255,255,255,0.05);
    }
    .name  { font-size: 2em; font-weight: bold; color: #00d4ff; }
    .batch { font-size: 1.2em; color: #aaa; margin-top: 8px; }
    .status {
      margin-top: 20px;
      padding: 8px 20px;
      background: rgba(0,212,255,0.1);
      border-radius: 20px;
      font-size: 0.9em;
    }
  </style>
</head>
<body>
  <div class="card">
    <div class="name">NAMA_KAMU</div>
    <div class="batch">DevOps Bootcamp — BATCH_KAMU</div>
    <div class="status">Backend Server — Port 8080</div>
  </div>
</body>
</html>
EOF
```

## Edit: Ganti Nama & Batch Kamu
```bash
nano /var/www/backend/index.html
```

Cari dan ganti:
- `NAMA_KAMU` → nama lengkap kamu (contoh: `Budi Santoso`)
- `BATCH_KAMU` → batch kamu (contoh: `Batch 1 - 2025`)

Simpan: **Ctrl+X → Y → Enter**

## Preview di Browser
Klik tombol **"Backend (Port 8080)"** di tab atas, atau via curl:
```bash
curl http://localhost:8080
```
