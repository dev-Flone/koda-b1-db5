CREATE TABLE rak (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    lokasi VARCHAR(255) NOT NULL
);

CREATE TABLE kategori (
    id SERIAL PRIMARY KEY,
    rak_id INT REFERENCES rak(id),
    name VARCHAR(255) NOT NULL
);

CREATE TABLE buku (
    id SERIAL PRIMARY KEY,
    kategori_id INT REFERENCES kategori(id),
    name VARCHAR(255) NOT NULL
);

CREATE TABLE peminjam (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    nomor_identitas VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE petugas (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    nomor_identitas VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE peminjaman (
    id SERIAL PRIMARY KEY,
    peminjam_id INT REFERENCES peminjam(id) NOT NULL,
    petugas_id INT REFERENCES petugas(id) NOT NULL,
    tanggal_pinjam DATE NOT NULL DEFAULT CURRENT_DATE,
    tanggal_kembali DATE NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'DIPINJAM'
);

CREATE TABLE detail_peminjaman (
    id SERIAL PRIMARY KEY,
    peminjaman_id INT REFERENCES peminjaman(id) NOT NULL,
    buku_id INT REFERENCES buku(id) NOT NULL,
    tanggal_dikembalikan DATE,
    denda NUMERIC(12, 2) NOT NULL DEFAULT 0.00 CHECK (denda > 0)
);