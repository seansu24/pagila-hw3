/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */

SELECT DISTINCT f.first_name, f.last_name
FROM (
    SELECT first_name, last_name, actor_id, name FROM category
    LEFT JOIN film_category USING (category_id)
    LEFT JOIN film_actor USING (film_id)
    LEFT JOIN actor USING (actor_id)
    WHERE name = 'Children'
) AS f
WHERE f.actor_id NOT IN (
    SELECT actor_id FROM category
    JOIN film_category USING (category_id)
    JOIN film_actor USING (film_id)
    JOIN actor USING (actor_id)
    WHERE name = 'Horror'
)
ORDER BY last_name ASC;
