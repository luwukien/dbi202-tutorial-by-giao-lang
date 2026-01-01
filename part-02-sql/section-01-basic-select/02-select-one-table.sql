use Northwind

----------------------------------------------
-- Lí thuyết
-- một db là một nơi chứa data (bán hàng, thư viện, qlsv, ...)
-- data được lưu dưới dạng table, tách thành thành nhiều table(nghệ thuật design db, nf)
-- dùng lệnh select để/xem in dữ liệu từ table, cũng hiện thị dưới dạng table
-- cú pháp chuẩn select * from <tên table>
--                      * là đại diện cho việc bố mày muốn lấy all cols
-- Cú pháp mở rộng:
--			select tên cột muốn lấy, cách nhau bằng dấu phẩy from [tên-table]
--			select có thể dùng các hàm xử lý các cột để độ lại thông tin hiện thị
--			FROM <Tên-table> 

-- data trả về có cell/ ô có NULL, hiểu rằng chưa xác định value/giá trị, chưa có, chưa biết
-- từ từ sẽ cập nhật giá trị sau. ví dụ sv kí tên vào danh sách thi, cột điểm ngay lúc ký tên
-- gọi là NULL, mang giá trị chữa xác định
----------------------------------------------
--1. xem thông tin của tất cả các khách hàng đang giao dịch với mình
select * from Customers
--insert into Customers(CustomerID, CompanyName, ContactName) 
	--	values('ALFKI', 'FPT University', 'Thanh Nguyen Khac')
		-- bị trùng vì trùng mã PK

insert into Customers(CustomerID, CompanyName, ContactName) 
		values('FPTU', 'FPT University', 'Thanh Nguyen Khac')

--2, xem thông tin nhân viên, xem hết các cột luôn
select * from Employees

--3. xem các sản phẩm có trong kho
select * from products

--4. mua hàng, thì thông tin sẽ nằm ở table Order và OrderDetails
select * from Orders

--5. xem thông tin công ty giao hàng
select * from Shippers
insert into Shippers(CompanyName, Phone) values ('Fedex Vietnam', '(084)90...')

--6. xem chi tiết mua hàng
select * from Orders
select * from [Order Details]

--7. in ra thông tin khách hàng, chỉ gồm các Id, ComName, ContactName, Country
select CustomerID, CompanyName, ContactName, Country from Customers

--8. In ra thong tin nhân viên, chỉ cần id, last, first, title, DOB
-- tên người tách thành last & first: dành cho mục tiêu sort theo tiêu chí tên , họ và in ra
-- tên theo quy ước mỗi quốc gia

select * from  Employees
select EmployeeID, LastName, FirstName, Title, BirthDate from Employees

--9. in ra thông tin nhân viên, ghép tên cho đẹp/ gộp cột, tính tuổi luôn giùm tôi
select EmployeeID, LastName + ' ' + FirstName as [Full Name], Title, BirthDate from Employees 

select EmployeeID, LastName + ' ' + FirstName as [Full Name], Title, BirthDate, year(BirthDate) as [year] from Employees 

select EmployeeID, LastName + ' ' + FirstName as [Full Name], Title, BirthDate,
year(GETDATE()) - year(BirthDate) as [Age] from Employees 

-- 10. in ra thông tin chi tiết mua hàng
select * from [Order Details]
select *, UnitPrice * Quantity from [Order Details]

--Công thức tính tổng tiền phải trả từng món, có trừ đi giảm giá, phần trăm
--SL * DG - tiền giảm gía -> phải trả
--SL * DG - SL * DG * DISCOUNT (%) ==> phải trả
--SL * DG (1 - DISCOUNT %) ===> tiền phải trả
select *, UnitPrice * Quantity * (1 - Discount) as SubTotal from [Order Details]
