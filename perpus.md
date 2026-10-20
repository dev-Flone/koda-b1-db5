# ERD Perpustakaan
``` mermaid
erDiagram
    direction TB

    RAK ||--o{ KATEGORI: "memiliki"
    KATEGORI ||--o{ BUKU: "mengelompokkan"
    PETUGAS ||--O{ PEMINJAMAN: "memproses"
    PEMINJAM ||--O{ PEMINJAMAN: "melakukan"
    PEMINJAMAN ||--|{ DETAIL_PEMINJAMAN: "memiliki"
    BUKU ||--O{ DETAIL_PEMINJAMAN: "tercatat"
    
    BUKU {
        int buku_id PK
        int kategori_id FK
        string name
    }
    RAK {
        int id PK
        string name
        string lokasi
    }

    KATEGORI {
        int id PK
        int rak_id FK
        string name

    }
    PEMINJAM {
        int id_peminjam PK
        string name
        int nomor_identitas UK
    }
    PEMINJAMAN {
        int id PK
        int peminjam_id FK
        int petugas_id FK
        date tanggal_pinjam
        date tanggal_kembali
        string status
    }
    DETAIL_PEMINJAMAN {
        int id PK
        int peminjaman_id FK
        int buku_id FK
        date tanggal_dikembalikan
        int denda
    }
    PETUGAS {
        int id_petugas PK
        string name
        int nomor_identitas UK
    }


```