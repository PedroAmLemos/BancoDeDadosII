--Excluind o usuario, se existir
DECLARE
    v_count INTEGER;
BEGIN
    SELECT COUNT(1) INTO v_count FROM ALL_USERS WHERE username = 'C##LIBRARY';
    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP USER c##library CASCADE';
    END IF;
END;
/

-- Criando o esquema
CREATE USER c##library IDENTIFIED BY library_password;
GRANT RESOURCE, CONNECT TO c##library;
ALTER USER c##library DEFAULT TABLESPACE users;
ALTER USER c##library TEMPORARY TABLESPACE temp;
ALTER USER c##library QUOTA UNLIMITED ON users;
grant create materialized view to c##library;
grant create any materialized view to c##library;
grant create any trigger to c##library;
grant create any procedure to c##library;
grant create any view to c##library;
grant create table to c##library;

-- APos isso, conectar com o banco como usuario c##library

-- Criando as tabelas
CREATE TABLE c##library.publisher
(
    name    VARCHAR2(80) PRIMARY KEY,
    address VARCHAR2(100),
    phone   VARCHAR2(15)
);

CREATE TABLE c##library.book
(
    book_id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title          VARCHAR2(40) NOT NULL,
    publisher_name VARCHAR2(80) NOT NULL,
    FOREIGN KEY (publisher_name) REFERENCES c##library.publisher (name)
);

CREATE TABLE c##library.book_authors
(
    book_id     NUMBER,
    author_name VARCHAR2(80),
    CONSTRAINT pk_authors PRIMARY KEY (book_id, author_name),
    FOREIGN KEY (book_id)
        REFERENCES c##library.book (book_id)
);

CREATE TABLE c##library.library_branch
(
    branch_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    branch_name VARCHAR2(80),
    address     VARCHAR2(40)
);

CREATE TABLE c##library.book_copies
(
    book_id      NUMBER,
    branch_id    NUMBER,
    no_of_copies NUMBER,
    CONSTRAINT pk_copies PRIMARY KEY (book_id, branch_id),
    FOREIGN KEY (book_id) REFERENCES c##library.book (book_id),
    FOREIGN KEY (branch_id) REFERENCES c##library.library_branch (branch_id)
);

CREATE TABLE c##library.borrower
(
    card_no NUMBER PRIMARY KEY,
    name    VARCHAR2(80),
    address VARCHAR2(40),
    phone   VARCHAR2(15)
);

CREATE TABLE c##library.book_loans
(
    book_id   NUMBER,
    branch_id NUMBER,
    card_no   NUMBER,
    date_out  DATE,
    due_date  DATE,
    CONSTRAINT pk_loans PRIMARY KEY (book_id, branch_id, card_no),
    FOREIGN KEY (book_id) REFERENCES c##library.book (book_id),
    FOREIGN KEY (branch_id) REFERENCES c##library.library_branch (branch_id),
    FOREIGN KEY (card_no) REFERENCES c##library.borrower (card_no)
);


-- Inserindo as publishers e um livro para cada publisher (palavras aleatorias)


INSERT INTO c##library.publisher (Name, Address, Phone)
VALUES ('squash', 'Endereço da squash', '43 3333 3333');
INSERT INTO c##library.book (Title, Publisher_name)
VALUES ('Livro 1', 'squash');
INSERT INTO c##library.publisher (Name, Address, Phone)
VALUES ('reverse', 'Endereço da reverse', '43 3333 3333');
INSERT INTO c##library.book (Title, Publisher_name)
VALUES ('Livro 2', 'reverse');
INSERT INTO c##library.publisher (Name, Address, Phone)
VALUES ('suppress', 'Endereço da suppress', '43 3333 3333');
INSERT INTO c##library.book (Title, Publisher_name)
VALUES ('Livro 3', 'suppress');
INSERT INTO c##library.publisher (Name, Address, Phone)
VALUES ('appear', 'Endereço da appear', '43 3333 3333');
INSERT INTO c##library.book (Title, Publisher_name)
VALUES ('Livro 4', 'appear');

-- Inserindo os autores (nomes aleatórios)


INSERT INTO c##library.book_authors (Book_id, Author_name)
VALUES (1, 'Jackie Manning');
INSERT INTO c##library.book_authors (Book_id, Author_name)
VALUES (2, 'Edmund Nicholson');
INSERT INTO c##library.book_authors (Book_id, Author_name)
VALUES (3, 'Valarie Perkins');
INSERT INTO c##library.book_authors (Book_id, Author_name)
VALUES (4, 'Terrell Jacobson');

-- Inserindo as branches


INSERT INTO c##library.library_branch (Branch_name, Address)
VALUES ('Regiao 1', 'Rua Aleatória 1');
INSERT INTO c##library.library_branch (Branch_name, Address)
VALUES ('Regiao 2', 'Rua Aleatória 2');
INSERT INTO c##library.library_branch (Branch_name, Address)
VALUES ('Regiao 3', 'Rua Aleatória 3');
INSERT INTO c##library.library_branch (Branch_name, Address)
VALUES ('Regiao 4', 'Rua Aleatória 4');



-- Inserindo as copias dos livros

INSERT INTO c##library.book_copies (book_id, branch_id, no_of_copies)
VALUES (1, 1, 3);
INSERT INTO c##library.book_copies (book_id, branch_id, no_of_copies)
VALUES (2, 2, 3);
INSERT INTO c##library.book_copies (book_id, branch_id, no_of_copies)
VALUES (3, 3, 3);
INSERT INTO c##library.book_copies (book_id, branch_id, no_of_copies)
VALUES (4, 4, 3);


-- Inserindo os membros


INSERT INTO c##library.borrower (Card_no, Name, Address, Phone)
VALUES (1, 'Theresa Gardner', 'endereço', 'telefone');
INSERT INTO c##library.borrower (Card_no, Name, Address, Phone)
VALUES (2, 'Michael Reynolds', 'endereço', 'telefone');
INSERT INTO c##library.borrower (Card_no, Name, Address, Phone)
VALUES (3, 'Harold Gray', 'endereço', 'telefone');
INSERT INTO c##library.borrower (Card_no, Name, Address, Phone)
VALUES (4, 'April Hanson', 'endereço', 'telefone');
INSERT INTO c##library.borrower (Card_no, Name, Address, Phone)
VALUES (5, 'Joshua Jones', 'endereço', 'telefone');
INSERT INTO c##library.borrower (Card_no, Name, Address, Phone)
VALUES (6, 'Emily Nguyen', 'endereço', 'telefone');
INSERT INTO c##library.borrower (Card_no, Name, Address, Phone)
VALUES (7, 'Charles Joyce', 'endereço', 'telefone');
INSERT INTO c##library.borrower (Card_no, Name, Address, Phone)
VALUES (8, 'Michael Moreno', 'endereço', 'telefone');
INSERT INTO c##library.borrower (Card_no, Name, Address, Phone)
VALUES (9, 'Erik Long', 'endereço', 'telefone');
INSERT INTO c##library.borrower (Card_no, Name, Address, Phone)
VALUES (10, 'Susan Colon', 'endereço', 'telefone');

COMMIT;

-- =========================EXERCICIOS =========================E
-- EXERCICIO 1
-- INSERINDO 2 LOAN, 1 ONDE O PERIODO É PELO MENOS 30 DIAS E OUTRA NÃO
INSERT INTO c##library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (1, 1, 1, TO_DATE('2016-08-19', 'YYYY-MM-DD'), TO_DATE('2016-11-19', 'YYYY-MM-DD')); -- deve aparecer
INSERT INTO c##library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (2, 2, 1, TO_DATE('2016-08-19', 'YYYY-MM-DD'), TO_DATE('2016-08-21', 'YYYY-MM-DD'));
-- nao deve aparecer

COMMIT;

CREATE MATERIALIZED VIEW c##library.month_borrowers AS
SELECT DISTINCT b.card_no,
       b.name,
       b.address,
       b.phone,
       bl.due_date - bl.date_out as loan_length,
       book.title,
       branch.branch_name
FROM c##library.Borrower b
         JOIN c##library.Book_Loans bl ON b.card_no = bl.card_no
         JOIN c##library.Book book ON bl.book_id = book.book_id
         JOIN c##library.Library_Branch branch ON bl.branch_id = branch.branch_id
         JOIN (SELECT COUNT(*) as count
               FROM c##library.book_loans bli
               WHERE bli.due_date - bli.date_out >= 30
               GROUP BY bli.card_no) more on bl.card_no = b.card_no
WHERE bl.due_date - bl.date_out >= 30
  and count > 1;



COMMIT;

-- NENHUM RESULTADO
SELECT *
FROM c##library.month_borrowers;

-- INSERINDO MAIS UM LOAN COM PELO MENOS 30 DIAS
INSERT INTO c##library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (3, 3, 1, TO_DATE('2016-08-19', 'YYYY-MM-DD'), TO_DATE('2016-09-19', 'YYYY-MM-DD'));
-- deve aparecer

-- ATUALIZA A VIEW
BEGIN
    DBMS_SNAPSHOT.REFRESH('month_borrowers');
end;

-- 2 LOANS COM PELO MENOS DE 30 DIAS
SELECT *
FROM c##library.month_borrowers;

-- Novas inserções para teste,
INSERT INTO c##library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (1, 1, 2, TO_DATE('2016-08-19', 'YYYY-MM-DD'), TO_DATE('2016-09-19', 'YYYY-MM-DD')); -- deve aparecer
INSERT INTO c##library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (2, 2, 2, TO_DATE('2016-08-19', 'YYYY-MM-DD'), TO_DATE('2016-09-19', 'YYYY-MM-DD')); -- deve aparecer
INSERT INTO c##library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (3, 3, 2, TO_DATE('2016-08-19', 'YYYY-MM-DD'), TO_DATE('2016-09-19', 'YYYY-MM-DD')); -- deve aparecer
INSERT INTO c##library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date)
VALUES (4, 4, 2, TO_DATE('2016-08-19', 'YYYY-MM-DD'), TO_DATE('2016-09-19', 'YYYY-MM-DD'));
-- deve aparecer
-- nao deve aparecer


-- ATUALIZA
BEGIN
    DBMS_SNAPSHOT.REFRESH('month_borrowers');
end;

-- 6 LOANS COM PELO MENOS 30 DIAS
select *
from c##library.month_borrowers;

-- EXERCICIO 2
-- Create temporary table
CREATE GLOBAL TEMPORARY TABLE c##library.current_book_copies
(
    book_id      NUMBER,
    branch_id    NUMBER,
    no_of_copies NUMBER
) ON COMMIT PRESERVE ROWS;

INSERT INTO c##library.current_book_copies (book_id,
                                 branch_id,
                                 no_of_copies)
SELECT book_id,
       branch_id,
       no_of_copies
FROM c##library.book_copies;

select *
from c##library.current_book_copies;


-- Remove no_of_copies column from book_copies table, constraint e adiciona colunas
TRUNCATE TABLE c##library.book_copies;
ALTER TABLE c##library.book_copies
    DROP COLUMN no_of_copies;
ALTER TABLE c##library.book_copies
    DROP CONSTRAINT pk_copies;
ALTER TABLE c##library.book_copies
    ADD acquisition_date DATE DEFAULT SYSDATE NOT NULL;
ALTER TABLE c##library.book_copies
    ADD condition VARCHAR(10) default 'fair' CHECK (condition IN ('fine', 'good', 'fair', 'poor'));
ALTER TABLE c##library.book_copies
    ADD copy_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY;
ALTER TABLE c##library.book_copies
    RENAME TO book_copies_new;

COMMIT;

ALTER TABLE c##library.book_loans
    ADD copy_id INT;

ALTER TABLE c##library.book_loans
    ADD CONSTRAINT loan_book_copy FOREIGN KEY (copy_id)
        REFERENCES c##library.book_copies_new (copy_id);

COMMIT;

-- Checa inconsistencias
SELECT cbc.book_id, cbc.branch_id, COUNT(c.book_id) AS current_count, cbc.no_of_copies
FROM c##library.book b
         LEFT JOIN c##library.book_copies_new c ON b.book_id = c.book_id
         JOIN c##library.current_book_copies cbc ON b.book_id = cbc.book_id
GROUP BY cbc.book_id, cbc.branch_id, cbc.no_of_copies
HAVING COUNT(c.book_id) <> cbc.no_of_copies
    OR COUNT(c.book_id) = 0;


-- inserir os livros da tabela copia para a tabela alterada
INSERT INTO c##library.book_copies_new (book_id, branch_id)
SELECT book_id, branch_id
FROM (SELECT book_id, branch_id, no_of_copies, LEVEL AS copy_index
      FROM c##library.current_book_copies
      CONNECT BY LEVEL <= no_of_copies
             AND PRIOR book_id = book_id
             AND PRIOR branch_id = branch_id
             AND PRIOR SYS_GUID() IS NOT NULL)
ORDER BY book_id, branch_id;

select *
from c##library.book_copies_new;

COMMIT;

-- Drop tabela temporária
TRUNCATE TABLE c##library.current_book_copies;
DROP TABLE c##library.current_book_copies;

-- View para compatibilidade
CREATE VIEW c##library.book_copies AS
SELECT b.book_id, c.branch_id, count(*) as no_of_copies
FROM c##library.book b
         JOIN c##library.book_copies_new c ON b.book_id = c.book_id
GROUP BY c.branch_id, b.book_id;

-- Trigger para delete na view
CREATE OR REPLACE TRIGGER c##library.delete_book_copy_trigger
    INSTEAD OF DELETE
    ON c##library.book_copies
    FOR EACH ROW
DECLARE
BEGIN
    DELETE
    FROM c##library.book_copies_new
    WHERE book_id = :OLD.book_id
      AND branch_id = :OLD.branch_id;
END;

select *
from c##library.book_copies;

select *
from c##library.book_copies_new;

DELETE
FROM c##library.book_copies bc
WHERE bc.book_id = 1;

select *
from c##library.book_copies;

select *
from c##library.book_copies_new;

-- Trigger para update na view
CREATE OR REPLACE TRIGGER c##library.update_book_copy_trigger
    INSTEAD OF UPDATE
    ON c##library.book_copies
    FOR EACH ROW
DECLARE
    difference_copies INTEGER;
    current_copies    INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO current_copies
    FROM book_copies_new
    WHERE book_id = :OLD.book_id AND branch_id = :OLD.branch_id;
    IF current_copies > :NEW.no_of_copies THEN
        RAISE_APPLICATION_ERROR(-20000, 'No number o copies reduction allowed');
    ELSIF current_copies < :NEW.no_of_copies AND :OLD.no_of_copies <> :NEW.no_of_copies THEN
        UPDATE book_copies_new
        SET book_id   = :NEW.book_id,
            branch_id = :NEW.branch_id
        WHERE book_id = :OLD.book_id
          AND branch_id = :OLD.branch_id;

        difference_copies := :NEW.no_of_copies - current_copies;
        FOR i IN 1..difference_copies
            LOOP
                INSERT INTO book_copies_new(book_id, branch_id, acquisition_date, condition)
                VALUES (:NEW.book_id, :NEW.branch_id, SYSDATE, 'good');
            END LOOP;
    ELSE
        UPDATE book_copies_new
        SET book_id   = :NEW.book_id,
            branch_id = :NEW.branch_id
        WHERE book_id = :OLD.book_id
          AND branch_id = :OLD.branch_id;
    END IF;
END;

UPDATE c##library.book_copies
SET no_of_copies = 10
where book_id = 2
  and branch_id = 2;

select *
from c##library.book_copies;
select *
from c##library.book_copies_new;

-- trigger para insert
CREATE OR REPLACE PROCEDURE c##library.insert_book_copy(
    p_book_id c##library.book_copies.book_id%TYPE,
    p_branch_id c##library.book_copies.branch_id%TYPE,
    p_no_of_copies NUMBER
) AS
BEGIN
    FOR i IN 1..p_no_of_copies
        LOOP
            INSERT INTO book_copies_new (book_id, branch_id, acquisition_date, condition)
            VALUES (p_book_id, p_branch_id, SYSDATE, 'poor');
        END LOOP;
END insert_book_copy;

CREATE OR REPLACE TRIGGER c##library.insert_book_copy_trigger
    INSTEAD OF INSERT
    ON c##library.book_copies
    FOR EACH ROW
BEGIN
    c##library.insert_book_copy(:NEW.book_id, :NEW.branch_id, :NEW.no_of_copies);
END insert_book_copy_trigger;

INSERT INTO c##library.book_copies(book_id, branch_id, no_of_copies)
VALUES (1, 1, 10);

SELECT *
FROM c##library.book_copies_new;

SELECT *
FROM c##library.book_copies;

-- EXERCICIO 3


-- Criar a tabela de logs
CREATE TABLE c##library.author_update_log
(
    log_id           NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    book_id          INT,
    old_author_name  VARCHAR(80),
    new_author_name  VARCHAR(80),
    update_timestamp TIMESTAMP,
    FOREIGN KEY (book_id) REFERENCES c##library.book (book_id)
);

-- Funcao para checar se dois nomes são similares
CREATE OR REPLACE FUNCTION c##library.names_are_similar(name1 VARCHAR2, name2 VARCHAR2) RETURN BOOLEAN
    IS
    name1_parts    DBMS_SQL.VARCHAR2_TABLE;
    name2_parts    DBMS_SQL.VARCHAR2_TABLE;
    num_parts1     INT;
    num_parts2     INT;
    i              INT;
    total_distance INT := 0;
    max_distance   INT := 2;
BEGIN
    -- divide o nome em partes
    SELECT REGEXP_SUBSTR(name1, '[^ ]+', 1, LEVEL) BULK COLLECT
    INTO name1_parts
    FROM DUAL
    CONNECT BY LEVEL <= LENGTH(REGEXP_REPLACE(name1, '[^ ]+')) + 1;
    SELECT REGEXP_SUBSTR(name2, '[^ ]+', 1, LEVEL) BULK COLLECT
    INTO name2_parts
    FROM DUAL
    CONNECT BY LEVEL <= LENGTH(REGEXP_REPLACE(name2, '[^ ]+')) + 1;

    num_parts1 := name1_parts.COUNT;
    num_parts2 := name2_parts.COUNT;

-- Se o numero de partes não for igual, os nome já não são equivalente
    IF num_parts1 <> num_parts2 THEN
        RETURN FALSE;
    END IF;

-- para cada parte do nome, checar se o nome é abreviado
    FOR i IN 1..num_parts1
        LOOP
            IF REGEXP_LIKE(name1_parts(i), '^[A-Za-z].$') OR REGEXP_LIKE(name2_parts(i), '^[A-Za-z].$') THEN
-- Se um dos nomes comeca abreviado, checa a primeira letra
                IF SUBSTR(name1_parts(i), 1, 1) <> SUBSTR(name2_parts(i), 1, 1) THEN
                    RETURN FALSE;
                END IF;
            ELSE
-- Se todas as partes forem palavras complear checa a distancia entre elas
                total_distance :=
                            total_distance + UTL_MATCH.edit_distance(LOWER(name1_parts(i)), LOWER(name2_parts(i)));
                -- Se a distancia total for maior que a maxima permitida, retorna falso
                IF total_distance > max_distance THEN
                    RETURN FALSE;
                END IF;
            END IF;
        END LOOP;

-- Se todas as partes forem iguais, retorna verdadeiro
    RETURN TRUE;
END;


CREATE OR REPLACE PROCEDURE c##library.reconcile_authors
    IS
    author1                    VARCHAR2(200);
    author2                    VARCHAR2(200);
    frequent_author_name       VARCHAR2(200);
    least_frequent_author_name VARCHAR2(200);
    cursor_author1             SYS_REFCURSOR;
    cursor_author2             SYS_REFCURSOR;
BEGIN
    OPEN cursor_author1 FOR
        SELECT DISTINCT author_name FROM c##library.book_authors;
    LOOP
        FETCH cursor_author1 INTO author1;
        EXIT WHEN cursor_author1%NOTFOUND;
        OPEN cursor_author2 FOR
            SELECT DISTINCT author_name FROM c##library.book_authors WHERE author_name <> author1;
        LOOP
            FETCH cursor_author2 INTO author2;
            EXIT WHEN cursor_author2%NOTFOUND;
            IF names_are_similar(author1, author2) THEN
-- Determinar o mais frequente e o menos frequente
                SELECT a1.author_name, a2.author_name
                INTO frequent_author_name, least_frequent_author_name
                FROM (SELECT author_name, COUNT(*) count
                      FROM c##library.book_authors
                      WHERE author_name = author1
                      GROUP BY author_name) a1,
                     (SELECT author_name, COUNT(*) count
                      FROM c##library.book_authors
                      WHERE author_name = author2
                      GROUP BY author_name) a2
                WHERE a1.count >= a2.count;

                -- Update do menos frequente pelo mais frequente
                UPDATE c##library.book_authors
                SET author_name = frequent_author_name
                WHERE author_name = least_frequent_author_name;

                -- Log do update
                INSERT INTO author_update_log (book_id, old_author_name, new_author_name, update_timestamp)
                SELECT book_id, least_frequent_author_name, frequent_author_name, SYSTIMESTAMP
                FROM c##library.book_authors
                WHERE author_name = frequent_author_name;
            END IF;
        END LOOP;
        CLOSE cursor_author2;
    END LOOP;
    CLOSE cursor_author1;
END;
COMMIT;

-- Dados de teste
INSERT INTO c##library.publisher(name)
VALUES ('Publisher 1');

INSERT INTO c##library.book (title, publisher_name)
VALUES ('Book 1', 'Publisher 1');
INSERT INTO c##library.book (title, publisher_name)
VALUES ('Book 2', 'Publisher 1');
INSERT INTO c##library.book (title, publisher_name)
VALUES ('Book 3', 'Publisher 1');
INSERT INTO c##library.book (title, publisher_name)
VALUES ('Book 4', 'Publisher 1');
INSERT INTO c##library.book (title, publisher_name)
VALUES ('Book 5', 'Publisher 1');
INSERT INTO c##library.book (title, publisher_name)
VALUES ('Book 6', 'Publisher 1');
INSERT INTO c##library.book (title, publisher_name)
VALUES ('Book 7', 'Publisher 1');
INSERT INTO c##library.book (title, publisher_name)
VALUES ('Book 8', 'Publisher 1');
INSERT INTO c##library.book (title, publisher_name)
VALUES ('Book 9', 'Publisher 1');

INSERT INTO c##library.book_authors (book_id, author_name)
VALUES (1, 'John Joseph Powell');
INSERT INTO c##library.book_authors (book_id, author_name)
VALUES (2, 'John J. Powell');
INSERT INTO c##library.book_authors (book_id, author_name)
VALUES (3, 'John Joseph Powel');
INSERT INTO c##library.book_authors (book_id, author_name)
VALUES (4, 'John Joseph Powel');

COMMIT;

-- Chama o procedimento
CALL c##library.reconcile_authors();

-- Checa os dados atualizados
SELECT *
FROM c##library.book_authors;
SELECT *
FROM c##library.author_update_log;
