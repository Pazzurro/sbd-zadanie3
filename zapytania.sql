SELECT * FROM `customers` WHERE country = "Germany";

SELECT * FROM `customers` WHERE city = "Berlin";

SELECT * FROM `customers` WHERE country = "Germany" AND city = "Berlin";

SELECT * FROM `customers` WHERE (city = "Berlin" OR city = "München") AND country = "Germany";

SELECT * FROM `customers` WHERE NOT country = "Germany" AND NOT country = "USA";

SELECT * FROM `customers` ORDER BY country ASC;

SELECT * FROM `customers` ORDER BY country DESC;

SELECT * FROM `customers` ORDER BY country DESC, customer_name ASC;

-------------------------------------------------------------------------

SELECT MIN(price) FROM `products`;

SELECT MAX(price) FROM `products`;

SELECT COUNT(*) FROM `products`;

SELECT COUNT(*) FROM `customers`;

SELECT COUNT(*) FROM `customers` GROUP BY country;

SELECT COUNT(*), AVG(price) FROM `products` WHERE category_id = 1;

SELECT SUM(price) FROM `products` WHERE category_id = 2;

SELECT MAX(price) FROM `products` WHERE category_id = 1 OR category_id = 2 GROUP BY category_id;

-------------------------------------------------------------------------

SELECT * FROM `products` WHERE price BETWEEN 10 AND 20;

SELECT * FROM `products` WHERE price NOT BETWEEN 10 AND 20;

SELECT * FROM `products` WHERE category_id IN(1, 2, 3);

SELECT * FROM orders WHERE shipper_id IN(1, 2, 3);

SELECT * FROM `products` WHERE (price BETWEEN 10 AND 15) AND (category_id NOT BETWEEN 1 AND 4);

SELECT * FROM `orders` WHERE order_date BETWEEN CAST(19960701 AS datetime) AND CAST(19960731 AS datetime);

SELECT * FROM `orders` WHERE orders.customer_id IN( SELECT id FROM `customers` WHERE id BETWEEN 77 AND 90);

-------------------------------------------------------------------------

SELECT customers.customer_name, customers.contact_name, customers.address, orders.order_date, orders_details.product_id FROM customers JOIN orders ON customers.id = orders.customer_id JOIN orders_details ON orders.id = orders_details.order_id;


SELECT customers.customer_name, customers.contact_name, customers.address, COUNT(orders.id) FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id;


SELECT DISTINCT customers.id, customers.customer_name, customers.contact_name, customers.address FROM customers JOIN orders ON customers.id = orders.customer_id WHERE customers.id = orders.customer_id;






