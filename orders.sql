CREATE TABLE "Products" (
	"ID" INTEGER PRIMARY KEY AUTOINCREMENT,
	"NAME" TEXT NOT NULL,
	"PRICE"	INTEGER NOT NULL,
	"CATEGORY" TEXT  NOT NULL,
	"VENDOR" TEXT  NOT NULL
);

CREATE TABLE "Customer" (
	"ID" INTEGER PRIMARY KEY,
	"NAME" TEXT NOT NULL,
	"ADDRESS" TEXT NOT NULL,
	"AGE" INT NOT NULL
);

CREATE TABLE "ORDERS" (
	"PRODUCT_ID" INTEGER NOT NULL,
	"CUSTOMER_ID" INTEGER NOT NULL,
	PRIMARY KEY ("PRODUCT_ID", "CUSTOMER_ID"),
	FOREIGN KEY ("PRODUCT_ID") REFERENCES Products("ID"),
	FOREIGN KEY ("CUSTOMER_ID") REFERENCES Customer("ID")
	);
  
INSERT INTO ORDERS VALUES (1, 2);
INSERT INTO ORDERS VALUES (1, 3);
INSERT INTO ORDERS VALUES (1, 4);
INSERT INTO ORDERS VALUES (2, 2);
INSERT INTO ORDERS VALUES (2, 1);
INSERT INTO ORDERS VALUES (4, 3);
INSERT INTO ORDERS VALUES (3, 4);

/*1. Find the customer who has the maximum number of orders*/

SELECT CUSTOMER_ID, MAX(counter)  
FROM (SELECT CUSTOMER_ID, count(*) AS counter 
FROM ORDERS O JOIN Products P on O.PRODUCT_ID = P.ID 
JOIN Customer C on O.CUSTOMER_ID = C.ID
GROUP BY O.CUSTOMER_ID)

/*2. Find the customer who in his orders has accumulated the maximum amount
(ie his purchase amount is the highest relative to the other customers)*/

SELECT CUSTOMER_ID, max(MAX_SUN)
FROM(SELECT CUSTOMER_ID, sum(PRICE) AS MAX_SUN
FROM (SELECT * FROM ORDERS O 
JOIN Products P on O.PRODUCT_ID = P.ID
JOIN Customer C on O.CUSTOMER_ID = C.ID) 
GROUP BY CUSTOMER_ID)

/*3. Find customers without orders*/



/*4. Find incorrect records in the order table - that is, records that contain a customer 
that does not exist or an order that does not exist*/



/*5. Create a query that returns the customer list and for each customer the amount of his total orders*/

SELECT CUSTOMER_ID, sum(PRICE) AS SUN_OF_ALL_ORDERS
FROM (SELECT * FROM ORDERS O 
JOIN Products P on O.PRODUCT_ID = P.ID
JOIN Customer C on O.CUSTOMER_ID = C.ID) 
GROUP BY CUSTOMER_ID

/*6. Create a query that returns the customer list and for each customer the average amount of his orders*/

SELECT CUSTOMER_ID, avg(PRICE) AS AVG
FROM (SELECT * FROM ORDERS O 
JOIN Products P on O.PRODUCT_ID = P.ID
JOIN Customer C on O.CUSTOMER_ID = C.ID) 
GROUP BY CUSTOMER_ID

/*7. Create a query that returns the list of customers whose purchases exceeded the average order amount*/



/*8. Find the sum of all orders of all customers together*/

SELECT sum(PRICE) AS SUM_OF_ALL_ORDERS
FROM (SELECT * FROM ORDERS O 
JOIN Products P on O.PRODUCT_ID = P.ID
JOIN Customer C on O.CUSTOMER_ID = C.ID) 

/*9. Find the item ordered the most times*/

SELECT PRODUCT_ID, MAX(counter)  
FROM (SELECT PRODUCT_ID, count(*) AS counter
FROM ORDERS O JOIN Products P on O.PRODUCT_ID = P.ID 
JOIN Customer C on O.CUSTOMER_ID = C.ID
GROUP BY O.PRODUCT_ID)

/*10. Find the items that were not bought at all */

