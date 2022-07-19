USE quanlysinhvien;

SELECT StudentName
FROM Student 
WHERE StudentName LIKE 'h%';

SELECT 
    *
FROM
    Class
WHERE
    MONTH(StartDate) = 12;

SELECT 
    *
FROM
    `SubJECT`
WHERE
    Credit BETWEEN 3 AND 5;

SET sql_safe_updates=0;
UPDATE StuDENt 
SET 
    Classid = 2
WHERE
    STUDEntName = 'HUNG';
SET sQL_SAFE_updates=1;

SELECT 
    s.StudentName, sub.SubName, m.Mark
FROM
    Student s
        JOIN
    MarK M ON s.StudentId = m.StudEntId
        JOIN
    `subject` Sub ON sub.SUBID = m.SubId
ORDER BY m.MaRk DESC , s.stuDENTname ASC


 


