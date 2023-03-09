select * from library.book;
select * from library.publisher;
SELECT COUNT(*) FROM library.book b WHERE b.title='The Lost Tribe';
SELECT * from library.book_loans;

CREATE MATERIALIZED VIEW month_borrowers AS
SELECT b.card_no, b.name, b.address, b.phone,
  COUNT(*) AS num_loans,
  DATE_PART('day', AGE(bl.due_date, bl.date_out)) AS loan_length,
  bk.title AS book_title, lb.branch_name AS branch_name
FROM library.Borrower b
  JOIN library.Book_Loans bl ON b.card_no = bl.card_no
  JOIN library.Book bk ON bl.book_id = bk.book_id
  JOIN library.Library_Branch lb ON bl.branch_id = lb.branch_id
GROUP BY b.card_no, b.name, b.address, b.phone, loan_length, book_title, branch_name, bl.due_date, bl.date_out
HAVING COUNT(*) > 1 AND DATE_PART('day', AGE(bl.due_date, bl.date_out)) >= 30;

SELECT * FROM month_borrowers;

DELETE FROM library.book_loans WHERE card_no = 1;

SELECT bl.due_date - bl.date_out as loan_lenth from library.book_loans bl;

SELECT extract(MONTH FROM AGE(bl.due_date, bl.date_out)) AS loan_lenght
FROM library.book_loans bl;

-- 1:
CREATE MATERIALIZED VIEW library.month_borrowers AS
SELECT b.card_no, b.name, b.address, b.phone,
    bl.due_date - bl.date_out as loan_length,
    book.title, branch.branch_name
FROM library.Borrower b
JOIN library.Book_Loans bl ON b.card_no = bl.card_no
JOIN library.Book book ON bl.book_id = book.book_id
JOIN library.Library_Branch branch ON bl.branch_id = branch.branch_id
JOIN (SELECT COUNT(*) as count FROM library.book_loans bli WHERE bli.due_date - bli.date_out >= 30 GROUP BY bli.card_no) more on bl.card_no = b.card_no
WHERE bl.due_date - bl.date_out >= 30 and count > 1;


REFRESH MATERIALIZED VIEW library.month_borrowers;

select * from library.month_borrowers;
drop materialized view library.month_borrowers;
select coalesce(bl.due_date, current_date) - bl.date_out as loan_length from library.book_loans bl;

DELETE FROM library.book_loans bl WHERE bl.card_no = 1;
DELETE FROM library.book_loans bl WHERE bl.card_no = 2;





SELECT b.card_no, COUNT(*) as num_long_loans
FROM library.Borrower b
         JOIN library.Book_Loans bl ON b.card_no = bl.card_no
WHERE (bl.due_date - bl.date_out) > 30
GROUP BY b.card_no;


SELECT b.card_no, COUNT(*) as num_long_loans
FROM library.Borrower b
         JOIN library.Book_Loans bl ON b.card_no = bl.card_no
WHERE (bl.due_date - bl.date_out) > 30
GROUP BY b.card_no
HAVING COUNT(DISTINCT bl.book_id) > 1;


-- ex 2
select * from current_book_copies;

select * from library.book_copies;

drop table current_book_copies;

CREATE TEMPORARY TABLE current_book_copies AS
SELECT *
FROM library.book_copies;




BEGIN;
-- Create temporary table
CREATE TEMPORARY TABLE current_book_copies AS
SELECT
    book_id,
    branch_id,
    no_of_copies
FROM library.book_copies;

-- Remove no_of_copies column from book_copies table, constraint and adding columns
ALTER TABLE library.book_copies DROP COLUMN no_of_copies;
ALTER TABLE library.book_copies DROP CONSTRAINT pk_copies;
ALTER TABLE library.book_copies ADD COLUMN acquisition_date DATE NOT NULL DEFAULT CURRENT_DATE;
ALTER TABLE library.book_copies ADD COLUMN condition VARCHAR(10) NOT NULL CHECK (condition IN ('fine', 'good', 'fair', 'poor')) DEFAULT 'fair';
ALTER TABLE library.book_copies RENAME TO book_copies_new;

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
select book_id, branch_id from(
SELECT book_id, branch_id, generate_series(1, no_of_copies-1)
FROM pg_temp.current_book_copies
ORDER BY book_id, branch_id) as carlos;

select * from library.book_copies_new;

COMMIT;
-- Drop temporary table
DROP TABLE pg_temp.current_book_copies;

-- Create view for backward compatibility
CREATE VIEW library.book_copies AS
SELECT b.book_id, c.branch_id, count(*)
FROM library.book b
JOIN library.book_copies_new c ON b.book_id = c.book_id
GROUP BY c.branch_id, b.book_id;

select * from library.book_copies;

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
DELETE FROM library.book_copies bc WHERE bc.book_id=2;



-- Create trigger for update on view
CREATE OR REPLACE FUNCTION update_book_copy()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.book_id <> OLD.book_id OR NEW.branch_id <> OLD.branch_id THEN
        RAISE EXCEPTION 'You cannot change book_id or branch_id';
    END IF;
    UPDATE library.book_copies_new
    SET condition = NEW.condition
    WHERE book_id = OLD.book_id AND branch_id = OLD.branch_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_book_copy_trigger
INSTEAD OF UPDATE ON library.book_copies
FOR EACH ROW
EXECUTE FUNCTION update_book_copy();