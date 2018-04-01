Project 3: Operational reports for Northwind foods
Student: Peter Jones
Queries 

## Query/slide 1: Total invoice amount by country
   select  o.ShipCountry
			  , sum( od.UnitPrice * Quantity ) as total_invoice_amt
      from Orders o
 left join OrderDetails od
		  on o.OrderID = od.OrderID
group by o.ShipCountry
;

## Query/slide 2: Order count by UK customer
select  c.CompanyName
		,  count( * ) as orderCount
from (
select c.CustomerID
		, c.CompanyName
		, o.OrderID
  from Customers c
 left join Orders o
	on c.CustomerID = o.CustomerID
 where Country = 'UK'
 ) c
 group by c.CompanyName
 order by count( * ) desc
;

## Query/slide 3: Increase in sales per year per country
select c.Country
       ,  sum( od.UnitPrice * od.Quantity ) as total_invoice_amt
	   ,  date(  o.OrderDate, 'start of year' ) as OrderMonth
from   Customers c
	left join Orders o
		on c.CustomerID = o.CustomerID
	left join OrderDetails od
		on o.OrderID = od.OrderID
group by c.Country, date(  o.OrderDate, 'start of year' )
order by c.Country, date(  o.OrderDate, 'start of year' )
;

## Query/slide 4: Number of customers shipped to per month
select  d.ShippedMonth
		,  count( * ) as ShippedCount
from (
select c.CompanyName
		, c.CustomerID
		, o.OrderID
		, date( o.ShippedDate, 'start of month' ) as ShippedMonth
from Customers c
left join Orders o
	on c.CustomerID = o.CustomerID
group by c.CompanyName
			,  c.CustomerID
			, o.OrderID
			,date( o.ShippedDate, 'start of month' )
) d
group by d.ShippedMonth
;