
CREATE PROC lost_in_sharpstown
AS
	SELECT number_of_copies AS Copies 
	FROM Library_Branch
	LEFT JOIN book_copies 
	ON Library_Branch.branch_id = book_copies.branch_id
	LEFT JOIN books
	ON book_copies.book_id = books.book_id
	WHERE books.title = 'The Lost Tribe' AND Library_Branch.branch_name = 'Sharpstown'
GO