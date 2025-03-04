SELECT * FROM `awesome chocolates`.geo;

SELECT * FROM `awesome chocolates`.products;

SELECT * FROM `awesome chocolates`.sales;

SELECT * FROM `awesome chocolates`.people;

Use awesome chocolates;

SELECT * FROM sales 
where saledate >= '2022-01-01'
order by saledate;

-- 1. Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?

Select SPID, amount, Boxes
from Sales 
where amount > 2000 and Boxes <100
order by amount;

-- 2. How many shipments (sales) each of the sales persons had in the month of January 2022?

Select people.Salesperson, count(*) 'Total Shipments'
from sales join people 
on sales.SPID = people.SPID
where SaleDate between '2022-01-01' and '2022-01-31'
group by Salesperson;	

-- 3. Which product sells more boxes? Milk Bars or Eclairs?

select sales.PID, products.Product, sum(sales.boxes)
from sales join products
on sales.PID = products.PID
where Product in ('Milk Bars' , 'Eclairs')
group by PID;

-- 4. Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?

Select products.Product, sum(sales.Boxes)
from products join sales
on products.PID = sales.PID 
where sales.SaleDate between '2022-02-01' and '2022-02-07' and Product in ('Milk Bars' , 'Eclairs')
group by Product;

-- 5. Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?

Select *,
case when weekday(saledate) = 2 then 'Wednesday Shipment'
end as 'W shipment'
from sales
where customers < 100 and boxes < 100;

-- 6. What are the names of salespersons who had at least 
-- one shipment (sale) in the first 7 days of January 2022?

Select distinct people.Salesperson, sales.SPID
from sales
join people on people.SPID = sales.SPID
where sales.SaleDate between '2022-01-01' and '2022-01-07'
order by sales.SPID;

 -- 7. Which salespersons did not make any shipments in the first 7 days of January 2022?

select salesperson
from people 
where people.SPID not in 
(select SPID from sales where SaleDate between '2022-01-01' and '2022-01-07')

-- 8. How many times we shipped more than 1,000 boxes in each month?

select * from sales;

	select year(saledate) 'Year', month(saledate) 'Month', count(*) 'Times we shipped 1k boxes'
	from sales
	where boxes > 1000
	group by year(saledate), month(saledate)
	order by year(saledate), month(saledate);
    
-- 8. How many times we shipped more than 1,000 boxes in each month?

select * from sales;

	select year(saledate) 'Year', month(saledate) 'Month', count(*) 'Times we shipped 1k boxes'
	from sales
	where boxes > 1000
	group by year(saledate), month(saledate)
	order by year(saledate), month(saledate);
    
-- 9. Did we ship at least one box of ‘After Nines’ to ‘New Zealand’ on all the months?

Select * from geo;

Select  sales.Boxes, sales.saledate
from products join sales
on sales.PID = products.PID
join geo 
on geo.GeoID = sales.GeoID
where Products.product = 'After Nines' and geo.Geo = 'New Zealand'
order by saledate;

set @product_name = 'After Nines';
set @country_name = 'New Zealand';

select year(saledate) 'Year', month(saledate) 'Month',
if(sum(boxes)>1, 'Yes','No') 'status'
from sales
join products.product on product.PID = sales.PID
join geo on geo.GeoID = sales.GeoID
where products.Product = @product_name and geo.Geo = @country_name
group by year(saledate), month(saledate)
order by year(saledate), month(saledate);
