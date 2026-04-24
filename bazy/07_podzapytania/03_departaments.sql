-- Wyświetl pracowników zarabiających więcej niż średnia zarobków

SELECT
    Name
FROM employees
WHERE salary > (
    SELECT
        AVG(salary)
    FROM employees
);


-- Wyświetl nazwy wraz z ceną najdroższych produktów
SELECT product_name, price
FROM products
WHERE price = (
    SELECT max(price)
    FROM products

);
-- Wyświetl dane klientów, którzy nie złożyli żadnego zamówienia

SELECT id, name
FROM customers
WHERE id NOT IN (
    SELECT customer_id
    FROM orders
);

-- Wyswietl dane osób pracujących w tym samym dziale co Bob

SELECT
    id,
    name
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    WHERE name = 'Bob'
);


-- Wyświetl dane pracowników,  którzy nie obsłużyli żadnego zamówienia

-- SELECT
--     id,
--     name
-- FROM employees
-- WHERE NOT EXISTS(
--     SELECT 1
--     FROM orders
--     WHERE orders.id = 
-- );
 
-- Wyświetl nazwy działów,  które nie mają żadnego pracownika

-- Wyświetl dane pracowników zarabiających więcej niż wynosi średnia zarobków w ich dziale

SELECT
    name,
    id
FROM employees
WHERE salary > (
    SELECT
        AVG(salary)
    FROM employees e
    WHERE employees.department_id = e.department_id
);

-- Wyświetl dane pracowników,  których pensje sa najwyższe w ich dziale

SELECT
    name,
    id
FROM employees
WHERE salary = (
    SELECT
        MAX(salary)
    FROM employees e
    WHERE employees.department_id = e.department_id
);