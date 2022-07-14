DROP DATABASE IF EXISTS quan_ly_ban_hang;

CREATE DATABASE quan_ly_ban_hang;

USE quan_ly_ban_hang;

CREATE TABLE customer(
	cid INT PRIMARY KEY AUTO_INCREMENT,
    cname VARCHAR(45),
    cage INT
);

CREATE TABLE oder(
	oid INT PRIMARY KEY AUTO_INCREMENT,
    cid INT,
    odate DATE,
    ototalprice INT,
    FOREIGN KEY (cid)
    REFERENCES customer(cid)
);

CREATE TABLE product(
	pid INT PRIMARY KEY AUTO_INCREMENT,
    pname VARCHAR(45),
    pprice INT
);

CREATE TABLE orderdetail(
	oid INT,
    pid INT,
    odqty INT,
    PRIMARY KEY(oid,pid),
    FOREIGN KEY (oid) 
    REFERENCES oder (oid),
    FOREIGN KEY (pid)
    REFERENCES product (pid)
);

