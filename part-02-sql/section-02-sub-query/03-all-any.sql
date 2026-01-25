use Northwind

----------------------------------------------
-- Lí thuyết
-- Cú pháp chuẩn của lệnh SELECT 
-- select * from <tbl> where ...
-- where cột toán tử so sánh với value cần lọc
--			cột > >= <= < = != value
---							DÙng câu sub-query tùy ngữ cảnh
--			cột				in sub chỉ có 1 cột nhưng nhiều value

--			cột				> >= < <= all (1 câu sub 1 cột nhiều value)
--										any(1 câu sub 1 cột nhiều value)


----------------------------------------------

-- Thực hành
-- tạo 1 tbl có 1 cột tên là Numbr, chỉ chưa 1 đống dòng các số nguyên
create table Num 
(
	Numbr int 


)


select * from Num
insert into Num values(1)
insert into Num values(1)
insert into Num values(2)
insert into Num values(9)
insert into Num values(100)
insert into Num values(101)

--1. in ra những số > 5
select * from Num where Numbr > 5

--2. In ra số lớn nhất trong các số đã nhập
-- SỐ LỚN NHẤT TRONG 1 ĐÁM ĐƯỢC ĐỊNH NGHĨA LÀ: MÀY LỚN HƠN HẾT CÁC ĐÁM ĐÓ, VÀ MÀY BẲNG CHÍNH MÀY
-- lớn hơn tất cả, ngoại trừ chính mình -> mình là MAX  của đám
select * from Num where Numbr >= ALL (Select * from Num)

--3. số nhỏ nhất là số nào ?
select * from Num where Numbr <= ALL (select * from Num)

select * from Num where Numbr > ALL (Select * from Num) -- rỗng

--4. Nhân viên nào lớn tuổi nhất
select * from Employees where year(BirthDate) <= all (select year(BirthDate) from Employees)
--5 đơn hàng nào có trọng lượng nặng nhất
select * from Orders where Freight >= all (select Freight from Orders)