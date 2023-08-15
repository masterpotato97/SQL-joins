
--1 there is no state 
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.address
FROM
    customer c
JOIN
    address a ON c.address_id = a.address_id
WHERE
    a.state = 'Texas';
    
--2
   
   SELECT
    c.customer_id,
    c.first_name,
    c.last_name
    from customer c 
    join payment p  on c.customer_id  = p.customer_id 
    where p.amount >'6.99'
    
    
--3. Show all customers names who have made payments over $175
select customer_id, first_name,last_name 
from customer c 
where customer_id  in(select customer_id 
from payment p 
group by customer_id 
having sum(amount) >175 )

--4 List all customers that live in Nepal (use the city table)
select first_name, last_name 
from customer c 
where customer_id  in(select city_id
from city 
where city like 'Nepal')

--5 Which staff member had the most transactions?
SELECT
    s.staff_id,
    s.first_name,
    s.last_name,
    COUNT(p.payment_id) AS transaction_count
FROM
    staff s
JOIN
    payment p ON s.staff_id = p.staff_id
GROUP BY
    s.staff_id, s.first_name, s.last_name
ORDER BY
    transaction_count desc
    
    
 --6How many movies of each rating are there?
    SELECT
    rating,
    COUNT(*) AS movie_count
FROM
    film
GROUP BY
    rating;
   
--7	.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    p.amount
FROM
    customer c
JOIN
    payment p ON c.customer_id = p.customer_id
WHERE
    p.amount > 6.99
    AND (
        SELECT COUNT(*)
        FROM payment
        WHERE customer_id = c.customer_id
    ) = 1;
--8 
   select * from payment p 
   where amount < 0


