select * from order_details;
select * from orders;
select * from pizzas;
select *from pizza_types;

/****2. A)Join the necessary tables to find the total quantity of each pizza category ordered.**************/
SELECT pizza_types.category,
 SUM(order_details.quantity) AS quantity
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC
LIMIT 5;


/**** B)Determine the distribution of orders by hour of the day.*************/
select hour(order_time) As hour , count(order_id) AS order_count
from orders
group by hour(order_time);

/** C) Join relevant tables to find the category-wise distribution of pizzas.*/
select category , count(name) from pizza_types
group by category;



-- //* D) Group the orders by date and calculate the average number of pizzas ordered per day.*/
SELECT AVG(quantity) 
FROM (
    SELECT orders.order_date, SUM(order_details.quantity) AS quantity
    FROM orders 
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date
) AS order_quantity;

/*** D)Determine the top 3 most ordered pizza types based on revenue.***/

SELECT pizza_types.name,
       SUM(order_details.quantity * pizzas.price) AS revenue
FROM pizza_types
JOIN pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;



