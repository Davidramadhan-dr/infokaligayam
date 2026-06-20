-- ============================================================
-- Jalankan SQL ini di Supabase: buka SQL Editor > New Query
-- lalu paste semua isi file ini, klik "Run".
-- ============================================================

create table if not exists kegiatan (
  id bigint generated always as identity primary key,
  judul text not null,
  kategori text not null,
  tanggal date not null,
  deskripsi text not null,
  foto text default '',
  created_at timestamp with time zone default now()
);

-- Mengizinkan akses baca publik (siapa saja boleh lihat daftar kegiatan)
alter table kegiatan enable row level security;

create policy "Publik boleh membaca kegiatan"
on kegiatan for select
to anon
using (true);

-- Catatan: insert/update/delete TIDAK diizinkan untuk role "anon" lewat policy ini.
-- Server kita menggunakan SUPABASE_SERVICE_KEY (service_role), yang otomatis
-- melewati Row Level Security, jadi hanya backend (setelah login admin) yang
-- bisa menambah/menghapus data. Frontend publik hanya bisa membaca.

-- Data contoh (opsional, boleh dihapus/diedit)
insert into kegiatan (judul, kategori, tanggal, deskripsi, foto) values
('Kerja Bakti Saluran Irigasi', 'Gotong Royong', '2026-06-08', 'Warga enam dusun bergotong royong membersihkan saluran irigasi menjelang musim tanam.', ''),
('Panen Raya Padi Musim I', 'Pertanian', '2026-05-22', 'Perayaan panen raya di area sawah berundak Dusun Krajan, diiringi syukuran warga.', ''),
('Posyandu Balita Bulanan', 'Kesehatan', '2026-06-02', 'Pemeriksaan kesehatan rutin dan pemberian gizi tambahan bagi balita di balai desa.', '');
