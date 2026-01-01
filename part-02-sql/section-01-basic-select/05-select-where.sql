use Northwind

----------------------------------------------
-- Lí thuyết
-- Cú pháp mở rộng:
-- Mệnh đề where: dùng làm bộ lọc/filter/ nhặt ra những dữ liệu ta cần theo 1 tiêu chí nào đó
-- Ví dụ: lọc ra những sv có quê ở Bình Dương
--		lọc ra những sinh viên có quê ở Tiền Gian và điểm tb >= 8
-- Cú Pháp dùng bộ lọc
-- select * (cột bạn muốn in ra) from <tên-table> where <điều kiện lọc>
-- * điều kiện lọc: tìm từng dòng, với cái cột có giá trị cần lọc
					--lọc theo tên cột với value thế nòa, lấy tên cột, xem value trong cell
--					cí thỏa điều kiện lọc hay kh?

--đề viết điều kiện lọc ta cần
-- > tên cột
-- value của cột (cell)
-- toán tử (operators) > >= < <= =(một dấu bằng thôi kh gioiongs C hay java ==), !=, <>
-- nhiều điều kiện lọc đi kèm, dùng theeo logic operators, AND, OR, NOT (~~~~~~~ J, C: && || !=)
-- Ví dụ: where city = N'Bình Dương'
--		  where City = B'Tiền Giang' AND GPA >= 8


-- Lọc liên quan đến giá trị/value/cell chứa gì, ta phải quan tâm đến data types
-- số: nguyên/thực, ghi số ra như truyền thống 5, 10, 3.14, 9.8
-- Chuỗi. kí tự: 'A', 'Ahihi'
-- Ngày tháng: '2003-01-01 ...'

----------------------------------------------
--1. IN ra danh sách các khách hàng
select * from Customers --92

--2. In ra danh sách khách hàng đến từ Ý
select * from Customers where Country = 'Italy'

--3. In ra danh sách khách hàng đến từ Mĩ
-- select * from Customers where Country = 'USA' and 'Italy' --Error, thiếu toán từ so sánh

--4. In ra những khách hàng đến từ Mỹ và Ý
select * from Customers where Country = 'USA' and Country = 'Italy' -- 0
select * from Customers where Country = 'USA' or Country = 'Italy' -- 16

-- sort theo Ý, Mỹ để gom cùng cụm cho dễ theo dõi

select * from Customers where Country = 'USA' or Country = 'Italy' order by Country

--5. in ra những khách hàng là thủ đô của nước Đức
select * from Customers where Country = 'Germany'and City = 'Berlin'


--6. in ra thông tin của nhân viên
select * from Employees

--7. in ra thông tin của nhân viên có năm sinh từ 1960 trở lại đây
select * from Employees where year(BirthDate) >= 1960
	
--8. in ra thông tin của nhân viên có tuổi từ 60 trở lên
select *, year(GETDATE()) - year(BirthDate) as Age from Employees where year(GETDATE()) - year(BirthDate) >= 60

--9.những nhân viên nào ở Luân đôn
select * from Employees where City = 'London'

--10. những nhân viên nào kh ở luân đôn
select * from Employees where City != 'London'
select * from Employees where City <> 'London'

-- vi diệu
-- đảo mệnh đề!!!!
 
select * from Employees where not (City = 'London') 

--select * from Employees where !(City = 'London') sai cú pháp, đảo mệnh đề, phép thì dùng not

--11. In ra hồ sơ nhân viên có mã số là 1
-- đi vào ngân hàng giao dịch , hoặc đưa số tk, kèm cccd, filter theo cmnd
select * from Employees where EmployeeID = 1 -- kiểu số, kh có nháy đơn ' '
-- where trên key chỉ có 1 mà thôi
-- select mà có where key chỉ 1 dòng trả về, distince là vô nghĩa

select distinct EmployeeID, City from Employees where EmployeeID = 1 order by EmployeeID

-- công thức full kh che của select 
-- select ...      from where ... group by ... having ... order by 
--       distinct      1, N table    
--		  Hàm() 
--			nested query/sub query

--12. Xem thông tin của bên đơn hàng
select * from Orders

---13. Xem thông tin bên Đơn hàng sắp xếp giảm dân theo trọng lượng
select * from Orders order by Freight desc

-- 14. In thông tin bên đơn hàng sắp xếp giảm dần theo trọng lượn, trọng lượng >= 500kg
select * from Orders where Freight >= 500 order by Freight desc --13

-- 15. In ra thông tin bên đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng nằm trong khoảng từ
-- 100 đến 500 
select * from Orders where Freight <= 500 and Freight >=100 order by Freight desc

-- 16. In ra thông tin bên đơn hàng sắp xếp giảm dần theo trọng lượng, trọng lượng nằm trong khoảng từ
-- 100 đến 500 và ship bởi công ty giao vận số 1

select * from Orders where Shipvia = 1 and Freight <= 500 and Freight >=100 order by Freight desc

-- 17. và kh ship với London

-- Rất cần thận khi trọng mệnh đề where lại có and or trộn với nhau, ta phải xài thêm ()
-- đề phân tách thứ tự filter ... (ss and or khác nữa) AND (SS khác)





