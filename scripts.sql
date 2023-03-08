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
-- GROUP BY b.card_no, b.name, b.address, b.phone,
--          bl.date_out, bl.due_date, book.title, branch.branch_name
WHERE bl.due_date - bl.date_out >= 30;

REFRESH MATERIALIZED VIEW library.month_borrowers;

select * from library.month_borrowers;
select coalesce(bl.due_date, current_date) - bl.date_out as loan_length from library.book_loans bl;

drop materialized view library.month_borrowers;