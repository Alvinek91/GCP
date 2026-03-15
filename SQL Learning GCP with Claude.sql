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