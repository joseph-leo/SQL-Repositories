USE Library

CREATE TABLE Library_Branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1, 1),
	branch_name VARCHAR(50) NOT NULL,
	address VARCHAR(60) NOT NULL
);

CREATE TABLE Borrower (
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1000, 1),
	name VARCHAR(40) NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(20) NOT NULL
);

CREATE TABLE Publisher (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	address VARCHAR(50),
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
	('Penguin UK', '80 Strand, London, WC2R 0RL, UK', '+44 (0)1206 256000 ')
;

SELECT * FROM Publisher

SELECT * FROM Books

INSERT INTO Books
	(title, publisher_name)
	VALUES
	('IT', 'Viking Press'),
	('The Shining', 'Doubleday'),
	('Carrie', 'Doubleday'),
	('Pet Sematary', 'Doubleday'),
	('Hatchet', 'Kevin Lain'),
	('Dogsong', 'Simon & Schuster'),
	('Twenty Thousand Leagues Under the Sea', 'Pierre-Jules Hetzel'),
	('Around the World in Eighty Days', 'Pierre-Jules Hetzel'),
	('Gulliver''s Travels', 'Benjamin Motte'),
	('To Kill a Mockingbird',  'J.B. Lippincott & Co.'),
	('And Then There Were None', 'Collins Crime Club'),
	('Animal Farm', 'Secker & Warburg'),
	('Lord of the Flies', 'Faber and Faber'),
	('The Catcher in the Rye', 'Little, Brown and Co.'),
	('O Alquimista', 'Paralela'),
	('The Great Gatsby', 'Charles Scribner''s Sons'),
	('The Hunger Games', 'Scholastic'),
	('Twilight', 'Little, Brown and Company'),
	('The Outsiders', 'Dell Publishing'),
	('Who Among Us?', 'Penguin UK')
;
