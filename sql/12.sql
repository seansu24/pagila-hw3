/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */

SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
CROSS JOIN LATERAL (
    SELECT cat.name
    FROM rental re
    JOIN inventory i USING (inventory_id)
    JOIN film f USING (film_id)
    JOIN film_category fc USING (film_id)
    JOIN category cat USING (category_id)
    WHERE re.customer_id = c.customer_id
    ORDER BY re.rental_date DESC
    LIMIT 5
) recent
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING count(*) FILTER (WHERE recent.name = 'Action') > 2 
ORDER BY c.customer_id;
