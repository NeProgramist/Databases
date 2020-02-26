SELECT COUNT(*) FROM products;

SELECT LENGTH('Zhenya') AS MySelf;
SELECT LENGTH('Zasko') AS MySelf;
SELECT LENGTH('Sergeevich') AS MySelf;

SELECT REPLACE('Sheck Wes - Mo Bamba', ' ', '_') AS FavouriteSong;

SELECT CONCAT(SUBSTR('Sashka', 1,2), SUBSTR('Borshosh', 1,4), '@', 'zasko.zh') AS SomeGreatTable;

SELECT EXTRACT(WEEK FROM cast('2001-02-12' as date)) AS Week;

SELECT TO_CHAR(cast('2001-02-12' as date), 'day') AS DateOfBirth;

SELECT * FROM products p
LEFT JOIN categories c on p."CategoryID" = c."CategoryID"
LEFT JOIN suppliers s on p."SupplierID" = s."SupplierID";

SELECT * FROM orders
    WHERE EXTRACT(YEAR FROM "OrderDate") = 1998
    AND EXTRACT(MONTH FROM "OrderDate") = 4
    AND "ShippedDate" IS NULL;

-- first(takes more time)
SELECT DISTINCT ON("EmployeeID") * FROM employeeterritories e
LEFT JOIN territories t on e."TerritoryID" = t."TerritoryID"
LEFT JOIN region r on t."RegionID" = r."RegionID"
WHERE "RegionDescription"= 'Northern';

-- second
SELECT * FROM employees
WHERE "EmployeeID" IN (
    SELECT "EmployeeID" FROM territories
    WHERE "TerritoryID" IN (
        SELECT "TerritoryID" FROM territories
        WHERE "RegionID" IN (
            SELECT "RegionID" FROM region
            WHERE "RegionDescription" = 'Northern'
        )
    )
);

-- first(takes more time)
SELECT SUM("UnitPrice" * (1-"Discount")) FROM order_details od
left join orders o on od."OrderID" = o."OrderID"
where cast(EXTRACT(DAY FROM "OrderDate") as int) % 2 = 1;


-- second
SELECT SUM("UnitPrice" * (1-"Discount")) FROM order_details
WHERE "OrderID" IN (
    SELECT "OrderID" FROM orders
    WHERE cast(EXTRACT(DAY FROM "OrderDate") as int) % 2 = 1
    );



SELECT "ShipAddress" FROM orders
WHERE "OrderID" IN (
    SELECT "OrderID" FROM order_details
    WHERE "UnitPrice" * "Quantity" * (1 - "Discount") IN (
        SELECT MAX("UnitPrice" * "Quantity" * (1-"Discount")) FROM order_details
    )
);






