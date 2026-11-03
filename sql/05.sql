/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT g.title FROM (
    SELECT * FROM film_actor
    JOIN film USING (film_id)
) f
JOIN (
    SELECT * FROM film_actor
    JOIN film USING (film_id)
) g USING (actor_id)
WHERE f.title = 'AMERICAN CIRCUS'
ORDER BY g.title;
