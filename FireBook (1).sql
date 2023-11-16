create database firebook
go
use firebook
GO

create table KhachHang(
	MaKhachHang varchar(20) primary key,
	HoTen nvarchar(100),
	Email nvarchar(100),
	SDT varchar(15),
	DiaChi nvarchar(200),
	NgaySinh date,
	GioiTinh bit,
	TrangThai bit
)

CREATE TABLE TacGia (
    MaTacGia INT IDENTITY(1,1) PRIMARY KEY,
    HoTen nvarchar(100),
    NgaySinh date,
    QueQuan nvarchar(200),
    TrangThai bit
)

CREATE TABLE TheLoai (
    MaTheLoai INT IDENTITY(1,1) PRIMARY KEY,
    TenTheLoai nvarchar(100),
    TrangThai bit
)

CREATE TABLE NhaXuatBan (
    MaNhaXuatBan INT IDENTITY(1,1) PRIMARY KEY, 
    TenNhaXuatBan nvarchar(100),
)

create table NhanVien(
	MaNhanVien varchar(20) primary key,
	HoTen nvarchar(100),
	Email varchar(100),
	SDT varchar(20),
	DiaChi nvarchar(200),
	TrangThai bit
)

create table KhuyenMai(
	MaKhuyenMai varchar(20) primary key,
	TenKhuyenMai nvarchar(100),
	NgayBatDau date,
	NgayKetThuc date,
	DieuKien varchar(1000),
	TrangThai bit
)

create table Sach(
	MaSach varchar(20) primary key,
	MaNhaXuatBan int foreign key references NhaXuatBan(MaNhaXuatBan),
	TenSach nvarchar(100),
)


create table HoaDon(
	MaHoaDon varchar(20) primary key,
	MaKhachHang varchar(20) foreign key references KhachHang(MaKhachHang),
	MaKhuyenMai varchar(20) foreign key references KhuyenMai(MaKhuyenMai),
	MaNhanVien varchar(20) foreign key references NhanVien(MaNhanVien),
	TenNguoiNhan nvarchar(100),
	GhiChu nvarchar(200),
	SDT varchar (20),
	Email varchar(50),
	NgayMua date,
	TongTien money,
	TrangThai bit
)
CREATE TABLE SachCT (
    MaSachCT INT IDENTITY(1,1) PRIMARY KEY,
    MaTheLoai INT FOREIGN KEY REFERENCES TheLoai(MaTheLoai),
    MaSach varchar(20) FOREIGN KEY REFERENCES Sach(MaSach),
    MaTacGia INT FOREIGN KEY REFERENCES TacGia(MaTacGia),
	GiaBan money,
	MoTa nvarchar(200),
	SoLuong int,
	NamXuatban int,
	NamTaiBan int,
	SoTrang int,
	SoTap int,
	TrangThai bit
)

CREATE TABLE HoaDonCT (
    MaHoaDonCT INT IDENTITY(1,1) PRIMARY KEY,
    MaSachCT INT FOREIGN KEY REFERENCES SachCT(MaSachCT),
    MaHoaDon varchar(20) FOREIGN KEY REFERENCES HoaDon(MaHoaDon),
	MaSach varchar(20) FOREIGN KEY REFERENCES Sach(MaSach),
    SoLuong int,
    GiaBan money
)


SELECT * FROM KhachHang;
SELECT * FROM TacGia;
SELECT * FROM TheLoai;
SELECT * FROM NhaXuatBan;
SELECT * FROM NhanVien;
SELECT * FROM KhuyenMai;
SELECT * FROM Sach;
SELECT * FROM HoaDon;
SELECT * FROM SachCT;
SELECT * FROM HoaDonCT;


INSERT INTO KhachHang (MaKhachHang, HoTen, Email, SDT, DiaChi, NgaySinh, GioiTinh, TrangThai)
VALUES ('KH001', 'Nguyen Van A', 'nguyenvana@example.com', '123456789', '123 Main St, City', '1990-01-01', 1, 1),
       ('KH002', 'Tran Thi B', 'tranthib@example.com', '987654321', '456 Oak St, City', '1995-05-15', 0, 1);


INSERT INTO TacGia (HoTen, NgaySinh, QueQuan, TrangThai)
VALUES ('Author A', '1980-02-10', 'Hanoi, Vietnam', 1),
       ('Author B', '1985-07-20', 'Ho Chi Minh City, Vietnam', 1);


INSERT INTO TheLoai (TenTheLoai, TrangThai)
VALUES ('Fiction', 1),
       ('Science Fiction', 1);


INSERT INTO NhaXuatBan (TenNhaXuatBan)
VALUES ('Publisher A'),
       ('Publisher B');


INSERT INTO NhanVien (MaNhanVien, HoTen, Email, SDT, DiaChi, TrangThai)
VALUES ('NV001', 'Employee A', 'employeea@example.com', '111222333', '789 Broadway, City', 1),
       ('NV002', 'Employee B', 'employeeb@example.com', '444555666', '012 Market St, City', 1);


INSERT INTO KhuyenMai (MaKhuyenMai, TenKhuyenMai, NgayBatDau, NgayKetThuc, DieuKien, TrangThai)
VALUES ('KM001', 'Discount 1', '2023-01-01', '2023-02-28', 'Buy 2 get 1 free', 1),
       ('KM002', 'Discount 2', '2023-03-01', '2023-04-30', 'Buy 1 get 50% off', 1);


INSERT INTO Sach (MaSach, MaNhaXuatBan, TenSach)
VALUES ('S001', 1, 'Book 1'),
       ('S002', 2, 'Book 2');


INSERT INTO HoaDon (MaHoaDon, MaKhachHang, MaKhuyenMai, MaNhanVien, TenNguoiNhan, GhiChu, SDT, Email, NgayMua, TongTien, TrangThai)
VALUES ('HD001', 'KH001', 'KM001', 'NV001', 'Customer A', 'Note 1', '987654321', 'customer@example.com', '2023-01-15', 100.00, 1),
       ('HD002', 'KH002', 'KM002', 'NV002', 'Customer B', 'Note 2', '123456789', 'customerb@example.com', '2023-02-20', 150.00, 1);


INSERT INTO SachCT (MaTheLoai, MaSach, MaTacGia, GiaBan, MoTa, SoLuong, NamXuatban, NamTaiBan, SoTrang, SoTap, TrangThai)
VALUES (1, 'S001', 1, 20.00, 'Description 1', 50, 2020, 2023, 200, 1, 1),
       (2, 'S002', 2, 25.00, 'Description 2', 40, 2018, 2022, 180, 2, 1);


INSERT INTO HoaDonCT (MaSachCT, MaHoaDon, MaSach, SoLuong, GiaBan)
VALUES (1, 'HD001', 'S001', 1, 40.00),
       (2, 'HD002', 'S002', 2, 75.00);


