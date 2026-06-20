# Website Desa Kaligayam — Versi Supabase + Vercel

Versi ini memakai **Supabase** (database online gratis) sehingga data kegiatan
tersimpan permanen dan aman dipakai di **Vercel** (yang tidak punya disk permanen).

Struktur folder:
```
desa-kaligayam-vercel/
├── app.js              → semua logic backend (API, koneksi Supabase)
├── server.js            → untuk jalan di lokal/Replit (app.listen)
├── api/index.js          → untuk jalan di Vercel (serverless function)
├── vercel.json            → konfigurasi routing Vercel
├── supabase-setup.sql      → SQL untuk membuat tabel di Supabase
├── .env.example
└── public/index.html       → frontend
```

---