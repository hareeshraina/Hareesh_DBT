select customerid,age,gender,annualincome,spendingscore,productcategory,
productprice,TO_DATE(purchasedate, 'DD-MM-YYYY') as purchasedate,storeid,storelocation,paymentmethod,
discountapplied,discountpercent,productcost,profit,foottraffic,
inventorylevel,marketingexpenditure,competitorprice from retail_data