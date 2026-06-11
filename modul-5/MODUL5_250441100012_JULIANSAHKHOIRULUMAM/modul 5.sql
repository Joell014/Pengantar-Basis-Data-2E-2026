CREATE DATABASE toko;
USE toko;

CREATE TABLE kategori(
id_kategori INT PRIMARY KEY,
nama_kategori VARCHAR (20)
);

CREATE TABLE produk(
id_produk INT PRIMARY KEY,
nama_produk VARCHAR (20),
harga INT,
id_kategori INT,
FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori)
);

CREATE TABLE transaksi (
id_transaksi INT PRIMARY KEY,
id_produk INT,
jumlah INT,
FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

INSERT INTO kategori VALUES
(1,'Laptop'),
(2,'Smartphone'),
(3,'Aksesoris'),
(4,'Headset');

INSERT INTO produk VALUES
(101,'Laptop Asus',8500000,1),
(102,'Laptop Lenovo',7500000,1),
(103,'iPhone 13',12000000,2),
(104,'Mouse Logitech',150000,3),
(105,'Keyboard Gaming',500000,3);

INSERT INTO transaksi VALUES
(1,101,2),
(2,104,5),
(3,103,1),
(4,105,3);

SELECT COUNT(*) AS jumlah_produk
FROM produk;

SELECT COUNT(*) AS produk_mahal FROM produk
WHERE harga > 1000000;

SELECT AVG(harga) AS rata_rata_harga
FROM produk;

SELECT SUM(jumlah) AS total_transaksi
FROM transaksi;

-- memghitung jumlah produk  
SELECT id_kategori, COUNT(*) AS jumlah_produk
FROM produk
GROUP BY id_kategori;

-- menghitung total barang yang terjual setiap produk 
SELECT id_produk, SUM(jumlah) AS total_terjual
FROM transaksi
GROUP BY id_produk;

-- menampilkan jumlah produk per kategori berdasarkan nama kategori
SELECT k.nama_kategori, COUNT(p.id_ produk) AS jumlah_produk 
FROM produk p JOIN kategori k 
ON p.id_kategori = k.id_kategori
GROUP BY k.nama_kategori;

-- menampiilkan  total_pendapatan untuk setiap produk   
SELECT p.nama_produk, SUM(p.harga * t.jumlah) AS total_pendapatan 
FROM transaksi t JOIN produk p 
ON t.id_produk = p.id_produk
GROUP BY p.nama_produk;

-- menampilakan kategori yang memiliki lebih dari 1 produk 
SELECT kategori.nama_kategori,
COUNT(produk.id_produk) AS jumlah_produk
FROM produk
JOIN kategori
ON produk.id_kategori = kategori.id_kategori
GROUP BY kategori.nama_kategori
HAVING COUNT(produk.id_produk) > 1;

-- menampilkan total jumlah penjualan tiap produk 
SELECT produk.nama_produk, 
SUM(transaksi.jumlah) AS total_penjualan
FROM transaksi JOIN produk
ON transaksi.id_produk = produk.id_produk
GROUP BY produk.nama_produk

-- Menampilkan total penjualan tiap produk dan urutkan dari yang ter paling laris 
SELECT produk.nama_produk, 
SUM(transaksi.jumlah) AS total_penjualan
FROM transaksi
JOIN produk
ON transaksi.id_produk = produk.id_produk
GROUP BY produk.nama_produk
ORDER BY total_penjualan DESC;


-- 1. Hitung jumlah produk pada setiap kategori.

-- 2. Hitung rata-rata harga produk pada setiap kategori.

-- 3. Tampilkan total jumlah transaksi untuk setiap produk.

-- 4. Tampilkan kategori yang memiliki lebih dari 1 produk.

-- 5. Tampilkan produk dengan total penjualan terbesar.

-- mrnamilkan kategori dengan lebih dari 1 produkk mahal (lebih dari  1000000) 
SELECT k.nama_kategori, COUNT(p.id_produk) AS  	 

