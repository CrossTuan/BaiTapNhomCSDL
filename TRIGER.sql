CREATE DATABASE BAI
go
use BAI
go



create table CUSTOMER(
maKH varchar(10) primary key,
hoten varchar(100),
email varchar(100),
sdt varchar(10),
diachi varchar(100)
)

GO
create table PAYMENT(
maTT varchar(10) primary key,
tenPTTT varchar(100),
phiTT money
)



create table ORDERS(
maDH varchar(10) primary key,
ngaydat date,
trangthai varchar(10),
tongtien money,
maKH varchar(10),
maTT varchar(10)
)


GO
create table PRODUCT(
maSP varchar(10) primary key,
tenSP varchar(100),
mota varchar(100),
giaSP money,
soluongSP int
)


GO
create table ORDER_DETAILS(
maCTSP varchar(10) primary key,
soluongmua int,
gia money,
thanhtien money,
maDH varchar(10),
maSP varchar(10)
)


GO
alter table ORDERS add foreign key(maKH) references CUSTOMER(maKH)
alter table ORDERS add foreign key(maTT) references PAYMENT(maTT)
alter table ORDER_DETAILS add foreign key(maDH) references ORDERS(maDH)
alter table ORDER_DETAILS add foreign key(maSP) references PRODUCT(maSP)


GO
INSERT INTO CUSTOMER VALUES
('MKH001','Nhi Nguyen','Nhi@gmail.com','0905808905','Thanh Khe'),
('MKH002','Jimmy Mr','Jimmy@gmail.com','0905399343','Son Tra'),
('MKH003','Vo DaiHua','Vuvu@gmail.com','0905399534','Ngu Hanh Son');
GO
INSERT INTO PAYMENT VALUES
('MaTT001','MOMO', '20000'),
('MaTT002','ARIPAY','14000');
GO
INSERT INTO ORDERS VALUES
('MDH001','20211020','VUVU','200000','MKH001','MaTT002'),
('MDH002','20211019','HENG','7000000','MKH002','MaTT001'),
('MDH003', '20220109','JIMMY','9000000','MKH001','MaTT002');
go
INSERT INTO PRODUCT VALUES
('SP001','Toan10','ToanDai C5',' 6000','20'),
('SP002','Hoa11', 'HuuCo C5', '7000','20'),
('SP003','Hoa12', 'VoCo C2',' 9000','15');
go
INSERT INTO ORDER_DETAILS VALUES
('CTSP001','1','9000','6010000','MDH003','SP001'),
('CTSP002','1','1000','7010000','MDH001','SP002'),
('CTSP003','1','4000','9010000','MDH002','SP003');
go



create trigger DEMO on ORDERS
FOR UPDATE, INSERT
AS
BEGIN
    PRINT'NHAP THANH CONG'
END
GO
INSERT INTO ORDERS VALUES
	('MDH001','20211020','VUVU','200000','MKH001','MaTT002');
GO
---------------------------------
SELECT	*from ORDERS
GO