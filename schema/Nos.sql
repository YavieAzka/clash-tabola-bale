-- 1. Tabel Klan
CREATE TABLE IF NOT EXISTS Klan (
    klan_id INT PRIMARY KEY AUTO_INCREMENT,
    nama_klan VARCHAR(100) NOT NULL,
    negara_asal VARCHAR(100),
    piala_dibutuhkan INT DEFAULT 0,
    deskripsi TEXT,
    tipe ENUM('Public', 'Private') DEFAULT 'Public'
);

-- 2. Tabel Arena
CREATE TABLE IF NOT EXISTS Arena (
    arena_id INT PRIMARY KEY AUTO_INCREMENT,
    nama_arena VARCHAR(100) NOT NULL,
    piala_dibutuhkan INT NOT NULL DEFAULT 0
);

-- 3. Tabel Rarity
CREATE TABLE IF NOT EXISTS Rarity (
    nama_rarity VARCHAR(50) PRIMARY KEY,
    max_terima_donasi INT NOT NULL,
    jumlah_untuk_upgrade INT NOT NULL,
    gold_dibutuhkan INT NOT NULL
);

-- 4. Tabel Akun
CREATE TABLE IF NOT EXISTS Akun (
    akun_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    jumlah_emas INT NOT NULL DEFAULT 0,
    jumlah_piala INT NOT NULL DEFAULT 0,
    klan_id INT NULL,
    role ENUM('member', 'elder', 'co-leader', 'leader') DEFAULT NULL,
    waktu_bergabung DATETIME NULL
);

-- 5. View current_arena
CREATE OR REPLACE VIEW AkunArena AS
SELECT
    a.akun_id,
    a.username,
    a.jumlah_piala,
    ar.arena_id AS current_arena_id,
    ar.nama_arena AS current_arena_nama,
    ar.piala_dibutuhkan AS current_arena_piala_min
FROM Akun a
JOIN Arena ar ON ar.arena_id = (
    SELECT arena_id
    FROM Arena
    WHERE piala_dibutuhkan <= a.jumlah_piala
    ORDER BY piala_dibutuhkan DESC
    LIMIT 1
);

-- 6. Tabel Kartu
CREATE TABLE IF NOT EXISTS Kartu (
    kartu_id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    deskripsi TEXT,
    tipe ENUM('pasukan', 'sihir', 'bangunan') NOT NULL,
    damage INT DEFAULT 0,
    elixir INT NOT NULL,
    nama_rarity VARCHAR(50),
    arena_id_unlocked INT
);

-- 7. Tabel Bangunan
CREATE TABLE IF NOT EXISTS Bangunan (
    kartu_id INT PRIMARY KEY,
    health INT NOT NULL,
    target_serangan ENUM('darat', 'udara', 'keduanya') NOT NULL,
    lifetime VARCHAR(50),
    jarak_serangan INT,
    kecepatan_menyerang DECIMAL(5,2)
);

-- 8. Tabel Pasukan
CREATE TABLE IF NOT EXISTS Pasukan (
    kartu_id INT PRIMARY KEY,
    health INT NOT NULL,
    target_serangan ENUM('darat', 'udara', 'keduanya') NOT NULL,
    jarak_serangan INT,
    kecepatan_gerak VARCHAR(50),
    kecepatan_menyerang DECIMAL(5,2),
    tipe_pasukan ENUM('darat', 'udara') NOT NULL
);

-- 9. Tabel Sihir
CREATE TABLE IF NOT EXISTS Sihir (
    kartu_id INT PRIMARY KEY,
    radius_serangan DECIMAL(5,2)
);

-- 10. Tabel Deck
CREATE TABLE IF NOT EXISTS Deck (
    akun_id INT NOT NULL,
    nomor_slot TINYINT NOT NULL,
    status_aktif BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (akun_id, nomor_slot)
);

-- 11. Tabel KoleksiKartu
CREATE TABLE IF NOT EXISTS KoleksiKartu (
    akun_id INT NOT NULL,
    kartu_id INT NOT NULL,
    level INT DEFAULT 1,
    jumlah_kartu INT DEFAULT 0,
    PRIMARY KEY (akun_id, kartu_id)
);

-- 12. Tabel KartuDeck
CREATE TABLE IF NOT EXISTS KartuDeck (
    akun_id INT NOT NULL,
    nomor_slot TINYINT NOT NULL,
    kartu_id INT NOT NULL,
    PRIMARY KEY (akun_id, nomor_slot, kartu_id)
);

-- 13. Tabel Pertarungan
CREATE TABLE IF NOT EXISTS Pertarungan (
    pertarungan_id INT PRIMARY KEY AUTO_INCREMENT,
    akun1_id INT NOT NULL,
    akun2_id INT NOT NULL,
    nomor_slot_akun1 TINYINT NULL,
    nomor_slot_akun2 TINYINT NULL,
    arena_id INT NOT NULL,
    pemenang_id INT NOT NULL,
    waktu_pertarungan DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    replay_path VARCHAR(255) NULL
);

-- 14. Tabel Chat
CREATE TABLE IF NOT EXISTS Chat (
    klan_id INT NOT NULL,
    urutan INT NOT NULL,
    waktu_kirim DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    akun_id_pengirim INT NOT NULL,
    PRIMARY KEY (klan_id, urutan)
);

-- 15. Tabel PesanBiasa
CREATE TABLE IF NOT EXISTS PesanBiasa (
    klan_id INT NOT NULL,
    urutan INT NOT NULL,
    pesan_teks TEXT NOT NULL,
    PRIMARY KEY (klan_id, urutan)
);

-- 16. Tabel PermintaanDonasi
CREATE TABLE IF NOT EXISTS PermintaanDonasi (
    klan_id INT NOT NULL,
    urutan INT NOT NULL,
    jumlah_kartu_diterima INT DEFAULT 0,
    kartu_id INT NOT NULL,
    PRIMARY KEY (klan_id, urutan)
);

-- 17. Tabel BerbagiReplay
CREATE TABLE IF NOT EXISTS BerbagiReplay (
    klan_id INT NOT NULL,
    urutan INT NOT NULL,
    deskripsi_tambahan TEXT,
    pertarungan_id INT NOT NULL,
    PRIMARY KEY (klan_id, urutan)
);