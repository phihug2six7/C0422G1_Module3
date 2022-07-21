use furama;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

set sql_safe_updates =0;
delete from nhan_vien 
where
    ma_nhan_vien not in (select 
        mnv.ma_nhan_vien
    from
        (select 
            nv.ma_nhan_vien
        from
            nhan_vien nv
        join hop_dong hd on nv.ma_nhan_vien = hd.ma_hop_dong
        
        where
            year(hd.ngay_lam_hop_dong) in (2019 , 2020, 2021)) as mnv);
    
set sql_safe_updates =1;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 1.000.000 VNĐ.
 
set sql_safe_updates = 0;
update khach_hang 
set 
    ma_loai_khach = (select 
            ma_loai_khach
        from
            loai_khach
        where
            ten_loai_khach = 'Diamond')
where
    ma_khach_hang in (select 
            tmp.ma_khach_hang
        from
            (select 
                kh.ma_khach_hang,
                    (ifnull(dv.chi_phi_thue, 0) + ifnull(dvdk.gia, 0) * ifnull(hdct.so_luong, 0)) as tong_tien
            from
                khach_hang kh
            left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
            left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
            left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
            left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
            left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
            where
                year(hd.ngay_lam_hop_dong) = 2021
                    and lk.ten_loai_khach = 'Platinium'
            having tong_tien > 1000000) as tmp);
    
-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set sql_safe_updates=0;
set foreign_key_checks=0;

delete from khach_hang 
where
    ma_khach_hang in (select 
        hkm.ma_khach_hang
    from
        (select 
            kh.ma_khach_hang
        from
            khach_hang kh
        join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
        
        where
            year(hd.ngay_lam_hop_dong) < 2021) as hkm);
    
set foreign_key_checks=1;
set sql_safe_updates=1;

-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

set sql_safe_updates=0;
update dich_vu_di_kem  
set 
    gia = gia * 2
where
    ma_dich_vu_di_kem in (select 
            dvdk.ma_dich_vu_di_kem
        from
            (select 
                mdvdk.ma_dich_vu_di_kem
            from
                dich_vu_di_kem mdvdk
            join hop_dong_chi_tiet hdct on mdvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
            join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
            where
                hdct.so_luong >= 10
                    and year(ngay_lam_hop_dong) = 2020) as dvdk);
 set sql_safe_updates=1;   

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm
-- id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select 
    ma_nhan_vien as id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
from
    nhan_vien 
union all select 
    ma_khach_hang as id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
from
    khach_hang
order by id;



    
