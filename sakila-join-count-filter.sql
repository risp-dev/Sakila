#Išvesti filmo pavadinimą, kategoriją ir jo trukmę (filmo ilgį) mažėjančia tvarka pagal trukmę:

select f.title, c.name, f.length
from film f 
inner join film_category fc 
on f.film_id = fc.film_id
inner join category c 
on fc.category_id = c.category_id
order by f.length DESC;

#Išvesti payments tam tikrai datai (vasario mėn):
select * from payment where payment_date like '%02-%';

#Išrinkti kokiai sumai kiekvienas darbuotojas (staff) 2005 m. liepos mėn. išnuomavo filmų:
select st.first_name, st.last_name, p.payment_date, p.amount from staff st 
inner join payment p
on st.staff_id = p.staff_id
where p.payment_date like '2005-07%'
order by p.amount;

#Išrinkti ir susumuoti kokiai sumai kiekvienas darbuotojas (staff) 2005 m. liepos mėn. išnuomavo filmų:
select st.first_name, st.last_name, sum(p.amount) as total_amount 
from staff st 
inner join payment p
on st.staff_id = p.staff_id
where p.payment_date like '2005-07%'
group by st.staff_id, st.first_name, st.last_name
order by total_amount desc, st.first_name;

#Išrinkti aktorius kurių vardas yra Victor, Adam, John naudojant in:
select * from actor where first_name in ('albert', 'adam', 'john');

#Išrinkti 5 daugiausiai uždirbusias filmų kategorijas, rikiuoti mažėjančia tvarka:
select c.name, sum(p.amount) as total_amount
from category c 
join film_category fc 
on c.category_id = fc.category_id
join film f 
on fc.film_id = f.film_id
join inventory i 
on f.film_id = i.film_id
join rental r 
on i.inventory_id = r.inventory_id
join payment p 
on r.rental_id = p.rental_id
group by c.name
order by total_amount desc
Limit 5;

#Kiek parduotuvės uždirbo iš nuomos, išvesti duomenis mažėjančia tvarka pagal sumą:
select s.store_id as store, sum(p.amount) as amount
from store s 
join inventory i 
on s.store_id = i.store_id
join rental r 
on i.inventory_id = r.inventory_id
join payment p 
on r.rental_id = p.rental_id
group by store
order by amount desc;

#Išvesti aktoriaus vardą ir pavardę viename langelyje ir pavaizduoti didžiosiomis raidėmis rikiuojant pagal vardą/pavardę:
select upper(concat(first_name, ' ', last_name)) as 'Actors' from actor
order by last_name;

select actor_id, first_name, last_name from actor
where last_name like '%LL%'
order by last_name, first_name;

#Išvesti aktorių id, vardą ir pavardę kurių pavardėje yra dviguma L ('LL') + išrikiuoti pagal vardą/pavardę:
select actor_id, first_name, last_name from actor
where last_name like '%LL%';

#Panaudojant IN išrinkti pasirinktas šalis:
select country_id, country from country
where country in ('Afghanistan', 'Bangladesh', 'China');

#Redaguoti lentelės kolonas: po country įterpti "language":
alter table country add language varchar(45) after country;

# Pakeisti varchar(45) į varchar(90):
alter table country modify column language varchar(90);

#Ištrinti language stulpelį:

aler table country drop column language;

#Išvesti ir suskaičiuoti pasikartojančias pavardes iš aktorių lentelės mažėjančia tvarka:
select last_name as Pavarde, count(last_name) as Skaicius from actor
group by last_name
order by Skaicius desc;

#Išvesti aktorių pavardes, kurios pasikartoja 3 ir daugiau kartų:
select last_name as Pavarde, count(last_name) as Skaicius from actor
group by Pavarde
having Skaicius > 3;

#Pakeisti aktoriaus ELVIS MARX pavardę į PRESLEY:
update actor set last_name ='PRESLEY' where actor_id = 22;

#'payment' lentelės sukūrimo užklausa:
show create table payment;

#Atvaizduoti address lentelės 10 įrašų, pagal district:
select * from address
order by district
limit 10;

#Išvesti staff vardus, pavardes ir adresus:
select s.first_name, s.last_name, a.address from staff s 
join address a 
on s.address_id = a.address_id;

#Išvesti filmų sąrašą ir prie kiekvieno filmo pateikti jame vaidinusių aktorių skaičių:
select f.title as film, count(fa.actor_id) as amount from film f 
join film_actor fa 
on f.film_id = fa.film_id 
group by film
order by amount desc;

#Kiek inventoriaus sandėlyje yra 'Hunchback Impossible' kopijų:
SELECT 
    f.title AS title, COUNT(i.film_id) AS amount
FROM
    film f
        JOIN
    inventory i ON f.film_id = i.film_id
WHERE
    title = 'Hunchback Impossible'
GROUP BY title
ORDER BY amount DESC;