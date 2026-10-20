CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(255) NOT NULL
);

CREATE TABLE wallet (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) NOT NULL UNIQUE,
    norek_walet INT UNIQUE NOT NULL
);

CREATE TABLE tipe_transaksi (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE transaksi (
    id_transaksi SERIAL PRIMARY KEY,
    id_wallet_pengirim INT REFERENCES wallet(id) ON DELETE RESTRICT,
    id_wallet_penerima INT REFERENCES wallet(id) ON DELETE RESTRICT,
    id_type INT REFERENCES tipe_transaksi(id) ON DELETE RESTRICT,
    nominal NUMERIC(15, 2) NOT NULL CHECK (nominal > 0),
    status VARCHAR(50) NOT NULL DEFAULT 'PENDING',
    tanggal_transaksi TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);