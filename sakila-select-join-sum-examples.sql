#(select distinct values)
SELECT DISTINCT `rating` FROM `film`;

#(select first 10 rows from film table)
SELECT * FROM `film` limit 10;

#(List all films with rating PG-13)
SELECT * FROM `film` WHERE `rating` = 'PG-13'

#(Count the number of films in the film table)
SELECT COUNT(*) as 'Is viso filmu:' FROM `film`;

#(List films produced after 2005)
SELECT `title`, `release_year` FROM `film` WHERE `release_year` > 2005

#(List who an when rented the film)
SELECT CONCAT(c.first_name, ' ', c.last_name) AS 'Nuomininkas', 
r.rental_date AS 'Nuomos data' 
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id;

SELECT CONCAT(`first_name`,' ',`last_name`) AS 'Nuomininkas',
`inventory_id` AS 'Inventoriaus numeris' FROM customer c 
INNER JOIN rental r 
ON
c.customer_id = r.customer_id

SELECT CONCAT(`first_name`,' ',`last_name`) AS 'Nuomininkas',
`inventory_id` AS 'Inventoriaus numeris' FROM customer c 
INNER JOIN rental r 
ON
c.customer_id = r.customer_id
WHERE c.first_name = 'LINDA'

#(List all films where title contains word 'agent'
SELECT `title` AS 'Filmo pavadinimas', `release_year` AS 'PAgaminimo metai'  FROM `film` WHERE `title` LIKE '%agent%'

#(Count how many actors there are in actor table)
SELECT COUNT(*) AS 'Aktoriu skaicius' FROM actor 

#(Names who rented more than 5 films)
SELECT CONCAT(c.first_name,' ',c.last_name) AS 'Nuomininkas' FROM `customer` c 
INNER JOIN 
rental r
ON
c.customer_id = r.customer_id
GROUP by r.customer_id
HAVING COUNT(*) > 5

SELECT CONCAT(c.first_name,' ',c.last_name) AS 'Nuomininkas', COUNT(r.customer_id) AS 'Nuomu skaicius' FROM `customer` c 
INNER JOIN 
rental r
ON
c.customer_id = r.customer_id
GROUP by r.customer_id
HAVING COUNT(*) > 5

#(Film list that were returned after 2005-08-06)
SELECT * FROM `rental` WHERE DATE(return_date) > '2005-08-06' 

SELECT f.title AS 'Filmo pavadinimas', r.return_date AS 'Grazinimo data'
FROM film f 
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
WHERE DATE(r.return_date) > '2005-08-06';

#(Avereage rental time (hour, days)
SELECT AVG(TIMESTAMPDIFF(HOUR, rental_date, return_date)) AS 'Vidutinė nuomos trukmė'
FROM rental
where rental_date IS NOT null
AND 
return_date IS NOT null

SELECT AVG(TIMESTAMPDIFF(DAY, rental_date, return_date)) AS 'Vidutinė nuomos trukmė'
FROM rental
where rental_date IS NOT null
AND 
return_date IS NOT null

#(10 customers who paid the most for rent)
SELECT CONCAT(c.first_name,' ',c.last_name) AS 'Vardas ir pavarde', 
sum(p.amount) AS 'Sumoketa suma'
FROM customer c 
INNER JOIN payment p 
ON
c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
order by 'Sumoketa suma' DESC
LIMIT 10

#(List of films that were not returned)
SELECT * FROM rental where return_date IS null

SELECT f.title AS 'Filmo pavadinimas' FROM film f 
INNER JOIN inventory i 
ON
f.film_id = i.film_id
INNER JOIN rental r 
ON
i.inventory_id = r.inventory_id
WHERE r.return_date IS NULL
ORDER BY f.title DESC
LIMIT 10