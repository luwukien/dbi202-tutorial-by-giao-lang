use Northwind -- chọn đề chơi với thùng chứa data nào đó
		      -- tại 1 thời điểm chơi với 1 thùng chứa data 

----------------------------------------------
-- Lí thuyết
-- 1. DBE cung cấp câu lệnh SELECT dùng để
-- in ra màn hình  1 cái gì đó  ~~~ printf() sout()
-- in ra dữ liệu có trong table (hàng/cột)
-- dùng cho mục đích nòa đó thì kết quả luôn hiện thị là table


----------------------------------------------

-- 1. Hôm này là ngày bao nhiêu?
select GETDATE()

select GETDATE() as [hôm này là ngày]

-- 2. hôm nay là tháng mấy hỡi em?
select MONTH(GETDATE()) as [hôm nay là tháng mấy hỡi em]
select YEAR(GETDATE())


-- 3. trị tuyệt đối của -5 là mấy?
select ABS(-5) as [trị tuyệt đối của -5 là mấy?]

-- 4. 5 + 5 là mấy?
select 5 + 5 as [5 + 5 là mấy?]

-- select là in ra một cái gì đó

-- 5. in ra tên của mình
select N'Lưu' + N'Chí Kiên' as [My full name is]

-- 6. tính tuổi



select CAST( YEAR(GETDATE()) - 2006 as varchar )

-- select N'Lưu' + N'Chí Kiên' + (YEAR(GETDATE() - 2006) + ' years old' bị lỗi vì khác kiểu dữ liệu của nhau
select N'Lưu' + N' Chí Kiên ' + convert(varchar, (year(getdate()) - 2006)) + ' years old' as [my profile]

select N'Lưu' + N' Chí Kiên ' + cast((year(getdate()) - 2006) as varchar) + ' years old'