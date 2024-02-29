#Išvesti visas klabas iš language ir išrikiuoti priešinga abc tvarka:
SELECT
    *
FROM
    language
ORDER BY name DESC;

#Išvesti visus adresus, kurie turi pašto kodą:
SELECT
    *
FROM
    address
WHERE
    postal_code IS NOT NULL
ORDER BY address;

#Suskaičiuoti kiek yra filmų, kurių to pačio filmo aprašyme minima thrill ir shark:
SELECT
    COUNT(*)
FROM
    film
WHERE
    description LIKE '%thrill%'
        AND description LIKE '%shark%'
ORDER BY title;

SELECT
    c.name, COUNT(fc.film_id) AS filmai
FROM
    category c
        INNER JOIN
    film_category fc ON c.category_id = fc.category_id
        INNER JOIN
    film f ON fc.film_id = f.film_id
GROUP BY c.name


#Išvesti filmų kategorijų pavadinimus ir suskaičiuoti, kiek kiekvienoje kategorijoje yra filmų, išfiltruoti kategorijas, kuriose yra 50 ir daugiau filmų:
SELECT
    c.name, COUNT(fc.film_id) AS filmai
FROM
    category c
        JOIN
    film_category fc ON c.category_id = fc.category_id
        INNER JOIN
    film f ON fc.film_id = f.film_id
GROUP BY c.name
HAVING filmai > 50
ORDER BY filmai DESC;


#Išvesti filmų kategorijų pavadinimus ir suskaičiuoti, kiek kiekvienoje kategorijoje yra filmų, išfiltruoti kategorijas, kuriose yra tarp 50 ir 60 filmų:
SELECT
    c.name, COUNT(fc.film_id) AS filmai
FROM
    category c
        JOIN
    film_category fc ON c.category_id = fc.category_id
        JOIN
    film f ON fc.film_id = f.film_id
GROUP BY c.name
HAVING filmai > 50 AND filmai < 60
ORDER BY filmai DESC;

# Išvesti kliento vardą, pavardę ir sumą išleistą už nuomą:

SELECT
    c.first_name AS vardas,
    c.last_name AS pavarde,
    SUM(COALESCE(p.amount, 0)) AS suma
FROM
    customer c
        JOIN
    payment p ON c.customer_id = p.customer_id
GROUP BY vardas , pavarde
ORDER BY suma DESC;

#The purpose of sum(coalesce(p.amount, 0)) is to sum up the values of p.amount, treating any null values as 0 in the process. This can be helpful for ensuring consistent calculations and avoiding errors caused by null values.