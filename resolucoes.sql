DROP SCHEMA IF EXISTS library CASCADE;
CREATE SCHEMA library;

-- Criando as tabelas
CREATE TABLE library.publisher
(
    name    VARCHAR(80) PRIMARY KEY,
    address VARCHAR(100),
    phone   VARCHAR(15)
);

CREATE TABLE library.book
(
    book_id        SERIAL PRIMARY KEY,
    title          VARCHAR(40) NOT NULL,
    publisher_name VARCHAR(80) NOT NULL,
    FOREIGN KEY (publisher_name) REFERENCES library.publisher (name)
);

CREATE TABLE library.book_authors
(
    book_id     INT,
    author_name VARCHAR(80),
    CONSTRAINT pk_authors PRIMARY KEY (book_id, author_name),
    FOREIGN KEY (book_id) REFERENCES library.book (book_id)
);

CREATE TABLE library.library_Branch
(
    branch_id   SERIAL PRIMARY KEY,
    branch_name VARCHAR(80),
    address     VARCHAR(40)
);

CREATE TABLE library.book_copies
(
    book_id      INT,
    branch_id    INT,
    no_of_copies INT,
    CONSTRAINT pk_copies PRIMARY KEY (book_id, branch_id),
    FOREIGN KEY (book_id) REFERENCES library.book (book_id),
    FOREIGN KEY (branch_id) REFERENCES library.library_branch (branch_id)
);

CREATE TABLE library.borrower
(
    card_no INT PRIMARY KEY,
    name    VARCHAR(80),
    address VARCHAR(40),
    phone   VARCHAR(15)
);

CREATE TABLE library.book_loans
(
    book_id   INT,
    branch_id INT,
    card_no   INT,
    date_out  DATE,
    due_date  DATE,
    CONSTRAINT pk_loans PRIMARY KEY (book_id, branch_id, card_no),
    FOREIGN KEY (book_id) REFERENCES library.book (book_id),
    FOREIGN KEY (branch_id) REFERENCES library.library_branch (branch_id),
    FOREIGN KEY (card_no) REFERENCES library.borrower (card_no)
);


-- Inserindo as publishers e um livro para cada publisher (palavras aleatorias)


INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('squash','Endereço da squash','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (1,'Livro 1','squash');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('reverse','Endereço da reverse','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (2,'Livro 2','reverse');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('suppress','Endereço da suppress','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (3,'Livro 3','suppress');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('appear','Endereço da appear','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (4,'Livro 4','appear');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('fibre','Endereço da fibre','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (5,'Livro 5','fibre');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('rare','Endereço da rare','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (6,'Livro 6','rare');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('indoor','Endereço da indoor','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (7,'Livro 7','indoor');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('accident','Endereço da accident','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (8,'Livro 8','accident');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('glide','Endereço da glide','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (9,'Livro 9','glide');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('rest','Endereço da rest','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (10,'Livro 10','rest');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('mill','Endereço da mill','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (11,'Livro 11','mill');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('injury','Endereço da injury','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (12,'Livro 12','injury');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('hover','Endereço da hover','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (13,'Livro 13','hover');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('bitch','Endereço da bitch','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (14,'Livro 14','bitch');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('apology','Endereço da apology','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (15,'Livro 15','apology');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('army','Endereço da army','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (16,'Livro 16','army');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('family','Endereço da family','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (17,'Livro 17','family');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('skilled','Endereço da skilled','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (18,'Livro 18','skilled');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('tent','Endereço da tent','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (19,'Livro 19','tent');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('gesture','Endereço da gesture','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (20,'Livro 20','gesture');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('belief','Endereço da belief','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (21,'Livro 21','belief');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('thought','Endereço da thought','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (22,'Livro 22','thought');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('worth','Endereço da worth','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (23,'Livro 23','worth');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('hunting','Endereço da hunting','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (24,'Livro 24','hunting');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('install','Endereço da install','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (25,'Livro 25','install');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('rocket','Endereço da rocket','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (26,'Livro 26','rocket');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('false','Endereço da false','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (27,'Livro 27','false');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('bracket','Endereço da bracket','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (28,'Livro 28','bracket');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('demonstration','Endereço da demonstration','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (29,'Livro 29','demonstration');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('dine','Endereço da dine','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (30,'Livro 30','dine');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('loose','Endereço da loose','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (31,'Livro 31','loose');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('initiative','Endereço da initiative','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (32,'Livro 32','initiative');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('calculation','Endereço da calculation','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (33,'Livro 33','calculation');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('content','Endereço da content','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (34,'Livro 34','content');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('vacuum','Endereço da vacuum','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (35,'Livro 35','vacuum');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('carbon','Endereço da carbon','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (36,'Livro 36','carbon');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('concession','Endereço da concession','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (37,'Livro 37','concession');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('stun','Endereço da stun','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (38,'Livro 38','stun');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('wedding','Endereço da wedding','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (39,'Livro 39','wedding');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('ballot','Endereço da ballot','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (40,'Livro 40','ballot');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('perforate','Endereço da perforate','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (41,'Livro 41','perforate');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('roof','Endereço da roof','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (42,'Livro 42','roof');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('vessel','Endereço da vessel','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (43,'Livro 43','vessel');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('dash','Endereço da dash','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (44,'Livro 44','dash');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('mix','Endereço da mix','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (45,'Livro 45','mix');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('pain','Endereço da pain','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (46,'Livro 46','pain');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('star','Endereço da star','43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (47,'Livro 47','star');


-- Inserindo os autores (nomes aleatórios)


INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (1, 'Jackie Manning');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (2, 'Edmund Nicholson');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (3, 'Valarie Perkins');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (4, 'Terrell Jacobson');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (5, 'Daren Avery');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (6, 'Josef Carpenter');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (7, 'Jess Richard');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (8, 'Aubrey Cochran');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (9, 'Al Davila');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (10, 'Susan Gilbert');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (11, 'Ray Meyers');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (12, 'Leonard Weaver');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (13, 'Ernestine Silva');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (14, 'Ida Andrade');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (15, 'Rory Mckenzie');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (16, 'Laverne Oconnor');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (17, 'Ashlee Weeks');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (18, 'Lillian Randall');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (19, 'Kim Kirby');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (20, 'Gonzalo Peterson');
INSERT INTO library.book_authors (Book_id, Author_name)
VALUES (21, 'Kristofer Lam');


-- Inserindo as branches


INSERT INTO library.library_branch (Branch_id, Branch_name, Address)
VALUES (1,'Regiao 1','Rua Aleatória 1');
INSERT INTO library.library_branch (Branch_id, Branch_name, Address)
VALUES (2,'Regiao 2','Rua Aleatória 2');
INSERT INTO library.library_branch (Branch_id, Branch_name, Address)
VALUES (3,'Regiao 3','Rua Aleatória 3');
INSERT INTO library.library_branch (Branch_id, Branch_name, Address)
VALUES (4,'Regiao 4','Rua Aleatória 4');


-- Inserindo as copias dos livros


INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (1, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (2, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (3, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (4, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (5, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (6, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (7, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (8, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (9, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (10, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (11, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (12, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (13, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (14, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (15, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (16, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (17, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (18, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (19, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (20, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (21, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (22, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (23, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (24, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (25, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (26, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (27, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (28, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (29, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (30, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (31, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (32, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (33, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (34, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (35, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (36, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (37, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (38, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (39, 4, 3);


-- Inserindo os membros


INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (1,'Theresa Gardner','endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (2,'Michael Reynolds','endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (3,'Harold Gray','endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (4,'April Hanson','endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (5,'Joshua Jones','endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (6,'Emily Nguyen','endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (7,'Charles Joyce','endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (8,'Michael Moreno','endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (9,'Erik Long','endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (10,'Susan Colon','endereço', 'telefone');



-- EXERCICIO 1
-- TESTANDO
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (1, 1, 1, '2016-08-19', '2016-09-19'); -- deve aparecer
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (2, 2, 1, '2016-08-19', '2016-10-19'); -- deve aparecer
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (3, 3, 1, '2016-08-19', '2016-11-19'); -- deve aparecer
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (4, 4, 1, '2016-08-19', '2016-08-21'); -- nao deve aparecer

-- CRIANDO AS VIEWS
CREATE MATERIALIZED VIEW library.month_borrowers AS
SELECT b.card_no,
       b.name,
       b.address,
       b.phone,
       bl.due_date - bl.date_out as loan_length,
       book.title,
       branch.branch_name
FROM library.Borrower b
         JOIN library.Book_Loans bl ON b.card_no = bl.card_no
         JOIN library.Book book ON bl.book_id = book.book_id
         JOIN library.Library_Branch branch ON bl.branch_id = branch.branch_id
WHERE bl.due_date - bl.date_out >= 30;

SELECT * FROM library.month_borrowers;

-- Novas inserções para teste,
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (1,1,2,'2016-08-19','2016-09-19'); -- deve aparecer
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (2,2,2,'2016-08-19','2016-10-19'); -- deve aparecer
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (3,3,2,'2016-08-19','2016-11-19'); -- deve aparecer
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (4,4,2,'2016-08-19','2016-08-21'); -- nao deve aparecer


-- ATUALIZA
REFRESH MATERIALIZED VIEW library.month_borrowers;

select * from library.month_borrowers;