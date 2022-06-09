
/* ============================= SUBQUERIES ====================================

    SORGU i?inde ?al??an SORGUYA SUBQUERY (ALT SORGU) denilir.

==============================================================================*/

    CREATE TABLE personel 
    (
        id NUMBER(9), 
        isim VARCHAR2(50), 
        sehir VARCHAR2(50), 
        maas NUMBER(20), 
        sirket VARCHAR2(20)
    );
    INSERT INTO personel VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
    INSERT INTO personel VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
    INSERT INTO personel VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
    INSERT INTO personel VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
    INSERT INTO personel VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
    INSERT INTO personel VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
    INSERT INTO personel VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');
    
    CREATE TABLE sirketler
    (
        sirket_id NUMBER(9), 
        sirket_adi VARCHAR2(20), 
        personel_sayisi NUMBER(20)
    );
    
    INSERT INTO sirketler VALUES(100, 'Honda', 12000);
    INSERT INTO sirketler VALUES(101, 'Ford', 18000);
    INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
    INSERT INTO sirketler VALUES(103, 'Toyota', 21000);

    SELECT *FROM sirketler;
    SELECT * FROM personel;
/* -----------------------------------------------------------------------------
  ORNEK1: Personel say?s? 15.000�den cok olan sirketlerin isimlerini ve bu 
  sirkette calisan personelin isimlerini ve maa?lar?n?, sirket isimlerini listeleyin
 -----------------------------------------------------------------------------*/ 
 
  SELECT isim,maas,sirket FROM personel
  
  WHERE sirket IN(SELECT sirket_adi FROM sirketler  
                  WHERE personel_sayisi > 15000 );
 
--drop table personel;
--drop table sirketler;
 /* -------------------
 ---------------------------------------------------------
  ORNEK2: sirket_id�si 101�den b?y?k olan ?irket ?al??anlar?n?n isim, maa? ve 
  ?ehirlerini listeleyiniz. 
 -----------------------------------------------------------------------------*/
 select isim, maas, sehir from personel
 
 where sirket In (Select sirket_adi     
                            from sirketler
                            where sirket_id >101);
/* -----------------------------------------------------------------------------
  ORNEK3:  Ankara�da personeli olan ?irketlerin ?irket id'lerini ve personel 
  say?lar?n? listeleyiniz 
 -----------------------------------------------------------------------------*/ 
 select sirket_id,personel_sayisi from sirketler
 where sirket_adi IN(select sirket from personel
 where sehir ='Ankara');
   
/* -----------------------------------------------------------------------------
  ORNEK4: Her ?irketin ismini, personel say?s?n? ve o ?irkete ait personelin
  toplam maa??n? listeleyen bir Sorgu yaz?n?z.
 -----------------------------------------------------------------------------*/
 
 select sirket_adi, personel_sayisi,from personel

 
 
 --select maas from personel where  IN (personel_sayisi from sirketler IN (select  sirket_id) );
 
 SELECT sirket_adi,personel_sayisi FROM sirketler 
WHERE sirket_adi IN(SELECT sirket FROM personel);

select sirket,personel_sayisi,sum(maas) as "Toplam Maas" from personel,sirketler 
where sirket=sirket_adi

group by sirket,personel_sayisi ;
 
 SELECT sirket_adi, personel_sayisi, (SELECT Sum(maas)
FROM personel 
Where sirket=sirket_adi)FROM sirketler;

SELECT sirket_adi, personel_sayisi, (SELECT Sum(maas)
FROM personel 
Where sirket=sirket_adi)AS maas_toplami  FROM sirketler;
 
 
 /* ===================== AGGREGATE METOT KULLANIMI ===========================
    Aggregate Metotlar?(SUM,COUNT, MIN,MAX, AVG) Subquery i?inde kullan?labilir.
    Ancak, Sorgu tek bir de?er d?nd?ryor olmal?d?r.
==============================================================================*/   
    
    SELECT sirket_adi, personel_sayisi, (SELECT SUM(maas) FROM personel
                                      WHERE  personel.sirket = sirketler.sirket_adi) AS toplam_maas
                                     
    FROM sirketler;
 
/* -----------------------------------------------------------------------------
  ORNEK5: Her ?irketin ismini, personel say?s?n? ve o ?irkete ait personelin
  ortalama maa??n? listeleyen bir Sorgu yaz?n?z.
 -----------------------------------------------------------------------------*/
 
    SELECT sirket_adi, personel_sayisi, (SELECT ROUND(AVG(maas)) FROM personel
                                        WHERE  sirket = sirketler.sirket_adi) AS ort_maas
                                     
    FROM sirketler;
    
 /* ----------------------------------------------------------------------------
  ORNEK6: Her ?irketin ismini, personel say?s?n? ve o ?irkete ait personelin
  maksimum ve minumum maa??n? listeleyen bir Sorgu yaz?n?z.
 -----------------------------------------------------------------------------*/          
    
    SELECT sirket_adi, personel_sayisi, (SELECT MAX(maas) FROM personel
                                        WHERE sirket_adi=sirket) AS max_maas,
                                        
                                        (SELECT MIN (maas) FROM personel 
                                        WHERE sirket_adi=sirket) AS min_maas
                                       
    FROM sirketler;
    
      
/* -----------------------------------------------------------------------------
  ORNEK7: Her sirketin id�sini, ismini ve toplam ka? ?ehirde bulundu?unu 
  listeleyen bir SORGU yaz?n?z.
 -----------------------------------------------------------------------------*/
    SELECT sirket_id, sirket_adi, ( SELECT COUNT(sehir) FROM personel
                                    WHERE sirket = sirketler.sirket_adi) AS sehir_sayisi
    
    FROM sirketler;
    
    
    
    
    
    
  
  