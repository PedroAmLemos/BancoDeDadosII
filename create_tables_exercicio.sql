DROP SCHEMA library cascade;
CREATE SCHEMA library;
CREATE TABLE library.Publisher (
	name VARCHAR(80) PRIMARY KEY,
	address VARCHAR(100),
	phone VARCHAR(15)
);

CREATE TABLE library.Book(
	book_id SERIAL PRIMARY KEY,
	title VARCHAR(40) NOT NULL,
	publisher_name VARCHAR(80) NOT NULL,
	FOREIGN KEY (publisher_name) REFERENCES library.Publisher(name)
);

CREATE TABLE library.Book_Authors(
	book_id INT,
	author_name VARCHAR(80),
    CONSTRAINT pk_authors PRIMARY KEY(book_id, author_name),
	FOREIGN KEY (book_id) REFERENCES library.Book(book_id)
);

CREATE TABLE library.Library_Branch(
	branch_id SERIAL PRIMARY KEY,
    branch_name VARCHAR(80),
	address VARCHAR(40)
);

CREATE TABLE library.Book_Copies(
	book_id INT,
    branch_id INT,
	no_of_copies INT,
    CONSTRAINT pk_copies PRIMARY KEY(book_id, branch_id),
	FOREIGN KEY (book_id) REFERENCES library.Book(book_id),
    FOREIGN KEY (branch_id) REFERENCES library.Library_Branch(branch_id)
);

CREATE TABLE library.Borrower(
	card_no INT PRIMARY KEY,
    name VARCHAR(80),
	address VARCHAR(40),
	phone VARCHAR(15)
);

CREATE TABLE library.Book_Loans(
	book_id INT,
    branch_id INT,
	card_no INT,
    date_out DATE,
    due_date DATE,
    CONSTRAINT pk_loans PRIMARY KEY(book_id, branch_id, card_no),
	FOREIGN KEY (book_id) REFERENCES library.Book(book_id),
    FOREIGN KEY (branch_id) REFERENCES library.Library_Branch(branch_id),
    FOREIGN KEY (card_no) REFERENCES library.Borrower(card_no)
);