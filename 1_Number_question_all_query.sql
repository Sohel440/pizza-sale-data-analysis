select * from order_details;
select * from orders;
select * from pizzas;
select *from pizza_types;


/****************** 1. A) Retrieve the total number of orders placed.************************/


select count(order_id) from orders;


/*******************  1. B) Calculate the total revenue generated from pizza sales.****************************/

select 
sum((order_details .quantity * pizzas .price) )as Total_sales
from order_details join pizzas
on pizzas.pizza_id = order_details.pizza_id;


/* C ) Identify the highest-priced pizza.*/
select pizza_types.name , pizzas.price
from  pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc
limit 1;

/* D) Identify the most common pizza size ordered.*/

select quantity , count(order_details_id)
from order_details group by quantity;


/** E) List the top 5 most ordered pizza types along with their quantities.******/
select pizzas.size, count(order_details.order_details_id) as order_count
from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizzas.size order by  order_count desc;

