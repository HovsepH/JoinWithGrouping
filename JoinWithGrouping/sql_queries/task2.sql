SELECT  
    [c].[name] AS [city],
    SUM([od].[price_with_discount] * [od].[product_amount]) AS income
FROM [customer_order] [co]
inner JOIN [supermarket] [s] ON [s].[id] = [co].[supermarket_id]
inner JOIN [street] [st] ON [st].[id] = [s].[street_id]
inner JOIN [city] [c] ON [c].[id] = [st].[city_id]
inner JOIN [order_details] [od] ON [od].[customer_order_id] = [co].[id]
WHERE [co].[operation_time] BETWEEN '2020-11-01' AND '2020-11-30'
GROUP BY [c].[id]
ORDER BY income ASC, [c].[name] ASC;
