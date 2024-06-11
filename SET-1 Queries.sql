													/* SET-1 Questions: Basic 

Q1. Retrieve the total number of orders placed. */

SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;

-- Q2. Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price)) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id;

-- Q3. Identify the highest-priced pizza.

SELECT 
    pizza_types.name, pizzas.price AS highest_price_prizza
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY highest_price_prizza DESC
LIMIT 1;

-- Q4. Identify the most common pizza size ordered.

 SELECT 
    COUNT(order_details.order_details_id) AS most_ordered_size,
    pizzas.size
FROM
    pizzas
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY most_ordered_size DESC
LIMIT 1;
  

-- Q5. List the top 5 most ordered pizza types along with their quantities. 
    
SELECT 
    pizza_types.name,
    SUM(order_details.quantity) AS most_ordered_pizza
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY most_ordered_pizza DESC
LIMIT 5;
