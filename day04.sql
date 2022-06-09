
CREATE TABLE tedarikciler
(
vergi_no NUMBER(3),
firma_ismi VARCHAR2(50),
irtibat_no VARCHAR2(50),
CONSTRAINT pk_ted PRIMARY KEY (vergi_no)
);

--DROP TABLE urunler;

    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', '?in Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
    
    
    CREATE TABLE urunler
    (
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    CONSTRAINT fak_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
    );
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ay?e Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan ?z');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Y?lmaz');
    
    SELECT * FROM urunler;
    SELECT * FROM tedarikciler;
    
    --baska bir tabloya gore diger tabloyu degistirmek
    UPDATE urunler
    SET urun_?s?m =(SELECT firma_ismi
    from tedarikciler
    WHERE irtibat_no='Adam Eve')
    WHERE musteri_isim ='Ali Bak';
    
    --
    UPDATE tedarikciler
    SET firma_ismi = 'LG'
    WHERE vergi_no = 101;
    
    
    ---
    
   
    
    
    ---
    
    UPDATE tedar?kc?ler
    SET firma_ismi= 'SAMSUNG' , irtibat_no = 'Ali Veli'
    WHERE vergi_no = 102;
    
    
    --
    UPDATE tedar?kc?ler
    SET ?rt?bat_no = 'AYSE YILMAZ'
    WHERE f?rma_?sm?='SAMSUNG';
    
    
    ---
    
    UPDATE urunler
    SET urun_isim ='TELEFON'
    WHERE urun_isim='Phone';
    
    
    
    