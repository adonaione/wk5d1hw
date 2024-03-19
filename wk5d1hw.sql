-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT count(last_name)
FROM actor a 
WHERE last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?

SELECT count(payment_id) 
FROM payment  
where amount BETWEEN 3.99 AND 5.99;


-- 3. What films have exactly 7 copies? (search in inventory)

SELECT film_id, count(*) AS num_films
FROM inventory i 
GROUP BY film_id 
HAVING count(*) = 7;

-- 4. How many customers have the first name ‘Willie’?

SELECT count(*)
FROM customer 
WHERE first_name LIKE 'Willie';


-- 5. What store employee (get the id) sold the most rentals (use the rental table)?

SELECT staff_id, count(staff_id) AS num_rentals
FROM rental r
GROUP BY staff_id
ORDER BY num_rentals DESC;


-- 6. How many unique district names(states) are there? (address table)

SELECT count(DISTINCT district) 
FROM address;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, count(*)
FROM film_actor fa
GROUP BY film_id
ORDER BY count(*) DESC
LIMIT 1;


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT count(*)
FROM customer c 
WHERE store_id = 1 AND last_name LIKE '%es';


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT amount, count(*)
FROM payment p 
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount 
HAVING count(*) > 250;


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

SELECT count(rating), rating
FROM film f
GROUP BY rating
ORDER BY count(rating) DESC;

