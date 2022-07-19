use furama;

-- 6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt
--  từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        INNER JOIN
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
        INNER JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE
    NOT dv.ma_dich_vu IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                INNER JOIN
            hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
                INNER JOIN
            loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        WHERE
            QUARTER(hd.ngay_lam_hop_dong) = 1
                AND YEAR(hd.ngay_lam_hop_dong) = 2021)
GROUP BY dv.ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da,
-- chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
-- đã từng được khách hàng đặt phòng trong năm 2020
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.so_nguoi_toi_da,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        INNER JOIN
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
        INNER JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE
    NOT dv.ma_dich_vu IN (SELECT 
            dv.ma_dich_vu
        FROM
            dich_vu dv
                INNER JOIN
            hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
                INNER JOIN
            loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2021)
        AND (YEAR(hd.ngay_lam_hop_dong) = 2020)
GROUP BY dv.ma_dich_vu;

-- 8.Hiển thị thông tin ho_ten khách hàng có trong hệ thống,
-- với yêu cầu ho_ten không trùng nhau.

-- Cách 1
SELECT 
    kh.ho_ten
FROM
    khach_hang kh
HAVING COUNT(kh.ho_ten) > 1;

-- Cách 2
SELECT DISTINCT
    ho_ten
FROM
    khach_hang
HAVING COUNT(ho_ten) > 1;

-- Cách 3
SELECT 
    kh1.ho_ten
FROM
    khach_hang kh1,
    khach_hang kh2
WHERE
    kh1.ho_ten = kh2.ho_ten
        AND kh1.ma_khach_hang <> kh2.ma_khach_hang
GROUP BY kh1.ho_ten;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng 
-- với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT 
    MONTH(hd.ngay_lam_hop_dong) AS thang,
    COUNT(hd.ngay_lam_hop_dong) AS so_luong_khach_hang
FROM
    hop_dong hd
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu
-- dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, 
-- ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT 
	hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    sum(hdct.so_luong) AS so_luong_dich_vu_di_kem
FROM
    hop_dong hd
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
		LEFT JOIN
	dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong
ORDER BY hd.ma_hop_dong;
















