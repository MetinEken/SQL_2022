SELECT urun_id, musteri_isim FROM mart_satislar 
    
    WHERE EXISTS  (SELECT urun_id FROM nisan_satislar 
                  WHERE mart_satislar.urun_id = nisan_satislar.urun_id);


SELECT urun_id, musteri_isim FROM mart_satislar 
    
    WHERE EXISTS  (SELECT urun_id FROM nisan_satislar 
                  WHERE mart_satislar.urun_id = nisan_satislar.urun_id);


 UPDATE insanlar
   SET isim = COALESCE (isim, 'Hen?z isim girilmedi'),
       adres = COALESCE (adres, 'Hen?z adres girilmedi'),
       ssn= COALESCE (ssn, 'No SSN');
       
    SELECT * FROM insanlar;
    
     SELECT * FROM kisiler
    ORDER BY adres;   -- Adres bilgilerine gore alfabetik siralama yapar..
    
    SELECT * FROM kisiler;
    
    SELECT * FROM kisiler
    ORDER BY maas;  
 
 /* ----------------------------------------------------------------------------
  ORNEK3: kisiler tablosunu maas'a g?re AZALAN s?rada sorgulay?n?z.
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM kisiler
    ORDER BY maas DESC;  -- Azalan
 
/* ----------------------------------------------------------------------------
  ORNEK4: ismi Mine olanlar?, SSN'e g?re AZALAN s?rada sorgulay?n?z.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    WHERE isim = 'Mine'
    ORDER BY ssn DESC;
/* ----------------------------------------------------------------------------
  ORNEK5: soyismi 'i Bulut olanlar? isim s?ral? olarak sorgulay?n?z.
-----------------------------------------------------------------------------*/ 
    SELECT * FROM kisiler
    WHERE soyisim = 'Bulut'
    ORDER BY 2;                 --2= 2.inci sutuna gore surala isim'e g?re s?ralanm??
                                --3= 3.uncu stuna gore sirala gibi
                                --6= 6.inci satir olmadigi icin hata verir
                                
                                
    SELECT * FROM kisiler
    ORDER BY maas DESC
    FETCH NEXT 2 ROWS ONLY;
    
     SELECT * FROM kisiler
    ORDER BY maas ASC
    FETCH NEXT 2 ROWS ONLY;
    
     SELECT isim, SUM(urun_miktari) AS toplam_urun 
    FROM manav
    GROUP BY isim;
    
    SELECT urun_adi, COUNT(isim) AS kisi_sayisi2
    FROM manav
    Where urun_adi IS NOT NULL
    GROUP BY urun_adi
    ORDER BY  COUNT(isim); -- 
    
    SELECT urun_adi, ismi COUNT(isim) AS kisi_sayisi2
    FROM manav
    Where urun_adi IS NOT NULL
    GROUP BY urun_adi;
    
    