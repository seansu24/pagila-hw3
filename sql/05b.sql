/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
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
GROUP BY g.title
HAVING count(actor_id) > 1
ORDER BY title; 

