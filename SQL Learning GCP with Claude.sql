-- Zadanie 1
-- How many individual line items are in the raw sales table? Use COUNT(*).

SELECT COUNT(*) AS trans_amount
FROM `power-bi-integration-490222.StoreData.Sprzedaz_produktow`;

-- Exercise 2 — Show distinct product categories

SELECT DISTINCT kategoria_towaru
FROM `power-bi-integration-490222.StoreData.Sprzedaz_produktow`;

----

SELECT COUNT(DISTINCT kategoria_towaru)
FROM `power-bi-integration-490222.StoreData.Sprzedaz_produktow`;


-- Exercise 3 — Filter: online channel orders only
-- From v_sales_clean, return all rows where channel is 'Internetowy'. Show only these columns: sale_date, product_name, unit_price, quantity, line_total. Limit to 20 rows.

SELECT
sale_date,
product_name,
unit_price,
quantity,
line_total
FROM `power-bi-integration-490222.StoreData.v_sales_clean`
WHERE channel = 'Internetowy'
ORDER BY sale_date, product_name
LIMIT 20;

-- Exercise 4 — Total revenue per brand (top 10)

-- From v_sales_clean, group by brand and calculate:

-- total revenue
-- total units sold
-- number of distinct orders

-- Return the top 10 brands by revenue.

SELECT 
brand,
ROUND(SUM(line_total),2) AS Total_revenue,
sum(quantity) as total_units_sold,
count(distinct id_dok_sprz) as number_of_distinct_orders
FROM `power-bi-integration-490222.StoreData.v_sales_clean`
group by brand
order by SUM(line_total) desc
LIMIT 10;

--5. Revenue by day of week
-- Which day of the week generates the most revenue? Use FORMAT_DATE('%A', sale_date) to extract the day name from v_sales_clean.

SELECT
  FORMAT_DATE('%A', sale_date)             AS day_name,
  FORMAT_DATE('%u', sale_date)             AS day_num,
  COUNT(DISTINCT id_dok_sprz)              AS num_orders,
  ROUND(SUM(line_total), 2)               AS revenue
FROM `power-bi-integration-490222.StoreData.v_sales_clean`
GROUP BY day_name, day_num
ORDER BY revenue desc;




-- Exercise 6 — Filter groups with HAVING
-- From v_sales_clean, find all customers who spent more than PLN 5,000 in January. Return their name, region, total orders, and total spend.
-- The exercise has two versions — write both:

-- Easy version directly from customer_summary
-- Better version built from scratch using v_sales_clean with GROUP BY + HAVING




SELECT  
customer_name,
region,
total_orders,
total_spend
FROM `power-bi-integration-490222.StoreData.customer_summary`
where total_spend > 5000;
--

SELECT
customer_name,
region,
customer_type,
count(distinct id_dok_sprz) as total_orders,
round(sum(line_total),2) as total_spend
FROM `power-bi-integration-490222.StoreData.v_sales_clean`
where customer_type = 'Osoba fizyczna'
group by customer_name, region, customer_type
having sum(line_total) > 5000
order by total_spend desc;

----

-- Exercise 7 — Payment method breakdown per channel
-- From v_sales_clean, show revenue broken down by both channel and payment_method together.












