CREATE DATABASE IF NOT EXISTS msisdb;
USE msisdb;

DROP TABLE IF EXISTS student;
CREATE TABLE student (
	id int PRIMARY KEY AUTO_INCREMENT ,
    username varchar(24) UNIQUE NOT NULL,
    name varchar(48)
);

INSERT INTO student (id, username, name) VALUES 
(1, 'tomgreg', 'Tom Gregory'),
(2, 'beth1', 'Beth Barnhart'),
(3, 'bipin', 'Prof. Prabhakar');

-- SELECT * FROM students;

DROP TABLE IF EXISTS offer;
CREATE TABLE offer (
	id int PRIMARY KEY AUTO_INCREMENT,
    studentId int NOT NULL REFERENCES student(id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
	companyName VARCHAR(24) NOT NULL DEFAULT '',
    salary int NOT NULL DEFAULT 0,
    bonus int NOT NULL DEFAULT 0,
	offerDate date NOT NULL DEFAULT(CURRENT_DATE)
);

-- Student 1 has no offers, Student 2 has 3 offers, Student 3 has one offer
INSERT INTO offer(id, studentId, companyName, salary, bonus, offerDate) VALUES
  (1, 2, 'KPMG', 95000, 7000, '2021-09-30'),
  (2, 2, 'Deloitte Digital', 94000, 12000, '2021-10-03'),
  (3, 2, 'IU, ISGP', 54000, 0, '2021-10-05'),
  (4, 3, 'Amazon', 122000, 11000, '2021-10-15')
;

DROP TABLE IF EXISTS books;
CREATE TABLE books (
	id int PRIMARY KEY,
    title varchar(24),
    author varchar(48),
    publishYear int,
    publisher varchar(48),  
    pageNumber int, 
    msrp float
);

INSERT INTO books (id, title, author, publishYear, publisher, pageNumber, msrp) VALUES 
(1, 'How To Graduate Grad School', 'Jeff Yu', 2021, 'McGraw-Hill Education', 568, 599.99),
(2, 'MSIS 101', 'Class of 2021', 2022, 'Penguin/Random House', 897, 10000.00),
(3, 'Programming for Dumbies', 'Anonymous Professor', 2018, 'Harper Collins', 105, 1939.99),
(4, 'How to Get a Job', 'GCS', 2021, 'Simon and Schuster', 209, 899.99);