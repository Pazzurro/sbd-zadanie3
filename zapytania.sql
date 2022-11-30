-------------------------------------------------------------------------
//WHERE_AND_OR_ORDAYBY//

1. SELECT * FROM `customers` WHERE country = "Germany";

2. SELECT * FROM `customers` WHERE city = "Berlin";

3. SELECT * FROM `customers` WHERE country = "Germany" AND city = "Berlin";

4. SELECT * FROM `customers` WHERE (city = "Berlin" OR city = "München") AND country = "Germany";

5. SELECT * FROM `customers` WHERE NOT country = "Germany" AND NOT country = "USA";

6. SELECT * FROM `customers` ORDER BY country ASC;

7. SELECT * FROM `customers` ORDER BY country DESC;

8. SELECT * FROM `customers` ORDER BY country DESC, customer_name ASC;

-------------------------------------------------------------------------
//MIN_MAX_COUNT_AVG_SUM_GROUPBY//

1. SELECT MIN(price) FROM `products`;

2. SELECT MAX(price) FROM `products`;

3. SELECT COUNT(*) FROM `products`;

4. SELECT COUNT(*) FROM `customers`;

5. SELECT COUNT(*) FROM `customers` GROUP BY country;

6. SELECT COUNT(*), AVG(price) FROM `products` WHERE category_id = 1;

7. SELECT SUM(price) FROM `products` WHERE category_id = 2;

8. SELECT MAX(price) FROM `products` WHERE category_id = 1 OR category_id = 2 GROUP BY category_id;

-------------------------------------------------------------------------
//BETWEEN_NOT_BETWEEN_IN_NOT_IN_SUBQUERY//

1. SELECT * FROM `products` WHERE price BETWEEN 10 AND 20;

2. SELECT * FROM `products` WHERE price NOT BETWEEN 10 AND 20;

3. SELECT * FROM `products` WHERE category_id IN(1, 2, 3);

4. SELECT * FROM orders WHERE shipper_id IN(1, 2, 3);

5. SELECT * FROM `products` WHERE (price BETWEEN 10 AND 15) AND (category_id NOT BETWEEN 1 AND 4);

6. SELECT * FROM `orders` WHERE order_date BETWEEN CAST(19960701 AS datetime) AND CAST(19960731 AS datetime);

7. SELECT * FROM `orders` WHERE orders.customer_id IN( SELECT id FROM `customers` WHERE id BETWEEN 77 AND 90);

-------------------------------------------------------------------------
//JOIN_INNER_LEFT_RIGT_SELF//

1. SELECT customers.customer_name, customers.contact_name, customers.address, orders.order_date FROM customers JOIN orders ON customers.id = orders.customer_id;


2. SELECT customers.customer_name, customers.contact_name, customers.address, COUNT(orders.id) FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id;


3. SELECT c.id, c.customer_name, c.contact_name, c.address, o.id FROM customers c RIGHT JOIN orders o ON c.id = o.customer_id WHERE c.id = o.customer_id;


4. SELECT employees.first_name, employees.last_name, orders.id FROM employees RIGHT JOIN orders ON orders.employee_id = employees.id;


5. SELECT C1.customer_name AS name1, C2.customer_name AS name2 FROM customers C1 JOIN customers C2 ON C1.city = C2.city AND C1.id != C2.id;

-------------------------------------------------------------------------
//LIMIT_OFFSET//

1. SELECT * FROM orders ORDER BY id DESC LIMIT 10;

2. SELECT * FROM orders LIMIT 10 OFFSET 10;

-------------------------------------------------------------------------
//HAVING_EXISTS//

1. SELECT country FROM customers GROUP BY country HAVING COUNT(country) > 5;

2. SELECT * FROM customers WHERE EXISTS (SELECT * FROM orders WHERE customers.id = orders.customer_id HAVING COUNT(orders.id) BETWEEN 2 AND 4) ORDER BY customers.id DESC;

3. SELECT employees.id, employees.last_name, employees.first_name FROM orders JOIN employees ON employees.id = orders.employee_id GROUP BY orders.employee_id HAVING COUNT(employee_id) > 10;

4. SELECT employees.id, employees.last_name, employees.first_name FROM employees JOIN orders ON employees.id = orders.employee_id WHERE employees.last_name = "Davolio" OR employees.last_name = "Fuller" GROUP BY orders.employee_id HAVING COUNT(employee_id) > 25;

5. SELECT * FROM suppliers WHERE EXISTS(SELECT * FROM products WHERE suppliers.id = products.supplier_id AND products.price < 20);

6. SELECT * FROM suppliers WHERE EXISTS(SELECT * FROM products WHERE suppliers.id = products.supplier_id AND products.price = 22);

-------------------------------------------------------------------------
//CASE//

1. SELECT products.name, CASE WHEN orders_details.quantity > 30 THEN "Liczba sztuk większa niż 30" WHEN orders_details.quantity = 30 THEN "Liczba sztuk równa 30" ELSE "Liczba sztuk mniejsza niż 30" END AS liczba_sztuk FROM products JOIN orders_details ON products.id = orders_details.product_id;

2. SELECT * FROM customers ORDER BY (CASE WHEN customers.city IS NULL THEN customers.country ELSE customers.city END);

-------------------------------------------------------------------------
//ALL//

1. SELECT products.id, products.name, SUM(orders_details.quantity) amount FROM products JOIN orders_details ON products.id = orders_details.product_id GROUP BY products.name ORDER BY amount DESC LIMIT 10;

2. SELECT customers.id, customers.customer_name, COUNT(orders.id) ordersAmount FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY orders.customer_id ORDER BY `ordersAmount` DESC LIMIT 10;

3. SELECT categories.category_name, COUNT(products.category_id) ilosc FROM categories JOIN products ON products.category_id = categories.id JOIN orders_details ON orders_details.product_id = products.id GROUP BY categories.category_name ORDER BY ilosc DESC LIMIT 1;

4. SELECT categories.category_name, COUNT(products.category_id) FROM categories JOIN products ON products.category_id = categories.id JOIN orders_details ON orders_details.product_id = products.id GROUP BY categories.category_name;

5. SELECT DISTINCT customers.customer_name FROM customers JOIN orders ON orders.customer_id = customers.id WHERE orders.order_date > '1996-10-01';

-------------------------------------------------------------------------
//DISTINCT//
1.  SELECT customers.country FROM customers;
    SELECT DISTINCT customers.country FROM customers;
    
2.  SELECT COUNT(DISTINCT country) FROM customers;