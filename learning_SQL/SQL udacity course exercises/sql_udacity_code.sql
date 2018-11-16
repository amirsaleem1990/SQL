***************************************************** SQL for Data Analysis (udacity) *****************************************************
https://www.youtube.com/playlist?list=PL7ersPsTyYt1ebhCAv0eLaQE-urdmELIx
-- course link: https://www.udacity.com/course/sql-for-data-analysis--ud198

************************************ LESSON 1 (Basi SQL) ************************************
# https://classroom.udacity.com/courses/ud198/lessons/614cf95a-13bf-406c-b092-e757178e633b/concepts/b8b3bf45-1503-49fc-a326-8f10f6967758
# 1- Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.
SELECT id, occurred_at, total_amt_usd 
FROM orders 
ORDER BY occurred_at 
LIMIT 10;

-- 2- Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

-- 3- Write a query to return the bottom 20 orders in terms of least total. Include the id, account_id, and total.
SELECT id, account_id, total
FROM orders
ORDER BY total
LIMIT 20;
########################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/614cf95a-13bf-406c-b092-e757178e633b/concepts/1f1906c2-6903-47bb-a0f7-de7a65924c04
/* 
1- Write a query that returns the top 5 rows from orders ordered according to newest to oldest, but with the largest total_amt_usd for each date listed 
first for each date. You will notice each of these dates shows up as unique because of the time element. When you learn about truncating dates in a
later lesson, you will better be able to tackle this question on a day, month, or yearly basis.
*/
SELECT *
FROM orders
ORDER BY occurred_at DESC, total_amt_usd DESC
LIMIT 5;

/*
 2- Write a query that returns the top 10 rows from orders ordered according to oldest to newest, but with the smallest total_amt_usd for each 
 date listed first for each date. You will notice each of these dates shows up as unique because of the time element. When you learn about 
 truncating dates in a later lesson, you will better be able to tackle this question on a day, month, or yearly basis.
*/
SELECT *
FROM orders
ORDER BY occurred_at, total_amt_usd
LIMIT 10;
########################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/614cf95a-13bf-406c-b092-e757178e633b/concepts/61a40e81-a1e4-4ced-bf68-7c5c5c2682de
-- 1- Pull the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
SELECT * 
FROM orders 
WHERE gloss_amt_usd >=1000 
LIMIT 5;

-- 2- Pull the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
SELECT * 
FROM orders 
WHERE total_amt_usd < 500 
LIMIT 10;

/*
You will notice when using these WHERE statements, we do not need to ORDER BY unless we want to actually order our data. Our condition 
will work without having to do any sorting of the data.
*/
########################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/614cf95a-13bf-406c-b092-e757178e633b/concepts/7c55878d-35d0-4c97-b176-55076b955299
-- Practice Question Using WHERE with Non-Numeric Data
-- 1- Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) for Exxon Mobil in the accounts table.
SELECT name, website, primary_poc 
FROM accounts
WHERE name = 'Exxon Mobil';
########################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/614cf95a-13bf-406c-b092-e757178e633b/concepts/07dc6709-953d-41c2-98d2-f630044c0767
-- Questions using Arithmetic Operations
/*
1- Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. Limit the 
results to the first 10 orders, and include the id and account_id fields. 
*/
SELECT id
,account_id
,standard_amt_usd/standard_qty AS calculated_column 
FROM orders
LIMIT 10;

/*
2- Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns that end 
with _usd. (Try to do this without using the total column). Include the id and account_id fields. NOTE - you will be thrown an error with the correct 
solution to this question. This is for a division by zero. You will learn how to get a solution without an error to this query when you learn about CASE 
statements in a later section. For now, you might just add some very small value to your denominator as a work around.
*/
SELECT id, account_id, 
poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders;
########################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/614cf95a-13bf-406c-b092-e757178e633b/concepts/8c6100c8-ab81-4c32-9fc8-5e5b3f46d97c
-- Questions using the LIKE operator
-- 1- All the companies whose names start with 'C'. 
SELECT * 
FROM accounts
WHERE name LIKE 'C%';
-- 2- All companies whose names contain the string 'one' somewhere in the name
SELECT * 
FROM accounts
WHERE name LIKE '%one%';
-- 3- All companies whose names end with 's'.
SELECT * 
FROM accounts
WHERE name LIKE '%s';
########################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/614cf95a-13bf-406c-b092-e757178e633b/concepts/c28f9da7-40e3-4e7b-a91f-ee6a57443cf6
-- Questions using IN operator
-- 1- Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');
-- 2- Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');
########################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/614cf95a-13bf-406c-b092-e757178e633b/concepts/7a401a69-4c73-48b3-ad11-96024e1bc4e3
-- Questions using the NOT operator
-- 1- Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom')
-- 2- Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords')

# Use the accounts table to find:

-- 1- All the companies whose names do not start with 'C'.
SELECT *
FROM accounts
WHERE name NOT LIKE 'C%'
-- 2- All companies whose names do not contain the string 'one' somewhere in the name.
SELECT *
FROM accounts
WHERE name NOT LIKE '%one%'
-- 3- All companies whose names do not end with 's'.
SELECT *
FROM accounts
WHERE name NOT LIKE '%s'
########################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/614cf95a-13bf-406c-b092-e757178e633b/concepts/91b5b832-e513-49d9-8966-d7b26208249e
-- Questions using AND and BETWEEN operators
-- 1- Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
SELECT *
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0
-- 2- Using the accounts table find all the companies whose names do not start with 'C' and end with 's'.
SELECT *
FROM accounts
WHERE name NOT LIKE '%C' AND name NOT LIKE 's%'
-- 3- Use the web_events table to find all information regarding individuals who were contacted via organic or adwords and started their account at any point in 2016 sorted from newest to oldest.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;
########################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/614cf95a-13bf-406c-b092-e757178e633b/concepts/59538de0-8405-46de-bede-d8f42c9541e2
-- Questions using the OR operator
-- 1- Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.
SELECT id
FROM orders
WHERE poster_qty > 4000 OR gloss_qty > 4000
-- 2- Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.
SELECT *
FROM orders
WHERE standard_qty = 0 AND gloss_qty > 1000 OR poster_qty > 1000
-- 3- Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
           AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
           AND primary_poc NOT LIKE '%eana%')
************************************ LESSON 2 (SQL Joins) ************************************
-- https://classroom.udacity.com/courses/ud198/lessons/8f23fc69-7c88-4a94-97a4-d5f6ef51cf7b/concepts/3f221ddd-423a-41c9-914a-2104d0994618
-- 1- Try pulling all the data from the accounts table, and all the data from the orders table.
SELECT *
FROM accounts
JOIN orders
ON accounts.id = orders.id

-- 2- Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website ,accounts.primary_poc
FROM accounts
JOIN orders
ON accounts.id = orders.id
######################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/8f23fc69-7c88-4a94-97a4-d5f6ef51cf7b/concepts/83da273e-73e7-48b6-a743-219de50b788f
-- image: https://classroom.udacity.com/courses/ud198/lessons/8f23fc69-7c88-4a94-97a4-d5f6ef51cf7b/concepts/83da273e-73e7-48b6-a743-219de50b788f#
-- 1- Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
select web_events.occurred_at, web_events.channel, accounts.primary_poc, accounts.name
from web_events
join accounts
on web_events.account_id = accounts.id
where name = 'Walmart'
-- 2- Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
select region.name region_name, sales_reps.name sales_reps_name, accounts.name accounts_name
from sales_reps
join accounts
on sales_reps.id = accounts.sales_rep_id
join region
on region.id = sales_reps.region_id
order by accounts_name
-- 3- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
select region.name region_name, accounts.name account_name, (orders.total_amt_usd/(orders.total+ 0.01))unit_price
from orders
join accounts
on orders.account_id = accounts.id
join sales_reps
on sales_reps.id = accounts.sales_rep_id
join region
on region.id = sales_reps.region_id












************************************ LESSON 3 (SQL Aggregations) ************************************

************************************ LESSON 4 (SQL Subqueries & Temporary Tables) ************************************

************************************ LESSON 5 (SQL Data Cleaning) ************************************

************************************ LESSON 6 ([Advanced] SQL Window Functions) ************************************

************************************ LESSON 7 ([Advanced] SQL Advanced JOINs & Performance Tuning) ************************************

************************************ LESSON 5 (SQL Data Cleaning) ************************************
