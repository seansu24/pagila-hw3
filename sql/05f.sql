/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */

SELECT title FROM (
    SELECT g.title FROM (
        SELECT * FROM film_actor
        JOIN film USING (film_id)
    ) f
    JOIN (
        SELECT * FROM film_actor
        JOIN film USING (film_id)
    ) g USING (actor_id)
    WHERE f.title = 'AMERICAN CIRCUS'
    INTERSECT
    SELECT g.title FROM (
        SELECT *
        FROM film_category
        JOIN category USING (category_id)
        JOIN film USING (film_id)
    ) f
    JOIN (
        SELECT *
        FROM film_category
        JOIN category USING (category_id)
        JOIN film USING (film_id)
    ) g USING (name)
    WHERE f.title = 'AMERICAN CIRCUS'
    GROUP BY g.title
    HAVING count(name) > 1
) f
ORDER BY title;
