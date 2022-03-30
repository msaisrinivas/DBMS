-- SQL Query Assignment - 2
-- Q1
select count(*) as DOCUMENTARIES_WITH_DELETED_SCENES from film f 
Inner join film_category fc
on f.film_id = fc.film_id
where f.special_features like '%Deleted Scenes%'
and fc.category_id = (select c.category_id from category c where name = "Documentary");

-- Q2
select fl.FID,fl.title,fl.category,i.store_id from film_list fl
inner join inventory i
where fl.FID = i.film_id
and fl.category = 'Sci-Fi'
and i.store_id = ( select s.store_id from staff s where s.first_name = "Jon" and s.last_name = "Stephens");

-- Q3
select * from sales_by_film_category
where category = 'Animation';

-- Q4
select fl.category,count(*) as No_of_Movies from film_list fl
Inner join inventory i
Inner join rental r 
where fl.FID = i.film_id
and i.inventory_id = r.inventory_id
and r.customer_id = (select ID from customer_list where name = "PATRICIA JOHNSON")
group by fl.category
order by No_of_Movies desc limit 3;

-- Q5
select count(*) as No_of_Movies from film_list fl
Inner join inventory i
Inner join rental r 
where fl.FID = i.film_id
and fl.rating = 'R'
and i.inventory_id = r.inventory_id
and r.customer_id = (select ID from customer_list where name = "SUSAN WILSON");

