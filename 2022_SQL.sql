

CREATE TABLE personel 
    (
        id NUMBER(9), 
        isim VARCHAR2(50), 
        sehir VARCHAR2(50), 
        maas NUMBER(20), 
        sirket VARCHAR2(20),
        CONSTRAINT personel_pk PRIMARY KEY(id)
    );
    
    INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
    INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
    INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
    INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
    INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
    INSERT INTO personel VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
    INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');
     INSERT INTO personel VALUES(114563890, 'JOHN Sahin', 'Istanbul', 8500, 'Toyota');
      INSERT INTO personel VALUES(223445611, 'THOMAS Sahin', 'Ankara', 5500, 'Ford');
      
    SELECT * FROM personel;
    
    --..............................
    SELECT maas, isim, sehir AS isim_veya_sehir-- sutun ismini ilk koda yazilabilir
    FROM personel
    WHERE maas > 4000
    
    UNION
    
    SELECT maas, isim, sehir
    FROM personel
    WHERE maas > 5000
    ORDER BY maas ASC;
    
    --   ...................
     SELECT isim AS isim_veya_sehir, maas -- sutun ismini ilk koda yazilabilir
    FROM personel
    WHERE maas > 4000
    
    UNION
    
    SELECT sehir, maas 
    FROM personel
    WHERE maas > 5000;
    
    
    CREATE TABLE personel_bilgi 
    (
        id NUMBER(9), 
        tel char(10) UNIQUE , 
        cocuk_sayisi NUMBER(2), 
        CONSTRAINT fk_personel FOREIGN KEY (id) REFERENCES personel(id) 
    ); 
    
    INSERT INTO personel_bilgi VALUES(123456789, '5302345678' , 5);
    INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
    INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3); 
    INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
    INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
    INSERT INTO personel_bilgi VALUES(453445611, '5524578574', 2);
    INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);
    
    
    
    
    SELECT sehir AS sehir_tel, maas AS maas_cocukSayisi
    FROM personel
    WHERE id = 123456789
    
    UNION           -- AYNI SUTUNDA YAZILANLARIN PARAMETRESI AYNI OLMALI
                    -- NUMBER=NUMBER  CHAR=CHAR
    
    SELECT tel, cocuk_sayisi
    FROM personel_bilgi
    WHERE id = 123456789;
    
    
     SELECT isim
    FROM personel
    WHERE sirket = 'Honda'
    
    INTERSECT
    
    SELECT isim
    FROM personel
    WHERE sirket = 'Ford'
    
    INTERSECT
    
    SELECT isim
    FROM personel
    WHERE sirket = 'Tofas';
    
     SELECT isim, maas
    FROM personel
    WHERE sirket = 'Toyota'
    
    INTERSECT
    
    SELECT isim, maas
    FROM personel
    WHERE sirket = 'Ford';
    
    
    SELECT id, isim, sehir  FROM personel
    WHERE isim = 'Mehmet Ozturk'
    MINUS                           -- Sehiri Istanbul olmayan
    SELECT id, isim,sehir FROM  personel
    WHERE sehir='Istanbul';
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    