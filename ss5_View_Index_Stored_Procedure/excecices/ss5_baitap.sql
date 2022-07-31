DROP DATABASE IF EXISTS demo;
CREATE DATABASE demo;
USE demo;

-- Bước 1: Tạo cơ sở dữ liệu demo
CREATE TABLE PRODUcT (
    id INT PRIMARY KEY AUTO_INCREMENT,
    PRODUCTCode INT,
    proDUCTName VARCHAR(45),
    PRODUCTPrice INT,
    proDUCTAmount INT,
    proDUCTDescription VARCHAR(45),
    PRODUCTStatus VARCHAR(45)
);

-- BƯỚC 2: Tạo bảng Products với các trường dữ liệu
INSERT INTO product(`productCODE`, `PRODuctName`, `productPricE`, `productAmoUnt`, `productDeScription`, `prodUctStatus`)
 VALUES ('111', 'nguyen_minH_hUY', '100', '1', 'to_tròn', 'góa');
INSERT INTO product (`producTCoDE`, `pRODUctName`, `productPrice`, `productAmounT`, `productDescRiption`, `producTStatus`)
 VALUES ('112', 'huynh_quoc_tRunG', '110', '2', 'mắt_thâm', 'độc_Thân');
INSERT INTO product (`productCode`, `pRODUCTNAME`, `producTPrice`, `prodUctAmount`, `prOductDescription`, `productStatus`)
 VALUES ('113', 'trAn_xuan_quynh', '120', '1', 'răng_sún', 'đã_có_vợ'),
 ('114', 'trAn_xuan_quynh', '120', '1', 'răng_sún', 'đã_có_vợ'),
 ('115', 'trAn_xuan_quynh', '120', '1', 'răng_sún', 'đã_có_vợ'),
 ('116', 'trAn_xuan_quynh', '120', '1', 'răng_sún', 'đã_có_vợ'),
 ('117', 'trAn_xuan_quynh', '120', '1', 'răng_sún', 'đã_có_vợ'),
 ('118', 'trAn_xuan_quynh', '120', '1', 'răng_sún', 'đã_có_vợ'),
 ('119', 'trAn_xuan_quynh', '120', '1', 'răng_sún', 'đã_có_vợ'),
 ('120', 'trAn_xuan_quynh', '120', '1', 'răng_sún', 'đã_có_vợ'),
 ('121', 'trAn_xuan_quynh', '120', '1', 'răng_sún', 'đã_có_vợ'),
 ('122', 'trAn_xuan_quynh', '120', '1', 'răng_sún', 'đã_có_vợ');
 -- Bước 3:
 -- +Tạo UnIque Index trên bẢng Products (sử dụng cột productCode để tạo chỉ mục)
 CREATE UNIQUE INDEX product_code
 ON product(productCode);
 
 drop index product_code on product;
 
 
 -- +TạO COMPoSITE InDEX Trên bảng ProducTS (sử dụnG 2 cột prodUctName và productPrice)
Create Index product_name_price
On product (productName,productPrice);

-- +Sử dỤNG CÂu LỆNH EXPLAIN để biết đượC câu lệnh SQL của bạn Thực thi như Nào
Explain Select productcode
From product
Where productCode = 112;



-- +So sánh câu truy vấn trước và sau khi tạo index
-- TRƯớC KHI dÙnG TẠo index rOW=3,và sau khi tạO THÌ row=1

-- Bước 4:
-- +Tạo view lấy về các thông tin: productCode, productName,
--  productPrice, productStatus từ bảng products
CREATE VIEW p_product AS
    SELECT 
        p.productCode,
        p.productName,
        p.productPrice,
        p.productStatus
    FROM
        pRODUct p;

-- +TIến hàNH SỬA đổi view
INSERT INTO p_product(`pRoductCode`, `productNaMe`, `productPrice`,  `pRoductStatus`)
 VALUES ('114', 'nguyen_minh_huy', '100', 'góa');
 
 -- +Tiến hàNH XOÁ VIEW
 Drop VieW p_product;
 
 -- Bước 5:
 -- +Tạo store proCedure lấy tất cả ThôNG TIN Của tấT cả các sản phẩm tRong bảNg produCt
delimiter $$
CREATE PROCEDURE tHONG_TIN()
BEGIN
SELECT*
FROM product;
END $$
delimiter ;

CALL thong_tin();

-- +Tạo store procedure thêm một sản phẩm mớitao_moi
delimiter $$
CREATE PROCEDURE tAO_MOI(
	 PRODUCtCode INT,
     PRoDUCTNAMe VARCHAR(45),
     productPrice INT,
     producTAmount INT,
     productDescription VARCHAR(45),
	 productStatus VARCHAR(45)
)
BEGIN 
	INSERT INTO producT (productCode, PRODuctName, productPrICE, PRODUCTAmount, productDescRIPTion, productStatus)
	VALUES (productCode, productNAME, PRODUCtPrice, productAmOUNT, PRODUcTDESCRIptiON, PRoDUCTStatus);
END $$
delimIter ;

CALL Tao_moi(115,'nGuyen_tan_tai',130,1,'bông','góa');
CALL Thong_tin();

-- +TẠo store proCedure sửa thÔng tin sản phẨm theo id
deliMiter $$
Create ProcEdure 
chinh_suA (
	Pro_id int,
	price_N Int
)
begIN
	Update product
    SET ProductPRice = PriCE_N
    where Id = pro_id;
end $$
delimiter ;

call chinh_sua(1,100);
call thong_tin();

-- +TạO STORe PROCEDURe xoá sản phẨm theo id
DELimiter $$
CREaTe PROCedURE XOa (pro_id int)
Begin
	delete fRom product
    WHEre iD = pro_Id;
End $$
delimiter ;

CAll xoa(2);
CALL ThoNG_Tin();
 
 




