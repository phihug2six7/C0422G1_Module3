DROP DATABASE IF EXISTS furama;
CREATE DATABASE furama;
USE furama;

CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
);

CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT NOT NULL,
    ma_trinh_do INT NOT NULL,
    ma_bo_phan INT NOT NULL,
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);

CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(45)
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY,
    ma_loai_khach INT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45)
);
ALTER TABLE khach_hang ADD CONSTRAINT fk_cat FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach);

CREATE TABLE kieu_thue(
	ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);

CREATE TABLE loai_dich_vu(
	ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45)
);

CREATE TABLE dich_vu(
	ma_dich_vu INT PRIMARY KEY,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT,
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT,
    FOREIGN KEY (ma_kieu_thue)
    REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu)
    REFERENCES loai_dich_vu (ma_loai_dich_vu)
);

CREATE TABLE hop_dong(
	ma_hop_dong INT PRIMARY KEY,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT ,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY (ma_nhan_vien)
    REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang)
    REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) 
    REFERENCES dich_vu (ma_dich_vu)
);

CREATE TABLE dich_vu_di_kem(
	ma_dich_vu_di_kem INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR (45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45)
);

CREATE TABLE hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet INT PRIMARY KEY,
    ma_hop_dong INT NOT NULL,
    ma_dich_vu_di_kem INT NOT NULL,
    so_luong INT NOT NULL,
    FOREIGN KEY (ma_hop_dong)
    REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem)
    REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);

INSERT INTO `furama`.`vi_tri` (`ma_vi_tri`, `ten_vi_tri`)
 VALUES ('1', 'Quản Lý');
INSERT INTO `Furama`.`vI_tri` (`mA_vi_tri`, `Ten_vi_tri`) 
VALUES ('2', 'Nhân Viên');

INSERT INTO `FURama`.`triNh_do` (`ma_Trinh_do`, `teN_trinh_do`)
 VALUES ('1', 'TrUng Cấp');
INSERT INTO `fURAMa`.`trinh_do` (`ma_trInh_do`, `ten_Trinh_do`) 
VALUES ('2', 'Cao Đẳng');
INSERT INTO `FURaMA`.`trinh_do` (`ma_trinh_do`, `ten_triNh_do`)
 VALUES ('3', 'ĐẠi Học');
INSERT INTO `fuRAMA`.`TRINh_do` (`mA_trinh_do`, `ten_trinh_do`) 
VALUES ('4', 'SAU ĐẠI Học');

INSERT INTO `furAma`.`BO_PhAN` (`ma_bo_pHan`, `ten_Bo_phan`) 
VALUES ('1', 'SalE-MARKETInG');
INSERT INTO `furaMa`.`BO_PhAN` (`ma_bo_pHan`, `ten_Bo_phan`)
 VALUES ('2', 'HànH cHÍNH');
INSERT INTO `furama`.`BO_PHAn` (`ma_bo_phaN`, `ten_bo_phan`)
 VALUES ('3', 'Phục Vụ');
INSERT INTO `furama`.`bO_pHAN` (`MA_Bo_phan`, `ten_bo_phaN`) 
VALUES ('4', 'Quản lý');

INSERT INTO `furama`.`nhaN_viEN` (`mA_NHan_vien`, `ho_ten`, `nGay_sinh`, `so_Cmnd`, `luOng`, `so_dieN_thoai`, `Email`, `Dia_chi`, `ma_vi_Tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUES ('1', 'Nguyễn Văn AN', '1970-11-07', '456231786', '10000000', '0901234121', 'annGuyen@gmail.Com', '295 NguYễn Tất Thành, Đà Nẵng', '1', '3', '1');
INSERT INTO `furama`.`nHan_vIen` (`ma_NhaN_VIEN`, `Ho_ten`, `Ngay_sinh`, `So_cmnd`, `luonG`, `so_diEn_thoai`, `eMail`, `dia_chi`, `mA_vi_tri`, `ma_trInh_do`, `ma_bo_phan`)
 VALUES ('2', 'Lê Văn BìnH', '1997-04-09', '654231234', '7000000', '0934212314', 'binHlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2');
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `HO_TEn`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dIen_thoai`, `email`, `dIa_chi`, `mA_vi_tri`, `ma_trinh_do`, `ma_bo_phAn`)
 VALUES ('3', 'Hồ THị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'Thiyen@gmail.cOm', 'K234/11 Điện Biên PHủ, Gia Lai', '1', '3', '2');
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vIen`, `ho_Ten`, `nGAY_SInH`, `so_cmnd`, `luong`, `sO_dien_thoai`, `email`, `Dia_chi`, `ma_vi_tri`, `Ma_trinh_Do`, `ma_bo_phan`)
 VALUES ('4', 'Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gMail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4');
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `ho_tEn`, `ngay_sinh`, `SO_CMnD`, `luong`, `so_dien_thoaI`, `email`, `dIa_chi`, `Ma_vi_tri`, `Ma_trinh_do`, `ma_bo_phan`)
 VALUES ('5', 'NguYễn Bỉnh PhÁt', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1');
INSERT INTO `fuRama`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_Sinh`, `so_cmnd`, `LUONG`, `So_dien_thOai`, `email`, `dia_chi`, `mA_vi_tri`, `ma_trinh_do`, `ma_bo_pHan`) 
VALUES ('6', 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'AnNghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3');
INSERT INTO `fUrama`.`nhan_vien` (`mA_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cMnd`, `luoNg`, `so_DIEN_tHOAI`, `email`, `dia_chi`, `ma_vi_tri`, `Ma_trinh_dO`, `ma_bo_phAn`)
 VALUES ('7', 'Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmAil.COM', '4 NGuyễn Chí Thanh, Huế', '2', '3', '2');
INSERT INTO `furama`.`nhan_vien` (`Ma_nhan_vien`, `ho_teN`, `ngay_sinh`, `so_cmnd`, `luoNg`, `so_dIen_tHoaI`, `EmAIL`, `dia_chI`, `ma_vi_trI`, `ma_trinh_dO`, `ma_bo_phan`)
 VALUES ('8', 'NGuyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghAnguyen@gmail.Com', '111 HùnG Vương, Hà Nội', '2', '4', '4');
INSERT INTO `furAma`.`nhan_Vien` (`ma_nhaN_vien`, `ho_ten`, `ngay_sInh`, `so_cmnd`, `luong`, `so_diEn_thOai`, `emaIl`, `DIA_CHI`, `ma_vi_Tri`, `ma_triNh_do`, `ma_bo_Phan`)
 VALUES ('9', 'TÒng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangTong@gmail.com', '213 Hàm NghI, ĐÀ NẴNg', '2', '4', '4');
INSERT INTO `fUrama`.`nhan_Vien` (`ma_Nhan_vien`, `hO_ten`, `ngay_sinh`, `sO_cmnd`, `luong`, `so_dien_thoAi`, `emaiL`, `Dia_CHI`, `MA_vi_tri`, `ma_trinh_do`, `ma_bo_phan`)
 VALUES ('10', 'Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyeNcongdao12@gmaiL.com', '6 Hoà KhÁNH, ĐồNg NaI', '2', '3', '2');

INSERT INTO `furama`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`)
 VALUES ('1', 'Diamond');
INSERT INTO `furama`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) 
VALUES ('2', 'Platinium');
INSERT INTO `furama`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) 
VALUES ('3', 'Gold');
INSERT INTO `furama`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`)
 VALUES ('4', 'Silver');
INSERT INTO `furama`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`)
 VALUES ('5', 'Member');
 
 INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('1', '5', 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('2', '3', 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('3', '1', 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('4', '1', 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('5', '4', 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('6', '4', 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('7', '1', 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('8', '3', 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES ('9', '1', 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('10', '2', 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');

INSERT INTO `furama`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`)
 VALUES ('1', 'year');
INSERT INTO `furama`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`)
 VALUES ('2', 'month');
INSERT INTO `furama`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`)
 VALUES ('3', 'day');
INSERT INTO `furama`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`)
 VALUES ('4', 'hour');
 
 INSERT INTO `furama`.`loai_dich_vu` (`ma_loai_dich_vu`, `ten_loai_dich_vu`)
 VALUES ('1', 'Villa');
INSERT INTO `furama`.`loai_dich_vu` (`ma_loai_dich_vu`, `ten_loai_dich_vu`)
 VALUES ('2', 'House');
INSERT INTO `furama`.`loai_dich_vu` (`ma_loai_dich_vu`, `ten_loai_dich_vu`)
 VALUES ('3', 'Room');

INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`)
 VALUES ('1', 'Villa Beach Front', '25000', '1000000', '10', '3', '1', 'vip', 'Có hồ bơi', '500', '4', null);
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`)
 VALUES ('2', 'House Princess 01', '14000', '5000000', '7', '2', '2', 'vip', 'Có thêm bếp nướng', null, '3', null);
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`)
 VALUES ('3', 'Room Twin 01', '5000', '1000000', '2', '4', '3', 'normal', 'Có tivi', null, null, '1 Xe máy, 1 Xe đạp');
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`)
 VALUES ('4', 'Villa No Beach Front', '22000', '9000000', '8', '3', '1', 'normal', 'Có hồ bơi', '300', '3', null);
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`)
 VALUES ('5', 'House Princess 02', '10000', '4000000', '5', '3', '2', 'normal', 'Có thêm bếp nướng', null, '2', null);
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`)
 VALUES ('6', 'Room Twin 02', '3000', '900000', '2', '4', '3', 'normal', 'Có tivi', null, null, '1 Xe máy');

INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES ('1', 'Karaoke', '10000', 'giờ', 'tiện nghi, hiện tại');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES ('2', 'Thuê xe máy', '10000', 'chiếc', 'hỏng 1 xe');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES ('3', 'Thuê xe đạp', '20000', 'chiếc', 'tốt');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES ('4', 'Buffet buổi sáng', '15000', 'suất', 'đầy đủ đồ ăn, tráng miệng');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES ('5', 'Buffet buổi trưa', '90000', 'suất', 'đầy đủ đồ ăn, tráng miệng');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES ('6', 'Buffet buổi tối', '16000', 'suất', 'đầy đủ đồ ăn, tráng miệng');

INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`)
 VALUES ('1', '2020-12-08', '2020-12-08', '0', '3', '1', '3');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`)
 VALUES ('2', '2020-07-14', '2020-07-21', '200000', '7', '3', '1');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`)
 VALUES ('3', '2021-03-15', '2021-03-17', '50000', '3', '4', '2');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`)
 VALUES ('4', '2021-01-14', '2021-01-18', '100000', '7', '5', '5');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`)
 VALUES ('5', '2021-07-14', '2021-07-15', '0', '7', '2', '6');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`)
 VALUES ('6', '2021-06-01', '2021-06-03', '0', '7', '7', '6');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`)
 VALUES ('7', '2021-09-02', '2021-09-05', '100000', '7', '4', '4');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`)
 VALUES ('8', '2021-06-17', '2021-06-18', '150000', '3', '4', '1');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`)
 VALUES ('9', '2020-11-19', '2020-11-19', '0', '3', '4', '3');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`)
 VALUES ('10', '2021-04-12', '2021-04-14', '0', '10', '3', '5');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`)
 VALUES ('11', '2021-04-25', '2021-04-25', '0', '2', '2', '1');
INSERT INTO `furama`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`)
 VALUES ('12', '2021-05-25', '2021-05-27', '0', '7', '10', '1');

INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`)
 VALUES ('1', '2', '4', '5');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`)
 VALUES ('2', '2', '5', '8');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`)
 VALUES ('3', '2', '6', '15');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`)
 VALUES ('4', '3', '1', '1');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`)
 VALUES ('5', '3', '2', '11');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`)
 VALUES ('6', '1', '3', '1');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`)
 VALUES ('7', '1', '2', '2');
INSERT INTO `furama`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`)
 VALUES ('8', '12', '2', '2');


















