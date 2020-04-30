use sakila;
 
-- 1. Find out the PG-13 rated comedy movies. DO NOT use the film_list table.

SELECT 
    f.film_id, f.title AS PG_13_rated_comedy_movies
FROM
    category c
        INNER JOIN
    film_category fc ON c.category_id = fc.category_id
        INNER JOIN
    film f ON fc.film_id = f.film_id
WHERE
    c.name = 'Comedy'
        AND f.rating = 'PG-13';
        
-- ---------------------------------------------------------------------------

SELECT 
    f.film_id, f.title AS top_3_rented_horror_movies
FROM
    rental r,
    inventory i,
    film f,
    film_category fc,
    category c
WHERE
    (r.inventory_id = i.inventory_id)
        AND (i.film_id = f.film_id)
        AND (f.film_id = fc.film_id)
        AND (fc.category_id = c.category_id)
        AND (c.name = 'Horror')
GROUP BY f.film_id
ORDER BY COUNT(*) DESC
LIMIT 3;

-- -------------------------------------------------------------------------------

SELECT DISTINCT
    cu.first_name, cu.last_name
FROM
    country co
        INNER JOIN
    city ci ON co.country_id = ci.country_id
        INNER JOIN
    address a ON a.city_id = ci.city_id
        INNER JOIN
    customer cu ON cu.address_id = a.address_id
        INNER JOIN
    rental r ON cu.customer_id = r.customer_id
        INNER JOIN
    inventory i ON i.inventory_id = r.inventory_id
        INNER JOIN
    film_category fc ON fc.film_id = i.film_id
        INNER JOIN
    category c ON c.category_id = fc.category_id
WHERE
    c.name = 'Sports'
        AND co.country = 'India';
        
-- ----------------------------------------------------------------------------------
        
SELECT 
    first_name, last_name
FROM
    customer
WHERE
    customer_id IN (SELECT 
            rental.customer_id
        FROM
            rental
                INNER JOIN
            inventory ON (rental.inventory_id = inventory.inventory_id)
        WHERE
            inventory.film_id IN (SELECT 
                    film_id
                FROM
                    film_actor
                WHERE
                    actor_id IN (SELECT 
                            actor_id
                        FROM
                            actor_info
                        WHERE
                            first_name = 'NICK'
                                AND last_name = 'WAHLBERG'))
                AND rental.customer_id IN (SELECT 
                    customer.customer_id
                FROM
                    rental
                        INNER JOIN
                    customer ON (rental.customer_id = customer.customer_id)
                        INNER JOIN
                    address ON (customer.address_id = address.address_id)
                        INNER JOIN
                    city ON (address.city_id = city.city_id)
                        INNER JOIN
                    country ON (city.country_id = country.country_id)
                WHERE
                    country.country = 'Canada'));
                    
-- --------------------------------------------------------------------
                    
SELECT 
    COUNT(fa.actor_id) AS no_of_movies_acted_by_Sean_Williams
FROM
    actor a
        INNER JOIN
    film_actor fa ON a.actor_id = fa.actor_id
WHERE
    a.first_name = 'Sean'
        AND a.last_name = 'Williams';

 
 