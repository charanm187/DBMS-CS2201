-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: CHARAN M
-- USN: 1RUA24BCA0016
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
'root@localhost', 'RVU-PC-27', '8.4.6', '2025-09-08 06:00:00'




CREATE DATABASE EXP03;
USE EXP03;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 



CREATE TABLE EMPLOYEES (
EMPID VARCHAR(10) PRIMARY KEY,
FIRSTNAME VARCHAR(25),
LASTNAME VARCHAR(15),
SALARY DECIMAL(8,2),
DOB DATETIME,
HIREDATE DATE
);
DESC EMPLOYEES;


-- 2. Insert 10 records to employee;

INSERT INTO EMPLOYEES VALUES (1, 'CHARAN', 'M', 9000, '2006-09-28', '2025-09-11');
INSERT INTO EMPLOYEES VALUES (2, 'HARSHA', 'PURANIK', 2000, '2006-05-23', '2025-09-11');
INSERT INTO EMPLOYEES VALUES (3, 'HARSHA', 'M', 2200, '2006-03-30', '2025-09-11');
INSERT INTO EMPLOYEES VALUES (4, 'VISHWAS', 'GOWDA', 2500, '2006-05-06', '2025-08-11');
INSERT INTO EMPLOYEES VALUES (5, 'HARSHITH', 'K', 2900, '2006-01-03', '2025-04-11');
INSERT INTO EMPLOYEES VALUES (6, 'MOHAN', 'S', 3300, '2006-05-07', '2025-05-11');
INSERT INTO EMPLOYEES VALUES (7, 'NITHIN', 'F', 3600, '2006-01-02', '2025-03-11');
INSERT INTO EMPLOYEES VALUES (8, 'BALA', 'G', 2600, '2006-03-16', '2025-01-11');
INSERT INTO EMPLOYEES VALUES (9, 'ADARSH', 'C', 2600, '2006-08-06', '2025-07-11');
INSERT INTO EMPLOYEES VALUES (10, 'SHIVU', 'M', 1500, '2006-06-26', '2025-04-11');

select * from EMPLOYEES





-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  

create table orders(
orderID varchar(10) PRIMARY KEY,
orderdate date,
totalamount decimal(8,2),
EMPID varchar(10),
FOREIGN KEY(EMPID) references EMPLOYEES(EMPID)
);

-- 4. Insert 10 records to Orders
INSERT INTO ORDERS (orderID, orderdate, totalamount, EMPID)
VALUES
('ORD001', '2025-09-01', 2500, 1),
('ORD002', '2025-09-02', 2200, 2),
('ORD003', '2025-09-03', 500, 3),
('ORD004', '2025-09-04', 200, 4),
('ORD005', '2025-09-05', 500, 5),
('ORD006', '2025-09-06', 9500,6),
('ORD007', '2025-09-07', 6500,7),
('ORD008', '2025-09-08', 3500, 8),
('ORD009', '2025-09-09', 9500, 9),
('ORD0010', '2025-09-10', 6500, 10);


select * from orders

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.

select * from orders


-- Output: 

ORD001	2025-09-01	2500.00	1
ORD0010	2025-09-10	6500.00	10
ORD002	2025-09-02	2200.00	2
ORD003	2025-09-03	500.00	3
ORD004	2025-09-04	200.00	4
ORD005	2025-09-05	500.00	5
ORD006	2025-09-06	9500.00	6
ORD007	2025-09-07	6500.00	7
ORD008	2025-09-08	3500.00	8
ORD009	2025-09-09	9500.00	9
			

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */

SELECT EMPID, FIRSTNAME, LASTNAME, SALARY, ROUND(SALARY) AS Rounded_Salary
FROM EMPLOYEES;

-- Output: 

1	CHARAN	M	9000.00	9000
10	SHIVU	M	1500.00	1500
2	HARSHA	PURANIK	2000.00	2000
3	HARSHA	M	2200.00	2200
4	VISHWAS	GOWDA	2500.00	2500
5	HARSHITH	K	2900.00	2900
6	MOHAN	S	3300.00	3300
7	NITHIN	F	3600.00	3600
8	BALA	G	2600.00	2600
9	ADARSH	C	2600.00	2600


/* b. Absolute Values: Show absolute values of salaries */

SELECT EMPID, FIRSTNAME, LASTNAME, SALARY, ABS(SALARY) AS Absolute_Salary
FROM EMPLOYEES;

-- Output: 

1	CHARAN	M	9000.00	9000.00
10	SHIVU	M	1500.00	1500.00
2	HARSHA	PURANIK	2000.00	2000.00
3	HARSHA	M	2200.00	2200.00
4	VISHWAS	GOWDA	2500.00	2500.00
5	HARSHITH	K	2900.00	2900.00
6	MOHAN	S	3300.00	3300.00
7	NITHIN	F	3600.00	3600.00
8	BALA	G	2600.00	2600.00
9	ADARSH	C	2600.00	2600.00

/* c. Ceiling Values: Get ceiling values of order amounts */

SELECT ORDERID, ORDERDATE, TOTALAMOUNT, CEIL(TOTALAMOUNT) AS Ceiling_Amount
FROM ORDERS;

-- Output: 

ORD001	2025-09-01	2500.00	2500
ORD0010	2025-09-10	6500.00	6500
ORD002	2025-09-02	2200.00	2200
ORD003	2025-09-03	500.00	500
ORD004	2025-09-04	200.00	200
ORD005	2025-09-05	500.00	500
ORD006	2025-09-06	9500.00	9500
ORD007	2025-09-07	6500.00	6500
ORD008	2025-09-08	3500.00	3500
ORD009	2025-09-09	9500.00	9500


-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */


SELECT COUNT(*) AS Total_Employees
FROM EMPLOYEES;

-- Output: 

10

/* b. Sum of Salaries: Calculate total salary expense */

SELECT SUM(SALARY) AS SUM_OF_SALARIES
FROM EMPLOYEES;

-- Output: 

32200.00

/* c. Average Order Amount: Find average order value */

SELECT AVG(TOTALAMOUNT) AS Average_Order_Amount
FROM ORDERS

-- Output: 

4140.000000


/* d. Max/Min Salary: Find highest and lowest salaries */

SELECT MAX(SALARY) AS Highest_Salary, MIN(SALARY) AS Lowest_Salary
FROM EMPLOYEES;

-- Output: 

9000.00	1500.00

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */

SELECT EMPID, 
       FIRSTNAME, 
       UPPER(FIRSTNAME) AS FIRSTNAME_UPPER, 
       LOWER(FIRSTNAME) AS FIRSTNAME_LOWER,
       LASTNAME,
       UPPER(LASTNAME) AS LASTNAME_UPPER,
       LOWER(LASTNAME) AS LASTNAME_LOWER
FROM EMPLOYEES;

-- Output: 

1	CHARAN	CHARAN	charan	M	M	m
10	SHIVU	SHIVU	shivu	M	M	m
2	HARSHA	HARSHA	harsha	PURANIK	PURANIK	puranik
3	HARSHA	HARSHA	harsha	M	M	m
4	VISHWAS	VISHWAS	vishwas	GOWDA	GOWDA	gowda
5	HARSHITH	HARSHITH	harshith	K	K	k
6	MOHAN	MOHAN	mohan	S	S	s
7	NITHIN	NITHIN	nithin	F	F	f
8	BALA	BALA	bala	G	G	g
9	ADARSH	ADARSH	adarsh	C	C	c

/* b. Concatenate Names: Create full names */
SELECT EMPID, 
       FIRSTNAME, 
       LASTNAME,
       CONCAT(FIRSTNAME, ' ', LASTNAME) AS FULL_NAME
FROM EMPLOYEES;

-- Output:

1	CHARAN	M	CHARAN M
10	SHIVU	M	SHIVU M
2	HARSHA	PURANIK	HARSHA PURANIK
3	HARSHA	M	HARSHA M
4	VISHWAS	GOWDA	VISHWAS GOWDA
5	HARSHITH	K	HARSHITH K
6	MOHAN	S	MOHAN S
7	NITHIN	F	NITHIN F
8	BALA	G	BALA G
9	ADARSH	C	ADARSH C 

/* c. Extract Substring: Get first 3 characters of first names */

SELECT EMPID, 
       FIRSTNAME, 
       SUBSTRING(FIRSTNAME, 1, 3) AS FIRSTNAME_SUBSTR
FROM EMPLOYEES;

-- Output: 

1	CHARAN	CHA
10	SHIVU	SHI
2	HARSHA	HAR
3	HARSHA	HAR
4	VISHWAS	VIS
5	HARSHITH	HAR
6	MOHAN	MOH
7	NITHIN	NIT
8	BALA	BAL
9	ADARSH	ADA

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert date to string: Convert text to DATE type */

SELECT 
    STR_TO_DATE('2025-09-11', '%Y-%m-%d') AS Converted_Date;
    
    SELECT DATE_FORMAT(HIREDATE, '%d-%m-%Y') AS Date_As_String
FROM EMPLOYEES;


-- Output: 
2025-09-11

11-09-2025
11-04-2025
11-09-2025
11-09-2025
11-08-2025
11-04-2025
11-05-2025
11-03-2025
11-01-2025
11-07-2025

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
SELECT NOW();

-- Output: 
2025-09-08 07:10:55

/* b. Extract Year: Get year from order dates */

SELECT ORDERID, ORDERDATE, YEAR(ORDERDATE) AS Order_Year
FROM ORDERS;


-- Output: 
ORD001	2025-09-01	2025
ORD0010	2025-09-10	2025
ORD002	2025-09-02	2025
ORD003	2025-09-03	2025
ORD004	2025-09-04	2025
ORD005	2025-09-05	2025
ORD006	2025-09-06	2025
ORD007	2025-09-07	2025
ORD008	2025-09-08	2025
ORD009	2025-09-09	2025


/* c. Add Months: Add 3 months to order dates */
SELECT ORDERID, ORDERDATE, DATE_ADD(ORDERDATE, INTERVAL 3 MONTH) AS OrderDate_Plus_3Months
FROM ORDERS;

-- Output: 

ORD001	2025-09-01	2025-12-01
ORD0010	2025-09-10	2025-12-10
ORD002	2025-09-02	2025-12-02
ORD003	2025-09-03	2025-12-03
ORD004	2025-09-04	2025-12-04
ORD005	2025-09-05	2025-12-05
ORD006	2025-09-06	2025-12-06
ORD007	2025-09-07	2025-12-07
ORD008	2025-09-08	2025-12-08
ORD009	2025-09-09	2025-12-09

/* d. Days Since Order: Calculate days between order date and now */
SELECT ORDERID, ORDERDATE, DATEDIFF(NOW(), ORDERDATE) AS Days_Since_Order
FROM ORDERS;
-- Output: 

ORD001	2025-09-01	7
ORD0010	2025-09-10	-2
ORD002	2025-09-02	6
ORD003	2025-09-03	5
ORD004	2025-09-04	4
ORD005	2025-09-05	3
ORD006	2025-09-06	2
ORD007	2025-09-07	1
ORD008	2025-09-08	0
ORD009	2025-09-09	-1

-- END of the Task -- 
