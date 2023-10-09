--1question
SELECT
  staff.name,
  staff.surname,
  store.name AS store_name,
  SUM(sale.total_amount) AS total_revenue
FROM sale
JOIN staff ON sale.staff_id = staff.id
JOIN store ON sale.store_id = store.id
WHERE sale.year = 2017
GROUP BY staff.name, staff.surname, store.name
ORDER BY total_revenue DESC
LIMIT 1 PER store;


--2question
SELECT
  movie.title,
  COUNT(rental.movie_id) AS rental_count,
  AVG(customer.age) AS expected_audience_age
FROM rental
JOIN movie ON rental.movie_id = movie.id
JOIN customer ON rental.customer_id = customer.id
GROUP BY movie.title
ORDER BY rental_count DESC
LIMIT 5;


--3question
SELECT
  actor.name,
  actor.surname,
  (MAX(movie.release_year) - MIN(movie.release_year)) AS acting_career_length
FROM actor
JOIN movie_actor ON actor.id = movie_actor.actor_id
JOIN movie ON movie_actor.movie_id = movie.id
GROUP BY actor.name, actor.surname
ORDER BY acting_career_length ASC
LIMIT 1;
