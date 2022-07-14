DROP DATABASE IF EXISTS chuyen_doi_erd_sang_mo_hinh_quan_he;

CREATE DATABASE chuyen_doi_erd_sang_mo_hinh_quan_he;

USE chuyen_doi_erd_sang_mo_hinh_quan_he;

CREATE TABLE phieu_xuat(
	sopx INT PRIMARY KEY AUTO_INCREMENT,
	ngay_xuat DATE
);

CREATE TABLE vat_tu(
	ma_vat_tu INT PRIMARY KEY AUTO_INCREMENT,
    ten_vat_tu VARCHAR(45)
);

CREATE TABLE phieu_nhap(
	so_phieu_nhap INT PRIMARY KEY AUTO_INCREMENT,
    ngay_nhap DATE
);

CREATE TABLE nha_cung_cap(
	ma_cung_cap INT PRIMARY KEY AUTO_INCREMENT,
    ten_nha_cung_cap VARCHAR(45),
    dia_chi VARCHAR(45)
);

CREATE TABLE don_dat_hang(
	so_dat_hang INT PRIMARY KEY AUTO_INCREMENT,
    ngay_dat_hang DATE,
    ma_nha_cung_cap INT,
    FOREIGN KEY (ma_nha_cung_cap)
    REFERENCES nha_cung_cap (ma_cung_cap)
);

CREATE TABLE sdt(
	so_dien_thoai VARCHAR(10) PRIMARY KEY,
	ma_cung_cap INT NOT NULL,
    FOREIGN KEY (ma_cung_cap) 
    REFERENCES nha_cung_cap(ma_cung_cap)
);

CREATE TABLE chi_tiet_phieu_xuat(
	so_phieu_xuat INT,
    ma_vat_tu INT,
    don_gia_xuat INT,
    so_luong_xuat INT,
	PRIMARY KEY(so_phieu_xuat,ma_vat_tu) ,
    FOREIGN KEY (so_phieu_xuat)
    REFERENCES phieu_xuat (sopx),
    FOREIGN KEY (ma_vat_tu) 
    REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE chi_tiet_phieu_nhap(
	ma_vat_tu INT,
    so_phieu_nhap INT,
    don_gia_nhap INT,
    so_luong_nhap INT,
    PRIMARY KEY (ma_vat_tu,so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu) 
    REFERENCES vat_tu(ma_vat_tu),
    FOREIGN KEY (so_phieu_nhap)
    REFERENCES phieu_nhap(so_phieu_nhap)
);

CREATE TABLE chi_tiet_don_dat_hang(
	ma_vat_tu INT,
    so_dat_hang INT,
     PRIMARY KEY (ma_vat_tu,so_dat_hang),
    FOREIGN KEY (ma_vat_tu) 
    REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_dat_hang)
    REFERENCES don_dat_hang (so_dat_hang)
);









