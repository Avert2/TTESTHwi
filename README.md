# 📌Petunjuk Umum:
# 📖 Deskripsi
Repositori ini berisi jawaban untuk Huawei Interview:
Backend Development – membuat server sederhana
Automation Testing (Cron Job) – membuat script otomatis untuk mengambil data dari API  dan membersihkan file lama.
Data Processing (SQL) – membuat query SQL untuk manipulasi data karyawan.

# Struktur projek
├── 1_Backend/        # Node.js + Express API

├── 2_Automation/     # Cron job scripts (data koleksi dan cleanup)

├── 3_DataProcessing/ # SQL scripts

└── README.md
# 🚀 Cara Menjalankan
# Pengembangan Backend
📂 Lokasi: 1_Backend/
Langkah Menjalankan:

1. Masuk ke folder:
```
cd 1_Backend
```
2. Install dependencies:
```
npm install
```
3. Jalankan Server:
```
node index.js
```
Server berjalan di:
```
http://localhost:3000
```
Endpoint API:

⯈ POST /submission → menerima data form (name, email/phone).

⯈ GET /submissions → mengembalikan semua data yang sudah tersimpan.

# Automation Testing
📂 Lokasi: 2_Cron/

Script:

⯄ collect_thedata.sh → mengambil data saham (AAPL, MSFT, GOOGL) dari MarketStack API dan menyimpannya ke folder /home/cron/.

⯄ cleanup.sh → menghapus file lama yang berumur lebih dari 30 hari.

Jadwal Cron:

 ⯈Data dikumpulkan otomatis setiap jam 08:00, 12:00, 15:00.

 ⯈Pembersihan dijalankan tiap tengah malam.

 
 👉 Tambahkan ke cron job:
 ```
 crontab -e
 ```
 👇 Isi:
 ```
 0 8,12,15 * * * /home/username/collect_thedata.sh
 0 0 * * * /home/username/cleanup.sh
 ```
🔑 Cara Mendapatkan API Key:
1. Daftar akun gratis di [MarketStack](https://marketstack.com)
2. Masuk ke Dashboard → copy API Key kamu.
3. Ganti API_KEY yang ada di collect_thedata.sh

# Data Processing
📂 Lokasi: 3_SQL/

File:

🧰 create_database.sql → membuat database dan tabel employees.

🧰 queries.sql → berisi query:

1. Menambah karyawan Albert sebagai Engineer.

2. Update gaji untuk posisi Engineer.

3. Hitung total biaya gaji tahun 2021.

4. Ambil 3 karyawan dengan pengalaman kerja terbanyak.

5. Subquery untuk Engineer dengan pengalaman ≤ 3 tahun.

Jalankan file ini  di MySQL / MariaDB / PHPMyadmin:
SOURCE create_database.sql;
SOURCE queries.sql;

# 📝 Catatan

Backend (No.1) & SQL (No.3) bisa dijalankan di Windows.

Cron Job (No.2) hanya bisa dijalankan di Linux (Ubuntu).
