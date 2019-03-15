CREATE PROC due_date_today_sharpstown
AS 
	SELECT name, borrower.address, title
	FROM Book_Loans
	FULL OUTER JOIN Borrower
	ON Book_Loans.card_no = Borrower.card_no
	FULL OUTER JOIN Library_Branch
	ON Book_Loans.branch_id = Library_Branch.branch_id
	FULL OUTER JOIN Books
	ON Book_Loans.book_id = Books.book_id
	WHERE Library_Branch.branch_name = 'Sharpstown' AND Book_Loans.date_in = GETDATE()
GO







