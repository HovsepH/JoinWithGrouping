SELECT 
	[product_category].[name] AS [category],
	COUNT([product].[id]) AS [count]
FROM [product_category]
INNER JOIN [product_title] ON [product_title].[product_category_id] = [product_category].[id]
INNER JOIN [product] ON [product].[product_title_id] = [product_title].[id]
GROUP BY [product_category].[id]
ORDER BY [product_category].[name] ASC;
