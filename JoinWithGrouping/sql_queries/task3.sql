SELECT  
    p.surname, 
    p.name, 
    p.birth_date, 
    SUM(od.price * od.product_amount) AS [sum]
FROM [customer_order] co
inner JOIN [order_details] od ON od.customer_order_id = co.id
inner JOIN [customer] c ON c.person_id = co.customer_id
inner JOIN [person] p ON p.id = c.person_id
WHERE co.operation_time BETWEEN '2021-01-01' AND '2021-12-31'
AND c.discount = 0
GROUP BY p.surname, p.name, p.birth_date
ORDER BY [sum] ASC, p.surname ASC;
