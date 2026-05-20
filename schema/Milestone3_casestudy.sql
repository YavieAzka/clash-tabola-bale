-- No.1 JUARA 1

ALTER TABLE akun
ADD wins INT DEFAULT 0;

UPDATE akun JOIN (SELECT pemenang_id, COUNT(pemenang_id) as jumlah_menang
      FROM pertarungan
      GROUP BY pemenang_id) w ON (akun_id = pemenang_id)
SET wins = jumlah_menang;

DELIMITER $$
CREATE TRIGGER trg_update_wins 
AFTER INSERT ON pertarungan
FOR EACH ROW
BEGIN
    UPDATE akun
    SET akun.wins = akun.wins + 1
    WHERE NEW.pemenang_id = akun.akun_id;
END $$
DELIMITER ;

CREATE VIEW leaderboard AS
SELECT username, wins
FROM akun
ORDER BY wins DESC
LIMIT 5;


-- No.2 Pertarungan Aman
CREATE TABLE toko_daily (
akun_id INT NOT NULL,
slot_toko INT NOT NULL,
kartu_id INT NOT NULL,
status VARCHAR(50) NOT NULL,
PRIMARY KEY (akun_id, slot_toko),
FOREIGN KEY (akun_id) REFERENCES akun(akun_id),
FOREIGN KEY (kartu_id) REFERENCES kartu(kartu_id));

ALTER TABLE rarity 
ADD (
    qty_jual INT NOT NULL,
    harga_toko INT NOT NULL
);

UPDATE rarity SET qty_jual = 40, harga_toko = 200 WHERE nama_rarity = 'common';
UPDATE rarity SET qty_jual = 15, harga_toko = 300 WHERE nama_rarity = 'uncommon';
UPDATE rarity SET qty_jual = 5, harga_toko = 500 WHERE nama_rarity = 'rare';
UPDATE rarity SET qty_jual = 2, harga_toko = 800 WHERE nama_rarity = 'epic';
UPDATE rarity SET qty_jual = 1, harga_toko = 1200 WHERE nama_rarity = 'legendary';


INSERT INTO toko_daily (akun_id, slot_toko, kartu_id, status)
WITH seed_kartu AS (
    SELECT kartu_id, akun_id, RAND(NOW() + 0) AS seed_toko
    FROM kartu, akun
    ORDER BY seed_toko DESC
)
SELECT akun_id, slot_toko, kartu_id, 'BELUM DIBELI'
FROM (SELECT akun_id, kartu_id, ROW_NUMBER() OVER (PARTITION BY akun_id) AS slot_toko
    FROM akun, kartu
    WHERE (akun_id, kartu_id) IN (SELECT akun_id, kartu_id 
                                    FROM seed_kartu)) s3
WHERE slot_toko <=6;

DELIMITER $$
CREATE EVENT refresh_daily_shop
ON SCHEDULE EVERY 24 HOUR
STARTS '2026-05-19 00:00:00'
DO BEGIN
    DELETE FROM toko_daily;
    INSERT INTO toko_daily (akun_id, slot_toko, kartu_id, status)
    WITH seed_kartu AS (
        SELECT kartu_id, akun_id, RAND(NOW() + 0) AS seed_toko
        FROM kartu, akun
        ORDER BY seed_toko DESC
    )
    SELECT akun_id, slot_toko, kartu_id, 'BELUM DIBELI'
    FROM (SELECT akun_id, kartu_id, ROW_NUMBER() OVER (PARTITION BY akun_id) AS slot_toko
        FROM akun, kartu
        WHERE (akun_id, kartu_id) IN (SELECT akun_id, kartu_id 
                                    FROM seed_kartu)) s3
    WHERE slot_toko <=6;
END $$
DELIMITER ;

SET GLOBAL event_scheduler = ON;

CREATE VIEW current_toko AS
SELECT akun_id, slot_toko, nama, qty_jual, harga_toko, status
FROM toko_daily NATURAL JOIN kartu NATURAL JOIN rarity;


--No.3 Winrate

ALTER TABLE akun
ADD winrate DECIMAL(5,2) DEFAULT NULL;

UPDATE akun NATURAL JOIN (SELECT akun_id, COUNT(akun_id) AS jumlah_battle, SUM(win) AS jumlah_menang
                          FROM ((SELECT akun1_id AS akun_id, (pemenang_id = akun1_id) AS win
                                  FROM pertarungan) UNION ALL
                                                                (SELECT akun2_id AS akun_id, (pemenang_id = akun2_id) AS win
                                  FROM pertarungan)) w
                          GROUP BY akun_id) w2
SET winrate = jumlah_menang * 100 / jumlah_battle;

DELIMITER $$
CREATE TRIGGER trg_update_winrate 
AFTER INSERT ON pertarungan
FOR EACH ROW
BEGIN
    UPDATE akun NATURAL JOIN (SELECT akun_id, COUNT(akun_id) AS jumlah_battle, SUM(win) AS jumlah_menang
                            FROM ((SELECT akun1_id AS akun_id, (pemenang_id = akun1_id) AS win
                                    FROM pertarungan) UNION ALL
                                (SELECT akun2_id AS akun_id, (pemenang_id = akun2_id) AS win
                                    FROM pertarungan)) w
                            GROUP BY akun_id) w2
    SET winrate = jumlah_menang * 100 / jumlah_battle;
END $$
DELIMITER ;


--No 4 Kartu Terpopuler
CREATE VIEW SkorPopularitasKartu AS
SELECT
k.kartu_id, k.nama, k.tipe, k.nama_rarity,
SUM(
CASE WHEN d.status_aktif = TRUE THEN 2 ELSE 1 END) AS skor_popularitas
FROM KartuDeck kd
JOIN Deck d ON  d.akun_id    = kd.akun_id AND d.nomor_slot = kd.nomor_slot
JOIN Kartu k ON k.kartu_id = kd.kartu_id
GROUP BY k.kartu_id, k.nama, k.tipe, k.nama_rarity;

--No 5 Replay Terpopuler
CREATE VIEW ReplayPopuler AS
SELECT p.pertarungan_id, p.akun1_id, p.akun2_id, p.pemenang_id, p.waktu_pertarungan, p.arena_id, p.replay_path, COUNT(*) AS jumlah_dibagikan
FROM BerbagiReplay br
JOIN Chat c ON  c.klan_id = br.klan_id AND c.urutan  = br.urutan
JOIN Pertarungan p ON p.pertarungan_id = br.pertarungan_id
WHERE c.waktu_kirim >= DATE_SUB(CURDATE(), INTERVAL DAYOFWEEK(CURDATE()) + 6 DAY) AND c.waktu_kirim <  DATE_SUB(CURDATE(), INTERVAL DAYOFWEEK(CURDATE()) - 1 DAY)
GROUP BY p.pertarungan_id, p.akun1_id, p.akun2_id, p.pemenang_id, p.waktu_pertarungan, p.arena_id, p.replay_path
ORDER BY jumlah_dibagikan DESC
LIMIT 1;
