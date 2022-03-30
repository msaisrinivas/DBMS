-- SQL Query Assignment - 1
-- Q1
select f.title from film_text f 
Inner join film_category fc
on f.film_id = fc.film_id
where fc.category_id = (select c.category_id from category c where name = "Comedy");

-- Q2
select f.film_id,f.title,f.rental_duration*f.rental_rate as rent from film f 
Inner join film_category fc
on f.film_id = fc.film_id
where fc.category_id = (select c.category_id from category c where name = "Horror")
order by rent desc, film_id asc limit 3;

-- Q3
select cl.ID, cl.name,fl.category,fl.title from customer_list cl
Inner join rental r 
Inner join inventory i
Inner join film_list fl
where cl.ID = r.customer_id
and cl.country = "India"
and r.inventory_id = i.inventory_id
and i.film_id = fl.FID
and fl.category = "Sports"
order by cl.ID asc;

-- Q4
select cl.ID, cl.name,fl.actors,fl.title from customer_list cl
Inner join rental r 
Inner join inventory i
Inner join film_list fl
where cl.ID = r.customer_id
and cl.country = "Canada"
and r.inventory_id = i.inventory_id
and i.film_id = fl.FID
and fl.actors like "%NICK WAHLBERG%"
order by cl.ID asc;

-- Q5
select count(*) as SEAN_WILLIAMS_MOVIES_COUNT from film_list 
where actors like "%SEAN WILLIAMS%";