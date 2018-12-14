# login
mysql -u <username> -p <password>

# show existing databases
SHOW databases;

# create new database
CREATE DATABASE amirDB;

# for create a table in database; first select the existing database
use amirDB;

# now create a table
CREATE TABLE table_1(
	column_1 int(4) PRIMARY KEY,
	column_2 varchar(40) NOT NULL,
	column_3 float(7,2)
 	);

# description of table
desc table_1

# delete database 
DROP DATABASE database_name;

# delete table
DROP TABLE table_name;

# for delete all data from the table, table structure exist after this command but no data in the table
TRUNCATE TABLE table_name;

# DROP Vs DELETE Vs TRUNCATE
	1- DROP:	for structure remove
	2- DELETE: for data remove, you can undo this command
	3- DROP and TRUNCATE can not be rolled back, (no undo)
	4- TRUNCATE removes all the rows from the table

# add a column in existing table
ALTER TABLE table_name ADD column_name type;

# drop a column from existing table
ALTER TABLE table_name DROP COLUMN column_name;

# change column size
ALTER TABLE table_name MODIFY column_name type(new_size);
# you can only decrease the length of a column if there aare no rows in the tabel or all the rows contain null values for that column.

# Change precision
ALTER TABLE table_name MODIFY column_name NUMBER(new size)
# apply only to the numeric column
# you can only decrease the precision of a numeric column if there are no rows in the table or the column contain null values.

# Change data type
ALTER TABLE table_name MODIFY column_name new_data_type(lenght);
# it the table is empty or the column contains null values, you can change the column to any data type; otherwise, you can change the data type of a column only to compatible data type
# you cannot cahange a DATE to a NUMBER

# Add constraint
ALTER TABLE table_name MODIFY column_name CONSTRAINT constaint_name NOT NULL;

ALTER TABLE table_name MODIFY column_name CONSTRAINT constraint_name PRIMARY KEY;

ALTER TABLE table_name MODIFY column_name CONSTRAINT constraint_name UNIQUE;

ALTER TABLE table_name ADD CONSTRAINT constraint_name FOREIGN KEY(col3) REFERENCES referred_table(column);

ALTER TABLE table_name MODIFY constaint_name CHECK(column_name condition);

# Drop constaint
ALTER TABLE table_name DROP CONSTRAINT constaint_name;

