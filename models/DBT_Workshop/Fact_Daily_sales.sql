select distinct b.CustomerID as customer_key,
c.StoreID as store_key,
d.product_key as product_key,
e.payment_key as payment_key,
cast(a.ProductPrice as decimal(5,2)) as ProductPrice,
a.PurchaseDate,
cast(a.DiscountPercent as int) as DiscountPercent,
cast(a.ProductCost as decimal(5,2)) as ProductCost,
cast(a.Profit as 	decimal(5,2)) as Profit,
cast(a.FootTraffic as	int) FootTraffic,
cast(a.InventoryLevel as	int) as InventoryLevel,
cast(a.MarketingExpenditure as decimal(10,2)) as MarketingExpenditure,
current_date as update_date
from retail_data a join dim_Customer b on 
a.CustomerID = b.CustomerID
 join dim_Store c on 
a.StoreID = c.storeid
and a.storelocation=c.storelocation
 join dim_product d on 
a.productcategory = d.productcategory 
join dim_payment e on 
a.PaymentMethod = e.paymentMethod 

