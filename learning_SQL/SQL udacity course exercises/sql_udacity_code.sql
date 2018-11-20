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
######################################################################################################################################################
# https://classroom.udacity.com/courses/ud198/lessons/8f23fc69-7c88-4a94-97a4-d5f6ef51cf7b/concepts/2a249dad-12c9-45ea-87c2-70a7dd4a35b1
-- 1- Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
select r.name Region_name, s.name Sales_reps_name, a.name Account_name
from sales_reps s
join region r
on r.id = s.region_id and r.name = 'Midwest'
join accounts a
on a.sales_rep_id = s.id
order by a.name
-- 2- Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
select r.name region_name, s.name sales_reps_name, a.name account_name
from region r
join sales_reps s
on s.region_id = r.id and r.name  = 'Midwest' and s.name like 'S%'
join accounts a
on a.sales_rep_id = s.id
order by a.name
-- 3- Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
select 
r.name region_name, s.name sales_reps_name, a.name account_name
from region r
join sales_reps s
on s.region_id = r.id and r.name = 'Midwest'
join accounts a
on a.sales_rep_id = s.id
where s.name like '% K%'
order by a.name
-- 4- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100. Your final table should have 3 columns: region name, account name, and unit price. In order to avoid a division by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).
select r.name region_name, a.name account_name, (o.total_amt_usd / (o.total+0.0001)) unit_price
from region r
join sales_reps s
on r.id = s.region_id
join accounts a
on a.sales_rep_id = s.id
join orders o
on o.account_id = a.id and o.standard_qty > 100
-- 5- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
select r.name region_name, a.name account_name, (o.total_amt_usd/(total+0.0001)) unit_price
from region r
join sales_reps s
on r.id = s.region_id
join accounts a
on a.sales_rep_id = s.id
join orders o
on o.account_id = a.id and o.standard_qty > 100 and poster_qty > 50
order by unit_price
-- 6- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price. Sort for the largest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
select r.name region_name, a.name Account_name, (o.total_amt_usd/(total+0.0001)) unit_price
from region r
join sales_reps s
on r.id = s.region_id
join accounts a
on a.sales_rep_id = s.id
join orders o
on o.account_id = a.id and o.standard_qty > 100 and poster_qty > 50
order by unit_price desc
-- 7- What are the different channels used by account id 1001? Your final table should have only 2 columns: account name and the different channels. You can try SELECT DISTINCT to narrow down the results to only the unique values.
select a.name account_name, w.channel channel
from accounts a
join web_events w
on a.id = w.account_id and w.account_id = 1001

-- 8- Find all the orders that occurred in 2015. Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.
select o.occurred_at, a.name accout_name, o.total order_total, o.total_amt_usd
from orders o
join accounts a
on o.account_id = a.id
where o.occurred_at between '2015-1-1' and '2015-12-31'

************************************ LESSON 3 (SQL Aggregations) ************************************
-- https://classroom.udacity.com/courses/ud198/lessons/76a484da-1f2e-4886-ba2c-684bb30e267d/concepts/a9f5ce88-e9ae-4baf-8950-1389a77816bd
-- Aggregation Questions

-- 1- Find the total amount of poster_qty paper ordered in the orders table.
select sum(poster_qty)
from orders
-- 2- Find the total amount of standard_qty paper ordered in the orders table.
select sum(standard_qty)
from orders
-- 3- Find the total dollar amount of sales using the total_amt_usd in the orders table.
select sum(total_amt_usd) 
from orders
-- 4- Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. This should give a dollar amount for each order in the table.
SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;
-- 5- Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both an aggregation and a mathematical operator.
SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;
######################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/76a484da-1f2e-4886-ba2c-684bb30e267d/concepts/cb699cd9-3391-4748-86d2-0158c1de37c0
-- Questions: MIN, MAX, & AVERAGE

-- 1- When was the earliest order ever placed? You only need to return the date.
select min(occurred_at) from orders
-- 2- Try performing the same query as in question 1 without using an aggregation function.
select occurred_at from orders
order by occurred_at
limit 1
-- 3- When did the most recent (latest) web_event occur?
select max(occurred_at) from web_events
-- 4- Try to perform the result of the previous query without using an aggregation function.
select occurred_at from web_events
order by occurred_at  desc
limit 1
5- Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, 
           AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd, 
           AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;
6- Via the video, you might be interested in how to calculate the MEDIAN. Though this is more advanced than what we have covered so far try finding - what is the MEDIAN total_usd spent on all orders?
select total_amt_usd from orders
order by total_amt_usd
OFFSET 
(select count(total_amt_usd)/2
from orders)
limit 1
######################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/76a484da-1f2e-4886-ba2c-684bb30e267d/concepts/1d61769f-cde5-4f4a-b4db-e5c0de9b3285
-- GROUP BY

-- 1- Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
select a.name account_name,
o.occurred_at date
from accounts a
join orders o
on a.id = o.account_id
order by date
limit 1
-- 2- Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name.
select a.name , SUM(total_amt_usd) total_sales
from accounts a
join orders o
on a.id = o.account_id
group by a.name
-- 3- Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only three values - the date, channel, and account name.
select w.channel, w.occurred_at date, a.name
from web_events w
join accounts a
on w.account_id = a.id
order by date desc
limit 1
-- 4- Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - the channel and the number of times the channel was used.
select w.channel, count(*)
from web_events w
group by w.channel
-- 5- Who was the primary contact associated with the earliest web_event?
select a.primary_poc, w.occurred_at
from web_events w
join accounts a
on a.id = w.account_id
order by occurred_at
limit 1
-- 6- What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.
select a.name, min(o.total_amt_usd) minimum_order
from accounts a
join orders o
on a.id = o.account_id
group by name
order by minimum_order
-- 7- Find the number of sales reps in each region. Your final table should have two columns - the region and the number of sales_reps. Order from fewest reps to most reps.
select r.name region, count(*) count
from region r
join sales_reps s
on s.region_id = r.id
group by r.name
order by count
######################################################################################################################################################
-- Questions: GROUP BY Part II
-- https://classroom.udacity.com/courses/ud198/lessons/76a484da-1f2e-4886-ba2c-684bb30e267d/concepts/5a403f64-56e2-4a3c-8f3e-288c5a9b51c0
-- 1 - For each account, determine the average amount of each type of paper they purchased across their orders. Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.
select a.name, avg(o.standard_qty) avg_standard, avg(o.gloss_qty) avg_gloss, avg(o.poster_qty) avg_postter
from accounts a
join orders o
on a.id = o.account_id
group by a.name
-- 2 - For each account, determine the average amount spent per order on each paper type. Your result should have four columns - one for the account name and one for the average amount spent on each paper type.
SELECT a.name, AVG(o.standard_amt_usd) avg_stand, AVG(o.gloss_amt_usd) avg_gloss, AVG(o.poster_amt_usd) avg_post
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;
-- 3 - Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.
SELECT s.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;
-- 4 - Determine the number of times a particular channel was used in the web_events table for each region. Your final table should have three columns - the region name, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.
SELECT r.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY num_events DESC;
######################################################################################################################################################
-- Questions: DISTINCT
-- https://classroom.udacity.com/courses/ud198/lessons/76a484da-1f2e-4886-ba2c-684bb30e267d/concepts/a3f13925-4ff9-4769-85cd-c7c4fa346258
-- 1 -Use DISTINCT to test if there are any accounts associated with more than one region.
select a.id as "account id", r.id as "region id", 
a.name as "account name", r.name as "region name"
from region r
join sales_reps s
on r.id = s.region_id
join accounts a
on a.sales_rep_id = s.id

-- and 

SELECT DISTINCT id, name
FROM accounts;
-- 2 -Have any sales reps worked on more than one account?
SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY num_accounts;

and

SELECT DISTINCT id, name
FROM sales_reps;
######################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/76a484da-1f2e-4886-ba2c-684bb30e267d/concepts/626dbb04-14f8-4215-ac69-81d323e4bf59
-- Questions: HAVING


-- 1 - How many of the sales reps have more than 5 accounts that they manage?
select sales_rep_id
from sales_reps s
join accounts a
on a.sales_rep_id = s.id
group by sales_rep_id
having count(a.name) > 5

-- or

-- using subquery:
SELECT COUNT(*) num_reps_above5
FROM(SELECT s.id, s.name, COUNT(*) num_accounts
     FROM accounts a
     JOIN sales_reps s
     ON s.id = a.sales_rep_id
     GROUP BY s.id, s.name
     HAVING COUNT(*) > 5
     ORDER BY num_accounts) AS Table1;

-- or

SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
HAVING COUNT(*) > 5
ORDER BY num_accounts;
-- 2 - How many accounts have more than 20 orders?
select a.name, count(a.name)
from orders o
join accounts a
on a.id = o.account_id
group by a.name
having count(a.name) > 20

-- or

SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num_orders;
-- 3 - Which account has the most orders?
SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY num_orders DESC
LIMIT 1;
-- 4 - How many accounts spent more than 30,000 usd total across all orders?
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total_spent;
-- 5 - How many accounts spent less than 1,000 usd total across all orders?
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_spent;
-- 6 - Which account has spent the most with us?
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
LIMIT 1;
-- 7- Which account has spent the least with us?
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
LIMIT 1;
-- 8 - Which accounts used facebook as a channel to contact customers more than 6 times?
-- SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel;
-- 9 - Which account used facebook most as a channel?
SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 1;
-- 10 - Which channel was most frequently used by most accounts?
SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10;
######################################################################################################################################################
-- Questions: Working With DATEs
-- https://classroom.udacity.com/courses/ud198/lessons/76a484da-1f2e-4886-ba2c-684bb30e267d/concepts/20715cb3-3ceb-4760-98c4-bc52017cc8e6
-- 1 - Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?
select DATE_PART('year', occurred_at) AS date_year, sum(total_amt_usd)
from orders
group by 1
order by 2 desc
-- 2 - Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?
select DATE_PART('month', occurred_at) AS date_month, sum(total_amt_usd)
from orders
group by 1
order by 2 desc
-- 3 - Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?
select DATE_PART('year', occurred_at) AS date_year, count(*)
from orders
group by 1
order by 2 desc
-- 4 - Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?
select DATE_PART('month', occurred_at) AS date_year, count(*)
from orders
group by 1
order by 2 desc
-- 5 - In which month of which year did Walmart spend the most on gloss paper in terms of dollars?
select DATE_Trunc('month',o.occurred_at) date_month , sum(o.gloss_amt_usd) sum_usd
from orders o 
join accounts a
on o.account_id = a.id and a.name = 'Walmart'
group by date_month
order by 2 desc
limit 1
######################################################################################################################################################
-- https://classroom.udacity.com/courses/ud198/lessons/76a484da-1f2e-4886-ba2c-684bb30e267d/concepts/7d7aa4d8-98ca-4062-b868-e66863dee18d
-- Questions: CASE

-- 1 - Write a query to display for each order, the account ID, total amount of the order, and the level of the order - ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or smaller than $3000.
select account_id, total_amt_usd, 
CASE WHEN total_amt_usd >= 3000 THEN 'Large' ELSE 'Small' END AS  "Large or small?"
from orders
-- 2 - Write a query to display the number of orders in each of three categories, based on the 'total' amount of each order. The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.
select count(*), 
CASE WHEN total >= 2000 THEN 'At Least 2000' 		When  total < 2000 and total > 1000 THEN 'Between 1000 and 2000' when total < 1000 THEN  'Less than 1000'END AS  catagories
from orders
group by 2
-- 3 - We would like to understand 3 different levels of customers based on the amount associated with their purchases. The top level includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd. The second level is between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd. Provide a table that includes the level associated with each account. You should provide the account name, the total sales of all orders for the customer, and the level. Order with the top spending customers listed first.
select a.name, sum(o.total_amt_usd) sum_of_total_amt_usd, 
case when sum(o.total_amt_usd) > 200000 then 'Greater than 200,000' 
	when sum(o.total_amt_usd) < 200000 and sum(o.total_amt_usd) > 100000  then 'Between 200,000 and 100,000'
    when sum(o.total_amt_usd) < 100000 then 'Under 100,000' end AS level
from accounts a
join orders o
on o.account_id = a.id
group by 1
order by 2 desc
-- 4 - We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by customers only in 2016 and 2017. Keep the same levels as in the previous question. Order with the top spending customers listed first.
select a.name, sum(o.total_amt_usd) sum_of_total_amt_usd,
case when sum(o.total_amt_usd) > 200000 then 'Greater than 200,000' 
	when sum(o.total_amt_usd) < 200000 and sum(o.total_amt_usd) > 100000  then 'Between 200,000 and 100,000'
    when sum(o.total_amt_usd) < 100000 then 'Under 100,000' end AS level
from accounts a
join orders o
on o.account_id = a.id and o.occurred_at < '2017-12-31' and o.occurred_at > '2016-01-01'
group by 1
order by 2 desc
-- 5 - We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders. Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if they have more than 200 orders. Place the top sales people first in your final table.
select s.name sales_rep_name, count(*) orders_qty, case when count(*) > 200 then 'top' else 'not' end
from sales_reps s
join accounts a
on s.id = a.sales_rep_id
join orders o
on o.account_id = a.id
group by s.name
order by 2 desc
-- 6 - The previous didn't account for the middle, nor the dollar amount associated with the sales. Management decides they want to see these characteristics represented as well. We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders or more than 750000 in total sales. The middle group has any rep with more than 150 orders or 500000 in sales. Create a table with the sales rep name, the total number of orders, total sales across all orders, and a column with top, middle, or low depending on this criteria. Place the top sales people based on dollar amount of sales first in your final table. You might see a few upset sales people by this criteria!
select s.name sales_rep_name, 
count(*) orders_qty,
case when count(*) > 200 or sum(o.total_amt_usd) > 750000 then 'top' when count(*) > 150 or sum(o.total_amt_usd) > 500000 then 'middle' else 'low' end
from sales_reps s
join accounts a
on s.id = a.sales_rep_id
join orders o
on o.account_id = a.id
group by s.name
order by 3 desc
************************************ LESSON 4 (SQL Subqueries & Temporary Tables) ************************************

************************************ LESSON 5 (SQL Data Cleaning) ************************************

************************************ LESSON 6 ([Advanced] SQL Window Functions) ************************************

************************************ LESSON 7 ([Advanced] SQL Advanced JOINs & Performance Tuning) ************************************

************************************ LESSON 5 (SQL Data Cleaning) ************************************