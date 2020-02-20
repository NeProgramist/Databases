SELECT 'Zhenya Zasko' as MySelf;

SELECT * FROM products;

SELECT * FROM products
WHERE "Discontinued" = 1;

SELECT DISTINCT "City" FROM customers;

SELECT "CompanyName" FROM customers
ORDER BY "CompanyName" DESC;

SELECT "OrderID" AS "1",
       "ProductID" AS "2",
       "UnitPrice" AS "3",
       "Quantity" AS "4",
       "Discount" AS "5"
FROM order_details;


SELECT * FROM customers
WHERE "ContactName" SIMILAR TO '[ZzSs]%';

SELECT * FROM orders
WHERE "ShipCity" SIMILAR TO '% %';

SELECT * FROM products
WHERE "ProductName" SIMILAR TO '[\%\_]%[ZzSs]';






