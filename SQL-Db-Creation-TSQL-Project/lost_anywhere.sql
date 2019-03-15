CREATE PROC lost_anywhere
AS
	SELECT number_of_copies AS Copies, branch_name AS Branch 
	FROM Library_Branch
	LEFT JOIN book_copies 
	ON Library_Branch.branch_id = book_copies.branch_id
	LEFT JOIN books
	ON book_copies.book_id = books.book_id
	WHERE books.title = 'The Lost Tribe'
GO