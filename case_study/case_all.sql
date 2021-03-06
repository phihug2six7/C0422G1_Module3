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
 VALUES ('1', 'Qu???n L??');
INSERT INTO `Furama`.`vI_tri` (`mA_vi_tri`, `Ten_vi_tri`) 
VALUES ('2', 'Nh??n Vi??n');

INSERT INTO `FURama`.`triNh_do` (`ma_Trinh_do`, `teN_trinh_do`)
 VALUES ('1', 'TrUng C???p');
INSERT INTO `fURAMa`.`trinh_do` (`ma_trInh_do`, `ten_Trinh_do`) 
VALUES ('2', 'Cao ?????ng');
INSERT INTO `FURaMA`.`trinh_do` (`ma_trinh_do`, `ten_triNh_do`)
 VALUES ('3', '?????i H???c');
INSERT INTO `fuRAMA`.`TRINh_do` (`mA_trinh_do`, `ten_trinh_do`) 
VALUES ('4', 'SAU ?????I H???c');

INSERT INTO `furAma`.`BO_PhAN` (`ma_bo_pHan`, `ten_Bo_phan`) 
VALUES ('1', 'SalE-MARKETInG');
INSERT INTO `furaMa`.`BO_PhAN` (`ma_bo_pHan`, `ten_Bo_phan`)
 VALUES ('2', 'H??nH cH??NH');
INSERT INTO `furama`.`BO_PHAn` (`ma_bo_phaN`, `ten_bo_phan`)
 VALUES ('3', 'Ph???c V???');
INSERT INTO `furama`.`bO_pHAN` (`MA_Bo_phan`, `ten_bo_phaN`) 
VALUES ('4', 'Qu???n l??');

INSERT INTO `furama`.`nhaN_viEN` (`mA_NHan_vien`, `ho_ten`, `nGay_sinh`, `so_Cmnd`, `luOng`, `so_dieN_thoai`, `Email`, `Dia_chi`, `ma_vi_Tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUES ('1', 'Nguy???n V??n AN', '1970-11-07', '456231786', '10000000', '0901234121', 'annGuyen@gmail.Com', '295 NguY???n T???t Th??nh, ???? N???ng', '1', '3', '1');
INSERT INTO `furama`.`nHan_vIen` (`ma_NhaN_VIEN`, `Ho_ten`, `Ngay_sinh`, `So_cmnd`, `luonG`, `so_diEn_thoai`, `eMail`, `dia_chi`, `mA_vi_tri`, `ma_trInh_do`, `ma_bo_phan`)
 VALUES ('2', 'L?? V??n B??nH', '1997-04-09', '654231234', '7000000', '0934212314', 'binHlv@gmail.com', '22 Y??n B??i, ???? N???ng', '1', '2', '2');
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `HO_TEn`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dIen_thoai`, `email`, `dIa_chi`, `mA_vi_tri`, `ma_trinh_do`, `ma_bo_phAn`)
 VALUES ('3', 'H??? TH??? Y???n', '1995-12-12', '999231723', '14000000', '0412352315', 'Thiyen@gmail.cOm', 'K234/11 ??i???n Bi??n PH???, Gia Lai', '1', '3', '2');
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vIen`, `ho_Ten`, `nGAY_SInH`, `so_cmnd`, `luong`, `sO_dien_thoai`, `email`, `Dia_chi`, `ma_vi_tri`, `Ma_trinh_Do`, `ma_bo_phan`)
 VALUES ('4', 'V?? C??ng To???n', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gMail.com', '77 Ho??ng Di???u, Qu???ng Tr???', '1', '4', '4');
INSERT INTO `furama`.`nhan_vien` (`ma_nhan_vien`, `ho_tEn`, `ngay_sinh`, `SO_CMnD`, `luong`, `so_dien_thoaI`, `email`, `dIa_chi`, `Ma_vi_tri`, `Ma_trinh_do`, `ma_bo_phan`)
 VALUES ('5', 'NguY???n B???nh Ph??t', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Y??n B??i, ???? N???ng', '2', '1', '1');
INSERT INTO `fuRama`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_Sinh`, `so_cmnd`, `LUONG`, `So_dien_thOai`, `email`, `dia_chi`, `mA_vi_tri`, `ma_trinh_do`, `ma_bo_pHan`) 
VALUES ('6', 'Kh??c Nguy???n An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'AnNghi20@gmail.com', '294 Nguy???n T???t Th??nh, ???? N???ng', '2', '2', '3');
INSERT INTO `fUrama`.`nhan_vien` (`mA_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cMnd`, `luoNg`, `so_DIEN_tHOAI`, `email`, `dia_chi`, `ma_vi_tri`, `Ma_trinh_dO`, `ma_bo_phAn`)
 VALUES ('7', 'Nguy???n H???u H??', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmAil.COM', '4 NGuy???n Ch?? Thanh, Hu???', '2', '3', '2');
INSERT INTO `furama`.`nhan_vien` (`Ma_nhan_vien`, `ho_teN`, `ngay_sinh`, `so_cmnd`, `luoNg`, `so_dIen_tHoaI`, `EmAIL`, `dia_chI`, `ma_vi_trI`, `ma_trinh_dO`, `ma_bo_phan`)
 VALUES ('8', 'NGuy???n H?? ????ng', '1989-09-03', '234414123', '9000000', '0642123111', 'donghAnguyen@gmail.Com', '111 H??nG V????ng, H?? N???i', '2', '4', '4');
INSERT INTO `furAma`.`nhan_Vien` (`ma_nhaN_vien`, `ho_ten`, `ngay_sInh`, `so_cmnd`, `luong`, `so_diEn_thOai`, `emaIl`, `DIA_CHI`, `ma_vi_Tri`, `ma_triNh_do`, `ma_bo_Phan`)
 VALUES ('9', 'T??ng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangTong@gmail.com', '213 H??m NghI, ???? N???Ng', '2', '4', '4');
INSERT INTO `fUrama`.`nhan_Vien` (`ma_Nhan_vien`, `hO_ten`, `ngay_sinh`, `sO_cmnd`, `luong`, `so_dien_thoAi`, `emaiL`, `Dia_CHI`, `MA_vi_tri`, `ma_trinh_do`, `ma_bo_phan`)
 VALUES ('10', 'Nguy???n C??ng ?????o', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyeNcongdao12@gmaiL.com', '6 Ho?? Kh??NH, ?????Ng NaI', '2', '3', '2');

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
 VALUES ('1', '5', 'Nguy???n Th??? H??o', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguy???n Ho??ng, ???? N???ng');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('2', '3', 'Ph???m Xu??n Di???u', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Th??i Phi??n, Qu???ng Tr???');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('3', '1', 'Tr????ng ????nh Ngh???', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 ??ng ??ch Khi??m, Vinh');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('4', '1', 'D????ng V??n Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 L?? L???i, ???? N???ng');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('5', '4', 'Ho??ng Tr???n Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 L?? Th??i T???, Gia Lai');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('6', '4', 'T??n N??? M???c Ch??u', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Y??n Th???, ???? N???ng');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('7', '1', 'Nguy???n M??? Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 L?? L???i, H??? Ch?? Minh');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('8', '3', 'Nguy???n Th??? H??o', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguy???n V??n Linh, Kon Tum');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES ('9', '1', 'Tr???n ?????i Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 L?? Th?????ng Ki???t, Qu???ng Ng??i');
INSERT INTO `furama`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`)
 VALUES ('10', '2', 'Nguy???n T??m ?????c', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ng?? Quy???n, ???? N???ng');

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
 VALUES ('1', 'Villa Beach Front', '25000', '1000000', '10', '3', '1', 'vip', 'C?? h??? b??i', '500', '4', null);
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`)
 VALUES ('2', 'House Princess 01', '14000', '5000000', '7', '2', '2', 'vip', 'C?? th??m b???p n?????ng', null, '3', null);
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`)
 VALUES ('3', 'Room Twin 01', '5000', '1000000', '2', '4', '3', 'normal', 'C?? tivi', null, null, '1 Xe m??y, 1 Xe ?????p');
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`)
 VALUES ('4', 'Villa No Beach Front', '22000', '9000000', '8', '3', '1', 'normal', 'C?? h??? b??i', '300', '3', null);
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`)
 VALUES ('5', 'House Princess 02', '10000', '4000000', '5', '3', '2', 'normal', 'C?? th??m b???p n?????ng', null, '2', null);
INSERT INTO `furama`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `dich_vu_mien_phi_di_kem`)
 VALUES ('6', 'Room Twin 02', '3000', '900000', '2', '4', '3', 'normal', 'C?? tivi', null, null, '1 Xe m??y');

INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES ('1', 'Karaoke', '10000', 'gi???', 'ti???n nghi, hi???n t???i');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES ('2', 'Thu?? xe m??y', '10000', 'chi???c', 'h???ng 1 xe');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES ('3', 'Thu?? xe ?????p', '20000', 'chi???c', 't???t');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES ('4', 'Buffet bu???i s??ng', '15000', 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES ('5', 'Buffet bu???i tr??a', '90000', 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng');
INSERT INTO `furama`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES ('6', 'Buffet bu???i t???i', '16000', 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng');

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


















