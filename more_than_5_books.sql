CREATE PROC more_than_5_books
AS 
	SELECT name, address, COUNT(Book_Loans.card_no) AS Loans
	FROM Borrower
	FULL OUTER JOIN Book_Loans
	ON Borrower.card_no = Book_Loans.card_no
	GROUP BY name, address
	HAVING COUNT(Book_Loans.card_no) > 5;
GO