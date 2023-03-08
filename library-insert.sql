--populando o esquema
--dados retirados de github.com/scholachoi/library-database
--dados não-chave de library.publisher retirados de geradores aleatórios

--**TRATAR INCONSISTÊNCIAS DE REFERÊNCIA**

--PUBLISHER

INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Singer','Bayernstraße 23, 97292  Uettingen, Germany','03621 41 11 90');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Newton','183 COMMONWEALTH AVE BOSTON MA 02116-2209 USA','617-555-0138');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('GST','31 Griffin Circle Buffalo, NY 14221','212-555-0109');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Loyly','24 SAINT ALBANS RD BOSTON MA 02115-6141 USA','617-555-0174');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Mews','1500 HENRY ST BERKELEY CA 94709-2008 USA','510-555-0159');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Manx','78 Place de la Madeleine, PARIS, Île-de-France(IL), 75012','93 005 3869');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Barr','33 Greystone Dr. Bay Shore, NY 11706','212-555-0148');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Higham','31 Park Avenue London EC56 2MQ','020 7946 0568');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Ten Ton','9204 Peach St Oakland, California(CA), 94603','510-555-0170');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Cosmo','90 Parsons Rd Portland, Maine(ME), 04103','207-555-0141');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Hello','794 Mcallister St San Francisco, California(CA), 94102','415-555-0110');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('ANAA','2600 S Hoover St Los Angeles, California(CA), 90007','213-555-0137');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Chance','7976 Rockland Ave. Middletown, NY 10940','212-555-0160');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Biz','318 Wentworth Rd. New York, NY 10025','212-555-0126');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Famous','201 50th Ave Long Island City, New York(NY), 11101','718-802-2331');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('North','12 Pine St East Hartford, Connecticut(CT), 06108','860-555-0192');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Bibi','2 E Oak St Chicago, Illinois(IL), 60611','312-555-0185');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('1999','20 N State St Chicago, Illinois(IL), 60602','312-555-0173');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Yaya','2139 Sacramento St Berkeley, California(CA), 94702','510-555-0103');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Sunshine','665 Channing Ave Palo Alto, California(CA), 94301','650-555-0111');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Jungle','endereço do jungle','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Dada','endereço do dada','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('BizBooks','endereço do BizBooks','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('OOL','endereço do OOL','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('Hatha','endereço do Hatha','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
VALUES ('JKL','endereço do JKL','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Phantom','endereço do Phantom','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Trope','endereço do Trope','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Pops','endereço do Pops','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Glass','endereço do Glass','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Grub','endereço do Grub','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Hart','endereço do Hart','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Bangkok','endereço do Bangkok','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Pullen','endereço do Pullen','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Ocean','endereço do Ocean ','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Pup','endereço do Pup','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Combs','endereço do Combs','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('HDT','endereço do HDT','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Whitehead','endereço do Whitehead','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Daily','endereço do Daily','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Park','endereço do Park','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Best','endereço do Best','telefone');
INSERT INTO library.publisher (Name, Address, Phone)
 VALUES ('Wolfe','endereço do Wolfe','telefone');


--BOOK

INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (1,'The Lost Tribe','Jungle');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (2,'How to Sew Buttons','Singer');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (3,'The Terrible Night','GST');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (4,'Mindy''s Mittens','Newton');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (5,'Pizza and Donuts Diet','Loyly');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (6,'101 Cat House Plans','Mews');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (7,'Self-Help for Dummies','Dada');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (8,'Land of Lemurs','Barr');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (9,'Go For It!','Higham');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (10,'Farming for Nerds','Ten Ton');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (11,'They Are Us','Cosmo');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (12,'Here We Go!','Hello');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (13,'Spanish for Nurses','ANAA');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (14,'Tacos Everyday','Chance');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (15,'One Minute Rule','BizBooks');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (16,'Apples to Oranges','Famous');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (17,'Tiger Mountain','North');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (18,'How Cookies Crumble','Bibi');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (19,'Bridge to Yesterday','1999');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (20,'The Lemonade Stand','Yaya');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (21,'Hello World','OOL');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (22,'Yoga for Moms','Hatha');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (23,'The Red Balloon','JKL');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (24,'Make Art Not War','Phantom');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (25,'War of Words','Trope');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (26,'Green Smoothies for Kids','Pops');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (27,'History of Jars','Glass');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (28,'365 Dinner Ideas','Grub');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (29,'Untitled Champion','Hart');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (30,'Running in Thailand','Bangkok');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (31,'Swimming After Dark','Pullen');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (32,'Don''t Pet the Shark','Ocean');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (33,'Is Your Dog Walking You?','Pup');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (34,'Tips for Success','Combs');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (35,'Learn to Type','HDT');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (36,'Tennis for Seniors','Whitehead');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (37,'Zumba at the Zoo','Daily');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (38,'Xavier and the Zebra','Park');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (39,'You Can Do It!','Best');
INSERT INTO library.book (Book_id, Title, Publisher_name) VALUES (40,'The Best Day Ever','Wolfe');

--BOOK_AUTHORS

INSERT INTO library.book_authors (Book_id, Author_name) VALUES (1,'John Smyth');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (2,'Jane Do');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (3,'Eleanor Mellors');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (4,'Heidi Holly');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (5,'Chef Jeff');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (6,'Bart Brat');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (7,'Jen Jones');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (8,'Carol Sims');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (9,'Li Li');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (10,'Dr. Dirt');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (11,'Mantek Klem');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (12,'Kit Townsend');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (13,'Laura Lloras');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (14,'Sara Carr');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (15,'Jens Kopek');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (16,'Jim Jordan');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (17,'Silas Lambert');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (18,'Barbara Bull');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (19,'Dan Bland');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (20,'Stephen King');
INSERT INTO library.book_authors (Book_id, Author_name) VALUES (21,'A. Nonymous');

--LIBRARY_BRANCH

INSERT INTO library.library_branch (Branch_id, Branch_name, Address) VALUES (1,'Central','10 Main St');
INSERT INTO library.library_branch (Branch_id, Branch_name, Address) VALUES (2,'Sharpstown','25 Pine St');
INSERT INTO library.library_branch (Branch_id, Branch_name, Address) VALUES (3,'River','333 River Rd');
INSERT INTO library.library_branch (Branch_id, Branch_name, Address) VALUES (4,'Field','45 Field St');

--BOOK_COPIES

INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (1,2,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (1,1,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (2,2,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (3,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (4,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (5,1,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (6,2,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (7,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (8,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (9,1,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (10,2,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (11,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (12,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (13,1,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (14,2,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (15,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (16,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (17,1,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (18,2,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (19,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (20,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (21,1,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (22,2,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (23,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (24,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (25,1,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (26,2,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (27,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (28,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (29,1,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (30,2,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (31,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (32,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (33,1,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (34,2,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (35,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (36,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (37,1,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (38,2,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (39,3,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (40,4,2);
INSERT INTO library.book_copies (Book_id, Branch_id, No_of_copies) VALUES (20,1,2);

--BORROWER

INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (1,'Charlie Brown','27 Main St','555-5123');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (2,'Rachel Rigby','101 Hwy 22','688-7711');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (3,'Nancy Drew','5678 Oak St','555-3467');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (4,'Derek Jones','6789 Ritmo Cir','222-1234');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (5,'Howie Han','111 First Ave','234-5678');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (6,'Tim Tegulpas','432 Nebraska Ave','987-6543');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (7,'Sam Semel','7688 Hedge Ct','777-9898');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (8,'Evan Mann','4545 Court St','899-9090');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (9,'Sally Short','323 Remington St','767-8991');
INSERT INTO library.borrower (Card_no, Name, Address, Phone) VALUES (10,'Bob Biggs','227 South St', 'telefone');

--BOOK_LOANS

INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (1,1,1,'2016-08-19','2016-09-19');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (2,2,1,'2016-08-19','2016-10-19');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (4,4,1,'2016-08-19','2016-11-19');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (5,4,1,'2016-08-19','2016-08-21');

INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (1,1,2,'2016-08-19','2016-09-19');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (2,2,2,'2016-08-19','2016-10-19');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (4,4,2,'2016-08-19','2016-11-19');
INSERT INTO library.book_loans (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES (5,4,2,'2016-08-19','2016-08-21');

DELETE FROM library.book_loans WHERE card_no = 1;
DELETE FROM library.book_loans WHERE card_no = 2;
