-- Tạo bảng User
CREATE TABLE User (
    user_id VARCHAR(20) NOT NULL PRIMARY KEY,
    password VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    role VARCHAR(7) NOT NULL
);

-- Tạo bảng Quiz
CREATE TABLE Quiz (
    question_id INT PRIMARY KEY AUTO_INCREMENT,
    question_content VARCHAR(100) NOT NULL,
    option1 VARCHAR(100) NOT NULL,
    option2 VARCHAR(100) NOT NULL,
    option3 VARCHAR(100) NOT NULL,
    option4 VARCHAR(100) NOT NULL,
    answer1 VARCHAR(100),
    answer2 VARCHAR(100),
    answer3 VARCHAR(100),
    answer4 VARCHAR(100)
);

ALTER TABLE Quiz
MODIFY question_id INT AUTO_INCREMENT PRIMARY KEY;

-- Hiển thị số lượng tài khoản đang có
SELECT COUNT(*) FROM User;

-- Hiển thị toàn bộ thông tin tài khoản
SELECT * FROM User;

-- Hiển thị thông tin user với điều kiện username
SELECT * FROM User WHERE user_id = 'admin2';

-- Tài khoản có tồn tại hay không
SELECT CASE
    WHEN EXISTS (SELECT 1 FROM User WHERE user_id = 'admin2')
    THEN 'true'
    ELSE 'false'
END AS result;

-- Đăng nhập có đúng tài khoản, mật khẩu hay không
SELECT CASE
    WHEN EXISTS (SELECT * FROM User WHERE user_id = '' and password = '')
    THEN '1'
    ELSE '0'
END AS result;

-- Xóa toàn bộ dữ liệu đang có trong bảng User
DELETE FROM User
WHERE user_id = '';

-- Reset số thứ tự quiz
ALTER TABLE Quiz AUTO_INCREMENT = 1;

-- Hiển thị số lượng quiz đang có
SELECT COUNT(*) FROM Quiz;

-- Hiển thị toàn bộ thông tin quiz
SELECT * FROM Quiz;

-- Thêm cột created_date
ALTER TABLE Quiz
ADD created_date DATE;

-- Cập nhật dữ liệu
UPDATE Quiz
SET created_date = '2023-09-15'
WHERE created_date = null;

-- Hiển thị 3 quiz bất kỳ
SELECT * FROM Quiz ORDER BY RAND() LIMIT 3;

-- Hiển thị tất cả quiz theo thứ tự mới nhất
SELECT * FROM Quiz ORDER BY created_date DESC;

-- Chỉnh lại cột created_time tự tăng
ALTER TABLE Quiz
MODIFY created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- Xóa toàn bộ dữ liệu đang có trong bảng Quiz
DELETE FROM Quiz
WHERE question_id < 1000;

-- Reset số thứ tự quiz
ALTER TABLE Quiz AUTO_INCREMENT = 1;

-- Đối chiếu đáp án người dùng và đáp án chính xác
SELECT IF (
    option1 = answer1
	AND '' = answer2
	AND '' = answer3
	AND '' = answer4,
    'true', 'false') AS result
FROM Quiz
WHERE question_id = 1;
