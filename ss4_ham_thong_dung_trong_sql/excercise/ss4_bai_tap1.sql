USE quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT 
    *
FROM
    `Subject` sub
WHERE
    credit = (SELECT 
            MAX(Credit)
        FROM
            `subject`);
            
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT 
    Subname subn, Mark m
FROM
    `subject` sub
        INNER JOIN
    mark m ON sub.SubId = m.SubId
WHERE
    mark = (SELECT 
            MAX(Mark)
        FROM
            Mark);
            
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên,
-- xếp hạng theo thứ tự điểm giảm dần
SELECT 
    *, AVG(Mark) AS diem_trung_binh
FROM
    student s
        LEFT JOIN
    mark m ON s.StudentId = m.StudentId
GROUP BY s.StudentId
ORDER BY diem_trung_binh DESC





