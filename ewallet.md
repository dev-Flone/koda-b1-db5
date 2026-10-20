# ERD E-Wallet

``` mermaid
erDiagram
    direction TB    

    USER ||--|| WALLET: "memiliki"
    WALLET ||--O{ TRANSAKSI: "mengirim"
    WALLET ||--O{ TRANSAKSI: "menerima"
    TIPE_TRANSAKSI ||--O{ TRANSAKSI: "mengkategorikan"

    USER {
        int id_user PK
        string nama_user
    }

    WALLET {
        int wallet_id PK
        int user_id FK
        int norek_wallet
    }

    TRANSAKSI {
        int id_transaksi PK
        int id_wallet_pengirim FK
        int id_wallet_penerima FK
        int id_type FK
        int nominal_transaksi
        string status
        datetime tanggal_transaksi
    }
    
    TIPE_TRANSAKSI {
        int id PK
        string nama
    }
```