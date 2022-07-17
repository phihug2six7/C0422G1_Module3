use quan_ly_ban_hang;

INSERT INTO customer
VALUES (1,'Minh Quan',10),
	   (2,'Ngoc Oanh',20),
	   (3,'Hong Ha',50);
       
INSERT INTO oder
VALUES (1,1,'2006-03-21',NULL),
	   (2,2,'2006-03-23',NULL),
	   (3,1,'2006-03-16',NULL);
       
INSERT INTO product
VALUES (1,'May Giat',3),
	   (2,'Tu Lanh',5),
	   (3,'Dieu Hoa',7),
	   (4,'Quat',1),
	   (5,'Bep Dien',2);
       
INSERT INTO orderdetail (oid, pid,odqty)
VALUES (1,1,3),
	   (1,3,7),
	   (1,4,2),
	   (2,1,1),
	   (3,1,8),
	   (2,5,4),
	   (2,3,3);
       
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

SELECT 
    oid, odate, ototalprice
FROM
    oder;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    c.cname, p.pname
FROM
    customer c
        JOIN
    oder o ON c.cid = o.cid
        JOIN
    orderdetail od ON o.oid = od.oid
        JOIN
    product p ON od.pid = p.pid;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT 
    c.cname, o.odate
FROM
    customer c
        LEFT JOIN
    oder o ON c.cid = o.cid
WHERE
    o.odate IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice
SELECT 
    o.oid, o.odate, SUM(p.pprice * od.odqty) total
FROM
    oder o
        JOIN
    orderdetail od ON o.oid = od.oid
        JOIN
    product p ON od.pid = p.pid
GROUP BY o.oid;

       
