#!/bin/bash
HTML=$(cat /var/www/backend/index.html 2>/dev/null)

if [ -z "$HTML" ]; then
  echo "File index.html tidak ditemukan. Jalankan step pembuatan HTML dulu."
  exit 1
fi

if echo "$HTML" | grep -q "NAMA_KAMU"; then
  echo "Kamu belum mengganti NAMA_KAMU! Jalankan: nano /var/www/backend/index.html"
  exit 1
fi

if echo "$HTML" | grep -q "BATCH_KAMU"; then
  echo "Kamu belum mengganti BATCH_KAMU! Jalankan: nano /var/www/backend/index.html"
  exit 1
fi

echo "Halaman backend berhasil dipersonalisasi! Lanjut ke step berikutnya."
exit 0
