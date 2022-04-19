CREATE DATABASE COMPANY
CREATE TABLE ISHCI(
MKOD NVARCHAR(100) NOT NULL,
SAA NVARCHAR (255) NOT NULL,
MAASH FLOAT NOT NULL
)

CREATE TABLE VEZIFE(
VEZIFEID INT  PRIMARY KEY IDENTITY,
VEZIFE NVARCHAR(100),
)

CREATE TABLE FILIAL(
ID INT  PRIMARY KEY IDENTITY,
FILIAL NVARCHAR(100)
)

CREATE TABLE MEHSUL(
ID INT  PRIMARY KEY IDENTITY,
NAME NVARCHAR(100),
ALISH FLOAT NOT NULL,
SATISH FLOAT NOT NULL
)
CREATE TABLE SATISH(
ID INT  PRIMARY KEY IDENTITY,
MEHSULID INT FOREIGN KEY REFERENCES MEHSUL(ID),
ISHCIID INT FOREIGN KEY REFERENCES VEZIFE(VEZIFEID),
ENDIRIM FLOAT,
TARIX DATETIME 
)

INSERT INTO ISHCI
VALUES('IDK','SIMATA MAHARRAMLI',510),
('IDK','SIMARAA MAHARRAMLI',600)

SELECT*FROM ISHCI ORDER BY MAASH DESC

SELECT*FROM MEHSUL ORDER BY SATISH DESC

SELECT*FROM SATISH ORDER BY TARIX DESC
SELECT*FROM ISHCI JOIN VEZIFE ON ISHCI.VEZIFEID=VEZIFE.VEZIFEID 