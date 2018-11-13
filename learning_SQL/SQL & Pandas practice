############################################# Retrieve Data ############################################# 
# only one attribute among whole table
SELECT AlbumId from tracks
# python: df.AlbumId

# one table with condition
SELECT AlbumId FROM tracks WHERE AlbumId > 6
# python: df.AlbumId[tracks.AlbumId>6]

# multiple conditions
SELECT AlbumId,Milliseconds FROM tracks WHERE AlbumId > 6 AND Milliseconds < 10000
# python: df[(df['AlbumId'] > 6) & (df['Milliseconds'] < 10000)]

# compare two attributes values
SELECT MediaTypeId FROM tracks WHERE MediaTypeId > GenreId
# python: df.MediaTypeId[df.MediaTypeId > df.GenreId]

# BETWEEN
SELECT AlbumId FROM tracks WHERE AlbumId BETWEEN 5 AND 10
# df.AlbumId[(df.AlbumId >= 5) &( df.AlbumId <= 10)]

# only two attribute
SELECT AlbumId,GenreId from tracks
# python: df[['AlbumId', 'GenreId']]

# all attributes
# SELECT * FROM tracks;
# python: df

# LIMIT
SELECT TrackId FROM tracks LIMIT 3
# python: df.TrackId.head(3)
############################################# Create Data #############################################
CREATE TABLE my_table
	(
	Id 		char(10)			PRIMARY KEY,
	Brand 	char(10) 			NOT NULL,
	Type 	char(250)			NOT NULL,
	Color 	char(250)			NOT NULL,
	Price 	decimal(8,2) 		NOT NULL,
	Desc 	Varchar (750)		NULL
	);

INSERT INTO my_table
VALUES('14535974'
	,'Gucci'
	,'slippers'
	,'Pink'
	,695.00
	,NULL
	);

# python: 
			columns = ['Id', 'Brand', 'Type', 'Color', 'Price', 'Desc']
			values = ['14535974', 'Gucci', 'slippers', 'Pink', 695.00, '' ]
			d = dict(zip(columns, values))
			df = pd.DataFrame(d, index=range(1))


#### Temporary tables

CREATE TEMPORARY TABLE aa AS
	SELECT *
	FROM tracks
	WHERE GenreId > MediaTypeId

# ye python me nahi hota :)


#### Commenting
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

############################################# Operators #############################################
IN:

SELECT AlbumId
,MediaTypeId
FROM tracks
WHERE MediaTypeId IN (2,3);

# python: df[['AlbumId', 'MediaTypeId']][df['MediaTypeId'].isin([2,3])]

------ 
OR:

SELECT AlbumId
FROM tracks
WHERE AlbumId < 10  OR AlbumId > 300 ;

# python: df['AlbumId'][(df['AlbumId'] < 10) | (df['AlbumId'] > 300)]


------
NOT:

SELECT *
FROM tracks
WHERE NOT AlbumId = 1 AND NOT MediaTypeId = 1

# python: df[(df['AlbumId'] != 1) & (df['MediaTypeId'] != 1)]

------
IS NULL:


SELECT *
FROM tracks
WHERE Composer IS NULL;
 
# python: df[df.Composer.isnull()]

############################################# Wildcards #############################################

'%'

SELECT *
FROM tracks
WHERE Composer LIKE '%hnson' ;
# python: df[df['Composer'].isin([i for i in df['Composer'] if str(i)[-5:] == 'hnson'])]
------
SE:

SELECT *
FROM tracks
WHERE Composer LIKE 't%@gmail.com' ;

# python: df[df['Email'].isin([i for i in df['Email'] if str(i)[0] == 't' and str(i)[-10:] == '@gmail.com'])]

############################################# Sort data  #############################################

ORDER BY:

SELECT * 
FROM tracks 
ORDER BY Genreid
# python: df.sort_values('GenreId')


# for more than one column

SELECT * 
FROM tracks 
ORDER BY 5,3 DESC
# python : df.sort_values(['GenreId', 'AlbumId'], ascending= False)

############################################# Math operations   #############################################

SELECT AlbumId, GenreId, GenreId * AlbumId AS calculated_column 
FROM tracks
# python: df['calculated_column'] = df.AlbumId * df.GenreId
		  df[['AlbumId', 'GenreId', 'calculated_column']]

############################################# Aggregate #############################################

AVG:
	SELECT AVG(AlbumId) AS avg_column 
	FROM tracks
	# python= df.AlbumId.mean()

COUNT:
	# COUNT(*): count all the rows in the table containing values or NULLs
	SELECT COUNT (*) AS len 
	FROM tracks
	# python: len(df)

	# COUNT(column_name): COUNT(*) counts all the rows in a specific column ignoring NULL values
	SELECT COUNT(Composer) AS len_of_column 
	FROM tracks
	# python: len(df.Composer.valid())

MAX:
	SELECT MAX(AlbumId) AS maximum 
	FROM tracks
	# python: df.AlbumId.max()

MIN:
	same as MAX

SUM (with condition):
	SELECT SUM(AlbumId*GenreId) AS total_of_2columns
	FROM tracks
	WHERE MediaTypeId = 2
	# python:   adf = df[df.MediaTypeId == 2]
			    sum(adf.AlbumId * adf.GenreId)


DISTINCT:
	SELECT COUNT(DISTINCT Milliseconds)
	FROM tracks
	# python: df.Milliseconds.nunique()


############################################# Grouping Data #############################################
SELECT MediaTypeId
,COUNT(GenreId) AS total_genr
FROM tracks
GROUP by MediaTypeId;
# python: df.groupby('MediaTypeId').size()
-------
GROUP By with condition
	SELECT MediaTypeId
	,COUNT (*) AS totallll
	FROM tracks
	GROUP BY MediaTypeId
	HAVING COUNT (*) > 7
	# python: for i in [(i[0], len(i[1])) for i in [i for i in df.groupby('MediaTypeId') if len(i[1]) > 7]]: print(i)
------
GROUP BY with ORDER BY:
	SELECT MediaTypeId
	,GenreId
	FROM tracks
	GROUP BY MediaTypeId
	ORDER BY GenreId DESC;
	# python: for i in sorted([(i[0], len(i[1])) for i in [i for i in df.groupby('MediaTypeId') if len(i[1]) > 7]]): print(i)

############################################# Subqueries #############################################
SELECT * FROM tracks
WHERE AlbumId IN (SELECT SupportRepId
FROM customers
WHERE Country = 'Brazil')
# python: df[df.AlbumId.isin(df2[df2['Country'] == 'Brazil'].SupportRepId)]
############################################# JOINS #############################################
CROSS JOIN
	SELECT *
	FROM genres CROSS JOIN artists;


INNER JOIN:
	SELECT suppliers.CompanyName
	,ProductName
	,UnitPrice
	FROM suppliers INNER JOIN Products ON suppliers.supplierid = Products.supplierid


INNER JOIN (with Multiple Tables):
	SELECT o.OrderID, c.CompanyName, e.LastName
	FROM((Orders 0 INNER JOIN Customers c ON o.CustomerID = c.CustomerID)
	INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID);

LEFT JOIN:
	SELECT C.CustomerName, o.orderID
	FROM Customers C
	LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
	ORDER BY C.CustomerName;

RIGHT JOIN:
	note: not supported by SQLite

	SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
	FRom Orders
	RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
	ORDER BY Orders.OrderID;

FULL OUTER JOIN:
	note: not supported by SQLite

	SELECT Customers.CustomerName, Orders.OrderID
	FROM Customers
	FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
	ORDER BY Customers.CustomerName;

UNION:
	SELECT City, Country FROM Customers
	WHERE Country='Germany'
	UNION
	SELECT City, Country FROM Suppliers
	WHERE Country='Germany'
	ORDER BY City;

############################################# Aliases #############################################

SELECT vendor_name
,product_name
,product_price
FROM Vendors_table as v, Products_table as p 
WHERE v.vendor_id = p.vendor_id;
############################################# String Functions #############################################
Concatenate:
	SELECT FirstName, LastName, FirstName || ' (' || LastName || ')' AS FULLNAME FROM customers
	# python: df['FULLNAME'] = df.FirstName + ' (' + df.LASTNAME + ')'
			  df[['FirstName', 'FirstName', 'FULLNAME']]
-------
TRIM:
	SELECT TRIM("	You the best.	") AS TrimmdeString;
-------
SUBSTR:
	SELECT FirstName
	,SUBSTR (FirstName, 2, 3)
	FROM customers
	# df.FirstName.str[2:2+3] 
-------
Upper:
	SELECT UPPER(Name) FROM table_name;
	# python: df.Name.str.upper()
-------
LOWER:
	SELECT LOWER(Name) FROM table_name;
	# python: df.Name.str.lower()
############################################# Date and Time #############################################
SELECT BirthDate
,STRFTIME('%Y', BirthDate) AS Year
,STRFTIME('%m', BirthDate) AS Month
,STRFTIME('%d', BirthDate) AS Day
FROM employees
# python: df['year'] = pd.DatetimeIndex(df['BirthDate']).year
		  df['Month'] = pd.DatetimeIndex(df['BirthDate']).month
		  df['Day'] = pd.DatetimeIndex(df['BirthDate']).day
		  df[['BirthDate', 'year', 'Month', 'Day']]

# current Date:
	SELECT DATE('now');

# Year, Month and Day for the current Date:
	SELECT STRFTIME('%Y %m %d', 'now');

# Hour, Minute, Seconds and Milliseconds from Current DATETIME:
	SELECT STRFTIME('%H %M %S %s', 'now');

# Compute Age using Birthdate:
	SELECT Birthdate
	,DATE('now') - Birthdate AS Age
	FROM employees

############################################# Case Statements #############################################
SELECT
AlbumId
,CASE AlbumId
	WHEN 3 THEN 'THREE' WHEN 4 THEN 'FOUR' ELSE "NOT THREE OR FOUR"  END new_column
	FROM tracks
	ORDER BY AlbumId;

# python: def partition(x):
		      if x == 3: return 'THREE'
		      elif x == 4: return 'FOUR'
		    return 'NOT THREE OR FOUR'

		  column = df['AlbumId']
		  t = column.map(partition)
		  df["new_column"]=t
		  df[['AlbumId', 'new_column']]

################################################# VIEW #############################################
CREATE VIEW my_view
AS
SELECT AlbumId, GenreId, MediaTypeId
FROM tracks


SELECT *
FROM my_view;

# Delete your VIEW
DROP VIEW my_view;