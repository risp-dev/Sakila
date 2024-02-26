#Pasirinkti phone, district iš address lentelės (naudojant IN) 'England' , 'Taipei', 'Java' adresams:

SELECT 
    phone, district
FROM
    address
WHERE
    district IN ('England' , 'Taipei', 'Java');

#Pasirinkti payment_id, amount, payment_date, naudoti IN, ir išrinkti įrašus dataoms '2005-05-26' , '2005-05-27': 
SELECT 
    payment_id, amount, payment_date
FROM
    payment
WHERE
    DATE(payment_date) IN ('2005-05-26' , '2005-05-27');

#Iš film lentelės išrinkti visus įraųus lurių reitingas yra 'G' , 'PG-13', 'NC-17':
SELECT 
    *
FROM
    film
WHERE
    rating IN ('G' , 'PG-13', 'NC-17');

#Pasirinkti viską iš payment kai mokėjimo data yra tarp (BETWEEN) '2005-06-01' ir '2005-06-30' ir kai customer_id 35 ir 48:
SELECT 
    *
FROM
    payment
WHERE
    DATE(payment_date) BETWEEN '2005-06-01' AND '2005-06-30'
        AND customer_id IN ('35' , '48');

#Pasirinkti filmus iš fil, kurių trukmė tarp 90 ir 120 min., išdėstyti pagal trukmę didėjančia tvarka:
SELECT 
    title, length
FROM
    film
WHERE
    length BETWEEN '90' AND '120'
ORDER BY length ASC;

#

#

#
