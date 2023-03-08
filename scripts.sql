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



-- Create temporary table
-- CREATE TEMPORARY TABLE temp_book_copies AS
-- SELECT
--     book_id,
--     branch_id,
--     no_of_copies
-- FROM library.book_copies;
--
-- -- Remove no_of_copies column from book_copies table
-- ALTER TABLE library.book_copies DROP COLUMN no_of_copies;
--
-- -- Create new book_copies table with additional columns
-- CREATE TABLE library.book_copies_new
-- (
--     copy_id SERIAL PRIMARY KEY,
--     book_id INT NOT NULL,
--     branch_id INT NOT NULL,
--     acquisition_date DATE NOT NULL DEFAULT CURRENT_DATE,
--     condition VARCHAR(10) NOT NULL CHECK (condition IN ('fine', 'good', 'fair', 'poor')),
--     FOREIGN KEY (book_id) REFERENCES library.book (book_id),
--     FOREIGN KEY (branch_id) REFERENCES library.library_branch (branch_id)
-- );
--
-- -- Insert data from temp_book_copies into new book_copies table
-- INSERT INTO library.book_copies_new (book_id, branch_id, copy_id)
-- SELECT book_id, branch_id, generate_series(1, no_of_copies)
-- FROM temp_book_copies
-- ORDER BY book_id, branch_id;
--
-- -- Drop temporary table
-- DROP TABLE temp_book_copies;
--
-- -- Create view for backward compatibility
-- CREATE VIEW library.book_copies AS
-- SELECT b.book_id, c.branch_id, c.copy_id, c.acquisition_date, c.condition
-- FROM library.book b
-- JOIN library.book_copies_new c ON b.book_id = c.book_id;
--
-- -- Create trigger for delete from view
-- CREATE OR REPLACE FUNCTION delete_book_copy()
-- RETURNS TRIGGER AS $$
-- BEGIN
--     DELETE FROM library.book_copies_new
--     WHERE book_id = OLD.book_id AND branch_id = OLD.branch_id AND copy_id = OLD.copy_id;
--     RETURN OLD;
-- END;
-- $$ LANGUAGE plpgsql;
--
-- CREATE TRIGGER delete_book_copy_trigger
-- INSTEAD OF DELETE ON library.book_copies
-- FOR EACH ROW
-- EXECUTE FUNCTION delete_book_copy();
--
-- -- Create trigger for update on view
-- CREATE OR REPLACE FUNCTION update_book_copy()
-- RETURNS TRIGGER AS $$
-- BEGIN
--     IF NEW.book_id <> OLD.book_id OR NEW.branch_id <> OLD.branch_id THEN
--         RAISE EXCEPTION 'You cannot change book_id or branch_id';
--     ELSIF NEW.condition = 'poor' THEN
--         RAISE EXCEPTION 'You cannot set condition as poor';
--     ELSIF NEW.condition NOT IN ('fine', 'good', 'fair', 'poor') THEN
--         RAISE EXCEPTION 'Invalid value for condition';
--     END IF;
--     UPDATE library.book_copies_new
--     SET condition = NEW.condition
--     WHERE book_id = OLD.book_id AND branch_id = OLD.branch_id AND copy_id = OLD.copy_id;
--     RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;
--
-- CREATE TRIGGER update_book_copy_trigger
-- INSTEAD OF UPDATE ON library.book_copies
-- FOR EACH ROW
-- EXECUTE FUNCTION update_book_copy();
--
-- -- Create trigger for insert on view
-- CREATE OR REPLACE FUNCTION insert_book_copy()
-- RETURNS TRIGGER AS $$
-- BEGIN
--     IF NEW.condition = 'poor' THEN
--         RAISE EXCEPTION 'You cannot set condition as poor';
--     ELSIF NEW.condition NOT IN ('fine', 'good', 'fair', 'poor') THEN
--         RAISE EXCEPTION 'Invalid value for condition';
--     END IF;
--     INSERT INTO library.book_copies_new (book_id, branch_id, acquisition_date, condition)
--     SELECT NEW.book_id, NEW.branch_id, CURRENT_DATE, NEW.condition
--     FROM generate_series(1, NEW.no_of_copies)
--     RETURNING copy_id INTO NEW.copy_id;
--     RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;
--
-- CREATE TRIGGER insert_book_copy_trigger
-- INSTEAD OF INSERT ON library.book_copies
-- FOR EACH ROW
-- EXECUTE FUNCTION insert_book_copy();
--
--
-- -- Query to return inconsistencies between book_copies and temp_book_copies table
-- SELECT *
-- FROM
-- (
--     SELECT b.book_id, c.branch_id, COUNT(*), SUM(t.no_of_copies)
--     FROM library.book b
--     JOIN library.book_copies_new c ON b.book_id = c.book_id
--     JOIN temp_book_copies t ON b.book_id = t.book_id AND c.branch_id = t.branch_id
--     GROUP BY b.book_id, c.branch_id
-- ) AS temp
-- WHERE temp.count <> temp.sum;
--
-- ROLLBACK;