use BookShop
go
CREATE TABLE DanhMucLon (
	MaDMLon VARCHAR(10) PRIMARY KEY NOT NULL,
	TenDML NVARCHAR(50) NOT NULL,
	SoLuongDML INT NOT NULL
)

GO 

CREATE TABLE DanhMuc (
	MaDM VARCHAR(10) PRIMARY KEY NOT NULL,
	MaDMLon VARCHAR(10) REFERENCES DanhMucLon(MaDMLon) NOT NULL,
	TenDM NVARCHAR(50) NOT NULL,
	SoLuong INT NOT NULL
)

GO 

CREATE TABLE Sach(
	MaSach VARCHAR(10) PRIMARY KEY NOT NULL,
	MaDM VARCHAR(10) REFERENCES DanhMuc(MaDM),
	TenSach NVARCHAR(100) UNIQUE NOT NULL,
	TacGia NVARCHAR(50) NOT NULL,
	NXB NVARCHAR(100), 
	TheLoai NVARCHAR(50),
	GiaBia INT,
	GiaBan INT NOT NULL,
	SoLuong INT NOT NULL,
	DanhGia FLOAT
)

GO

CREATE TABLE ANH (
	MaAnh VARCHAR(50) PRIMARY KEY NOT NULL,
	MaSach VARCHAR(10) REFERENCES Sach(MaSach) NOT NULL,
	Link VARCHAR(50)
)

go



CREATE TABLE NguoiDung (
	MaND VARCHAR(10) PRIMARY KEY NOT NULL ,
	TenND NVARCHAR(100) NOT NULL,
	SDT VARCHAR(15) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	Email VARCHAR(30)
)

GO 
 
CREATE TABLE DiaChiNguoiDung (
	MaDC VARCHAR(10) NOT NULL,
	MaND VARCHAR(10) REFERENCES NguoiDung(MaND) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	SDT VARCHAR(15) NOT NULL,
	TenNNH NVARCHAR(100) NOT NULL,
	PRIMARY KEY (MaDC, MaND)
)

GO 

CREATE TABLE BinhLuan (
	MaSach VARCHAR(10) REFERENCES Sach(MaSach) NOT NULL,
	MaND VARCHAR(10) REFERENCES NguoiDung(MaND) NOT NULL,
	BinhLuan TEXT
	PRIMARY KEY(MaSach, MaND)
)

GO 

CREATE TABLE GioHang (
	MaGH VARCHAR(10) PRIMARY KEY NOT NULL,
	MaND VARCHAR(10) REFERENCES NguoiDung(MaND) NOT NULL,
	TienGH INT NOT NULL
)

GO 

CREATE TABLE CTGioHang (
	MaGH VARCHAR(10) REFERENCES GioHang(MaGH) NOT NULL,
	MaSach VARCHAR(10) REFERENCES Sach(MaSach) NOT NULL,
	SoLuong INT NOT NULL,
	TienCT INT NOT NULL, 
	PRIMARY KEY (MaGH, MaSach)
)

GO 

CREATE TABLE DonHang (
	MaDH VARCHAR(10) NOT NULL,
	MaGH VARCHAR(10) REFERENCES GioHang(MaGH) NOT NULL,
	MaSach VARCHAR(10) REFERENCES Sach(MaSach) NOT NULL,
	NgayBan DATE NOT NULL,
	PRIMARY KEY (MaDH, MaGH, MaSach)
)

GO


insert into DanhMucLon(MaDMLon, TenDML, SoLuongDML)
value('DML00001', n'Sách Tiếng Việt', 1);
insert into DanhMucLon
value('DML00002', n'Sách Tiếng Anh', 1)

insert into DanhMuc
value('DM00001', 'DML00001', N'Sách thiếu nhi', 1)
insert into DanhMuc
value('DM00002', 'DML00001', N'Sách thiếu nhi', 1)
insert into DanhMuc
value('DM00003', 'DML00001', N'Sách thiếu nhi', 1)

insert into Sach
value('SH00001',n'Sách thiếu nhi', N'Alice ở xứ sở thần tiên', 'Lewis Carrol', n'Nhã Nam', 136000, 124000, 20, 0)
insert into Sach
value('SH00002',n'Sách thiếu nhi', N'Harry Potter', 'J.K Rolling', n'Nhã Nam', 236000, 224000, 20, 0)
insert into Sach
value('SH00003',n'Sách thiếu nhi', N'Doraemon', 'Fujikawa', n'Thiếu Nhi', 36000, 24000, 20, 0)

insert into ANH
value('ANH001', 'SH00001',NULL)
insert into ANH
value('ANH001', 'SH00002',NULL)
insert into ANH
value('ANH001', 'SH00003',NULL)
