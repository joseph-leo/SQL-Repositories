SELECT * FROM Production.Product

SELECT * FROM Production.ProductCategory

SELECT * FROM Production.Product


DECLARE @subCat NVARCHAR(50) = 'LIGHTS';
DECLARE @cat NVARCHAR(50) = 'Accessories';

SELECT PC.Name AS Category,
       PSC.Name AS Subcategory,
       PM.Name AS Model,
       P.Name AS Product
FROM Production.Product AS P
FULL OUTER JOIN
       Production.ProductModel AS PM
       ON PM.ProductModelID = P.ProductModelID
FULL OUTER JOIN
       Production.ProductSubcategory AS PSC
       ON PSC.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN
       Production.ProductCategory AS PC
       ON PC.ProductCategoryID = PSC.ProductCategoryID
WHERE PC.Name = @cat AND PSC.Name = @subCat;