use Northwind

----------------------------------------------
-- Lí thuyết
-- Cú pháp mở rộng:
-- khi cần lọc dữ liệu trong 1 đoạn cho trước, thay vì dùng >= .... AND <= ..., ta có thể thay thế
-- bằng mệnh đề between, in
-- *cú pháp: cột between value-1 and value-2
-- *cú pháp: in....

-- * cú pháp: cột IN (một tập hợp các giá trị được liệt kê các nhau bằng dấu phẩy)
-- ====> chốt hạ IN sẽ thay thế cho một loạt các OR
----------------------------------------------
-- 1. Liệt kê danh sách nhân viên sinh trong năm 1960...1970
select * from Employees where YEAR(BirthDate) >= 1960 and year(BirthDate) <= 1970 order by BirthDate desc

select * from Employees where YEAR(BirthDate) between 1960 and  1970 order by BirthDate desc

--2. liệt kê các đơn hàng có trọng lượng từ 100...500
select * from Orders where Freight between 100 and 500 order by Freight desc

--3. liệt kê đơn hàng gửi từ Anh, Pháp, Mĩ
select * from Orders where ShipCountry = 'USA' or ShipCountry = 'France' or ShipCountry = 'UK'

select * from Orders where ShipCountry IN( 'USA', 'France', 'UK')

--4. liệt kê đơn hàng nào không gửi tới Anh, Pháp, Mĩ
select * from Orders where ShipCountry NOT IN( 'USA', 'France', 'UK')

--5. liệt kê các đơn hàng trong năm 1966 ngoại trừ các tháng 6, 7, 8, 9
select * from Orders where YEAR(OrderDate) = 1966 and MONTH(OrderDate) not IN(6, 7, 8, 9)

-- Lưu ý IN; chỉ khi ta liệt kê được tập giá trị  thì mới chơi in
-- KHOẢNG SỐ THỨC THÌ KH LÀM ĐƯỢC

--6. liệt kê các đơn hàng có trọn lượng từ 100..110
select * from orders where Freight >= 100 and Freight <= 110 order by Freight desc
select * from orders where  Freight between 100 and 110 order by Freight desc





