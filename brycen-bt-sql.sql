select * from brycen.sanpham;
select * from brycen.khohang;
-- bai1 Tính tổng giá trị theo mỗi sản phẩm có trong kho
select sp.MaSP, sp.TenSP, (sp.Dongia* kh.SoLuong) as GiaTri from sanpham as sp join khohang as kh on sp.MaSP = kh.MaSP group by sp.TenSP;
-- bai 2 Liệt kê các sản phẩm trong Phân loại 1 và 2
select sp.MaSP, sp.TenSP, sp.PhanLoai from sanpham as sp where sp.PhanLoai = 1 || sp.PhanLoai = 2 order by sp.PhanLoai;
-- bai 3 Liệt kê sản phẩm (đơn giá <= 2000 và >=1000)
select * from sanpham as sp where sp.DonGia between 1000 and  2000 order by sp.DonGia; 
-- bai 4 Liệt kê các sản phẩm Phân loại 1 có đơn giá >1000
select * from sanpham as sp where sp.PhanLoai = 1 and sp.DonGia > 1000;
-- bai 5 Sắp xếp sản phẩm theo đơn giá
select * from sanpham as sp order by sp.DonGia;
-- bai 6 Tìm các sản phẩm có tên bắt đầu là 'c';
select * from sanpham as sp where sp.TenSP like 'c%';
-- bai 7 Lấy 2 sản phẩm đầu tiên của kệ hàng 1, sắp xếp theo MaSP
select sp.MaSP, sp.TenSP, kh.MaKeHang from sanpham as sp join khohang as kh on sp.MaSP = kh.MaSP and kh.MaKeHang = 'KH1' order by sp.MaSP  limit 2;
-- bai 8 Tìm kiếm các sản phẩm sắp hết (SoLuong < 10)
select sp.MaSP, sp.TenSP, kh.SoLuong from sanpham as sp join khohang as kh on sp.MaSP = kh.MaSP and kh.SoLuong < 10 order by kh.SoLuong;
-- bai 9 Tính tổng số lượng sản phẩm trong kho theo từng phân loại
select sp.PhanLoai, sum(kh.SoLuong) from sanpham as sp join khohang as kh on sp.MaSP = kh.MaSP group by sp.PhanLoai;
-- Tìm các sản phẩm không có trong kho hàng  
select sp.MaSP, sp.TenSP, sp.PhanLoai from sanpham as sp left outer join khohang as kh on sp.MaSP = kh.MaSP where kh.MaSP is null; 
-- Tìm trong kho hàng các sản phẩm có tổng giá trị <20000
select sp.MaSP, sp.TenSP, (sp.DonGia * kh.SoLuong) as TongTien from sanpham as sp join khohang as kh on sp.MaSP = kh.MaSP where (sp.DonGia * kh.SoLuong) > 20000;
-- Tìm kệ hàng có giá trị lớn nhất
select kh.MaKeHang, max(sp.DonGia * kh.SoLuong) as GiaTri from sanpham as sp join khohang as kh on sp.MaSP = kh.MaSP;