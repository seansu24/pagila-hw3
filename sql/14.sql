/*
 * Management also wants to create a "best sellers" list for each category.
 *
 * Write a SQL query that:
 * For each category, reports the five films that have been rented the most for each category.
 *
 * Note that in the last query, we were ranking films by the total amount of payments made,
 * but in this query, you are ranking by the total number of times the movie has been rented (and ignoring the price).
 */

SELECT c.name, best.title, best.num_rentals AS "total rentals"
FROM category c
CROSS JOIN LATERAL (
    SELECT f.title, COUNT(r.rental_id) AS num_rentals
    FROM film f
    JOIN film_category fc USING (film_id)
    JOIN inventory i USING (film_id)
    JOIN rental r USING (inventory_id)
    WHERE fc.category_id = c.category_id
    GROUP BY f.film_id, f.title
    ORDER BY num_rentals DESC, f.title DESC
    LIMIT 5
) best
ORDER BY c.name, "total rentals" DESC, best.title;
