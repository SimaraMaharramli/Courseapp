CREATE DATABASE SCHOOL
USE SCHOOL
CREATE TABLE STUDENT(
NAME NVARCHAR(100) NOT NULL,
SURNAME NVARCHAR(100) NOT NULL,
PHONE NVARCHAR(50) UNIQUE,
SCORE INT DEFAULT 50,
COMMENT NVARCHAR(100),
ISGRADUATED BIT DEFAULT 0
)
--DROP TABLE STUDENT

INSERT INTO STUDENT
VALUES('Simara', 'Maharramli','20545645',70,'',1)
INSERT INTO STUDENT
VALUES('DILARA', 'Azizov','205445545645',60,'ALAM',1)
INSERT INTO STUDENT
VALUES('HASAN', 'Aliyev','205456452566',80,'',1)
INSERT INTO STUDENT (NAME,SURNAME,PHONE,COMMENT,ISGRADUATED)
VALUES('SimaraNJG', 'Maharramli','20524563445645','',1)

UPDATE STUDENT
SET COMMENT='CONGRA'
WHERE SCORE >(SELECT AVG(SCORE) FROM STUDENT)

UPDATE STUDENT
SET COMMENT='SO BAD'
WHERE SCORE <(SELECT AVG(SCORE) FROM STUDENT)

INSERT INTO STUDENT (NAME,SURNAME,PHONE,COMMENT)
VALUES('SAMIR', 'MaMMADamli','012320524563445645','')
SELECT*FROM STUDENT

CREATE TABLE GRADUATESTUDENT(
NAME NVARCHAR(100) NOT NULL,
SURNAME NVARCHAR(100) NOT NULL,
PHONE NVARCHAR(50) UNIQUE,
SCORE INT DEFAULT 50,
COMMENT NVARCHAR(100),
ISGRADUATED BIT DEFAULT 0
)

INSERT INTO GRADUATESTUDENT
SELECT NAME,SURNAME,PHONE,SCORE FROM STUDENT WHERE ISGRADUATED=1


DELETE FROM STUDENT 
WHERE ISGRADUATED=1