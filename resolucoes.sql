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
VALUES ('squash', 'Endereço da squash', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (1, 'Livro 1', 'squash');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('reverse', 'Endereço da reverse', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (2, 'Livro 2', 'reverse');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('suppress', 'Endereço da suppress', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (3, 'Livro 3', 'suppress');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('appear', 'Endereço da appear', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (4, 'Livro 4', 'appear');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('fibre', 'Endereço da fibre', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (5, 'Livro 5', 'fibre');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('rare', 'Endereço da rare', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (6, 'Livro 6', 'rare');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('indoor', 'Endereço da indoor', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (7, 'Livro 7', 'indoor');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('accident', 'Endereço da accident', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (8, 'Livro 8', 'accident');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('glide', 'Endereço da glide', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (9, 'Livro 9', 'glide');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('rest', 'Endereço da rest', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (10, 'Livro 10', 'rest');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('mill', 'Endereço da mill', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (11, 'Livro 11', 'mill');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('injury', 'Endereço da injury', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (12, 'Livro 12', 'injury');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('hover', 'Endereço da hover', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (13, 'Livro 13', 'hover');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('bitch', 'Endereço da bitch', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (14, 'Livro 14', 'bitch');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('apology', 'Endereço da apology', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (15, 'Livro 15', 'apology');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('army', 'Endereço da army', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (16, 'Livro 16', 'army');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('family', 'Endereço da family', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (17, 'Livro 17', 'family');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('skilled', 'Endereço da skilled', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (18, 'Livro 18', 'skilled');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('tent', 'Endereço da tent', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (19, 'Livro 19', 'tent');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('gesture', 'Endereço da gesture', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (20, 'Livro 20', 'gesture');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('belief', 'Endereço da belief', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (21, 'Livro 21', 'belief');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('thought', 'Endereço da thought', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (22, 'Livro 22', 'thought');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('worth', 'Endereço da worth', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (23, 'Livro 23', 'worth');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('hunting', 'Endereço da hunting', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (24, 'Livro 24', 'hunting');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('install', 'Endereço da install', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (25, 'Livro 25', 'install');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('rocket', 'Endereço da rocket', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (26, 'Livro 26', 'rocket');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('false', 'Endereço da false', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (27, 'Livro 27', 'false');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('bracket', 'Endereço da bracket', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (28, 'Livro 28', 'bracket');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('demonstration', 'Endereço da demonstration', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (29, 'Livro 29', 'demonstration');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('dine', 'Endereço da dine', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (30, 'Livro 30', 'dine');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('loose', 'Endereço da loose', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (31, 'Livro 31', 'loose');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('initiative', 'Endereço da initiative', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (32, 'Livro 32', 'initiative');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('calculation', 'Endereço da calculation', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (33, 'Livro 33', 'calculation');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('content', 'Endereço da content', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (34, 'Livro 34', 'content');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('vacuum', 'Endereço da vacuum', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (35, 'Livro 35', 'vacuum');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('carbon', 'Endereço da carbon', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (36, 'Livro 36', 'carbon');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('concession', 'Endereço da concession', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (37, 'Livro 37', 'concession');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('stun', 'Endereço da stun', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (38, 'Livro 38', 'stun');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('wedding', 'Endereço da wedding', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (39, 'Livro 39', 'wedding');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('ballot', 'Endereço da ballot', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (40, 'Livro 40', 'ballot');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('perforate', 'Endereço da perforate', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (41, 'Livro 41', 'perforate');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('roof', 'Endereço da roof', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (42, 'Livro 42', 'roof');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('vessel', 'Endereço da vessel', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (43, 'Livro 43', 'vessel');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('dash', 'Endereço da dash', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (44, 'Livro 44', 'dash');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('mix', 'Endereço da mix', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (45, 'Livro 45', 'mix');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('pain', 'Endereço da pain', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (46, 'Livro 46', 'pain');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('star', 'Endereço da star', '43 3333 3333');
INSERT INTO library.book (Book_id, Title, Publisher_name)
VALUES (47, 'Livro 47', 'star');


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
VALUES (1, 'Regiao 1', 'Rua Aleatória 1');
INSERT INTO library.library_branch (Branch_id, Branch_name, Address)
VALUES (2, 'Regiao 2', 'Rua Aleatória 2');
INSERT INTO library.library_branch (Branch_id, Branch_name, Address)
VALUES (3, 'Regiao 3', 'Rua Aleatória 3');
INSERT INTO library.library_branch (Branch_id, Branch_name, Address)
VALUES (4, 'Regiao 4', 'Rua Aleatória 4');


-- Inserindo as copias dos livros


INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (1, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (2, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (3, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (4, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (5, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (6, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (7, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (8, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (9, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (10, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (11, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (12, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (13, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (14, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (15, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (16, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (17, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (18, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (19, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (20, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (21, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (22, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (23, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (24, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (25, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (26, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (27, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (28, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (29, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (30, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (31, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (32, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (33, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (34, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (35, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (36, 4, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (37, 1, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (38, 2, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (39, 3, 3);
INSERT INTO library.book_copies (book_id, branch_id, no_of_copies)
VALUES (40, 4, 3);


-- Inserindo os membros


INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (1, 'Theresa Gardner', 'endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (2, 'Michael Reynolds', 'endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (3, 'Harold Gray', 'endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (4, 'April Hanson', 'endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (5, 'Joshua Jones', 'endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (6, 'Emily Nguyen', 'endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (7, 'Charles Joyce', 'endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (8, 'Michael Moreno', 'endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (9, 'Erik Long', 'endereço', 'telefone');
INSERT INTO library.borrower (Card_no, Name, Address, Phone)
VALUES (10, 'Susan Colon', 'endereço', 'telefone');

-- =========================EXERCICIOS =========================E
-- EXERCICIO 1
-- INSERINDO 2 LOAN, 1 ONDE O PERIODO É PELO MENOS 30 DIAS E OUTRA NÃO
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (1, 1, 1, '2016-08-19', '2016-11-19'); -- deve aparecer
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (2, 2, 1, '2016-08-19', '2016-08-21');
-- nao deve aparecer

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
         JOIN (SELECT COUNT(*) as count
               FROM library.book_loans bli
               WHERE bli.due_date - bli.date_out >= 30
               GROUP BY bli.card_no) more on bl.card_no = b.card_no
WHERE bl.due_date - bl.date_out >= 30
  and count > 1;


-- NENHUM RESULTADO
SELECT *
FROM library.month_borrowers;

-- INSERINDO MAIS UM LOAN COM PELO MENOS 30 DIAS
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (3, 3, 1, '2016-08-19', '2016-09-19');
-- deve aparecer

-- ATUALIZA A VIEW
REFRESH MATERIALIZED VIEW library.month_borrowers;

-- 2 LOANS COM PELO MENOS DE 30 DIAS
SELECT *
FROM library.month_borrowers;

-- Novas inserções para teste,
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (1, 1, 2, '2016-08-19', '2016-09-19'); -- deve aparecer
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (2, 2, 2, '2016-08-19', '2016-10-19'); -- deve aparecer
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (3, 3, 2, '2016-08-19', '2016-11-19'); -- deve aparecer
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (4, 4, 2, '2016-08-19', '2016-08-21');
-- nao deve aparecer


-- ATUALIZA
REFRESH MATERIALIZED VIEW library.month_borrowers;

-- 5 LOANS COM PELO MENOS 30 DIAS
select *
from library.month_borrowers;

-- EXERCICIO 2
BEGIN;
-- Create temporary table
CREATE TEMPORARY TABLE current_book_copies AS
SELECT book_id,
       branch_id,
       no_of_copies
FROM library.book_copies;

-- Remove no_of_copies column from book_copies table, constraint and adding columns
ALTER TABLE library.book_copies
    DROP COLUMN no_of_copies;
ALTER TABLE library.book_copies
    DROP CONSTRAINT pk_copies;
ALTER TABLE library.book_copies
    ADD COLUMN acquisition_date DATE NOT NULL DEFAULT CURRENT_DATE;
ALTER TABLE library.book_copies
    ADD COLUMN condition VARCHAR(10) NOT NULL CHECK (condition IN ('fine', 'good', 'fair', 'poor')) DEFAULT 'fair';
ALTER TABLE library.book_copies
    ADD COLUMN copy_id SERIAL PRIMARY KEY;
ALTER TABLE library.book_copies
    RENAME TO book_copies_new;

ALTER TABLE library.book_loans
    ADD COLUMN copy_id INT,
    ADD CONSTRAINT loan_book_copy FOREIGN KEY (copy_id)
        REFERENCES library.book_copies_new (copy_id);

-- Checa inconsistencias
SELECT *
FROM (SELECT cbc.book_id, cbc.branch_id, COUNT(*), cbc.no_of_copies
      FROM library.book b
               JOIN library.book_copies_new c on b.book_id = c.book_id
               JOIN current_book_copies cbc on b.book_id = cbc.book_id
      group by cbc.book_id, cbc.branch_id, cbc.no_of_copies) AS temp
WHERE temp.count <> temp.no_of_copies;


-- inserir os livros da tabela copia para a tabela alterada
INSERT INTO library.book_copies_new (book_id, branch_id)
select book_id, branch_id
from (SELECT book_id, branch_id, generate_series(1, no_of_copies - 1)
      FROM pg_temp.current_book_copies
      ORDER BY book_id, branch_id) as carlos;

select *
from library.book_copies_new;

COMMIT;

-- Drop temporary table
DROP TABLE pg_temp.current_book_copies;

-- Create view for backward compatibility
CREATE VIEW library.book_copies AS
SELECT b.book_id, c.branch_id, count(*) as no_of_copies
FROM library.book b
         JOIN library.book_copies_new c ON b.book_id = c.book_id
GROUP BY c.branch_id, b.book_id;

-- Create trigger for delete from view
CREATE OR REPLACE FUNCTION delete_book_copy()
    RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM library.book_copies_new
    WHERE book_id = OLD.book_id AND branch_id = OLD.branch_id;
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_book_copy_trigger
    INSTEAD OF DELETE ON library.book_copies
    FOR EACH ROW
EXECUTE FUNCTION delete_book_copy();

select * from library.book_copies;
select * from library.book_copies_new;
DELETE FROM library.book_copies bc WHERE bc.book_id=1;
select * from library.book_copies;
select * from library.book_copies_new;

-- Create trigger for update on view
CREATE OR REPLACE FUNCTION update_book_copy()
    RETURNS TRIGGER AS $$
DECLARE
    difference_copies INTEGER;
    current_copies INTEGER;
BEGIN
    SELECT COUNT(*) INTO current_copies FROM library.book_copies_new WHERE book_id = OLD.book_id AND branch_id = OLD.branch_id;

    IF current_copies > NEW.no_of_copies THEN
        RAISE EXCEPTION 'No number o copies reduction allowed';
    ELSEIF current_copies < NEW.no_of_copies AND old.no_of_copies <> NEW.no_of_copies THEN
        UPDATE library.book_copies_new
        SET book_id = NEW.book_id,
            branch_id = NEW.branch_id
        WHERE book_id = OLD.book_id AND branch_id = OLD.branch_id;

        difference_copies := NEW.no_of_copies - current_copies;
        for _ in 1..difference_copies LOOP
                INSERT INTO library.book_copies_new(book_id, branch_id, acquisition_date, condition)
                VALUES (NEW.book_id, NEW.branch_id, CURRENT_DATE, 'good');
            end loop;
    ELSE
        UPDATE library.book_copies_new
        SET book_id = NEW.book_id, branch_id = NEW.branch_id WHERE book_id = OLD.book_id AND branch_id = OLD.branch_id;
    end if;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_book_copy_trigger
    INSTEAD OF UPDATE ON library.book_copies
    FOR EACH ROW
EXECUTE FUNCTION update_book_copy();


UPDATE library.book_copies SET no_of_copies = 10 where book_id=2 and branch_id = 2;

select * from library.book_copies;
select * from library.book_copies_new;

-- trigger para insert
CREATE OR REPLACE FUNCTION library.insert_book_copy() RETURNS TRIGGER AS $$
BEGIN
    FOR _ IN 1..NEW.no_of_copies LOOP
            INSERT INTO library.book_copies_new(book_id, branch_id, acquisition_date, condition)
            VALUES(NEW.book_id, NEW.branch_id, CURRENT_DATE, 'poor');
        end loop;
    RETURN NEW;
end;
$$ LANGUAGE  PLPGSQL;

CREATE TRIGGER insert_book_copy_trigger
    INSTEAD OF INSERT ON library.book_copies
    FOR EACH ROW
EXECUTE FUNCTION library.insert_book_copy();


INSERT INTO library.book_copies(book_id, branch_id, no_of_copies)
VALUES(1, 1, 10);

SELECT * FROM library.book_copies_new;
SELECT * FROM library.book_copies;

-- EXERCICIO 3
CREATE TABLE library.author_update_log
(
    log_id      SERIAL PRIMARY KEY,
    book_id     INT,
    old_name    VARCHAR(80),
    new_name    VARCHAR(80),
    update_time TIMESTAMP
);

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;


CREATE OR REPLACE FUNCTION library.name_similarity(name1 VARCHAR, name2 VARCHAR) RETURNS INT
AS $$
BEGIN
    RETURN levenshtein(LOWER($1), LOWER($2));
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE library.reconcile_authors()
LANGUAGE plpgsql
AS $$
DECLARE
    rec1 RECORD;
    rec2 RECORD;
BEGIN
    -- Create a temporary table to store update operations
    CREATE TEMP TABLE updates_to_apply (book_id INT, old_name VARCHAR(80), new_name VARCHAR(80));

    FOR rec1 IN (SELECT * FROM library.book_authors) LOOP
        FOR rec2 IN (SELECT * FROM library.book_authors WHERE book_id <> rec1.book_id AND author_name <> rec1.author_name) LOOP
            IF library.name_similarity(rec1.author_name, rec2.author_name) <= 2 THEN
                IF SUBSTRING(rec1.author_name, 1, 1) = SUBSTRING(rec2.author_name, 1, 1) AND SUBSTRING(rec1.author_name FROM ' [A-Za-z]\.') = SUBSTRING(rec2.author_name FROM ' [A-Za-z]\.') THEN
                    -- Store the update operations in the temporary table
                    INSERT INTO updates_to_apply (book_id, old_name, new_name)
                    VALUES (rec2.book_id, rec2.author_name, rec1.author_name);
                END IF;
            END IF;
        END LOOP;
    END LOOP;

    -- Perform the update operations and log them
    FOR rec2 IN (SELECT * FROM updates_to_apply) LOOP
        UPDATE library.book_authors
        SET author_name = rec2.new_name
        WHERE book_id = rec2.book_id AND author_name = rec2.old_name;

        INSERT INTO library.author_update_log (book_id, old_name, new_name, update_time)
        VALUES (rec2.book_id, rec2.old_name, rec2.new_name, NOW());
    END LOOP;

    -- Drop the temporary table
    DROP TABLE updates_to_apply;
END;
$$;

-- Insert test data
INSERT INTO library.publisher(name) VALUES('Publisher 1');

INSERT INTO library.book (title, publisher_name) VALUES ('Book 1', 'Publisher 1');
INSERT INTO library.book (title, publisher_name) VALUES ('Book 2', 'Publisher 1');
INSERT INTO library.book (title, publisher_name) VALUES ('Book 3', 'Publisher 1');


SELECT * FROM library.book;

INSERT INTO library.book_authors (book_id, author_name) VALUES (1, 'John Joseph Powell');
INSERT INTO library.book_authors (book_id, author_name) VALUES (2, 'John J. Powell');
INSERT INTO library.book_authors (book_id, author_name) VALUES (3, 'John Joseph Powel');

-- Call the procedure
CALL library.reconcile_authors();

-- Check the updated data
SELECT * FROM library.book_authors;
SELECT * FROM library.author_update_log;

