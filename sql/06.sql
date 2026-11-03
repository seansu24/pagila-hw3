/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

SELECT DISTINCT y.first_name || ' ' || y.last_name AS "Actor Name"
FROM (
    SELECT film_id
    FROM film_actor
    WHERE actor_id = 112  -- Bacall number
) x
JOIN (
    SELECT actor_id, first_name, last_name, film_id
    FROM actor
    JOIN film_actor USING (actor_id)
) y USING (film_id)
WHERE y.actor_id <> 112
ORDER BY "Actor Name";
