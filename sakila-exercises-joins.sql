#Select actor with name -
SELECT * FROM `actor` HAVING first_name = 'helen';
SELECT first_name AS 'Vardas', last_name AS 'Pavarde' FROM actor WHERE first_name = 'John';

#Select actor with last name 'cage'
SELECT first_name as 'Name', last_name AS 'Last name' FROM actor where last_name = 'cage';

#How many distint actors last name are there:
SELECT COUNT(DISTINCT last_name) AS 'Total distinct last names' FROM actor;

#Which last names are not repeated:
SELECT last_name AS 'Pavarde' FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1

SELECT COUNT(DISTINCT last_name) as 'Nepasikartojanciu pavardziu skaicius'
FROM actor
WHERE last_name IS NOT null;

#Which last name apear more than once
SELECT last_name AS 'Pasikartojanti pavarde' 
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1

SELECT last_name AS 'Pasikartojanti pavarde', count(last_name) as 'Kiek kartu pasikartoja'
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1

#Which actor has apeared in the most movies?
SELECT a.first_name AS 'Vardas', a.last_name AS 'Pavarde', COUNT(fa.film_id) AS 'Filmu skaicius'
FROM actor a 
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id 
INNER JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) = (
    SELECT COUNT(fa_sub.film_id)
    FROM film_actor fa_sub
    GROUP BY fa_sub.actor_id
    ORDER BY COUNT(fa_sub.film_id) DESC
    LIMIT 1
);

#Is Academy Dinosaur available for rent from store 1?
SELECT 
    f.title AS 'Filmo pavadinimas',
    r.return_date AS 'Grazinimo data'
FROM
    film f
        INNER JOIN
    rental r ON f.film_id = r.rental_id
        INNER JOIN
    inventory i ON r.inventory_id = i.inventory_id
WHERE
    r.return_date IS NOT NULL
        AND i.store_id = 1
        AND f.title = 'ACADEMY DINOSAUR'