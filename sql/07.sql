/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

SELECT a.first_name || ' ' || a.last_name AS "Actor Name"
FROM actor a
WHERE a.actor_id <> 112
  AND a.actor_id NOT IN (
      SELECT co.actor_id
      FROM film_actor bacall
      JOIN film_actor co USING (film_id)
      WHERE bacall.actor_id = 112)
  AND a.actor_id IN (
      SELECT co.actor_id
      FROM film_actor fa
      JOIN film_actor co USING (film_id)
      WHERE fa.actor_id IN (
          SELECT co2.actor_id
          FROM film_actor b
          JOIN film_actor co2 USING (film_id)
          WHERE b.actor_id = 112))
ORDER BY "Actor Name";
