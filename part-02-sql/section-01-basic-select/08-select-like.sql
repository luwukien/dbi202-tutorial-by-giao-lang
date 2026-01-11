use Northwind

----------------------------------------------
-- Lí thuyết
-- Cú pháp mở rộng của select 
-- Trong thực tế có những lúc ta muốn tìm dữ liệu/filter theo kiểu gần đúng
-- gần đúng trên kiểu chuỗi, liệt kê ai đó có tên là AN, khác câu
-- liệt ke ai đố tên bắt dầu bằng chữ A
-- tìm đúng, toán tử = 'AN'
-- tìm gần đúng, tìm có sự xuất hiện, không dùng =, dùng toán tử like
--						LIKE 'A...' ...
-- Để sử dụng toán tử like, ta cần thêm 2 thứ trọ giúp, dấu % và dấu _
-- % đại diện cho 1 chuỗi bất kì nào đó
-- _ đại diện cho 1 kí tự bất kì nào đó
-- VÍ DỤ: Name like 'A%', bất kì ai có tên xh bằng chứ A, phần còn lại là gì thì kh care
--		  Name 'A_', bất kì ai có tên là 2 kí tự, trong đó kí tự đầu tiên phải là A

----------------------------------------------
-- 1. In ra danh sách nhân viên
select * from Employees

--2. nhân viên nào có tên bắt dầu chữ A
select * from Employees where FirstName = 'A%'--0 vì toán tử ss bằng A%, có ai tên bằng A%
select * from Employees where FirstName like 'A%'

--2.1  Nhân viên nào có tên bắt dầu chữ A, in ra củ fullname được ghép đầy đủ
select EmployeeID, CONCAT(FirstName, ' ', LastName) as FullName, Title from Employees 
						where FirstName like 'A%'

-- 3. Nhân viên nào có tên có chữ A cuối cùng
select EmployeeID, CONCAT(FirstName, ' ', LastName) as FullName, Title from Employees 
						where FirstName like '%A'

--4. nhân viên nòa có tên có 4 kí tự
select * from Employees where FirstName like '____' --1

--5.Xem danh sách các sản phẩm/món đồ đang có - Product
select * from Products where ProductName like '%ch'
select * from Products where ProductName like '%ch%'

--6. Những sản phẩm trong tên sản phẩm mà từ cuối cùng là 5 kí tự
select * from Products where ProductName like '%_____'-- tên có từ 5 kí tự trở lên
select * from Products where ProductName like '% _____' -- tên có ít nhất 2 từ
														-- và từ cuối cùng có 5 kí tự  nhưng nó lại vô tình loại đi tên có đúng 5 kí tự

select * from Products where ProductName like '% _____' or ProductName like '_____'



select * from Products where ProductName like 'K%'