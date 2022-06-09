
CREATE TABLE calisanlar
(
id CHAR(5) ,
isim VARCHAR2(50) NOT NULL , -- ISIM BOS BIRAKILAMAZ, HATA VERIR.
maas NUMBER(5) NOT NULL,
ise_baslama DATE,
CONSTRAINT id_pk PRIMARY KEY (id)
);

INSERT INTO calisanlar VALUES ('1001', 'Ahmet', 700, '08.06.2022');
INSERT INTO calisanlar VALUES ('1002', 'Ahmet2', 7002, '08.06.2022');
INSERT INTO calisanlar VALUES ('1003', 'Ahmet3', 7003, '08.06.2022');
INSERT INTO calisanlar VALUES ('1004', 'Ahmet4', 7004, '08.06.2022');
INSERT INTO calisanlar VALUES ('1005', 'Ahmet5', 7005, '08.06.2022');
INSERT INTO calisanlar VALUES ('1006', 'Ahmet6', 7006, '08.06.2022');
-- INSERT INTO calisanlar VALUES ('1006', 'Ahmet6', 7006, '08.06.2022');
-- yukardakini kabul etmedi, primary key ozelligi


select * from calisanlar;

drop table calisanlar;

CREATE TABLE adresler
( 
    adres_id CHAR(5) REFERENCES calisanlar(id),
    sokak VARCHAR2(50),
    cadde VARCHAR2(30),
    sehir VARCHAR2(15)
);

INSERT INTO adresler VALUES ('1001', 'mutlu sokak1', '40.cad.', 'ist1');
INSERT INTO adresler VALUES ('1002', 'mutlu sokak2', '40.cad.', 'ist2');
INSERT INTO adresler VALUES ('1003', 'mutlu sokak3', '40.cad.', 'ist3');
INSERT INTO adresler VALUES ('1004', 'mutlu sokak4', '40.cad.', 'ist4');
INSERT INTO adresler VALUES ('1005', 'mutlu sokak5', '40.cad.', 'ist5');
INSERT INTO adresler VALUES ('1006', 'mutlu sokak6', '40.cad.', 'ist6');

drop table adresler;

select * from calisanlar;
select * from adresler;

SELECT    * FROM cal?sanlar, adresler
where id ='1001';


CREATE TABLE sehirler
(
alan_adi NUMBER(3) DEFAULT  00 ,
isim VARCHAR2(50) DEFAULT  'BELIRSIZ' ,
nufus NUMBER(8) CHECK(nufus >0)
);

INSERT INTO sehirler VALUES( 42, 'KONYA', 12345);
INSERT INTO sehirler VALUES( 43, 'KOCAELI', 12345);
INSERT INTO sehirler VALUES( 44, 'KARS', 12345);
INSERT INTO sehirler VALUES( 45, 'MARDIN', 12345);
INSERT INTO sehirler VALUES( 46, 'MARDIN2', 12345);

SELECT * FROM SEHIRLER;
        --PARCALI GIRIS
INSERT INTO sehirler (nufus )VALUES(12345); -- 34 istanbul atamasi yapti

DROP TABLE sehirler;