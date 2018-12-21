CREATE PROC no_books_out 
AS 
	SELECT name FROM Borrower
	FULL OUTER JOIN Book_Loans
	ON Borrower.card_no = Book_Loans.card_no
	WHERE book_id IS NULL
GO


