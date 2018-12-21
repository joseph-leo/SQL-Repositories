CREATE PROC num_of_books_checked_out
AS
	SELECT branch_name AS 'Branch Name', count(Book_Loans.branch_id) AS 'Checked Out'
	FROM Book_Loans
	RIGHT JOIN Library_Branch
	ON Book_Loans.branch_id = Library_Branch.branch_id
	GROUP BY branch_name
GO

