-------------------------------------------------------------------------
//WHERE_AND_OR_ORDAYBY//

SELECT * FROM `customers` WHERE country = "Germany";

SELECT * FROM `customers` WHERE city = "Berlin";

SELECT * FROM `customers` WHERE country = "Germany" AND city = "Berlin";

SELECT * FROM `customers` WHERE (city = "Berlin" OR city = "München") AND country = "Germany";

SELECT * FROM `customers` WHERE NOT country = "Germany" AND NOT country = "USA";

SELECT * FROM `customers` ORDER BY country ASC;

SELECT * FROM `customers` ORDER BY country DESC;

SELECT * FROM `customers` ORDER BY country DESC, customer_name ASC;

-------------------------------------------------------------------------
//MIN_MAX_COUNT_AVG_SUM_GROUPBY//

SELECT MIN(price) FROM `products`;

SELECT MAX(price) FROM `products`;

SELECT COUNT(*) FROM `products`;

SELECT COUNT(*) FROM `customers`;

SELECT COUNT(*) FROM `customers` GROUP BY country;

SELECT COUNT(*), AVG(price) FROM `products` WHERE category_id = 1;

SELECT SUM(price) FROM `products` WHERE category_id = 2;

SELECT MAX(price) FROM `products` WHERE category_id = 1 OR category_id = 2 GROUP BY category_id;

-------------------------------------------------------------------------
//BETWEEN_NOT_BETWEEN_IN_NOT_IN_SUBQUERY//

SELECT * FROM `products` WHERE price BETWEEN 10 AND 20;

SELECT * FROM `products` WHERE price NOT BETWEEN 10 AND 20;

SELECT * FROM `products` WHERE category_id IN(1, 2, 3);

SELECT * FROM orders WHERE shipper_id IN(1, 2, 3);

SELECT * FROM `products` WHERE (price BETWEEN 10 AND 15) AND (category_id NOT BETWEEN 1 AND 4);

SELECT * FROM `orders` WHERE order_date BETWEEN CAST(19960701 AS datetime) AND CAST(19960731 AS datetime);

SELECT * FROM `orders` WHERE orders.customer_id IN( SELECT id FROM `customers` WHERE id BETWEEN 77 AND 90);

-------------------------------------------------------------------------
//JOIN_INNER_LEFT_RIGT_SELF//

SELECT customers.customer_name, customers.contact_name, customers.address, orders.order_date FROM customers JOIN orders ON customers.id = orders.customer_id;


SELECT customers.customer_name, customers.contact_name, customers.address, COUNT(orders.id) FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id;


SELECT c.id, c.customer_name, c.contact_name, c.address, o.id FROM customers c RIGHT JOIN orders o ON c.id = o.customer_id WHERE c.id = o.customer_id;


SELECT employees.first_name, employees.last_name, orders.id FROM employees RIGHT JOIN orders ON orders.employee_id = employees.id;


SELECT C1.customer_name AS name1, C2.customer_name AS name2 FROM customers C1 JOIN customers C2 ON C1.city = C2.city AND C1.id != C2.id;

-------------------------------------------------------------------------
//LIMIT_OFFSET//

SELECT * FROM orders ORDER BY id DESC LIMIT 10;

SELECT * FROM orders LIMIT 10 OFFSET 10;
