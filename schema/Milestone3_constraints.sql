-- ============================================================
-- ATTRIBUTE CONSTRAINTS (CHECK yang belum ada di DDL)
-- ============================================================

-- Piala yang dibutuhkan klan tidak negatif
ALTER TABLE Klan ADD CONSTRAINT chk_piala_klan CHECK (piala_dibutuhkan >= 0);

-- Jumlah kartu diterima pada PermintaanDonasi tidak negatif
ALTER TABLE PermintaanDonasi ADD CONSTRAINT chk_jml_donasi CHECK (jumlah_kartu_diterima >= 0);

-- Level kartu pada KoleksiKartu minimal 1
ALTER TABLE KoleksiKartu ADD CONSTRAINT chk_level_kartu CHECK (level >= 1);

-- ============================================================
-- RELATION CONSTRAINTS (Triggers)
-- ============================================================

-- Satu akun hanya boleh memiliki satu deck aktif (INSERT)
DELIMITER //
CREATE TRIGGER trg_satu_deck_aktif_ins
BEFORE INSERT ON Deck
FOR EACH ROW
BEGIN
    DECLARE jumlah_aktif INT;
    IF NEW.status_aktif = TRUE THEN
        SELECT COUNT(*) INTO jumlah_aktif
        FROM Deck
        WHERE akun_id = NEW.akun_id
          AND status_aktif = TRUE;
        IF jumlah_aktif >= 1 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Akun sudah memiliki deck aktif';
        END IF;
    END IF;
END//
DELIMITER ;

-- Satu akun hanya boleh memiliki satu deck aktif (UPDATE)
DELIMITER //
CREATE TRIGGER trg_satu_deck_aktif_upd
BEFORE UPDATE ON Deck
FOR EACH ROW
BEGIN
    DECLARE jumlah_aktif INT;
    IF NEW.status_aktif = TRUE THEN
        SELECT COUNT(*) INTO jumlah_aktif
        FROM Deck
        WHERE akun_id = NEW.akun_id
          AND nomor_slot <> NEW.nomor_slot
          AND status_aktif = TRUE;
        IF jumlah_aktif >= 1 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Akun sudah memiliki deck aktif';
        END IF;
    END IF;
END//
DELIMITER ;

-- Jumlah kartu dalam satu deck maksimal 8
DELIMITER //
CREATE TRIGGER trg_maks_kartu_deck
BEFORE INSERT ON KartuDeck
FOR EACH ROW
BEGIN
    DECLARE jumlah INT;
    SELECT COUNT(*) INTO jumlah
    FROM KartuDeck
    WHERE akun_id = NEW.akun_id AND nomor_slot = NEW.nomor_slot;
    IF jumlah >= 8 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Deck sudah penuh, maksimal 8 kartu';
    END IF;
END//
DELIMITER ;

-- ============================================================
-- DATABASE CONSTRAINTS (Triggers)
-- ============================================================

-- Akun hanya boleh memiliki kartu dari arena yang sudah dicapai
DELIMITER //
CREATE TRIGGER trg_cek_arena_koleksi
BEFORE INSERT ON KoleksiKartu
FOR EACH ROW
BEGIN
    DECLARE arena_akun INT;
    DECLARE arena_kartu INT;

    SELECT MAX(arena_id) INTO arena_akun
    FROM Arena
    WHERE piala_dibutuhkan <= (
        SELECT jumlah_piala FROM Akun WHERE akun_id = NEW.akun_id
    );

    SELECT arena_id_unlocked INTO arena_kartu
    FROM Kartu WHERE kartu_id = NEW.kartu_id;

    IF arena_kartu > arena_akun THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Akun belum mencapai arena yang diperlukan untuk kartu ini';
    END IF;
END//
DELIMITER ;

-- Deck yang dipakai dalam pertarungan harus berisi tepat 8 kartu
DELIMITER //
CREATE TRIGGER trg_cek_deck_penuh
BEFORE INSERT ON Pertarungan
FOR EACH ROW
BEGIN
    DECLARE jumlah_kartu1 INT;
    DECLARE jumlah_kartu2 INT;

    SELECT COUNT(*) INTO jumlah_kartu1
    FROM KartuDeck
    WHERE akun_id = NEW.akun1_id AND nomor_slot = NEW.nomor_slot_akun1;

    SELECT COUNT(*) INTO jumlah_kartu2
    FROM KartuDeck
    WHERE akun_id = NEW.akun2_id AND nomor_slot = NEW.nomor_slot_akun2;

    IF jumlah_kartu1 < 8 OR jumlah_kartu2 < 8 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Deck harus berisi tepat 8 kartu untuk bertarung';
    END IF;
END//
DELIMITER ;

-- Pertarungan hanya boleh antara dua akun dalam arena yang sama
DELIMITER //
CREATE TRIGGER trg_cek_arena_sama
BEFORE INSERT ON Pertarungan
FOR EACH ROW
BEGIN
    DECLARE arena1 INT;
    DECLARE arena2 INT;

    SELECT MAX(arena_id) INTO arena1
    FROM Arena
    WHERE piala_dibutuhkan <= (
        SELECT jumlah_piala FROM Akun WHERE akun_id = NEW.akun1_id
    );

    SELECT MAX(arena_id) INTO arena2
    FROM Arena
    WHERE piala_dibutuhkan <= (
        SELECT jumlah_piala FROM Akun WHERE akun_id = NEW.akun2_id
    );

    IF arena1 <> arena2 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Kedua akun harus berada di arena yang sama untuk bertarung';
    END IF;
END//
DELIMITER ;

-- Donasi tidak boleh melebihi batas max_terima_donasi (INSERT)
DELIMITER //
CREATE TRIGGER trg_batas_donasi_ins
BEFORE INSERT ON PermintaanDonasi
FOR EACH ROW
BEGIN
    DECLARE batas INT;
    SELECT r.max_terima_donasi INTO batas
    FROM Kartu k
    JOIN Rarity r ON k.nama_rarity = r.nama_rarity
    WHERE k.kartu_id = NEW.kartu_id;

    IF NEW.jumlah_kartu_diterima > batas THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Jumlah donasi melebihi batas maksimal untuk rarity kartu ini';
    END IF;
END//
DELIMITER ;

-- Donasi tidak boleh melebihi batas max_terima_donasi (UPDATE)
DELIMITER //
CREATE TRIGGER trg_batas_donasi_upd
BEFORE UPDATE ON PermintaanDonasi
FOR EACH ROW
BEGIN
    DECLARE batas INT;
    SELECT r.max_terima_donasi INTO batas
    FROM Kartu k
    JOIN Rarity r ON k.nama_rarity = r.nama_rarity
    WHERE k.kartu_id = NEW.kartu_id;

    IF NEW.jumlah_kartu_diterima > batas THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Jumlah donasi melebihi batas maksimal untuk rarity kartu ini';
    END IF;
END//
DELIMITER ;

-- ============================================================
-- TRANSITION CONSTRAINTS (Triggers)
-- ============================================================

-- Level kartu tidak boleh turun
DELIMITER //
CREATE TRIGGER trg_level_kartu_naik
BEFORE UPDATE ON KoleksiKartu
FOR EACH ROW
BEGIN
    IF NEW.level < OLD.level THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Level kartu tidak boleh turun';
    END IF;
END//
DELIMITER ;

-- Pertarungan bersifat immutable (atribut historis tidak boleh diubah)
DELIMITER //
CREATE TRIGGER trg_pertarungan_immutable
BEFORE UPDATE ON Pertarungan
FOR EACH ROW
BEGIN
    IF NEW.akun1_id          <> OLD.akun1_id
    OR NEW.akun2_id          <> OLD.akun2_id
    OR NEW.pemenang_id       <> OLD.pemenang_id
    OR NEW.arena_id          <> OLD.arena_id
    OR NEW.waktu_pertarungan <> OLD.waktu_pertarungan THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Atribut historis pertarungan tidak boleh diubah';
    END IF;
END//
DELIMITER ;

-- Username immutable (tidak boleh diubah setelah pendaftaran)
DELIMITER //
CREATE TRIGGER trg_username_tetap
BEFORE UPDATE ON Akun
FOR EACH ROW
BEGIN
    IF NEW.username <> OLD.username THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Username tidak dapat diubah setelah pendaftaran';
    END IF;
END//
DELIMITER ;



-- REFERENTIAL CONSTRAINTS

ALTER TABLE deck ADD CONSTRAINT fk_deck_akun
FOREIGN KEY (akun_id) REFERENCES Akun(akun_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE koleksikartu ADD CONSTRAINT fk_koleksikartu_akun
FOREIGN KEY (akun_id) REFERENCES Akun(akun_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE chat ADD CONSTRAINT fk_chat_akun
FOREIGN KEY (akun_id_pengirim) REFERENCES Akun(akun_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE pertarungan ADD CONSTRAINT fk_pertarungan_akun1
FOREIGN KEY (akun1_id) REFERENCES Akun(akun_id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

ALTER TABLE pertarungan ADD CONSTRAINT fk_pertarungan_akun2
FOREIGN KEY (akun2_id) REFERENCES Akun(akun_id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

ALTER TABLE pertarungan ADD CONSTRAINT fk_pertarungan_akunpemenang
FOREIGN KEY (pemenang_id) REFERENCES Akun(akun_id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;


ALTER TABLE akun ADD CONSTRAINT fk_akun_klan
FOREIGN KEY (klan_id) REFERENCES Klan(klan_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE chat ADD CONSTRAINT fk_chat_klan
FOREIGN KEY (klan_id) REFERENCES Klan(klan_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE bangunan ADD CONSTRAINT fk_bangunan_kartu
FOREIGN KEY (kartu_id) REFERENCES Kartu(kartu_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE pasukan ADD CONSTRAINT fk_pasukan_kartu
FOREIGN KEY (kartu_id) REFERENCES Kartu(kartu_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE sihir ADD CONSTRAINT fk_sihir_kartu
FOREIGN KEY (kartu_id) REFERENCES Kartu(kartu_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE koleksikartu ADD CONSTRAINT fk_koleksikartu_kartu
FOREIGN KEY (kartu_id) REFERENCES Kartu(kartu_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE permintaandonasi ADD CONSTRAINT fk_permintaandonasi_kartu
FOREIGN KEY (kartu_id) REFERENCES Kartu(kartu_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE kartudeck ADD CONSTRAINT fk_kartudeck_deck
FOREIGN KEY (akun_id, nomor_slot) REFERENCES Deck(akun_id, nomor_slot)
ON DELETE CASCADE
ON UPDATE CASCADE;

DELIMITER $$
CREATE TRIGGER trg_upd_deck
AFTER UPDATE ON deck
FOR EACH ROW
BEGIN
    UPDATE pertarungan
    SET nomor_slot_akun1 = NULL
    WHERE OLD.akun_id = akun1_id AND
          OLD.nomor_slot = nomor_slot_akun1;
    UPDATE pertarungan
    SET nomor_slot_akun2 = NULL
    WHERE OLD.akun_id = akun2_id AND
          OLD.nomor_slot = nomor_slot_akun2;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_del_deck
AFTER DELETE ON deck
FOR EACH ROW
BEGIN
    UPDATE pertarungan
    SET nomor_slot_akun1 = NULL
    WHERE OLD.akun_id = akun1_id AND
          OLD.nomor_slot = nomor_slot_akun1;
    UPDATE pertarungan
    SET nomor_slot_akun2 = NULL
    WHERE OLD.akun_id = akun2_id AND
          OLD.nomor_slot = nomor_slot_akun2;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_add_kartudeck
AFTER INSERT ON kartudeck
FOR EACH ROW
BEGIN
    UPDATE pertarungan
    SET nomor_slot_akun1 = NULL
    WHERE NEW.akun_id = akun1_id AND
          NEW.nomor_slot = nomor_slot_akun1;
    UPDATE pertarungan
    SET nomor_slot_akun2 = NULL
    WHERE NEW.akun_id = akun2_id AND
          NEW.nomor_slot = nomor_slot_akun2;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_upd_kartudeck
AFTER UPDATE ON kartudeck
FOR EACH ROW
BEGIN
    UPDATE pertarungan
    SET nomor_slot_akun1 = NULL
    WHERE NEW.akun_id = akun1_id AND
          NEW.nomor_slot = nomor_slot_akun1;
    UPDATE pertarungan
    SET nomor_slot_akun2 = NULL
    WHERE NEW.akun_id = akun2_id AND
          NEW.nomor_slot = nomor_slot_akun2;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_del_kartudeck
AFTER DELETE ON kartudeck
FOR EACH ROW
BEGIN
    UPDATE pertarungan
    SET nomor_slot_akun1 = NULL
    WHERE OLD.akun_id = akun1_id AND
          OLD.nomor_slot = nomor_slot_akun1;
    UPDATE pertarungan
    SET nomor_slot_akun2 = NULL
    WHERE OLD.akun_id = akun2_id AND
          OLD.nomor_slot = nomor_slot_akun2;
END $$
DELIMITER ;

ALTER TABLE pesanbiasa ADD CONSTRAINT fk_pesanbiasa_chat
FOREIGN KEY (klan_id, urutan) REFERENCES Chat(klan_id, urutan)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE permintaandonasi ADD CONSTRAINT fk_permintaandonasi_chat
FOREIGN KEY (klan_id, urutan) REFERENCES Chat(klan_id, urutan)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE berbagireplay ADD CONSTRAINT fk_berbagireplay_chat
FOREIGN KEY (klan_id, urutan) REFERENCES Chat(klan_id, urutan)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE kartu ADD CONSTRAINT fk_kartu_arena
FOREIGN KEY (arena_id_unlocked) REFERENCES Arena(arena_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE pertarungan ADD CONSTRAINT fk_pertarungan_arena
FOREIGN KEY (arena_id) REFERENCES Arena(arena_id)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

ALTER TABLE berbagireplay ADD CONSTRAINT fk_berbagireplay_pertarungan
FOREIGN KEY (pertarungan_id) REFERENCES Pertarungan(pertarungan_id)
ON DELETE CASCADE
ON UPDATE CASCADE;
