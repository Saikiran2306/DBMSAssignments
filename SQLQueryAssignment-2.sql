use sakila;

-- 1. Find out the number of documentaries with deleted scenes.

SELECT 
    COUNT(*) AS no_of_documentaries_with_deleted_scenes
FROM
    category c
        INNER JOIN
    film_category fc ON c.category_id = fc.category_id
        INNER JOIN
    film f ON f.film_id = fc.film_id
WHERE
    c.name = 'Documentary'
        AND f.special_features LIKE '%Deleted Scenes%';
        
-- 2. Find out the number of sci-fi movies rented by the store managed by Jon Stephens.

SELECT 
    COUNT(DISTINCT fc.film_id) AS movies_rented
FROM
    category c
        INNER JOIN
    film_category fc ON c.category_id = fc.category_id
        INNER JOIN
    inventory i ON fc.film_id = i.film_id
        INNER JOIN
    rental r ON r.inventory_id = i.inventory_id
        INNER JOIN
    staff s ON s.staff_id = r.staff_id
WHERE
    c.name = 'Sci-Fi'
        AND s.first_name = 'Jon'
        AND s.last_name = 'Stephens';
        
-- 3. Find out the total sales from Animation movies.

SELECT 
    SUM(p.amount) AS sales_animation_movies
FROM
    category c
        INNER JOIN
    film_category fc ON c.category_id = fc.category_id
        INNER JOIN
    inventory i ON i.film_id = fc.film_id
        INNER JOIN
    rental r ON r.inventory_id = i.inventory_id
        INNER JOIN
    payment p ON p.rental_id = r.rental_id
WHERE
    c.name = 'Animation';
    
-- 4. Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.

SELECT 
    ca.name, COUNT(fc.category_id)
FROM
    customer c
        INNER JOIN
    rental r ON c.customer_id = r.customer_id
        INNER JOIN
    inventory i ON i.inventory_id = r.inventory_id
        INNER JOIN
    film_category fc ON fc.film_id = i.film_id
        INNER JOIN
    category ca ON ca.category_id = fc.category_id
WHERE
    c.first_name = 'PATRICIA'
        AND c.last_name = 'JOHNSON'
GROUP BY ca.name
ORDER BY COUNT(fc.category_id) DESC
LIMIT 3;

-- 5. Find out the number of R rated movies rented by “SUSAN WILSON”.

SELECT 
    COUNT(*) AS r_rated_movies
FROM
    film f
        INNER JOIN
    inventory i ON i.film_id = f.film_id
        INNER JOIN
    rental r ON r.inventory_id = i.inventory_id
        INNER JOIN
    customer c ON c.customer_id = r.customer_id
WHERE
    c.first_name = 'SUSAN'
        AND c.last_name = 'WILSON'
        AND f.rating = 'R';