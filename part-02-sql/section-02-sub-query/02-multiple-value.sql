use Northwind

----------------------------------------------
-- Lí thuyết
-- Cú pháp chuẩn của lệnh select
-- select * from <table> where...

-- where cột = value nào đó
-- where cột in (một tập hợp nào đó)
-- ví dụ City in ('London', 'Berlin', 'New York) -- thay bằng 
--					OR OR OR City = 'London' OR City = 'Berlin'....

-- Nếu có 1 câu sql mà trả về được 1 cột, nhiều dòng
-- một cột và nhiều dòng thì ta có thể xem nó tương đương với 1 tập howpjj 
-- select city from Employees, bạn đượic 1 loạt các thành phần
-- ta có thể nhét/lồng câu 1 cột/ nhiều dòng vào trong mệnh đề in của câu SQL bên ngoài
-- * cú pháp
-- where cột in (cột câu select trả về 1 cột nhiều dòng-nhiều value cùng kiểu- tập hợp 

----------------------------------------------

-- thực hành
-- 1. Liệt kê các nhóm hàng
select * from Categories

-- 2. In ra các món hàng/ mặt hàng thuộc nhóm 1, 6, 8
select * from Products where CategoryID in (1, 6, 8)


select * from Products where CategoryID between 1 and 8 -- 77 toang cmnr

--3. In ra các món hàng thuộc nhóm bia/rượu, thịt và hải sản
select * from Products where CategoryID  in (select CategoryID from Categories where 
CategoryName in ('Beverages', 'Seafood', 'Meat/Poultry'))

--4. Nhân viên quê London phụ trách những đơn hàng nào
select * from Orders where
EmployeeID in (select EmployeeID from Employees where City = 'London')


--btvn
--
--1. Các nhà cung cấp đến từ Mĩ cung cấp những mặt hàng nào?
select * from Products where SupplierID in ( select SupplierID from Suppliers where Country = 'USA')
--2. Các nhà cung cấp đến từ Mĩ cung cấp những nhóm hàng?
select * from Categories where CategoryID in (select CategoryID from Products where SupplierID in 
(select SupplierID from Suppliers where Country = 'USA'))


--3. Các đơn hàng vận chuyển đến tới thành phố Sao Paulo được vận chuyển bởi những hãng nào
-- các cty nào đã vận chuyển tới Sao Paulo
select CompanyName from Shippers where ShipperID in (select ShipVia from Orders where ShipCity = 'Sao Paulo')

--4. Khách hàng đến từ thành phố Berlin, London, Madrid có những đơn hàng nào
-- liệt kê các đơn hàng của khách hàng, từ Berlin, London, Madrid
select * from Orders where CustomerID in (select CustomerID from Customers where City in ('Berlin', 'London', 'Madrid'))
