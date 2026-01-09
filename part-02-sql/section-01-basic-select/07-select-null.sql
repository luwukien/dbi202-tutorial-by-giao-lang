use Northwind

----------------------------------------------
-- Lí thuyết
-- Cú pháp mở rộng của select 
-- trong thực tế có những lúc dữ liệu/ info chưa xác định được nó là gì????
-- kí tên danh sách thi, danh sách kí tên có cột điểm, điểm ngay lúc kí tên
-- chưa xác định được, từ từ sẽ có, sẽ update sau
-- hiện tượng dữ liệu chưa xác định, chưa biết, từ từ đưa vào sao, hiện nhìn
-- chưa thấy có data, thì ta gọi giá trị chưa xác định này là null
-- null đại diện cho thứ chưa xác định, chưa xác định tức là không có giá trị, mà không có giá trì
-- thì không thể dùng được các toán tử được
-- CẤM TUYỆT ĐỐI XÁC CÁC TOÁN TỬ SO SÁNH
-- TA DÙNG TOÁN TỬ, IS NULL, IS NOT NULL, NOT (IS NULL) ĐỂ FILTER CELL CÓ
-- GIÁ TRỊ NULL


----------------------------------------------
-- THỰC HÀNH
-- 1. in ra danh sách nhân viên
select * from Employees --9 

-- 2. AI chưa xác định khu vực ở, region null
select * from Employees where Region = 'NULL' --0, vì không ai ở khu vực tên là NULL
select * from Employees where Region = NULL --0 dòng vì null không thể dùng toán tử
select * from Employees where Region is null

--3. Những ai đã xác định được khu vực cư trú
select * from Employees where Region is not null --5
select * from Employees where not (Region is null) --5

--4. những nhân viên đại diện kinh doanh và xác định được nơi cư trú
select * from Employees where Title = 'Sales Representative' and Region is not null --3
select * from Employees where Title = 'Sales Representative' and not (Region is null)

--5. liệt kê danh sách khách hoàng đến từ Anh, Pháp, Mĩ có cả thôn tin số fax, và region
select * from Customers where Country in ('USA', 'UK', 'France') and Fax is not null and Region is not null




