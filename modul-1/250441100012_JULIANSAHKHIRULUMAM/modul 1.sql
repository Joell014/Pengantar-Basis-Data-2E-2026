-- jawaban 1
CREATE DATABASE perpus_digital; 
CREATE TABLE koleksi_langka(
id_buku BIGINT PRIMARY KEY,
judul VARCHAR (250),
tahun_terbit YEAR,
estimasi_harga DECIMAL(20,2)
);

-- jawaban 2
CREATE DATABASE pelanggan;
CREATE TABLE pelanggan_setia(
nomor_identitas INT 
);
ALTER TABLE pelanggan_setia
MODIFY nomor_identitas VARCHAR (20);

-- jawaban 3
CREATE DATABASE transaksi;
CREATE TABLE transaksi_harian(
id_transaksi INT,
harga DECIMAL (10,2)
);
TRUNCATE TABLE transaksi_harian;
DROP TABLE transaksi_harian;

-- jawaban 4
CREATE DATABASE admin_1;
CREATE TABLE umpan_balik(	
isi_dari_komentar TEXT 
);
