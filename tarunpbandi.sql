--Sales Representatives 

select FirstName, LastName, HireDate from dbo.employees

select * from dbo.employees

select FirstName, LastName, HireDate from dbo.employees where Title='sales representative'

--Sales Representatives in the United States

select FirstName, LastName, HireDate from dbo.employees where Title='sales representative'and Country= 'usa'

-- Orders placed by specific EmployeeID 

select * from dbo.Employees

select * from dbo.OrderDetails

select * from dbo.Orders

select OrderID , OrderDate from dbo.Orders where EmployeeID=5

--Suppliers and ContactTitles

select * from [dbo].[Suppliers] 

select  SupplierID, ContactName, ContactTitle from [dbo].[Suppliers] where ContactTitle != 'Marketing Manager' 

--Products with “queso” in ProductName

select * from [dbo].[Products]

select  ProductID , ProductName from [dbo].[Products] where ProductName LIKE '%queso%'

--Orders shipping to France or Belgium 
--Looking at the Orders table, there’s a field called ShipCountry. Write a query that shows the OrderID, 
--CustomerID, and ShipCountry for the orders where the ShipCountry is either France or Belgium.  

select * from [dbo].[Orders]

select OrderID, CustomerID, ShipCountry from  [dbo].[Orders] where ShipCountry IN( 'France','Belgium')

--Orders shipping to any country in Latin America 

select * from [dbo].[Orders]

select OrderID, CustomerID, ShipCountry from  [dbo].[Orders] where ShipCountry IN('Brazil ' ,'Mexico',' Argentina ','Venezuela')

--10.Employees, in order of age

select * from [dbo].[Employees]

select FirstName, LastName, Title,BirthDate from [dbo].[Employees] order by BirthDate asc

--Showing only the Date with a DateTime field 

select FirstName, LastName, Title,cast (BirthDate AS date) AS newday from [dbo].[Employees]

--12. Employees full name
select Firstname ,lastname , firstname+' '+LastName as Full_Name from [dbo].[Employees]

--13. OrderDetails amount per line item  
select * from [dbo].[OrderDetails]
select orderid,productid,unitprice ,quantity,(unitprice*quantity) as Totalprice from [dbo].[OrderDetails]  Order by OrderID ,ProductID

--14. How many customers?[dbo].[Customers]
select COUNT(*) as customer_count from [dbo].[Customers]

--15. When was the first order?  
select * from [dbo].[Orders]
select MIN(orderDate) as First_order from [dbo].[Orders]

--16. Countries where there are customers 
select * from [dbo].[Customers]
select distinct(country) from [dbo].[Customers]

--17. Contact titles for customers 
select contacttitle, COUNT(*) as total_count from [dbo].[Customers] group by ContactTitle order by total_count desc;

--21. Total customers per country/city 
select * from [dbo].[Customers]

select country,city,COUNT(*) as total_customers from [dbo].[Customers] group by Country, City order by total_customers desc;

--22. Products that need reordering 
select * from [dbo].[Products]
select productid,productname,UnitsInStock , ReorderLevel from [dbo].[Products] where  UnitsInStock< ReorderLevel

--23. Products that need reordering, continued
select * from [dbo].[Products]
select productid,productname,UnitsInStock, UnitsOnOrder, ReorderLevel,Discontinued from [dbo].[Products] where UnitsInStock + UnitsOnOrder <= ReorderLevel and Discontinued =0 order by ProductID desc;

--25. High freight charges 
select*from [dbo].[Orders]
select top 3 shipcountry,AVG(freight) as Average_Freight from [dbo].[Orders] group by shipcountry order by Average_Freight desc;

--26. High freight charges - 2015 
select top 3 shipcountry,AVG(freight) as Average_Freight 
from [dbo].[Orders]
where YEAR(orderDate) = 2015
group by shipcountry 
order by Average_Freight desc;	

create table studentid(
studentid int,
studentname varchar(25),
course varchar(10),
city varchar(15),
score int)

select * from studentid

insert into studentid (studentid,studentname,course,city,score)values
(1,'Tarun','BCA','bagalkote',80),
(2,'Varun','MCA','bagalkote',70)

select*from studentid

delete from studentid where studentname='varun'
truncate table studentid
drop table studentid

--18. Products with associated supplier names

select P.ProductID,P.productName,S.companyName as supplier
from [dbo].[Products] as P
inner join [dbo].[Suppliers] as S
on P.SupplierID=S.SupplierID;

--19. Orders and the Shipper that was used

select O.orderID,cast(o.orderdate AS date),s.companyName as shipper
from[dbo].[Orders] as o
inner join [dbo].[Shippers] as s
on o.ShipVia=s.ShipperID
where o.OrderID<10300
order by OrderID Asc;

--20. Categories, and the total products in each category

select c.categoryName, COUNT(*) as totalproducts
from [dbo].[Categories] as c
inner join [dbo].[Products] as p
on p.CategoryID = c.CategoryID 
group by c.CategoryName
order by totalproducts desc;

select * from [dbo].[Products]
select * from [dbo].[Categories]