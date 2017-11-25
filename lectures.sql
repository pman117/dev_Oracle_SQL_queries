SELECT *
FROM product;
SELECT product.product_id,sales.product_id
FROM product left outer join sales
ON product.product_id= sales.product_id;

SELECT * FROM sales ;
SELECT * FROM sales WHERE total_amount BETWEEN 0 and 100;
SELECT * FROM sales WHERE total_amount NOT BETWEEN 0 and 100;
SELECT * FROM sales WHERE NOT (total_amount BETWEEN 0 and 100);
SELECT * FROM sales WHERE total_amount IN(330);
SELECT * FROM sales WHERE total_amount NOT IN(330);
SELECT * FROM product;
SELECT * FROM product WHERE product_name LIKE 'i%';
SELECT * FROM product WHERE product_category LIKE 'Com_uter';
SELECT * FROM sales WHERE total_amount < ALL(330,66);
SELECT * FROM sales WHERE total_amount = ALL(330,66);
SELECT * FROM sales WHERE total_amount > ANY(330,66);
SELECT * FROM product WHERE color IS NULL;
SELECT * FROM product WHERE color IS NOT NULL;
SELECT * FROM sales WHERE total_amount >100 OR sales_date='09-FEB-15';
SELECT sales_amount,tax_amount,total_amount
FROM sales;
SELECT sales_amount,tax_amount,total_amount,sales_amount+tax_amount,sales_amount-tax_amount,sales_amount *10
FROM sales;
SELECT sales_date,sales_amount,tax_amount,total_amount
FROM sales
ORDER BY sales_date;
SELECT sales_date,sales_amount,tax_amount,total_amount
FROM sales
ORDER BY sales_date DESC;
SELECT sales_date,sales_amount,tax_amount,total_amount
FROM sales
ORDER BY sales_date,total_amount,tax_amount;
SELECT * FROM product;
SELECT * FROM product
ORDER BY color;
SELECT * FROM product
ORDER BY color DESC;
SELECT * FROM sales_history;
SELECT sales_date,order_id,product_id
FROM sales
UNION
SELECT sales_date,order_id,product_id
FROM sales_history;
SELECT sales_date,order_id,product_id
FROM sales
UNION ALL
SELECT sales_date,order_id,product_id
FROM sales_history;
SELECT sales_date,order_id,product_id
FROM sales
INTERSECT
SELECT sales_date,order_id,product_id
FROM sales_history;
SELECT sales_date,order_id,product_id
FROM sales
MINUS
SELECT sales_date,order_id,product_id
FROM sales_history;
SELECT COUNT(*)
FROM sales;
SELECT SUM(total_amount)
FROM sales;
SELECT MIN(total_amount)
FROM sales;
SELECT MAX(total_amount)
FROM sales;
SELECT  sales_date,SUM(total_amount)
FROM sales;
GROUP BY sales_date
ORDER BY sales_date;
SELECT sales_date,product_id,customer_id, SUM(total_amount)
FROM sales
WHERE sales_date LIKE '%JAN-15'
GROUP BY sales_date,product_id,customer_id
ORDER BY sales_date,product_id,customer_id;
SELECT sales_date,product_id, SUM(total_amount) 
FROM sales
WHERE sales_date BETWEEN '01-JAN-15' and '31-JAN-15'
GROUP BY sales_date,product_id
HAVING SUM(total_amount)>100;
SELECT *
FROM sales;
SElECT *
FROM product;
SELECT sales.sales_date,sales.order_id,sales.product_id,product.product_id,product.product_name
FROM sales INNER JOIN product
ON sales.product_id=product.product_id;
SELECT sales.sales_date,sales.order_id,sales.product_id,product.product_id,product.product_name
FROM sales LEFT OUTER JOIN product
ON sales.product_id=product.product_id;
SELECT sales.sales_date,sales.order_id,sales.product_id,product.product_id,product.product_name
FROM sales RIGHT OUTER JOIN product
ON sales.product_id=product.product_id;
SELECT sales.sales_date,sales.order_id,sales.product_id,product.product_id,product.product_name
FROM sales FULL OUTER JOIN product
ON sales.product_id=product.product_id;
SELECT sales.product_id,sales.order_id,product.product_id
FROM sales CROSS JOIN product;
SELECT *
FROM sales NATURAL JOIN product;
SELECT product_id, order_id,standard_cost
FROM sales NATURAL JOIN product;
SELECT user,sysdate 
FROM dual;
DESC dual;
SELECT round(28.889,2)
FROM sales;
SELECT round(28.889,2)
FROM dual;
SELECT ceil(48.95)
FROM dual;
SELECT power(16,2)
FROM dual;
SELECT sqrt(16)
FROM dual;
SELECT greatest(11,10,11.1)
FROM dual;
SELECT upper('john')
FROM dual;
SELECT lower('JoHn')
FROM dual;
SELECT length('John')
FROM dual;
SELECT substr('ParthaRay',1,3)
FROM dual;
SELECT decode(5,10,'TEN',2, 'TWO',5,'FIVE')
FROM dual;
SELECT round(28.889,2), ceil(48.95),power(16,2), sqrt(16), greatest(11,10,11.1), upper('john'), lower('JoHn'), length('John'), substr('ParthaRay',1,3), decode(5,10,'TEN',2, 'TWO',5,'FIVE')
FROM dual;
SELECT add_months('01-JAN-2015',24),months_between('11-JAN-2017','01-JAN-1986'),last_day('01-JUN-2015'),next_day('02-FEB-2015','Tuesday')
FROM dual;
SELECT last_day(sales_date),add_months(sales_date,6),sales_date
FROM sales;
SELECT add_months ('07-JUL-2015', 3)
FROM dual;
SELECT add_months('07-JUL-2015',-3)
FROM dual;
SELECT concat('rush','hour')
FROM dual;
SELECT length ('SQL  Course')
FROM dual;
SELECT lpad ('course',9)
FROM dual;
SELECT rpad ('course',9)
FROM dual;
SELECT instr ('Oracale Course', 'r')
FROM dual;
SELECT log (10,20)
FROM dual;
SELECT last_day(to_date('2015/03/15','yyyy/mm/dd'))
FROM dual;
SELECT months_between (to_date('2015/01/01','yyyy/mm/dd'),to_date('2015/03/01','yyyy/mm/dd'))
FROM dual;
SELECT sales_date,total_amount,
case 
when total_amount <= 100 then 'Low'
when total_amount < 1000 then 'Medium'
else 'High'
end
FROM sales;
SELECT sales_date as "Sales Date",total_amount,
case
when total_amount<= 100 then 'Low'
when total_amount<= 1000 then 'Medium'
else 'High'
end as category
FROM sales;
SELECT distinct sales_date
FROM sales;
SELECT sysdate
FROM dual;
SELECT rownum, sales_date
FROM sales;
CREATE table customers
(customer_id number(11),
 customer_name varchar2(20),
 city varchar2(20),
 join_date date
 );
 DESC customers;
 ALTER TABLE customers
 ADD(customer_country varchar2(20));
 ALTER TABLE customers
 MODIFY (customer_id number(10));
 ALTER TABLE customers
 DROP COLUMN city;
 CREATE table MOVIES
 (movie_number number(11),
  movie_name varchar2(100),
  movie_type varchar2(40),
  movie_release_date date
 );
 DESC MOVIES;
 ALTER table MOVIES
 ADD(movie_language varchar(30));
 ALTER table MOVIES
 MODIFY(movie_type varchar2(50));
 INSERT INTO MOVIES(movie_number,movie_name,movie_type,movie_release_date)
 VALUES(1,'Click','Comedy','01-JAN-15');
COMMIT;
INSERT INTO MOVIES (movie_number,movie_name,movie_type,movie_release_date)
  SELECT movie_number,movie_name,movie_type,movie_release_date 
  FROM MOVIES;
COMMIT;
DESC customers;
INSERT INTO customers(customer_id,customer_name,join_date,customer_country)
VALUES(234,'Jacob','01-JAN-2015','USA');
COMMIT;
INSERT INTO customers(customer_id,customer_name,join_date,customer_country)
  SELECT customer_id,customer_name,join_date,customer_country
  FROM customers;
COMMIT;
SELECT *
FROM customers;
DELETE
FROM customers 
WHERE customer_id=234
AND customer_name='Jacob';
ROLLBACK;
SELECT*
FROM customers;
UPDATE customers
SET customer_id=111,
    join_date='01-FEB-15'
WHERE customer_id=234;
SELECT *
FROM customers;
COMMIT;
TRUNCATE TABLE customers;
SELECT *
FROM customers;
INSERT INTO MOVIES(movie_number,movie_name,movie_type,movie_release_date,movie_language)
VALUES(1,'Bad Girl Island','thriler','02-MAR-15','english');
COMMIT;
DESC MOVIES;
SELECT*
FROM MOVIES;
INSERT INTO MOVIES(movie_number,movie_name,movie_type,movie_release_date,movie_language)
VALUES(2,'Rush Hour','Comedy','01-FEB-00','english' );
COMMIT;
INSERT INTO MOVIES(movie_number,movie_name,movie_type,movie_release_date,movie_language)
VALUES(3,'Scarface','Thriller','01-MAR-86','english');
COMMIT;
SELECT *
FROM MOVIES;
UPDATE MOVIES
SET
   movie_number=1000  
WHERE movie_number=1;
COMMIT;
SELECT *
FROM MOVIES;
DELETE
FROM MOVIES
WHERE movie_name='Rush Hour';
ROLLBACK;
SELECT *
FROM MOVIES;
DROP TABLE customers;
CREATE TABLE customers
(
customer_id number(11) NOT NULL,
customer_name varchar (25),
join_date date

);
SELECT *
FROM customers;

INSERT INTO customers (customer_id,customer_name,join_date)
VALUES(1,'John','01-JAN-2015');
COMMIT;

CREATE TABLE cars
(
car_id number(11) UNIQUE,
car_name varchar(25)

);
INSERT INTO cars (car_id,car_name)
VALUES (1,'Mustang');
COMMIT;
INSERT INTO cars (car_id,car_name)
VALUES(1,'Tacoma');

CREATE TABLE trucks
(
truck_id number(11) PRIMARY KEY,
truck_name varchar(25)
);
INSERT INTO trucks (truck_id, truck_name)
VALUES (1,'Tacoma');
INSERT INTO trucks(truck_id, truck_name)
VALUES (1, NULL);

CREATE TABLE horses
(
horse_id number (11),
horse_name varchar(25),
registered varchar(1) CHECK(registered IN ('Y','N'))
);

INSERT INTO horses (horse_id,horse_name,registered)
VALUES (1,'Amy','Y');
COMMIT;
INSERT INTO horses (horse_id,horse_name,registered)
VALUES (2,'Sara','T');

CREATE TABLE automobiles
(
auto_id number REFERENCES cars(car_id),
auto_name varchar2(25)
);

INSERT INTO automobiles (auto_id,auto_name)
VALUES (1,'Tacoma');
COMMIT;

CREATE TABLE pictures
(
picture_id number(11),
picture_size number(11),
picture_weight number(11),
CONSTRAINT PRODUCT_DT_PK
PRIMARY KEY (picture_id,picture_size,picture_weight)

);

ALTER TABLE cars
ADD CONSTRAINT car_name
PRIMARY KEY (car_name);

ALTER TABLE cars
DISABLE CONSTRAINT car_name;

ALTER TABLE cars
ENABLE CONSTRAINT car_name;

CREATE TABLE doorknobs
(
door_id number(11),
door_number number (11),
CONSTRAINT door_knobs
UNIQUE (door_id),
PRIMARY KEY (door_number)
);
INSERT INTO doorknobs (door_id,door_number)
VALUES (1,11);
COMMIT;

INSERT INTO doorknobs (door_id,door_number)
VALUES(NULL,12);
COMMIT;

INSERT INTO doorknobs (door_id,door_number)
VALUES(2,NULL);

ALTER TABLE automobiles
ADD CONSTRAINT auto_name
UNIQUE (auto_name);

CREATE TABLE animals
(
animal_id number (11),
animal_name varchar2 (23),
animal_vaccination_ck  varchar(1) CHECK(animal_vaccination_ck IN ('Y','N'))
);

CREATE TABLE doors
(
doors_id number REFERENCES doorknobs(door_id)
);

SELECT *
FROM customer;

CREATE VIEW customer_south AS
SELECT customer_id,first_name,region
FROM customer
WHERE region='SOUTH';

SELECT *
FROM customer_south;

CREATE OR REPLACE VIEW customer_south AS
SELECT first_name,last_name,region
FROM customer
WHERE region='SOUTH' ;

SELECT *
FROM customer_south;

UPDATE customer_south
SET last_name='Smith'
WHERE last_name='AMIRTHRAJ';

SELECT *
FROM customer_south;

SELECT *
FROM customer;

SELECT *
FROM sales;

CREATE VIEW customer_north AS
SELECT s.order_id,s.product_id,c.customer_id
FROM sales s, customer c
WHERE s.customer_id=c.customer_id
AND c.region='NORTH';

SELECT *
FROM customer_north;

SELECT *
FROM sales;
SELECT *
FROM product;


CREATE VIEW sales_mobile AS
SELECT s.sales_date,s.order_id,s.quantity,s.unit_price,s.total_amount,p.product_name,p.product_category
FROM sales s, product p
WHERE s.product_id=p.product_id
AND p.product_category='Mobile';

CREATE OR REPLACE VIEW sales_mobile AS
SELECT s.sales_date,s.order_id,s.quantity,s.unit_price,S.total_amount,p.product_id,p.product_name,p.product_category
FROM sales s, product p
WHERE s.product_id=p.product_id
AND p.product_category='Mobile';

CREATE SYNONYM inventory_data for sales;
SELECT *
FROM inventory_data;

CREATE SEQUENCE customer_sequence
MINVALUE 1
MAXVALUE 100
START WITH 1
INCREMENT BY 1
CACHE 10;

SELECT customer_sequence.NEXTVAL
FROM dual;

SELECT customer_sequence.CURRVAL
FROM dual;

GRANT select, delete
ON sales
TO HR ;

GRANT all
ON sales
TO HR
WITH GRANT OPTION;

REVOKE select,delete
ON sales
FROM HR ;

SELECT *
FROM customer;

SELECT customer_id
FROM customer 
WHERE customer_id IN(SELECT customer_id FROM customer WHERE first_name='TOM' or first_name='JOHN');

SELECT *
FROM sales x
WHERE total_amount >(SELECT avg(total_amount) FROM sales y WHERE y.customer_id=x.customer_id)
ORDER BY customer_id;

SELECT *
FROM customer;

CREATE INDEX customer_city_index
ON customer(city) ;

SELECT city
FROM customer;

SELECT *
FROM customer
WHERE city='Atlanta' ;

SELECT *
FROM customer;

CREATE UNIQUE INDEX customer_id_index
ON customer(customer_id);

SELECT *
FROM customer
WHERE customer_id=11 ;

SELECT *
FROM customer
WHERE country='USA';

CREATE INDEX customer_lower_country
ON customer(LOWER(country)) ;

SELECT *
FROM customer
WHERE LOWER(country)='usa'; 

DROP INDEX customer_city_index;

ALTER INDEX customer_id_index
RENAME TO customer_id_unique_index;SELECT *
FROM CAT;
DESC sales;
SELECT *
FROM sales ;
SELECT order_id,product_id
FROM sales ;
SELECT sales_date,order_id,product_id,customer_id,quantity,total_amount
FROM sales;
SELECT*
FROM sales
WHERE total_amount>100;
SELECT *
FROM sales
WHERE total_amount<=100;
SELECT *
FROM sales
WHERE total_amount=44;
SELECT *
FROM sales
WHERE total_amount!=44;
SELECT *
FROM product ;
SELECT product_id,product_name,color
FROM product;
SELECT *
FROM customer;
SELECT * FROM sales ;
SELECT * FROM sales WHERE total_amount BETWEEN 0 and 100;
SELECT * FROM sales WHERE total_amount NOT BETWEEN 0 and 100;
SELECT * FROM sales WHERE NOT (total_amount BETWEEN 0 and 100);
SELECT * FROM sales WHERE total_amount IN(330);
SELECT * FROM sales WHERE total_amount NOT IN(330);
SELECT * FROM product;
SELECT * FROM product WHERE product_name LIKE 'i%';
SELECT * FROM product WHERE product_category LIKE 'Com_uter';
SELECT * FROM sales WHERE total_amount < ALL(330,66);
SELECT * FROM sales WHERE total_amount = ALL(330,66);
SELECT * FROM sales WHERE total_amount > ANY(330,66);
SELECT * FROM product WHERE color IS NULL;
SELECT * FROM product WHERE color IS NOT NULL;
SELECT * FROM sales WHERE total_amount >100 OR sales_date='09-FEB-15';
SELECT sales_amount,tax_amount,total_amount
FROM sales;
SELECT sales_amount,tax_amount,total_amount,sales_amount+tax_amount,sales_amount-tax_amount,sales_amount *10
FROM sales;
SELECT sales_date,sales_amount,tax_amount,total_amount
FROM sales
ORDER BY sales_date;
SELECT sales_date,sales_amount,tax_amount,total_amount
FROM sales
ORDER BY sales_date DESC;
SELECT sales_date,sales_amount,tax_amount,total_amount
FROM sales
ORDER BY sales_date,total_amount,tax_amount;
SELECT * FROM product;
SELECT * FROM product
ORDER BY color;
SELECT * FROM product
ORDER BY color DESC;
SELECT * FROM sales_history;
SELECT sales_date,order_id,product_id
FROM sales
UNION
SELECT sales_date,order_id,product_id
FROM sales_history;
SELECT sales_date,order_id,product_id
FROM sales
UNION ALL
SELECT sales_date,order_id,product_id
FROM sales_history;
SELECT sales_date,order_id,product_id
FROM sales
INTERSECT
SELECT sales_date,order_id,product_id
FROM sales_history;
SELECT sales_date,order_id,product_id
FROM sales
MINUS
SELECT sales_date,order_id,product_id
FROM sales_history;
SELECT COUNT(*)
FROM sales;
SELECT SUM(total_amount)
FROM sales;
SELECT MIN(total_amount)
FROM sales;
SELECT MAX(total_amount)
FROM sales;
SELECT  sales_date,SUM(total_amount)
FROM sales;
GROUP BY sales_date
ORDER BY sales_date;
SELECT sales_date,product_id,customer_id, SUM(total_amount)
FROM sales
WHERE sales_date LIKE '%JAN-15'
GROUP BY sales_date,product_id,customer_id
ORDER BY sales_date,product_id,customer_id;
SELECT sales_date,product_id, SUM(total_amount) 
FROM sales
WHERE sales_date BETWEEN '01-JAN-15' and '31-JAN-15'
GROUP BY sales_date,product_id
HAVING SUM(total_amount)>100;
SELECT *
FROM sales;
SElECT *
FROM product;
SELECT sales.sales_date,sales.order_id,sales.product_id,product.product_id,product.product_name
FROM sales INNER JOIN product
ON sales.product_id=product.product_id;
SELECT sales.sales_date,sales.order_id,sales.product_id,product.product_id,product.product_name
FROM sales LEFT OUTER JOIN product
ON sales.product_id=product.product_id;
SELECT sales.sales_date,sales.order_id,sales.product_id,product.product_id,product.product_name
FROM sales RIGHT OUTER JOIN product
ON sales.product_id=product.product_id;
SELECT sales.sales_date,sales.order_id,sales.product_id,product.product_id,product.product_name
FROM sales FULL OUTER JOIN product
ON sales.product_id=product.product_id;
SELECT sales.product_id,sales.order_id,product.product_id
FROM sales CROSS JOIN product;
SELECT *
FROM sales NATURAL JOIN product;
SELECT product_id, order_id,standard_cost
FROM sales NATURAL JOIN product;
SELECT user,sysdate 
FROM dual;
DESC dual;
SELECT round(28.889,2)
FROM sales;
SELECT round(28.889,2)
FROM dual;
SELECT ceil(48.95)
FROM dual;
SELECT power(16,2)
FROM dual;
SELECT sqrt(16)
FROM dual;
SELECT greatest(11,10,11.1)
FROM dual;
SELECT upper('john')
FROM dual;
SELECT lower('JoHn')
FROM dual;
SELECT length('John')
FROM dual;
SELECT substr('ParthaRay',1,3)
FROM dual;
SELECT decode(5,10,'TEN',2, 'TWO',5,'FIVE')
FROM dual;
SELECT round(28.889,2), ceil(48.95),power(16,2), sqrt(16), greatest(11,10,11.1), upper('john'), lower('JoHn'), length('John'), substr('ParthaRay',1,3), decode(5,10,'TEN',2, 'TWO',5,'FIVE')
FROM dual;
SELECT add_months('01-JAN-2015',24),months_between('11-JAN-2017','01-JAN-1986'),last_day('01-JUN-2015'),next_day('02-FEB-2015','Tuesday')
FROM dual;
SELECT last_day(sales_date),add_months(sales_date,6),sales_date
FROM sales;
SELECT add_months ('07-JUL-2015', 3)
FROM dual;
SELECT add_months('07-JUL-2015',-3)
FROM dual;
SELECT concat('rush','hour')
FROM dual;
SELECT length ('SQL  Course')
FROM dual;
SELECT lpad ('course',9)
FROM dual;
SELECT rpad ('course',9)
FROM dual;
SELECT instr ('Oracale Course', 'r')
FROM dual;
SELECT log (10,20)
FROM dual;
SELECT last_day(to_date('2015/03/15','yyyy/mm/dd'))
FROM dual;
SELECT months_between (to_date('2015/01/01','yyyy/mm/dd'),to_date('2015/03/01','yyyy/mm/dd'))
FROM dual;
SELECT sales_date,total_amount,
case 
when total_amount <= 100 then 'Low'
when total_amount < 1000 then 'Medium'
else 'High'
end
FROM sales;
SELECT sales_date as "Sales Date",total_amount,
case
when total_amount<= 100 then 'Low'
when total_amount<= 1000 then 'Medium'
else 'High'
end as category
FROM sales;
SELECT distinct sales_date
FROM sales;
SELECT sysdate
FROM dual;
SELECT rownum, sales_date
FROM sales;
CREATE table customers
(customer_id number(11),
 customer_name varchar2(20),
 city varchar2(20),
 join_date date
 );
 DESC customers;
 ALTER TABLE customers
 ADD(customer_country varchar2(20));
 ALTER TABLE customers
 MODIFY (customer_id number(10));
 ALTER TABLE customers
 DROP COLUMN city;
 CREATE table MOVIES
 (movie_number number(11),
  movie_name varchar2(100),
  movie_type varchar2(40),
  movie_release_date date
 );
 DESC MOVIES;
 ALTER table MOVIES
 ADD(movie_language varchar(30));
 ALTER table MOVIES
 MODIFY(movie_type varchar2(50));
 INSERT INTO MOVIES(movie_number,movie_name,movie_type,movie_release_date)
 VALUES(1,'Click','Comedy','01-JAN-15');
COMMIT;
INSERT INTO MOVIES (movie_number,movie_name,movie_type,movie_release_date)
  SELECT movie_number,movie_name,movie_type,movie_release_date 
  FROM MOVIES;
COMMIT;
DESC customers;
INSERT INTO customers(customer_id,customer_name,join_date,customer_country)
VALUES(234,'Jacob','01-JAN-2015','USA');
COMMIT;
INSERT INTO customers(customer_id,customer_name,join_date,customer_country)
  SELECT customer_id,customer_name,join_date,customer_country
  FROM customers;
COMMIT;
SELECT *
FROM customers;
DELETE
FROM customers 
WHERE customer_id=234
AND customer_name='Jacob';
ROLLBACK;
SELECT*
FROM customers;
UPDATE customers
SET customer_id=111,
    join_date='01-FEB-15'
WHERE customer_id=234;
SELECT *
FROM customers;
COMMIT;
TRUNCATE TABLE customers;
SELECT *
FROM customers;
INSERT INTO MOVIES(movie_number,movie_name,movie_type,movie_release_date,movie_language)
VALUES(1,'Bad Girl Island','thriler','02-MAR-15','english');
COMMIT;
DESC MOVIES;
SELECT*
FROM MOVIES;
INSERT INTO MOVIES(movie_number,movie_name,movie_type,movie_release_date,movie_language)
VALUES(2,'Rush Hour','Comedy','01-FEB-00','english' );
COMMIT;
INSERT INTO MOVIES(movie_number,movie_name,movie_type,movie_release_date,movie_language)
VALUES(3,'Scarface','Thriller','01-MAR-86','english');
COMMIT;
SELECT *
FROM MOVIES;
UPDATE MOVIES
SET
   movie_number=1000  
WHERE movie_number=1;
COMMIT;
SELECT *
FROM MOVIES;
DELETE
FROM MOVIES
WHERE movie_name='Rush Hour';
ROLLBACK;
SELECT *
FROM MOVIES;
DROP TABLE customers;
CREATE TABLE customers
(
customer_id number(11) NOT NULL,
customer_name varchar (25),
join_date date

);
SELECT *
FROM customers;

INSERT INTO customers (customer_id,customer_name,join_date)
VALUES(1,'John','01-JAN-2015');
COMMIT;

CREATE TABLE cars
(
car_id number(11) UNIQUE,
car_name varchar(25)

);
INSERT INTO cars (car_id,car_name)
VALUES (1,'Mustang');
COMMIT;
INSERT INTO cars (car_id,car_name)
VALUES(1,'Tacoma');

CREATE TABLE trucks
(
truck_id number(11) PRIMARY KEY,
truck_name varchar(25)
);
INSERT INTO trucks (truck_id, truck_name)
VALUES (1,'Tacoma');
INSERT INTO trucks(truck_id, truck_name)
VALUES (1, NULL);

CREATE TABLE horses
(
horse_id number (11),
horse_name varchar(25),
registered varchar(1) CHECK(registered IN ('Y','N'))
);

INSERT INTO horses (horse_id,horse_name,registered)
VALUES (1,'Amy','Y');
COMMIT;
INSERT INTO horses (horse_id,horse_name,registered)
VALUES (2,'Sara','T');

CREATE TABLE automobiles
(
auto_id number REFERENCES cars(car_id),
auto_name varchar2(25)
);

INSERT INTO automobiles (auto_id,auto_name)
VALUES (1,'Tacoma');
COMMIT;

CREATE TABLE pictures
(
picture_id number(11),
picture_size number(11),
picture_weight number(11),
CONSTRAINT PRODUCT_DT_PK
PRIMARY KEY (picture_id,picture_size,picture_weight)

);

ALTER TABLE cars
ADD CONSTRAINT car_name
PRIMARY KEY (car_name);

ALTER TABLE cars
DISABLE CONSTRAINT car_name;

ALTER TABLE cars
ENABLE CONSTRAINT car_name;

CREATE TABLE doorknobs
(
door_id number(11),
door_number number (11),
CONSTRAINT door_knobs
UNIQUE (door_id),
PRIMARY KEY (door_number)
);
INSERT INTO doorknobs (door_id,door_number)
VALUES (1,11);
COMMIT;

INSERT INTO doorknobs (door_id,door_number)
VALUES(NULL,12);
COMMIT;

INSERT INTO doorknobs (door_id,door_number)
VALUES(2,NULL);

ALTER TABLE automobiles
ADD CONSTRAINT auto_name
UNIQUE (auto_name);

CREATE TABLE animals
(
animal_id number (11),
animal_name varchar2 (23),
animal_vaccination_ck  varchar(1) CHECK(animal_vaccination_ck IN ('Y','N'))
);

CREATE TABLE doors
(
doors_id number REFERENCES doorknobs(door_id)
);

SELECT *
FROM customer;

CREATE VIEW customer_south AS
SELECT customer_id,first_name,region
FROM customer
WHERE region='SOUTH';

SELECT *
FROM customer_south;

CREATE OR REPLACE VIEW customer_south AS
SELECT first_name,last_name,region
FROM customer
WHERE region='SOUTH' ;

SELECT *
FROM customer_south;

UPDATE customer_south
SET last_name='Smith'
WHERE last_name='AMIRTHRAJ';

SELECT *
FROM customer_south;

SELECT *
FROM customer;

SELECT *
FROM sales;

CREATE VIEW customer_north AS
SELECT s.order_id,s.product_id,c.customer_id
FROM sales s, customer c
WHERE s.customer_id=c.customer_id
AND c.region='NORTH';

SELECT *
FROM customer_north;

SELECT *
FROM sales;
SELECT *
FROM product;


CREATE VIEW sales_mobile AS
SELECT s.sales_date,s.order_id,s.quantity,s.unit_price,s.total_amount,p.product_name,p.product_category
FROM sales s, product p
WHERE s.product_id=p.product_id
AND p.product_category='Mobile';

CREATE OR REPLACE VIEW sales_mobile AS
SELECT s.sales_date,s.order_id,s.quantity,s.unit_price,S.total_amount,p.product_id,p.product_name,p.product_category
FROM sales s, product p
WHERE s.product_id=p.product_id
AND p.product_category='Mobile';

CREATE SYNONYM inventory_data for sales;
SELECT *
FROM inventory_data;

CREATE SEQUENCE customer_sequence
MINVALUE 1
MAXVALUE 100
START WITH 1
INCREMENT BY 1
CACHE 10;

SELECT customer_sequence.NEXTVAL
FROM dual;

SELECT customer_sequence.CURRVAL
FROM dual;

GRANT select, delete
ON sales
TO HR ;

GRANT all
ON sales
TO HR
WITH GRANT OPTION;

REVOKE select,delete
ON sales
FROM HR ;

SELECT *
FROM customer;

SELECT customer_id
FROM customer 
WHERE customer_id IN(SELECT customer_id FROM customer WHERE first_name='TOM' or first_name='JOHN');

SELECT *
FROM sales x
WHERE total_amount >(SELECT avg(total_amount) FROM sales y WHERE y.customer_id=x.customer_id)
ORDER BY customer_id;

SELECT *
FROM customer;

CREATE INDEX customer_city_index
ON customer(city) ;

SELECT city
FROM customer;

SELECT *
FROM customer
WHERE city='Atlanta' ;

SELECT *
FROM customer;

CREATE UNIQUE INDEX customer_id_index
ON customer(customer_id);

SELECT *
FROM customer
WHERE customer_id=11 ;

SELECT *
FROM customer
WHERE country='USA';

CREATE INDEX customer_lower_country
ON customer(LOWER(country)) ;

SELECT *
FROM customer
WHERE LOWER(country)='usa'; 

DROP INDEX customer_city_index;

ALTER INDEX customer_id_index
RENAME TO customer_id_unique_index;

SELECT*
FROM Sales
WHERE total_amount > '1000';

SELECT *
FROM product
WHERE product_category='Mobile';

SELECT *
FROM sales
WHERE sales_amount BETWEEN 100 and 500 ;

SELECT *
FROM sales
WHERE sales_amount NOT BETWEEN 100 and 500;

SELECT *
FROM sales
WHERE sales_amount IN (1600,60);

SELECT *
FROM sales
WHERE sales_amount NOT IN (1600,60) ;

SELECT *
FROM product;

SELECT *
FROM product
WHERE product_name LIKE '%ile Cover';

SELECT *
FROM product
WHERE product_name LIKE '%bile Cov%';

SELECT *
FROM product
WHERE product_name LIKE 'M_bile Cover' ;

SELECT *
FROM sales;

SELECT *
FROM sales
WHERE total_amount >= ANY(44,66);

SELECT *
FROM sales
WHERE total_amount >= ALL(44,66);

SELECT *
FROM product;

SELECT *
FROM sales
WHERE total_amount > ALL() ;

SELECT *
FROM product
WHERE color IS NULL ;

SELECT *
FROM sales
WHERE customer_id = 11 AND total_amount >= 100 ;

SELECT *
FROM sales
WHERE customer_id = 11 OR total_amount >= 100;

SELECT *
FROM sales
WHERE NOT (total_amount >=1000);

SELECT *
FROM sales
WHERE quantity IN(20,2,10);

SELECT *
FROM product
WHERE product_name LIKE 'MOB%' ;

SELECT *
FROM sales
WHERE total_amount > ALL(50,100,200) ;

SELECT *
FROM sales
WHERE total_amount > ANY(50,100,200);

SELECT sales_amount,tax_amount,sales_amount + tax_amount,total_amount
FROM SALES;

SELECT sales_amount,tax_amount,total_amount,total_amount-tax_amount
FROM sales;

SELECT sales_date,sales_amount,tax_amount,total_amount
FROM sales
ORDER BY sales_date,sales_amount desc ; 

SELECT *
FROM product;

SELECT product_name,color
FROM product
ORDER BY color;

SELECT *
FROM sales;

SELECT sales_date,order_id,customer_id
FROM sales 
UNION 
SELECT sales_date,order_id,customer_id
FROM sales;

SELECT sales_amount,tax_amount,total_amount
FROM sales
ORDER BY tax_amount ;

SELECT order_id,sales_date,product_id
FROM sales
ORDER BY order_id desc;
SELECT sales_date,order_id,product_id
FROM sales
ORDER BY sales_date,total_amount;
SELECT *
FROM product
ORDER BY color;
SELECT * 
FROM sales;
SELECT sales_date, order_id, product_id, sales_amount,tax_amount
FROM sales
ORDER BY tax_amount;
SELECT sales_date,order_id,product_id,sales_amount,tax_amount
FROM sales
ORDER BY sales_amount,tax_amount ;
SELECT sales_date,order_id,product_id,sales_amount,tax_amount
FROM sales
ORDER BY order_id desc  ;

SELECT *
FROM sales 
UNION
SElECT*
FROM sales_history;
SELECT *
FROM sales
UNION ALL
SELECT * 
FROM sales_history;
SELECT *
FROM sales 
INTERSECT
SELECT *
FROM sales_history;

SELECT *
FROM sales
MINUS
SELECT *
FROM sales_history ;
SELECT *
FROM sales 
UNION ALL
SELECT *
FROM sales_history;

SELECT MIN(sales_date)
FROM sales;

SELECT sales_date, total_amount
FROM sales
GROUP BY sales_date;

SELECT AVG(unit_price)
FROM sales;

SELECT AVG(unit_price), MAX(unit_price), COUNT(unit_price)
FROM sales;

SELECT sales_date,SUM(order_id)
FROM sales
GROUP BY sales_date;

SELECT customer_id
FROM sales
GROUP BY customer_id;

SELECT order_id,SUM(total_amount)
FROM sales
GROUP BY order_id;

SELECT *
FROM sales;

SELECT sales_date,product_id,MIN(quantity)
FROM sales
GROUP BY sales_date,product_id;

SELECT sales_date, MIN(quantity)
FROM sales
GROUP BY sales_date
HAVING MIN(quantity)= 2;

SELECT COUNT(*)
FROM sales;

SELECT  sales_date,SUM(quantity)
FROM sales
GROUP BY sales_date;

SELECT sales_date, order_id, MAX(quantity)
FROM sales
GROUP BY sales_date, order_id;







