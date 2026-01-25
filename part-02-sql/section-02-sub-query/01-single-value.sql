use Northwind

----------------------------------------------
-- Lí thuyết
-- Cú pháp chuẩn của lệnh select
-- select * from <table> where ....
-- where cột = value nào đó
-- where cột like pattern nào đó e.g. '_____'
-- where cột between range
-- where cột in ( tập hợp giá trị được liệt kê)

-- một câu select tùy cách viết thì có thể trả về đúng 1 value/cell
-- một câu select tùy cách viết thì có thể trả về đúng 1 tập giá trị/ 1 tập cell
-- Tập kết quả này đồng nhất (các giá trị khác nhau của 1 biến)

--*****
-- where cột = value nào đó - đã học, e.g. year(dob) = 2003
--			= thay value này = 1 câu sql khác miễn tả về 1 cell tương ứng
-- kĩ thuật viết câu sql theo kiểu hỏi gián tiếp, lồng nhau


----------------------------------------------
-- Thực hành
--1. IN ra danh sách nhân viên
select * from Employees
select FirstName from Employees where EmployeeID = 1 --1 cell
select FirstName from Employees --1 tập giá trj/ 1 cột/ phép chiếu

---2. liệt kê các nhân viên ở london
select * from Employees where City = 'London' --4

--3. liệt kê các nhân viên cùng quê với King Robert
select * from Employees where FirstName = 'Robert'

select City from Employees where FirstName = 'Robert' --1 value

-- đáp án cho câu 3 bắt đầu
-- select * from Employees where City = City quê của Robert
select * from Employees where City =
(select City from Employees where FirstName = 'Robert')

-- câu này 9.9 điểm, trong kết quả còn Robert bị dư, tìm cùng quê Robert
-- không cần nói lại Robert

select * from Employees where City = 
(select City from Employees where FirstName = 'Robert') and FirstName <> 'Robert'

--4. liệt kê tất cả các đơn hàng
select * from Orders order by Freight desc

--4.1 liệt kê tất cả các đơn hàng trọng lượng lớn hơn 252kg
select * from Orders where Freight >= 252

--4.2 liệt kê tất cả các đơn  hàng có trọng lượng lớn hơn trọng lượng
-- đơn hàng 10555
select * from Orders where Freight >=
(select Freight from Orders where OrderID = 10555) order by Freight desc --47 xuất hiện luôn cả 10555


select * from Orders where Freight >=
(select Freight from Orders where OrderID = 10555) and OrderID <> 10555 order by Freight desc 

--BTVN Deadline: 23:00 22/9/2021 hoangnt2@fpt.edu.vn
--1. Liệt kê danh sách các công ty vận chuyển hàng
--2. Liệt kê danh sách các đơn hàng đc vận chuyển bởi công ty giao vận
--có mã số 1
--3. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận có tên Speedy Express 
--4. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận
--có tên Speedy Express và trọng lượng từ 50-100
--5. Liệt kê các mặt hàng cùng chủng loại với mặt hàng Filo Mix
--6. Liệt kê các nhân viên trẻ tuổi hơn nhân viên Janet


---
--1.
select * from Orders
select * from Shippers


--2.
select * from Orders where ShipVia = 1

--3
select * from Orders where ShipVia = ( select ShipperID from Shippers where CompanyName = 'Speedy Express')


--4. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận
--có tên Speedy Express và trọng lượng từ 50-100
--5. Liệt kê các mặt hàng cùng chủng loại với mặt hàng Filo Mix
--6. Liệt kê các nhân viên trẻ tuổi hơn nhân viên Janet

--4.
select * from Orders where Freight <= 100 and Freight >= 50 and ShipVia = 
(select ShipperID from Shippers where CompanyName = 'Speedy Express')

select * from Orders where Freight between 50 and 100 and ShipVia = 
(select ShipperID from Shippers where CompanyName = 'Speedy Express')

--5. 
select * from Products where CategoryID = (select CategoryID from Products where ProductName = 'Filo Mix')

--6.
select * from Employees where year(BirthDate) >= (select Year(BirthDate) from Employees where FirstName = 'Janet')

