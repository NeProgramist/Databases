SELECT 'artist1' as artists, 'song1' as songs
UNION
SELECT 'artist2', 'song2'
UNION
SELECT 'artist3', 'song3'
UNION
SELECT 'artist4', 'song4'
UNION
SELECT 'artist5', 'song5'
ORDER BY artists;

SELECT
    CASE
    WHEN 6 <= all(select generate_series(1, 21)) THEN ';-)'
    ELSE ':-D'
END;

SELECT 'girl1' as girls
UNION
SELECT 'girl2' as girls
UNION
SELECT 'girl3' as girls
UNION
SELECT 'girl4' as girls
UNION
SELECT 'girl5' as girls
EXCEPT
SELECT 'girl3' as girls;

-- create table numbers

drop table if exists numbers;
SELECT number Into numbers from generate_series(1, 20) as Number;
-- or this
with number as (SELECT generate_series(1, 20) as number)
SELECT
    CASE WHEN number.number = 0 THEN 'zero'
    WHEN number.number = 1 THEN 'one'
    WHEN number.number = 2 THEN 'two'
    WHEN number.number = 3 THEN 'three'
    WHEN number.number = 4 THEN 'four'
    WHEN number.number = 5 THEN 'five'
    WHEN number.number = 6 THEN 'six'
    WHEN number.number = 7 THEN 'seven'
    WHEN number.number = 8 THEN 'eight'
    WHEN number.number = 9 THEN 'nine'
    ELSE cast(number.number as char(20)) -- number::text
END
from NUMBER;

--cross coin
SELECT * FROM employees
cross join customers;

----------------------------------

select *,
case "ShipVia"
    when 1 then 'zhenya'
    when 2 then 'zasko'
    when 3 then 'sergeevich'
else "ShipVia"::text
end
from orders;

select "Country" from customers
union
select "Country" from employees
union
select "ShipCountry" from orders
order by "Country";

select * from employees;

select *  from orders;