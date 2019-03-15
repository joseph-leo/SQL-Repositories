
CREATE DATABASE Library;


USE Library;


CREATE TABLE Library_Branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1, 1),
	branch_name VARCHAR(50) NOT NULL,
	address VARCHAR(100) NOT NULL
);

CREATE TABLE Borrower (
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1000, 1),
	name VARCHAR(40) NOT NULL,
	address VARCHAR(100) NOT NULL,
	phone VARCHAR(20) NOT NULL
);

CREATE TABLE Publisher (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	address VARCHAR(100),
	phone VARCHAR(20)
);


CREATE TABLE Books (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (10, 1),
	title VARCHAR(50) NOT NULL,
	publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES Publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Book_Copies (
	number_of_copies INT NOT NULL,
	branch_id INT NOT NULL CONSTRAINT fk_copies_branch_id FOREIGN KEY REFERENCES Library_Branch(branch_id),
	book_id INT NOT NULL CONSTRAINT fk_copies_book_id FOREIGN KEY REFERENCES Books(book_id)
);

CREATE TABLE Book_Author (
	author_name VARCHAR(30) NOT NULL,
	book_id INT NOT NULL CONSTRAINT fk_author_book_id FOREIGN KEY REFERENCES Books(book_id)
);

CREATE TABLE Book_Loans (
	date_in DATE NOT NULL,
	date_out DATE NOT NULL,
	card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES Borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_loans_branch_id FOREIGN KEY REFERENCES Library_Branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	book_id INT NOT NULL CONSTRAINT fk_loans_book_id FOREIGN KEY REFERENCES Books(book_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Publisher 
	(publisher_name, address, phone)
	VALUES
	('Viking Press', '375 Hudson St New York, NY 10014', '(866)761-6685'),
	('Doubleday', '1745 Broadway New York, NY 10019', '1(800)733-3000.'),
	('Kevin Lain', '', ''),
	('Simon & Schuster', '1230 6th Ave, New York, NY 10020', '1(800)223-2336'),
	('Pierre-Jules Hetzel', '', ''),
	('Benjamin Motte', '', ''),
	('J.B. Lippincott & Co.', '', ''),
	('Collins Crime Club', '', ''),
	('Secker & Warburg', '20 Vauxhall Bridge Rd, Westminster, London SW1V 2SA, UK', '020 7840 8570'),
	('Faber and Faber', '74-77 Great Russell Street, London, WC1B 3DA, UK', '+44 (0)1206 255777'),
	('Little, Brown and Co.', '3 Center Plaza Boston, MA 02108 ', ''),
	('Paralela', '', '(11)3707-3500'),
	('Charles Scribner''s Sons', '153-157 Fifth Avenue, New York City', ''),
	('Scholastic', '557 Broadway, New York City, New York 10012', '(503)252-8486'),
	('Dell Publishing', '1745 Broadway, New York, NY 10019', '(212)782-9000'),
	('Penguin UK', '80 Strand, London, WC2R 0RL, UK', '+44 (0)1206 256000 '),
	('Amazon', '', '')
;


	

INSERT INTO Books
	(title, publisher_name)
	VALUES
	('IT', 'Viking Press');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('The Shining', 'Doubleday');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('Carrie', 'Doubleday');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('The Lost Tribe', 'Amazon');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('Hatchet', 'Kevin Lain');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('Dogsong', 'Simon & Schuster');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('Twenty Thousand Leagues Under the Sea', 'Pierre-Jules Hetzel');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('Around the World in Eighty Days', 'Pierre-Jules Hetzel');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('Gulliver''s Travels', 'Benjamin Motte');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('To Kill a Mockingbird',  'J.B. Lippincott & Co.');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('And Then There Were None', 'Collins Crime Club');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('Animal Farm', 'Secker & Warburg');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('Lord of the Flies', 'Faber and Faber');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('The Catcher in the Rye', 'Little, Brown and Co.');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('O Alquimista', 'Paralela');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('The Great Gatsby', 'Charles Scribner''s Sons');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('The Hunger Games', 'Scholastic');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('Twilight', 'Little, Brown and Co.');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('The Outsiders', 'Dell Publishing');
INSERT INTO Books
	(title, publisher_name)
	VALUES
	('Who Among Us?', 'Penguin UK')
;


INSERT INTO Library_Branch
	(branch_name, address)
	VALUES
	('Sharpstown', '432 W Spurgeon Rd Missoula, MT 59804'),
	('Central', '75 1st St Missoula, MT 59803'),
	('Downtown', '321 Main St Missoula, MT 59801'),
	('South Hills', '4500 39th St Missoula, MT 59803')
;


INSERT INTO Book_Author
	(author_name, book_id)
	VALUES
	('Stephen King', 10),
	('Stephen King', 11),
	('Stephen King', 12),
	('Gary Paulsen', 14),
	('Gary Paulsen', 15),
	('Jules Verne', 16),
	('Jules Verne', 17),
	('Jonathan Swift', 18),
	('Harper Lee', 19),
	('Agatha Christe', 20),
	('George Orwell', 21),
	('William Golding', 22),
	('J.D. Salinger', 23),
	('Paulo Coelho', 24),
	('F. Scott Fitzgerald', 25),
	('Suzanne Collins', 26),
	('Stephenie Meyer', 27),
	('S. E. Hinton', 28),
	('Mario Benedetti', 29),
	('Mark Lee', 30)
;

USE Library

INSERT INTO Borrower
	(name, address, phone)
	VALUES
	('Pearl Hart', '1303 39th St Missoula, MT 59803', '406-586-0349'),
	('John Stockton', '402 S 6th St E Missoula, MT 59801', '406-594-4328'),
	('Don Hughes', '3 Alder St Missoula, MT 59801', '406-483-5043'),
	('Barry Douglas', '685 Strand Ave Missoula, MT 59802', '406-546-3201'),
	('Jess Sanders', '6200 McDonald Ave Missoula, MT 59803', '406-675-0329'),
	('Walter Murphy', '43 Linda Vista Blvd Missoula, MT 59803', '406-009-1195'),
	('Sarah Parker', '1010 Jamie Ann Ln Missoula, MT 59803', '406-796-8686'),
	('Alexis Taylor', '40 Arthur Ave Missoula, MT 59801', '406-435-2958'),
	('Elizabeth Moody', '128 Jack Dr Missoula, MT 59803', '406-092-1000')
;

INSERT INTO Book_Copies
	(book_id, branch_id, number_of_copies)
	VALUES
	( 30, 1, 2),
	( 16, 1, 3),
	( 18, 1, 2),
	( 12, 1, 4),
	( 25, 1, 2),
	( 27, 1, 2),
	( 29, 1, 3),
	( 20, 1, 2),
	( 15, 1, 3),
	( 28, 1, 2),
	( 10, 2, 2),
	( 11, 2, 3),
	( 12, 2, 2),
	( 14, 2, 2),
	( 15, 2, 2),
	( 16, 2, 2),
	( 17, 2, 2),
	( 18, 2, 3),
	( 19, 2, 2),
	( 20, 2, 3),
	( 21, 3, 2),
	( 22, 3, 2),
	( 23, 3, 3),
	( 24, 3, 2),
	( 25, 3, 2),
	( 26, 3, 2),
	( 27, 3, 3),
	( 28, 3, 3),
	( 29, 3, 3),
	( 30, 3, 2),
	( 10, 4, 2),
	( 11, 4, 3),
	( 12, 4, 3),
	( 14, 4, 2),
	( 15, 4, 2),
	( 16, 4, 2),
	( 17, 4, 2),
	( 18, 4, 2),
	( 19, 4, 2),
	( 20, 4, 2)
;


INSERT INTO Book_Loans
	(book_id, branch_id, card_no, date_out, date_in)
	VALUES
	(30, 1, 1000, '2018-06-21', '2018-07-05'),
	(16, 1, 1000, '2018-06-21', '2018-07-05'),
	(18, 1, 1000, '2018-06-21', '2018-07-05'),
	(12, 1, 1000, '2018-06-21', '2018-07-05'),
	(25, 1, 1000, '2018-06-21', '2018-07-05'),
	(27, 1, 1000, '2018-06-21', '2018-07-05'),
	(10, 2, 1001, '2018-06-14', '2018-06-28'),
	(11, 2, 1001, '2018-06-14', '2018-06-28'),
	(12, 2, 1001, '2018-06-14', '2018-06-28'),
	(14, 2, 1001, '2018-06-14', '2018-06-28'),
	(15, 2, 1001, '2018-06-14', '2018-06-28'),
	(16, 2, 1001, '2018-06-14', '2018-06-28'),
	(17, 2, 1001, '2018-06-14', '2018-06-28'),
	(18, 2, 1001, '2018-06-14', '2018-06-28'),
	(28, 1, 1002, '2018-06-01', '2018-06-15'),
	(15, 1, 1002, '2018-06-01', '2018-06-15'),
	(20, 1, 1002, '2018-06-01', '2018-06-15'),
	(29, 1, 1002, '2018-06-01', '2018-06-15'),
	(27, 1, 1002, '2018-06-01', '2018-06-15'),
	(25, 1, 1002, '2018-06-01', '2018-06-15'),
	(20, 4, 1003, '2018-05-25', '2018-06-08'),
	(19, 4, 1003, '2018-05-25', '2018-06-08'),
	(18, 4, 1003, '2018-05-25', '2018-06-08'),
	(17, 4, 1003, '2018-05-25', '2018-06-08'),
	(16, 4, 1003, '2018-05-25', '2018-06-08'),
	(15, 4, 1003, '2018-05-25', '2018-06-08'),
	(21, 3, 1004, '2018-05-26', '2018-06-09'),
	(22, 3, 1004, '2018-05-26', '2018-06-09'),
	(23, 3, 1004, '2018-05-26', '2018-06-09'),
	(24, 3, 1004, '2018-05-26', '2018-06-09'),
	(25, 3, 1004, '2018-05-26', '2018-06-09'),
	(30, 1, 1004, '2018-05-27', '2018-06-10'),
	(16, 1, 1004, '2018-05-27', '2018-06-10'),
	(12, 1, 1004, '2018-05-27', '2018-06-10'),
	(28, 1, 1004, '2018-05-27', '2018-06-10'),
	(20, 1, 1004, '2018-05-27', '2018-06-10'),
	(12, 1, 1005, '2018-06-27', '2018-07-11'),
	(14, 2, 1005, '2018-06-29', '2018-07-13'),
	(15, 2, 1005, '2018-06-29', '2018-07-13'),
	(16, 2, 1005, '2018-06-29', '2018-07-13'),
	(17, 2, 1005, '2018-06-29', '2018-07-13'),
	(18, 2, 1005, '2018-06-29', '2018-07-13'),
	(19, 2, 1005, '2018-06-29', '2018-07-13'),
	(20, 2, 1005, '2018-06-29', '2018-07-13'),
	(21, 3, 1006, '2018-06-30', '2018-07-14'),
	(22, 3, 1006, '2018-06-30', '2018-07-14'),
	(23, 3, 1006, '2018-06-30', '2018-07-14'),
	(24, 3, 1007, '2018-06-30', '2018-07-14'),
	(25, 3, 1007, '2018-06-30', '2018-07-14'),
	(26, 3, 1007, '2018-06-30', '2018-07-14'),
	(27, 3, 1007, '2018-06-30', '2018-07-14')
;
	


