/* Assignments 3*/
/* Performer: Phạm Hữu Tuấn Anh*/

-- Question 1: Thêm ít nhất 10 record vào mỗi table
INSERT INTO `account` (Email, UserName, FullName, DepartmentID, PositionID, CreatedDate)
VALUES
('NVA_account1@vtiacademy.com', 'NVA', 'Nguyen Van Anh', '1', '1', '2019-12-02 00:00:00'),
('NHM_account1@vtiacademy.com', 'NHM', 'Nguyen huy nam', '2', '2', '2019-12-03 00:00:00'),
('PVA_account1@vtiacademy.com', 'PVA', 'Pham Van An', '3', '3', '2019-12-04 00:00:00'),
('DVH_account1@vtiacademy.com', 'DVH', 'Doan van hau', '2', '4', '2019-12-05 00:00:00'),
('NTA_account1@vtiacademy.com', 'NTA', 'Nguyen Tuan Anh', '1', '5', '2019-12-06 00:00:00'),
('NHH_account1@vtiacademy.com', 'NHH', 'Nguyen Huy Hung', '3', '5', '2019-12-07 00:00:00'),
('NVT_account1@vtiacademy.com', 'NVT', 'Nguyen Van Toan', '3', '3', '2019-12-08 00:00:00'),
('DHD_account1@vtiacademy.com', 'DHD', 'Do Hung Dung', '2', '2', '2019-12-09 00:00:00'),
('PVD_account1@vtiacademy.com', 'PVD', 'Phan Van Duc', '3', '4', '2019-12-10 00:00:00'),
('BTT_account1@vtiacademy.com', 'BTT', 'Bui Tan Truong', '1', '1', '2019-12-11 00:00:00');
INSERT INTO `account` (Email, UserName, FullName, DepartmentID, PositionID, CreatedDate)
VALUES
('DVH1_account1@vtiacademy.com', 'DVH', 'Duong Van Hao', '3', '4', '2019-12-14 00:00:00');
-- Question 2: lấy ra tất cả các phòng ban
SELECT *
FROM department;
-- Question 3: lấy ra id của phòng ban "Sale"
SELECT DepartmentID
FROM department
WHERE DepartmentName = 'Phong Sale';
-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT *
FROM `account`
Where length(Fullname) = (Select max(length(Fullname)) FROM `account`);
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT ac.AccountID, db.DepartmentID, ac.FullName, LENGTH(ac.FullName) AS NameLength
FROM `account` AS ac
left JOIN department AS db ON ac.DepartmentID = db.DepartmentID -- kết hợp hai bảng account và department theo trường DepartmentID
WHERE db.DepartmentID = 3 -- lọc dữ liệu theo điều kiện id của phòng ban là 3
ORDER BY NameLength DESC
LIMIT 1; --  giới hạn kết quả trả về chỉ 2 dòng dài nhất
 -- Cách 2:
 Select AccountID, FullName, DepartmentID
 from `account`
 Where length(Fullname) = (Select max(length(Fullname))
 FROM `account`) and DepartmentID = 3;
-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT GroupName
FROM `group`
WHERE CreatedDate < '2019-12-20';
-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT QuestionID
FROM answer
GROUP BY QuestionID
HAVING COUNT(*) >= 4; -- lấy ra các nhóm có >= 4 câu trả lời
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT Title
FROM exam
WHERE Duration >= 60 AND CreatedDate < '2019-12-20';
-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT GroupID, GroupName, CreatedDate
FROM `group`
ORDER BY CreatedDate DESC
LIMIT 5;
-- Question 10: Đếm số nhân viên thuộc department có id = 2
  -- Cách 1:
SELECT COUNT(*) as Tong_NV
FROM `account`
WHERE DepartmentID = 2;
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT *
FROM `account`
where FullName Like 'D%o';
-- Question 12: Xóa tất cả các exam được tạo trước ngày 25/12/2018
INSERT INTO exam (`Code`, Title, CategoryID, Duration, CreatorID, CreatedDate)
	VALUES ('MS_08', 'De thi 08', 1, 90, 1, '2016-08-30');
DELETE FROM exam
WHERE CreatedDate < '2028-12-25 23:04:28' and ExamID >=1;
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi1"
INSERT INTO `question` (Content, CategoryID, TypeID, CreatorID, CreatedDate)
	VALUES ('Câu hỏi1 SQL 1', 2, 2, 1, '2021-04-01');
DELETE FROM question WHERE Content LIKE 'Câu hỏi1%' and QuestionID >=1;
-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE account
SET FullName = 'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;
-- Question 15: update account có id = 5 sẽ thuộc group có id = 4

