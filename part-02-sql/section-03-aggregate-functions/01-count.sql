use Northwind

----------------------------------------------
-- Lí thuyết
-- DB Engine hỗ trợ 1 loạt nhóm hàm dùng thao tác trên nhóm dòng/ cột, gom data
-- trên đám data gom này - nhóm hàm gom nhóm - arrgegate functions, aggregation 
-- count() sum() min() max() avg()

-- * Cú pháp chuẩn
-- select cột, .., hàm gom nhóm(), ... from <TBL>

-- Cú pháp mở rộng
-- select cột...., hàm gom nhóm(), ... from <TBL> ..where... group by (gom theo cụm cột nào)

-- select cột...., hàm gom nhóm(), .... from <TBL> ...where... group by (gom theo cụm cột nào)

-- * Hàm count(???) đếm số lần xuất hiện của 1 cái gì đó
--		count(*): đếm số dòng trong table, đếm tất cả các dòng kh care tiêu chuẩn nào kahcs
--		count(cột nào đó) from .... where
--							CHỌN RA NHỮNG DÒNG THỎA TIÊU CHÍ NÀO ĐÓ RỒI MỚI ĐẾM


----------------------------------------------
--1. IN ra danh sách các nhân viên
select * from Employees

--2. Đếm xem có bao nhiêu nhân viên
select count(*) from Employees --9
select count(*) as [Number of Employees] from Employees

--3. Có bao nhiêu nhân viên ở London
select count(*) as [No of emps in London] from Employees where City = 'London'

--4. có bao nhiêu lượt thành phố xuất hiện - cứ xuất hiện tên tp là dếm, không care lặp lại hay kh
select count(City) from Employees -- 9

--5. Đếm xem có bao nhiêu Region
select count(Region) from Employees
-- Phát hiện hàm coutn(Cột), nếu cell của cột chưa null, không tính tiền, kh đếm

--5.1 đếm xem có bao nhiêu khu vực null, có bao nhiêu dòng region null
select count(*) from Employees where Region is null -- đếm sự xh dòng chứa region null

select count(Region) from Employees where Region is null
select * from Employees where Region is null

--6. Có bao nhiêu thành phố trong table nv
select * from Employees 

select City from Employees --9 
select distinct City from Employees
-- tui coi két quả trên là 1 table, mất quá trời công sức lọc ra 5 tp

--sub query mới, coi 1 câu select là 1 tbl, biến tbl này vào trong mệnh đề from 
-- ngáo
select * from (select distinct City from Employees) as Cities
--7.
select count(*) from (select distinct City from Employees) as Cities

select count(*) from Employees --9 nv
select count(City) from Employees -- 9 city
select count(distinct City) from Employees -- 5

--8. đếm xem mỗi thành phố có bao nhiêu nhân viên
-- khi câu hỏi có tính toán gom data (hàm aggregate) mà lại chứa chứa từ khóa mỗi....
-- gặp từ "Mỗi", chính là chia để đếm, chia để trị, chia cụm để gom đếm
select * from Employees

-- Seatle 2 
-- Sự xuất hiện của nhóm Seatle 2 |....
-- đếm theo sự xuất hiện của nhóm, count++ trong nhóm thôi, sau đó reset ở nhóm mới
select count(City) from Employees group by City -- đếm value của city, nhưng đếm theo nhóm
--												chia city thành các nhóm, rồi mới đếm
select City, count(City) as [No Employees] from Employees group by City

