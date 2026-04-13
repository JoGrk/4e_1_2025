SELECT CEIL( MAX(price)) AS max_price
FROM Products;

SELECT productname, categoryname, price
FROM Products
inner join categories on categories.categoryid=Products.categoryid
where price between 10 and 50;