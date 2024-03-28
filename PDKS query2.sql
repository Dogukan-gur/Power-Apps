CREATE TABLE DENEME1 (
ID INT IDENTITY (1,1) PRIMARY KEY,
tarih date ,
lokasyon varchar(255),
personel varchar(255),
saat time
)
DROP TABLE DENEME1
TRUNCATE TABLE DENEME1
SELECT * FROM DENEME1

CREATE TABLE PDKSGELEN (
ID INT IDENTITY (1,1) PRIMARY KEY,
sicilno varchar(255),
tarih date ,
saat time
)
DROP TABLE PDKSGELEN
TRUNCATE TABLE PDKSGELEN

SELECT * FROM PDKSGELEN



CREATE TABLE PDKSAD (
ID INT IDENTITY (1,1) PRIMARY KEY,
sicilno varchar(255),
adsoyad varchar(255) ,
telno varchar(255),

)
drop table PDKSAD

ALTER TABLE PDKSAD
ADD devam INT NOT NULL DEFAULT 1;
