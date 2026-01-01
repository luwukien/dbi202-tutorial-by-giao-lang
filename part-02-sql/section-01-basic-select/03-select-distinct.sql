use Northwind

----------------------------------------------
-- Lí thuyết

-- dùng lệnh select để/xem in dữ liệu từ table, cũng hiện thị dưới dạng table
-- cú pháp chuẩn select * from <tên table>
--                      * là đại diện cho việc bố mày muốn lấy all cols
-- Cú pháp mở rộng:
--			select tên cột muốn lấy, cách nhau bằng dấu phẩy from [tên-table]
--			select có thể dùng các hàm xử lý các cột để độ lại thông tin hiện thị
--			FROM <Tên-table> 
-- Khi ta select ít cột từ tbl gốc thì có nguy cơ dữ liệu sẽ bị trùng lại
-- kh phải ta bị sai, kh phải người thiết kế ra cái tbl bị sai 
-- vấn đề ở đây là do chúng ta có nhiều info trùng nhau/ đặc điểm trùng nhau, 
-- nên nếu chỉ tập chung vào data này thì trung nhau chắc chắc sẽ xảy ra
-- 1000tr người dân VN được quản lý info bao gồm: ID, tên, DOB, ... tỉnh thành sinh sống
-- thì nếu select mỗi cột tỉnh thì có tận tới 100tr tỉnh
-- nên lệnh select nó mới hỗ trợ loại trừ dòng trùng nhau
-- select distinct tên-các-cột from <tên-table>
----------------------------------------------

--1. liệt kê danh sách nhân viên
select * from Employees
-- phân tích: 9 người nhưng có 4 title 
select TitleOfCourtesy from Employees
select distinct TitleOfCourtesy from Employees


select distinct EmployeeID, TitleOfCourtesy from Employees
-- nếu distinct đi kèm với id/key, nó vô dụng, key sao trùng mà loại trừ được

--2. in ra thông tin khách hàng
select * from Customers --92 rows

--3 có bao nhiêu quốc gia xuất hiện trong thông tin khách hàng, in ra
select Country from Customers
select distinct Country from Customers

