select * from library.book;
select * from library.publisher;
SELECT COUNT(*) FROM library.book b WHERE b.title='The Lost Tribe';
SELECT * from library.book_loans;


CREATE MATERIALIZED VIEW month_borrowers
AS


