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
