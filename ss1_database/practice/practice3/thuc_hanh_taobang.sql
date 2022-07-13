create database student_management;
use student_management;
create table student(
id int primary key auto_increment,
name_student varchar(45),
age int,
country varchar(45)
);
create table class(
id int primary key auto_increment,
name_class varchar(30)
);
create table teacher(
id int primary key auto_increment,
name_teacher varchar(45),
age int,
country varchar(45)
)
