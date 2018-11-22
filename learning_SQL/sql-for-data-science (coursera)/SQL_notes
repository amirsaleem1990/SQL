SQL: Structured Query Language.
----------------------------------------------------------------------------
SQL is all about data
----------------------------------------------------------------------------
SQL used to query, insert, update and modify data. 
----------------------------------------------------------------------------
SQL is non-procedural language:
  * cannot write completed applicataions.
  * Simple, but powerfull
----------------------------------------------------------------------------
Data Scientist might do a little of the analysis using SQL, however the main thing they're using SQL for is data retrieval. 
----------------------------------------------------------------------------
how you write syntax witt depend on what DBMS(database managment system) you are using, each DBMS its own "dialect", you will tweak based on the "dialect" your DMBS speaks.
----------------------------------------------------------------------------
Miscrosoft SQL Server, IBM DB2 Oracle, Sybase ASE, PostgreSQL, MySQL, Apache Open Office Base, SQLite
----------------------------------------------------------------------------
we use SQLite in this course
----------------------------------------------------------------------------
Database: A container that is used to organize and store all the data.
----------------------------------------------------------------------------
Table: A structured list of data or a specific type (like excel table)
----------------------------------------------------------------------------
Data Modeling: Organizes and structures information into multiple, related tables.
The data model scheme of organization should always represent the real world as closely as possible. 
----------------------------------------------------------------------------
NoSQL: Not Only SQL
A mechanism for storage and retrieval of unstructured data modeled by means other than batular relations in relationnal databases.
----------------------------------------------------------------------------
Relational vs Transactional Model

Relational Model: A database design tha shows the relationships between the different tables, this is really used to optimize querying data, Allows for easy querying and data manipulation in an easy, logical and intuitive way.

Transactional Model: more Operationl database, information may not be stored in a great way for querying and using it for analysis
----------------------------------------------------------------------------
Data Model Building Blocks:
Entity: Person, place, thing, or event
		Distinguishabel, unique, and distinct
Attribute:A characteristic of an entity
Relationship: Describes association among entities:
	1- One-to-many (eg. customer to invoices)
	2- Many-to-many (eg. student to classes)
	3- One-to_one (eg. manager to store)
----------------------------------------------------------------------------
ER model <https://d3c33hcgiwev3.cloudfront.net/JIQNlAqcEei8LQpwydYI3g.processed/full/540p/index.webm?Expires=1541808000&Signature=FePpr~ZG-hWl5-dmrIQ3rxB41Es1BkJ0elECyXrw0501crarca7plbwEwnr~un4vxx7hDZa9RQ5pug23KhMgvDIcIE1OuBLqDotmt0RUZzUsFw82DnI0tOktd-kn6x9G~VP7kjUwyXYtyJyi0xWvsrB37XOXNN0X2CsX0lS0ptc_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A>
dubare repeat karna h, samajh nahi aaya
ERD: It is a key element to understanding how we can pull data from multiple tables.
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
								Retrieve Data 															Retrieve Data
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
# SELECT for one column
SELECT colum_name 
FROM table;
----------------------------------------------------------------------------
# SELECT for more than one column
SELECT column_1, column_2, column_3 
FROM table;
----------------------------------------------------------------------------
# Select all tables
SELECT *
FROM table;
----------------------------------------------------------------------------
# observations limit (first n records)
SELECT column
FROM table
LIMIT 5;

#in Oracle:
SELECT column
FROM table
WHERE ROWNUM <= 5;

#in DB2:
SELECT column
FROM table
FETCH FIRST 5 ROWS ONLY;
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
								Create Data 															Create Data
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
# create table (not a data, but column names, type of data in each column ... etc)
CREATE TABLE table_name
	(
	Id 		char(10)			PRIMARY KEY,
	Brand 	char(10) 			NOT NULL,
	Type 	char(250)			NOT NULL,
	Color 	char(250)			NOT NULL,
	Price 	decimal(8,2) 		NOT NULL,
	Desc 	Varchar (750)		NULL
	);
# Id, Brand, Type, Color, Price, Desc columns names hen
# <Id> column k andar characher type ka data ay ga, jis ki lenght maximum 10 ho gi, column <Type> me 250 characters allow hen........... 
# phir agli entries <PRIMARY KEY, NOT NULL, NULL> is baat ki hen k in column me null value ijaazat h ya nahi, agar khali chor den gy to by default NULL values allow hon gi 
# Every column is either NULL or NOT NULL, an error will be returned if one tries to submit a column with no value, don't confuse null values with empty strings, epmpty string not a null value, NOTE: Primary keys cannot be null or empty value
Note: NULL represents no value
----------------------------------------------------------------------------
# Adding Data to the Table
# when you are sure about order of columns
INSERT INTO table_name
VALUES('14535974'
	,'Gucci'
	,'slippers'
	,'Pink'
	,695.00
	,NULL
	);
# first value to first column, 2nd to 2nd column .... 

# but when you are not sure about order of column, you have to specify column names also
INSERT INTO table_name
		(Id
		,Brand
		,Type
		,color
		,Price
		,Desc
		)
VALUES
		('14535974'
		,'Gucci'
		,'slippers'
		,'Pink'
		,695.00
		,NULL
		);
----------------------------------------------------------------------------------------------------------------------
# Temporary tables
----------------------------------------------------------------------------------------------------------------------
CREATE TEMPORARY TABLE temprary_table_name AS
	(
	SELECT *
	FROM original_table
	WHERE 'shoe_type' == 'sandals'
	)
# equal to: temprary_table_name = original_table[original_table['shoe_type'] == 'sandals']
----------------------------------------------------------------------------
# commenting
for 1 line: - -, eg:
SELECT column_1
- -,column_2
,column_3
,column_4
from table_name


for multiple lines:
/**/, eg:
SELECT column_1
/*,column_2
,column_3
*/
,column_4
from table_name
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
								Operators 																Operators
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
# WHERE clause operators

SELECT column_1
,column_2
,column_3
FROM table_name
WHERE column_1 = 'blablabla';
----------------------------------------------------------------------------
# New clauses and Operators in SQL
WHERE
BETWEEN 	Between an inclusive range
IN
OR  		SQL processing AND before OR
AND 		SQL processing AND before OR
NOT
LIKE
ORDER BY
GROUP BY

#Example of BETWEEN
SELECT column_1
,column_2
,column_3
FROM table_name
WHERE column_3 BETWEEN 10 AND 20;

#Example of IN
SELECT column_1
,column_2
,column_3
FROM table_name
WHERE column_2 IN (9,10,11);
# srif wo rows jin k column_2 ki values (9,10,11) me sy koi 1 h

#Example of OR
SELECT column_1
,column_2
,column_3
FROM table_name
WHERE column_3 = 'amir' OR 'hamza';

#Example of NOT
SELECT *
FROM table_name
WHERE NOT column_1 = 'bla_1' AND NOT column_1='bla_2;

# IN vs. OR
IN works the same as OR.
Benefits of IN:
	1- long list of options
	2- IN executes faster than OR
	3- Don't have to think about the order with IN
	4- Can contain another SELECT

NOTE: if you're using OR and AND together be careful about order of operations and use parentheses
----------------------------------------------------------------------------
# Operator
=			Equal
<>			Not equal
> 		
< 		
>=
<=		
IS NULL 	 Is a null value


#Example of IS NULL
SELECT column_1
,column_2
,column_3
FROM table_name
WHERE column_3 IS NULL;
# wo rows jin k column_3 me NULL h srif wohi rows

#Example of IS NOT NULL
SELECT column_1
,column_2
,column_3
FROM table_name
WHERE column_3 IS NULL;
# wo rows jin k column_3 me NULL h un k ilawa sary data k 3 columns
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
								Wildcards 																Wildcards
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
Wildcards:
	allow more precise search capabilities
	Special character used to match partsof a value
	Search pattern made from literal text, Wildcard character, or a combination
	uses LIKE as an operator(though technically a predicate)
	can only be  used with strings
	cannot be used for non-text datatypes
	Helpful for data scientist as they explore string variables
	not match NULLs
----------------------------------------------------------------------------
----------------- % -----------------
'%Pizza'   		= Grabs anything ending with the word Pizza
'Pizza%'   		= Grabs anything after the word Pizza
'%Pizza%'  		= Grabs anything before and after the word Pizza

'S%E' 	   		= Grabs anything that starts with "S" and ends with "E" (like sadie)
't%@gmail.com'	= Grabs gmail addresses that start with "t"

----------------- _ -----------------

WHERE column_n LIKE '_Pizza' # Note: not supported by DB2
# output:
	spizza
	mpizza
# equal to: column_n LIKE '%Pizza'

-----------------[]----------------

Bracket [] Wildcard:
	used to specify a set of characters in a specific location
	Does not work with all DBMS
	Does not work with SQLite
----------------------------------------------------------------------------
 Downsides of Wildcards:
 	Takes longer to run
 	Better to use another operator (if possible): =, <, =, AND etc.
 	Statements with Wildcards will take longer to run if used at the end of search patterns
 	Placement of Wildcards is important
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
								Sort data 																Sort Data
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
ORDER BY 
	allows user to sort data by particular columns
	Takes the name of one or more columns
	Add a comma after each additional column name
	Can sort by a column not retrieved
	Must always be the last clause in a select statement
----------------------------------------------------------------------------
ORDER BY 2,3	# 2 means 2nd columnn and 3 means 3rd column, etc
----------------------------------------------------------------------------
Sort Direction

DESC = descending order
ASC  = ascending order

Only applies to the  column names it directly precedes
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
								Date cleaning 														Date cleaning
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
LEFT 		# pull limited number of charachters from left side
RIGHT   	# pull limited number of charachters from right side
LENGTH 		# return lenght of a string
POSITION 	# Position of substring, like <index> or <find> in python string methods, return a number of position for
 			  particuler substring, 
 			  NOTE: this is case sensitive
STRPOS		# same as POSITION, 
			  NOTE: this is case sensitive
LOWER 		# for lower case
UPPER 		# for upper case
CONCAT / ||	# Combines values from several columns into one column
			  Note: SQL server support <+> instead of <||>
CAST 		# Allow us to change columns from one data type to another, very usefull to turning strings into numbers or
			  dates
TRIM
RTRIM
LTRIM
TRIM
COALESCE	# return the first non_null value passed for each row
SUBSTRING: 	# Returns the specified number of characters from a particular position of a givin string

LEFT / RIGHT / LENGHT:
	select first_name,
	last_name
	phone_number,
	LEFT(phone_number, 3) AS area_code,
	RIGTH(phone_number, 8) AS phone_number_only,
	RIGTH(phone_number, LENGTH(phone_number) - 4 ) AS phone_number_alt) # this variable and phone_number_only variable are same.. since in this data we get <8> by processing this code <LENGTH(phone_number) - 4 )> which we hardcoded in phone_number_only variable.
	from customer_data 

POSITION / STRPOS / LOWER / UPPER:
	SELECT fitst_name,
	last_name,
	city_state,
	POSITION(',' IN city_state) AS comma_position,
	STRPOS(city_state, ',') AS substr_comma_position, # same as POSITION
	LOWER(city_state) AS lowercase,
	UPPER(city_state) AS uppercase,
	LEFT(city_state, POSITION(',' IN city_state)) AS city
	from customer_data


CONCAT:
	SELECT first_name,
	last_name,
	CONCAT(first_name, ' ', last_name) AS full_name # altarnatively we can replace thin line by <first_name || ' ' || last_name AS full_name
	from customer_data


CAST  / :: :
	# say we have 3 columns, year(2010, 2011..), day(1,2,3...) and month(january, feb...), we need this data as a single date..
	SELECT *, 
	DATE_PART('month', TO_DATE(month, 'month')) AS clean_month, # in this column we obtain <jan> as 1 and <feb> as 2..
	year || '-' || DATE_PART('month', TO_DATE(month, 'month')) || '-' || day AS concatenated_datee, # now we have date in one column bat still this new created calumn has type string, we need to convert this column to date type
	CAST(year || '-' || DATE_PART('month', TO_DATE(month, 'month')) || '-' || day AS date) AS formated_date # we can esily skip this line by using <::>, modify 2nd line in our code <yaer || '-' || .... > to  (year || '-' || DATE_PART('month', TO_DATE(month, 'month')) || '-' || day)::date AS formatted_date_alt
	from ad_clicks
	
	# code above explaination
	DATE_PART('month', TO_DATE(month, 'month')) 
	here changed a month name into the number associated with that particular month.

	Then you can change a string to a date using CAST. CAST is actually useful to change lots of column types. Commonly you might be doing as you saw here, where you change a string to a date using CAST(date_column AS DATE). However, you might want to make other changes to your columns in terms of their data types. You can see other examples here.

	In this example, you also saw that instead of CAST(date_column AS DATE), you can use date_column::DATE.
	
COALESCE:
	# task: column1 k andar jo bhi null hen un me 'no value' daal do
	SELECT *,
		COALESCE(column1, 'no entry') AS 'no value'
		FROM table_name
		WHERE column1 IS NULL

TRIM:
	SELECT TRIM("	You the best.	") AS TrimmdeString
	from table_name;



SUBSTRING:

	SUBSTR(string name
		, string position
		, number of characters to be returned);

	SELECT first_name
	, SUBSTR (first_name, 2, 3)
	FROM Employees_table
	WHERE department_id = 60;
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
								Math operations 													Math operations
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
Multiplication Example:
SELECT
column_1
,column_2
,column_3 * column_4 AS calculated_column
FROM table_name

# it returns 3 columns: column_1, column_2, calculated_column
----------------------------------------------------------------------------
Order of Operations:
parentheses
Exponents
Multiplication
Division
Addition
Subtraction
"Please excuse my dear Anty Sally"
----------------------------------------------------------------------------
Combining Math Operations
SELECT column_1
,column_2
,column_3
,(column2-column_5)/column_3 AS calculated_column
FROM table;
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
									Aggregate 														Aggregate
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
Aggregate
	used to summamrize data
	Finding the highest and lowest values
	Finding the total number of rows
	Finding the average value
	etc..
----------------------------------------------------------------------------
Aggregate functions:
AVG()		# ignoring NULL values, return a scalar value
COUNT()		# count all non-null values, return a scalar value
MIN() 		# ignoring NULL values, return a scalar value
MAX()		# ignoring NULL values, return a scalar value
SUM()		# return a scalar value

MEDIAN - Expert Tip
One quick note that a median might be a more appropriate measure of center for this data, but finding the median happens to be a pretty difficult thing to get using SQL alone — so difficult that finding a median is occasionally asked as an interview question.
----------------------------------------------------------------------------
AVG:
	SELECT AVG(column_5) AS avg_column_5
	FROM table_name

note: AVG() ignore rows containing NULL values
If you want to count NULLs as zero, you will need to use SUM and COUNT. However, this is probably not a good idea if the NULL values truly just represent unknown values for a cell. 
----------------------------------------------------------------------------
COUNT:
	SELECT COUNT (*) AS total_customers
	FROM table_name;
# COUNT(*) counts all the rows in a table containing values or NULL values

	SELECT COUNT(CustomerID) AS	total_customers
	FROM table_name
# Count(column) counts all the rows in a specific column ignoring NULL values
----------------------------------------------------------------------------
MAX:
	SELECT MAX(column_name) AS max_column_price
	FROM table_name

*Expert Tip
Functionally, MIN and MAX are similar to COUNT in that they can be used on non-numerical columns. Depending on the column type, MIN will return the lowest number, earliest date, or non-numerical value as early in the alphabet as possible. As you might suspect, MAX does the opposite—it returns the highest number, the latest date, or the non-numerical value closest alphabetically to “Z.”
----------------------------------------------------------------------------
MAX and MIN:
	SELECT MAX(column_1) AS max_column_price
	,MIN(column_1) AS min_column_price
	FROM table_name
----------------------------------------------------------------------------
MIN:
	same as MAX
----------------------------------------------------------------------------
SUM:
	same as MAX, MIN
----------------------------------------------------------------------------
SUM (with condition):
	SELECT SUM(column_1*column_2) AS total_of_2columns
	FROM table_name
	WHERE column_n = 24;
----------------------------------------------------------------------------
DISTINCT

Using DISTINCT on Aggregate Functions
	<skiping duplicated in specific column> amir
	if DISTINCT is not specified, ALL is assumed
	Cannot use DISTINCT on COUNT(*)
	No value to use with MIN and MAX functions

DISTINCT is always used in SELECT statements, and it provides the unique rows for all columns written in the SELECT statement. Therefore, you only use DISTINCT once in any particular SELECT statement.
You could write:
SELECT DISTINCT column1, column2, column3
FROM table1;

which would return the unique (or DISTINCT) rows across all three columns.
You would not write:
SELECT DISTINCT column1, DISTINCT column2, DISTINCT column3
FROM table1;

You can think of DISTINCT the same way you might think of the statement "unique".
It’s worth noting that using DISTINCT, particularly in aggregations, can slow your queries down quite a bit.
	

SELECT COUNT(DISTINCT column_n)
FROM table_name
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
									Grouping Data 													Grouping Data
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

GROUP BY
	can contain multiple columns
	Every column in your SELECT statement must be present in a GROUP BY clause, except for aggregated  calculations
	NULLs will be grouped together if your GROUP BY column contains NULLs
	WHERE does not work for groups because WHERE filters on rows, instead use HAVING clause to filter for groups

Expert Tip
Before we dive deeper into aggregations using GROUP BY statements, it is worth noting that SQL evaluates the aggregations before the LIMIT clause. If you don’t group by any columns, you’ll get a 1-row result—no problem there. If you group by a column with enough unique values that it exceeds the LIMIT number, the aggregates will be calculated, and then some rows will simply be omitted from the results.

This is actually a nice way to do things because you know you’re going to get the correct aggregates. If SQL cuts the table down to 100 rows, then performed the aggregations, your results would be substantially different. The above query’s results exceed 100 rows, so it’s a perfect example. In the next concept, use the SQL environment to try removing the LIMIT and running it again to see what changes.

The order of column names in your GROUP BY clause doesn’t matter—the results will be the same regardless. If we run the same query and reverse the order in the GROUP BY clause, you can see we get the same results.

As with ORDER BY, you can substitute numbers for column names in the GROUP BY clause. It’s generally recommended to do this only when you’re grouping many columns, or if something else is causing the text in the GROUP BY clause to be excessively long.

A reminder here that any column that is not within an aggregation must show up in your GROUP BY statement. If you forget, you will likely get an error. However, in the off chance that your query does work, you might not like the results!


SELECT
Region
,COUNT(CustomerID) AS total_customers
FROM table_name
GROUP by Region;


HAVING:
HAVING is the “clean” way to filter a query that has been aggregated, but this is also commonly done using a subquery. Essentially, any time you want to perform a WHERE on an element of your query that was created by an aggregate, you need to use HAVING instead.


HAVING Example:

	SELECT
	CustomerID
	,COUNT (*) AS orders
	FROM table_name
	GROUP BY CustomerID
	HAVING COUNT (*) >= 2
----------------------------------------------------------------------------
WHERE vs. HAVING
WHERE filters before data is grouped
HAVING filters after data is grouped
Rows eliminated by the WHERE vlause will not be a included in the group
----------------------------------------------------------------------------
ORDER BY with GROUP BY

ORDER BY 
	sorts data
	its a last thing that we put in our query

GROUP BY does not sort data

SELECT column_1
,column_2
FROM table_name
GROUP BY column_1
ORDER BY column_2 DESC;
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
						Subqueries and Joins 													Subqueries and Joins
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
Subqueries
	Queries embedded into other queries
	Relational Databases store data in multiple tables
	Subqueries merge data from multiple sources together
	Helps with adding other filtering criteria
	There is no limit to the number of subqueries you can have
	Performance slows when you nest too deeply
	Subquery selects can only retrieve a single column
	Not always the best option due to Performance
 	just one of many teqniques we can use to combine information together from multiple tables

Both subqueries and table expressions are methods for being able to write a query that creates a table, and then write a query that interacts with this newly created table. Sometimes the question you are trying to answer doesn't have an answer when working directly with existing tables in database. 

Note: It is a really important when you working with subqueries is make sure indenting things, this is help you a lot

SELECT CustomerID
,CompanyName
,Region
FROM Customers_table
WHERE CustomerID in (SELECT
customerID
FROM orders_table
Where column_4 > 100);

Always Perform the innermost SELECT portion first
if i am looking somebody's query and try to trebelshot it i always start with innermost queriy to see what's going on
----------------------------------------------------------------------------
 Subquery in Subquery

 SELECT Customer_name, Customer_contact
 FROM cust_table IN
 	SELECT customer_id
 	FROM orders_table
 	WHERE order_number IN ( SELECT order_number
 								FROM OrderItems_table
 								WHERE product_name = 'Toothbrush');
----------------------------------------------------------------------------
Subqueries for Calculations

# task: Total number of orders placed by every customer

SELECT COUNT(*) AS orders
FROM Orders
WHERE customer_id = '143569';

SELECT customer_name
	,customer_state(SELECT COUNT(*) AS orders FROM Orders WHERE Orders.customer_id = Customer.customer_id) AS orders
FROM customers
ORDER BY customer_name
----------------------------------------------------------------------------
						JOINS
----------------------------------------------------------------------------
Benefits of Breaking Data into Tables
	Efficient storage
	Easier manipulation
	Greater scalability
	Logically models a process
	Tables are related through common valuse(keys)
---
# https://classroom.udacity.com/courses/ud198/lessons/8f23fc69-7c88-4a94-97a4-d5f6ef51cf7b/concepts/6bcadea2-78dd-4aa5-a9f1-f84be429067b
Notice our SQL query has the two tables we would like to join - one in the FROM and the other in the JOIN. Then in the ON, we will ALWAYs have the PK equal to the FK:
The way we join any two tables is in this way: linking the PK and FK (generally in an ON statement).
---
----------------------------------------------------------------------------
JOINS:
	Associate correct records from each table on the fly
	Allows data retrieval from multiple tables in one query
	Joins are not physical - they persist for the duratino the query execution
	The more tables you join, the slower the database will perform
----------------------------------------------------------------------------
JOINS types:
	Cartesian (cross) Joins
	Inner Joins / JOINS
	Left
	Right
	FULL Outer
----------------------------------------------------------------------------
Cartesian (cross) Joins:
	Each row from the first table joins with all the rows of another table, if we have 10 rows in table_1 and 10 rows in table_2 and we apply Cartesion/Cross join we obtain 100 records
	Very computationally taxing so Not frequently used 
	Wille return products with the incorrect vendor or no vendor at all

SELECT product_name
,unit_price
,company_name
FROM suppliers CROSS JOIN table_name;
# the ouput will be the number of joins in the 1st table multiplied by the number of rows in the 2nd table
----------------------------------------------------------------------------
Inner Joins:
	the data you join in inner join can have a one to one or a one to many relationship.
	most frequantly used JOINS in SQL
	select records that have matching values in both tables
	no limit what you can join, 
SELECT suppliers.CompanyName
,ProductName
,UnitPrice
FROM suppliers INNER JOIN Products ON suppliers.supplierid = Products.supplierid


# Inner join with Multiple Tables
SELECT o.OrderID, c.CompanyName, e.LastName
FROM((Orders 0 INNER JOIN Customers c ON o.CustomerID = c.CustomerID)
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID);
----------------------------------------------------------------------------
Best Practices With Joins
	make sure you're pre-qualifying names
	Do not make unnecessary joins
	Think about the type of join you are making
	How are you connecting records?
----------------------------------------------------------------------------
				Aliases and Self Joins
----------------------------------------------------------------------------
SELECT vendor_name
,product_name
,product_price
FROM Vendors_table as v, Products_table as p 
WHERE v.vendor_id = p.vendor_id;



# Self Joins
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID = B.CustomerID 
AND A.City = B.City
ORDER BY A.City;  

specially when you are joining the table to it self (self joins) you have to have a table Aliase, there is no other way  this could happen
----------------------------------------------------------------------------
Left, Right, and Full Outer Joins
----------------------------------------------------------------------------
note: SQLite only does Left Joins
Other DBMS use all joins
----------------------------------------------------------------------------
Left Join = LEFT OUTER JOIN

SELECT C.CustomerName, o.orderID
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
ORDER BY C.CustomerName;
----------------------------------------------------------------------------
Right Join = RIGHT OUTER JOIN
note: not supported by SQLite

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FRom Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;
----------------------------------------------------------------------------
FULL OUTER JOIN = OUTER JOIN
note: not supported by SQLite
The use cases for a full outer join are very rare

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
----------------------------------------------------------------------------
										UNIONS
----------------------------------------------------------------------------
UNIONS

The UNION operator is used to combine the result-set of two or more SELECT statements.
Each SELECT statement within UNION must have the same numeber of columns
Columns must have similar data types
The column in each SELECT statement must be in the same order

# Basic Union Setup
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

# Which German cities have suppliers
SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
						Date and Time 														Date and Time
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
Date:
	"As long as your data contains only the date portion, your queries wilkl work as expected. However, if a time portion is involved, it gets more complicated"
	"The most difficult part when working with dates is to be sure  that the format of the date you are trying to insert, maatches the format of the date column in the database."
	"Dates are stored as datetypes"
	"Each DBMS uses it's own variety of datatypes"

Wednesday, September 17th, 2008
9/17/2008 5:14:56 P.M. EST
9/17/2008 19:14:56 P.M. GMT
2612008 (Julian format)

DATE
Format: YYYY-MM-DD

DATETIME
Format: YYYY-MM-DD HH:MI:SS

TIMESTAMP
Format: YYYY-MM-DD HH:MI:SS

if you Query a DATETIME with: 
	WHERE PuchaseDatee = '2016-12-12'
You will get no results, because there is also HOURS, MINITS, and SECONDS that should be inclued in your query
----------------------------------------------------------------------------
SQLite support 5 date and time functions:
	DATE(timestring, modifier, modifier, ...)
	TIME(timestring, modifier, modifier, ...)
	DATETIME(timestring, modifier, modifier, ...)
	JULIANDAY(timestring, modifier, modifier, ...)
	STRFTIME(format, timestring, modifier, modifier, ...)
----------------------------------------------------------------------------
Timestrings:
	
A time string are what you want to extract from the Datetime function.
we have a lot of diffirent Timestrings that we can use:

YYYY-MM-DD
YYYY-MM-DD HH:MM
YYYY-MM-DD HH:MM:SS
YYYY-MM-DD HH:MM:SS.SSS
YYYY-MM-DDTHH:MM
YYYY-MM-DDTHH:MM:SS
YYYY-MM-DDTHH:MM:SS.SSS
HH:MM
HH:MM:SS
HH:MM:SS.SSS
----------------------------------------------------------------------------
Modifiers:
	NNN days------------start of year
	NNN hours-----------start of day
	NNN minutes---------weekday N
	NNN.NNNN seconds----unixepoch
	NNN months----------localtime
	NNN years-----------utc
	start of month 		

a timestring can be followed by 0 modifiers or multiple modifires, each modifier transforms that is apply to the time value is applied from left to right, the order is very important when you apply a modifieres. 
----------------------------------------------------------------------------
SELECT Birthdate_column
,STRFTIME('%Y', Birthdate_column) AS Year
,STRFTIME('%m', Birthdate_column) AS Month
,STRFTIME('%d', Birthdate_column) AS Day
FROM employees_table
# return 3 new columns <Year> containing year of birth, <Month> containing month of birth, and <Day> containing day of birth
----------------------------------------------------------------------------
Current Date:
	SELECT DATE('now');
----------------------------------------------------------------------------
Year, Month and Day for the current Date:
	SELECT STRFTIME('%Y %m %d', 'now'); 
----------------------------------------------------------------------------
Hour, Minute, Seconds and Milliseconds from Current DATETIME:
	SELECT STRFTIME('%H %M %S %s', 'now');
----------------------------------------------------------------------------
# Compute Age using Birthdate
SELECT Birthdate
,STRFTIME('%Y', Birthdate) AS Year
,STRFTIME('%m', Birthdate) AS Month
,STRFTIME('%d', Birthdate) AS Day
,DATE(('now') - Birthdate) AS Age
FROM employees_table
# return 5 columns, Birthdate, Year, Month, Day, Age
----------------------------------------------------------------------------
DATE_TRUNC

DATE_TRUNC allows you to truncate your date to a particular part of your date-time column. Common trunctions are day, month, and year. Here (https://blog.modeanalytics.com/date-trunc-sql-timestamp-function-count-on/) is a great blog post by Mode Analytics on the power of this function. 

example:

RESULT:						INPUT:
2017-04-01 12:15:01			DATE_Trunc('second', 2017-04-01 12:15:01)
2017-04-01 00:00:00			DATE_Trunc('day', 2017-04-01 12:15:01)
2017-04-01 00:00:00			DATE_Trunc('month', 2017-04-01 12:15:01)
2017-04-01 00:00:00			DATE_Trunc('year', 2017-04-01 12:15:01)
----------------------------------------------------------------------------
DATE_PART:

DATE_PART can be useful for pulling a specific portion of a date, but notice pulling month or day of the week (dow) means that you are no longer keeping the years in order. Rather you are grouping for certain components regardless of which year they belonged in.

For additional functions you can use with dates, check out the documentation here (https://www.postgresql.org/docs/9.1/static/functions-datetime.html), but the DATE_TRUNC and DATE_PART functions definitely give you a great start!

You can reference the columns in your select statement in GROUP BY and ORDER BY clauses with numbers that follow the order they appear in the select statement. For example

SELECT standard_qty, COUNT(*)

FROM orders

GROUP BY 1 (this 1 refers to standard_qty since it is the first of the columns included in the select statement)

ORDER BY 1 (this 1 refers to standard_qty since it is the first of the columns included in the select statement)

example

RESULT:			INPUT:
1				DATE_PART('second', 2017-04-01 12:15:01)
1				DATE_PART('day', 2017-04-01 12:15:01)
4				DATE_PART('month', 2017-04-01 12:15:01)
2017			DATE_PART('year', 2017-04-01 12:15:01)
6				DATE_PART('dow', 2017-04-01 12:15:01) # 'dow' stands for 'day of week'
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
						Window Functions 														Window Functions
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
 for more, wisit https://www.postgresql.org/docs/9.1/tutorial-window.html
 
 a window function performs a calculation across a set of table rows that are somehow related to the current row. This is comparable to the type of calculation that can be done with an aggregate function. But unlike regular aggregate functions, use of a window function does not cause rows to become grouped into a single output row — the rows retain their separate identities. Behind the scenes, the window function is able to access more than just the current row of the query result.
OVER and PARTITION BY are key to window functions. Not every window function uses PARTITION BY

example:

SELECT depname, empno, salary, avg(salary) OVER (PARTITION BY depname) FROM empsalary;

  depname  | empno | salary |          avg          
-----------+-------+--------+-----------------------
 develop   |    11 |   5200 | 5020.0000000000000000
 develop   |     7 |   4200 | 5020.0000000000000000
 develop   |     9 |   4500 | 5020.0000000000000000
 develop   |     8 |   6000 | 5020.0000000000000000
 develop   |    10 |   5200 | 5020.0000000000000000
 personnel |     5 |   3500 | 3700.0000000000000000
 personnel |     2 |   3900 | 3700.0000000000000000
 sales     |     3 |   4800 | 4866.6666666666666667
 sales     |     1 |   5000 | 4866.6666666666666667
 sales     |     4 |   4800 | 4866.6666666666666667

 explaination:
 The fourth column represents an average taken across all the table rows that have the same depname value as the current row. (This actually is the same function as the regular avg aggregate function, but the OVER clause causes it to be treated as a window function and computed across an appropriate set of rows.)


----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
						Case Statements 														Case Statements
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
Case Statements:
	Mimics if-then-else Statements found in most programing languages
	Can be used in SELECT, INSERT, update and DELETE statements
	The CASE statement always goes in the SELECT clause # https://classroom.udacity.com/courses/ud198/lessons/76a484da-1f2e-4886-ba2c-684bb30e267d/concepts/5a1c618b-1597-4947-8980-84d49b8415e6
	CASE must include the following components: WHEN, THEN, and END. ELSE is an optional 
	You can include multiple WHEN statements, as well as an ELSE statement again, to deal with any unaddressed conditions.

	
CASE 
WHEN C1 THEN E1
WHEN C2 THEN E2
....
ELSE [result else]
END


CASE input_	expression 
	WHEN when_expression THEN result_expression [...n]
	[ELSE else_result_expression]
END


SELECT
EmployeeID
,first_name
,LastName
,city
,CASE city
	WHEN 'calgary' THEN 'calgary' ELSE 'Other' END calgary # END k bad new column ka nime define kya h
	FROM Employees_table
	ORDER BY LastName, first_name;

# 1 naya column <calgary> banao, jab <city> me 'calgary' ho to new column me bhi 'calgary' dal do, warna 'Other' daal do
----------------------------------------------------------------------------
SELECT 
trackID
,name
,bytes
,CASE
WHEN bytes < 30000 THEN 'small'
WHEN bytes >= 30000 AND bytes <= 50000 THEN 'mediam'
WHEN bytes >= 50001 THEN 'large'
ELSE 'Other'
END bytescategory
FROM Tracks_table;
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
						Views 																					Views
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
Views:
	Can add or remove columns without changing Schema
	Use it to encapsulate queries
	The view will be removed after database connection has ended

we are always combining data from multiple sources or transforming it in some way. As you know,  sometimes things like the order of operations can get a little ricky. Instead of creating a whole new table, sometimes we can create the illusion of a table by using a view.
A view is essentially a stored query, and it helps us clean up our queries and simplify when we have to write.
In a view, you can add or remove columns without changing the schema.  You're not actually writing the query to the database or  anything, what you're doing is you're kind of storing it for the time being. This is really helpful and pays off when we use it to encapsulate queries
The beauty of the view is that it can be used like a table. But it's unlike a table in that you don't have to have ETL or run ETL on any of the data. This helps a lot by encapsulating complex queries or complex calculations that you're trying to write.
It can really help simplify it.
It can also be used in pretty much any database, except for stored procedures.
Views are really most helpful if you need to join a set of tables and  you're having trouble getting calculations.  Particularly those complex ones dealing with the order of operations in the right  order to get the output you're looking for.
Another benefit of views includes different securities or  write capabilities.  We talked about not being able to write data to an environment or to a particular database.
Views are helpful because you're creating a view of a table but not actually writing data to that table.  This is a way to get around some of those database writing limitations.
Another thing that views are helpful for is to create a stepping stone in multilevel queries.  For example, let's say you create a query that counts the number of cells that each person has made. You could then write a query that groups the salespeople into a particular group. Then you can count the sales of that group as well.
It just creates this multilevel dimension that you wouldn't have been able to do elsewhere.
And then, it also helps so that you're not transferring any data through and ETL process.
Views are definitely something that will come in handy, if you're in a particularly sticky situation or having some trouble with your calculation. It can definitely make things a lot easier for you.


CREATE [TEMP] VIEW [IF NOT EXISTS] view_name(column-name-list) AS select-statement;


CREATE VIEW my_view
AS
SELECT
rregiondescription
,t.territorydescription
,e.Lastname
,e.Fistname
,e.Hiredate
,e.Reportsto
FROM Region r
INNER JOIN Territiories t on r.regionid = t.regionid
INNER JOIN Employeeterritories et on t.TerritoryID = et.TerritoryID
INNER JOIN Employees e on et.employeeid = e.EmployeeID

# my view name is my_view, if i need to see my view:
	SELECT *
	FROM my_view;

# not need your view?
DROP VIEW my_view;

# Get a count of how many territories each employee has
SELECT count(territorydescription)
,Lastname
,Firstname
FROM my_view
GROP BY Lastname, Firstname;
----------------------------------------------------------------------------
Working Through a Problem from Beginning to End
	1- Data Understanding
		1- Most Importtant step
		2- Understanding relationships in your data
		3- NULL values
		4- String Values
		5- Dates and times
	2- Subject Area and  Businuess Understanding
		1- Until you gain businuess understanding, writing queries may take more time
		2- Understanding where data joins are
		3- Differentiating integers from strings
		4- Investing time to understand your subject will help later during data analysis
	3- Profilling
		1- Get into the details of your data
		2- Create a data model and map the fields and tables you need
		3- Consider joins and calculations
		4- Understand any data quality or format issues
	4- Start with SELECT
		1- Start simple
		2- Any query begins with SELECT statement
		3- Add in special formatting
		4- if using subqueries, start with the inner-most query and work outward
	5- Test and Troubleshoot
		1- do not wait until the end to test queries
		2- Test after each join or filter
		3- Are you getting the results you expect?
		4- Start small and go step by step when troubleshooting a query.
	6- Format & Comment
		1- Use correct formatting and identation
		2- Comment strategically
		3- Clean code and comments help when you revisit or hand off code
	7- Review
		1- always revies old queries
		2- Business rules
		3- Date changes
		4- Date indicators
		5- Work the problem for beginning to end
----------------------------------------------------------------------------
WITH (CTE)

when creating multiple tables using WITH, you add a comma after every table except the last table leading to your final query.
The new table name is always aliased using <table_name AS>, which is followed by your query nested between parentheses.
----------------------------------------------------------------------------



* note: you can't delete particuler field from tha observation, yes, you can updated it.
* Notice, traditional databases do not allow for many-to-many relationships, as these break the schema down pretty quickly. A very good answer is provided here <https://stackoverflow.com/questions/7339143/why-no-many-to-many-relationships>. 
* The types of relationships that exist in a database matter less to analysts, but you do need to understand why you would perform different types of JOINs, and what data you are pulling from the database
* If you have two or more columns in your SELECT that have the same name after the table name such as accounts.name and sales_reps.name you will need to alias them. Otherwise it will only show one of the columns. You can alias them like accounts.name AS AcountName, sales_rep.name AS SalesRepName
* There are two common ways in which you are likely to encounter NULLs:

    NULLs frequently occur when performing a LEFT or RIGHT JOIN. You saw in the last lesson - when some rows in the left table of a left join are not matched with rows in the right table, those rows will contain some NULL values in the result set.

    NULLs can also occur from simply missing data in our database.
* Aggregation Reminder

An important thing to remember: aggregators only aggregate vertically - the values of a column. If you want to perform a calculation across rows, you would do this with (simple arithmetic https://community.modeanalytics.com/sql/tutorial/sql-operators/#arithmetic-in-sql) .
* 
