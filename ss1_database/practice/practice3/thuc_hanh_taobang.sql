DROP DATABASE IF EXISTS student_management;
CREATE DATABASE student_management;
USE student_management;
CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name_student VARCHAR(45),
    age INT,
    country VARCHAR(45)
);
CREATE TABLE class (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name_class VARCHAR(30)
);
CREATE TABLE teacher (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name_teacher VARCHAR(45),
    age INT,
    country VARCHAR(45)
);

