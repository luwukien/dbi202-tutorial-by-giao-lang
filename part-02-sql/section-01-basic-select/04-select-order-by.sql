use Northwind

----------------------------------------------
-- Lí thuyết
-- Cú pháp mở rộng:
-- Ta muốn sắp xếp dữ liệu/sort theo tiêu chí nào đó, thường là tăng dần - ascending
--																giảm dần - descending	
-- ta có thể sort trên nhiều cột, logic này từ từ tính
-- select .... from <tên-tbl> order by tên-cột muốn sort <kiểu sort 


----------------------------------------------

--1. in ra danh sách nhân viên
select * from Employees

--2. in ra ds nv tăng dân theo năm sinh
select * from Employees order by BirthDate asc
select * from Employees order by BirthDate -- mặc định tăng dân

--3. in ra ds nv giảm dân theo năm sinh
select * from Employees order by BirthDate desc

--4. tính tiền chi tiết mua hàng
select * from [Order Details]
select *, UnitPrice * Quantity * (1 -Discount) as SubTotal from [Order Details]

--5. tính tiền chi tiết mua hàng, sắp xếp giảm dân theo số tiền
select * from [Order Details]
select *, UnitPrice * Quantity * (1 -Discount) as SubTotal from [Order Details]
					order by SubTotal desc

--5. in ra danh sách nhân viên giảm dân theo tuổi
select * from Employees
select EmployeeID, FirstName, year(getDate()) - year(BirthDate) as Age from Employees order by age desc
