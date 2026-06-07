-- 1. Top 5 product categories have the most products?

SELECT
product_category,
COUNT(*) AS total_products
FROM amazon_cleaned
GROUP BY product_category
ORDER BY total_products DESC limit 5;


-- 2. Top 5 categories generate the highest purchase volume?

SELECT
product_category ,
sum(purchased_last_month) as total_purchases
FROM amazon_cleaned
GROUP by product_category
order by total_purchases DESC
LIMIT 5


-- 3. Which categories have the highest average rating?

SELECT
product_category,
ROUND(AVG(product_rating),2) AS avg_rating
FROM amazon_cleaned
GROUP BY product_category
ORDER BY avg_rating DESC
LIMIT 5;


-- 4. What are the top 10 most purchased products?

SELECT
product_title,
purchased_last_month
FROM amazon_cleaned
ORDER BY purchased_last_month DESC
LIMIT 10;


-- 5. What are the top 10 most reviewed products?

SELECT
product_title,
total_reviews
FROM amazon_cleaned
ORDER BY total_reviews DESC
LIMIT 10;


-- 6. What are the most expensive product.

SELECT
product_title,
CAST(original_price AS REAL) AS price
FROM amazon_cleaned
ORDER BY price DESC
LIMIT 5;


-- 7. Which categories have the highest average product price?

SELECT
product_category,
ROUND(AVG(original_price),2) AS avg_price
FROM amazon_cleaned
GROUP BY product_category
ORDER BY avg_price DESC
LIMIT 5;


-- 8. Do sponsored products sell more than organic products?

SELECT
is_sponsored,
ROUND(AVG(purchased_last_month),2) AS avg_purchases
FROM amazon_cleaned
GROUP BY is_sponsored;


-- 9. Do sponsored products have higher ratings?

SELECT
is_sponsored,
ROUND(AVG(product_rating),2) AS avg_rating
FROM amazon_cleaned
GROUP BY is_sponsored;


-- 10. How do Best Sellers compare with other products?

SELECT
is_best_seller,
ROUND(AVG(purchased_last_month),2) AS avg_purchases,
ROUND(AVG(product_rating),2) AS avg_rating
FROM amazon_cleaned
GROUP BY is_best_seller
ORDER BY avg_purchases DESC
limit 5;


-- 11. Which categories offer the highest average discount?

SELECT
product_category,
ROUND(AVG(discount_percentage),2) AS avg_discount
FROM amazon_cleaned
GROUP BY product_category
ORDER BY avg_discount DESC
LIMIT 5;


-- 12. How do discounts influence sales?

SELECT
    CASE
        WHEN discount_percentage = 0 THEN 'No Discount'
        WHEN discount_percentage <= 10 THEN 'Low Discount'
        WHEN discount_percentage <= 30 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_group,
    ROUND(AVG(purchased_last_month),2) AS avg_purchases
FROM amazon_cleaned
GROUP BY discount_group
ORDER BY avg_purchases DESC;


-- 13. Which categories have the most reviews?

SELECT
product_category,
SUM(total_reviews) AS total_reviews
FROM amazon_cleaned
GROUP BY product_category
ORDER BY total_reviews DESC;


-- 14. Which products have high ratings but low purchases?

SELECT
    product_title,
    product_rating,
    CAST(purchased_last_month AS REAL) AS purchase
FROM amazon_cleaned
WHERE product_rating >= 4.8
  AND CAST(purchased_last_month AS REAL) <= 100
ORDER BY product_rating DESC;


-- 15. Which categories have the highest average purchases per product?

SELECT
    product_category,
    ROUND(AVG(purchased_last_month),2) AS avg_purchases
FROM amazon_cleaned
GROUP BY product_category
ORDER BY avg_purchases DESC;



