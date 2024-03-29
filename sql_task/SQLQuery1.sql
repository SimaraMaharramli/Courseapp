﻿--İşçi - (SAA, VəzifəId,Maaş)
--Vəzifə - (Ad)
--Filial - (Ad)
--Məhsul - (Ad, Alış qiyməti, Satış qiyməti)
--Satış - (MəhsulId, İşçiId,Filialİd, Satış tarixi)

CREATE DATABASE MARKET
USE MARKET
CREATE TABLE ISHCI(
ID INT PRIMARY KEY IDENTITY,
SAA NVARCHAR(255),
MAASH FLOAT
)

CREATE TABLE VEZIFE(
ID INT PRIMARY KEY IDENTITY,
AD NVARCHAR(100)
)

CREATE TABLE FILIAL(
ID INT PRIMARY KEY IDENTITY,
FAD NVARCHAR(100)
)

CREATE TABLE MEHSUL(
ID INT PRIMARY KEY IDENTITY,
MAD NVARCHAR(100),
ALISH FLOAT,
SATISH FLOAT
)
--Satış - (MəhsulId, İşçiId,Filialİd, Satış tarixi)
CREATE TABLE SATISH(
MEHSULID INT REFERENCES MEHSUL(ID),
ISHCIID INT REFERENCES ISHCI(ID),
FILIALID INT REFERENCES FILIAL(ID),
SATISHTARIXI DATE DEFAULT GETDATE()
)
--1) Satış cədvəlində işçilərin , satılan məhsulların,
-- satışın olduğu filialın, məhsulun alış və satış qiyməti yazılsın.
SELECT ISHCI.SAA,MEHSUL.MAD,FILIAL.FAD,MEHSUL.SATISH FROM
SATISH
JOIN ISHCI
ON ISHCI.ID=ISHCIID  
JOIN MEHSUL
ON MEHSULID=MEHSUL.ID 
JOIN FILIAL
ON FILIAL.ID=FILIALID 

--Bütün satışların cəmini tap.

SELECT SUM(MEHSUL.SATISH) 
FROM SATISH
JOIN MEHSUL
ON MEHSUL.ID=SATISH.MEHSULID


SELECT SUM(MEHSUL.SATISH) AS 'GELIR'
FROM SATISH
JOIN MEHSUL
ON MEHSULID=SATISH.MEHSULID
WHERE MONTH(SATISH.SATISHTARIXI)=MONTH(GETDATE())

--Hər işçinin satdığı məhsul sayını tap
SELECT ISHCI.SAA,COUNT(MEHSUL.SATISH) AS SATILAN FROM SATISH
FULL OUTER JOIN MEHSUL
ON MEHSUL.ID=SATISH.MEHSULID
FULL OUTER JOIN FILIAL
ON FILIAL.ID=SATISH.FILIALID
FULL OUTER JOIN ISHCI
ON ISHCI.ID=SATISH.ISHCIID
GROUP BY ISHCI.SAA

SELECT DAY(SATISHTARIXI) AS GUN,SUM(MEHSUL.SATISH)AS CEM  FROM SATISH
INNER JOIN MEHSUL
ON MEHSUL.ID=SATISH.MEHSULID
GROUP BY DAY(SATISHTARIXI)

SELECT MONTH(SATISHTARIXI) AS MONTHH,SUM(MEHSUL.SATISH)AS CEM  FROM SATISH
INNER JOIN MEHSUL
ON MEHSUL.ID=SATISH.MEHSULID
GROUP BY MONTH(SATISHTARIXI)