CREATE DATABASE shoewebbtl
USE shoewebbtl;

CREATE TABLE [account] (
  [uID] INT IDENTITY(1,1) NOT NULL,
  [user] NVARCHAR(255) NOT NULL,
  [pass] NVARCHAR(45) NOT NULL,
  [isSell] INT NOT NULL,
  [isAdmin] INT NOT NULL,
  [name] NVARCHAR(255) DEFAULT NULL,
  [address] NVARCHAR(255) DEFAULT NULL,
  [phone] NVARCHAR(255) DEFAULT NULL,
  PRIMARY KEY ([uID])
);

                             
BEGIN TRANSACTION;
INSERT INTO [account] VALUES ('admin','123456',1,1,'Admin','Admin','Admin'),
                             ('sell','123456',1,0,NULL,NULL,NULL),
                             ('khongtuan','123456',0,0,'KhongDuy Tuan','Vinh Phuc, Viet Nam','0123456789'),
                             ('trile','123456',0,0,'Le Tri','Ha Dong, Ha Noi, Viet Nam','0123456789'),
                             ('abc','123456',0,0,NULL,NULL,NULL),
                             ('System','123',0,0,'Nguyen Van A','Thanh Xuan, Ha Noi','0123456789'),
                             ('hoangnguyen','1234',0,0,'Nguyen Hoang','Ha Noi','0123456789'),
                             ('quy','123456',0,0,'Nguyen Duc Quy','Thanh Hoa','123456');

COMMIT TRANSACTION;

CREATE TABLE [cart] (
  [AccountID] INT NOT NULL PRIMARY KEY,
  [ProductID] INT NULL,
  [Amount] INT NULL
);


CREATE TABLE [category] (
  [cid] INT NOT NULL PRIMARY KEY,
  [cname] NVARCHAR(1000) NOT NULL
);

BEGIN TRANSACTION;
INSERT INTO [category] VALUES (1,'Ao Phong'),(2,'Ao Polo'),(3,'Ao So mi');
COMMIT TRANSACTION;

CREATE TABLE [history] (
  [date] DATE NOT NULL,
  [user] NVARCHAR(45) NOT NULL,
  [product] NVARCHAR(45) NOT NULL,
  [quantity] NVARCHAR(45) NOT NULL,
  [totalprice] NVARCHAR(45) NOT NULL
);

BEGIN TRANSACTION;
INSERT INTO [history] VALUES ('2023-05-17','khongtuan','Ao phong size M','1','180.0'),
                             ('2023-05-19','khongtuan','Ao so mi size M','1','150.0'),
                             ('2023-05-19','trile','Ao Polo size M','1','160.0'),
                             ('2023-05-20','khongtuan','Ao phong size XL','1','180.0');
COMMIT TRANSACTION;

CREATE TABLE [order] (
  [id] INT IDENTITY(14,1) NOT NULL PRIMARY KEY,
  [accountID] INT NOT NULL,
  [orderDate] NVARCHAR(255) NOT NULL
);

BEGIN TRANSACTION;
INSERT INTO [order] VALUES (2,'10/05/2023'),
                           (1,'test'),
                           (3,'2023-05-12T22:41:44.018923500'),
                           (3,'2023-05-12T22:59:51.919489100'),
                           (8,'2023-05-13T00:57:29.756701800'),
                           (3,'2023-05-13T11:27:23.740356'),
                           (1,'2023-05-13T15:43:12.106118100'),
                           (4,'2023-05-17T14:45:19.075291900'),
                           (3,'2023-05-17T15:53:49.668791900'),
                           (3,'2023-05-19T18:20:13.778947400'),
                           (3,'2023-05-19T18:21:36.510085900'),
                           (3,'2023-05-20T08:22:16.866512700');
COMMIT TRANSACTION;

CREATE TABLE [orderdetail] (
  [id] INT IDENTITY(17,1) NOT NULL PRIMARY KEY,
  [orderID] INT NOT NULL,
  [productID] INT NOT NULL,
  [quantity] INT NOT NULL,
  [price] FLOAT NOT NULL
);

BEGIN TRANSACTION;
INSERT INTO [orderdetail] VALUES (4,1,1,100),
                                 (4,5,1,150),
                                 (5,1,2,100),
                                 (6,5,3,150),
                                 (6,6,1,160),
                                 (7,1,1,100),
                                 (8,1,1,100),
                                 (8,5,1,150),
                                 (8,9,1,180),
                                 (9,10,1,180),
                                 (9,11,1,150),
                                 (10,10,1,180),
                                 (11,1,1,100),
                                 (11,8,1,150),
                                 (12,6,1,160),
                                 (13,9,1,180);
COMMIT TRANSACTION;

CREATE TABLE [payments] (
  [id] INT IDENTITY(7,1) NOT NULL PRIMARY KEY,
  [order_id] NVARCHAR(255) NOT NULL,
  [thanh_vien] NVARCHAR(100) NOT NULL,
  [money] FLOAT NOT NULL,
  [note] NVARCHAR(255) NULL,
  [vnp_response_code] NVARCHAR(255) NOT NULL,
  [code_vnpay] NVARCHAR(255) NOT NULL,
  [code_bank] NVARCHAR(255) NOT NULL,
  [time] DATETIME NOT NULL
);

BEGIN TRANSACTION;
INSERT INTO [payments] VALUES ('742874161','abc',100000,'chinh chuyển khoản','00','13401455','NCB','2020-10-10 01:00:00'),
                               ('608324672','abc',1000000,'test chuyển khoản','00','13401811','NCB','2020-10-11 21:00:00'),
                               ('1134065293','CT2',150000,'học phí','00','13407163','NCB','2020-10-22 23:00:00'),
                               ('596509313','CT2',5000000,'học phí','00','13407176','NCB','2020-10-23 00:00:00'),
                               ('70267166','CT2',5000000,'học phí','00','13407178','NCB','2020-10-23 00:00:00'),
                               ('1672349048','CT1',150000,'học phí','00','13407729','NCB','2020-10-23 21:00:00');
COMMIT TRANSACTION;

CREATE TABLE [product] (
  [id] INT IDENTITY(22,1) NOT NULL PRIMARY KEY,
  [name] NVARCHAR(1000) NOT NULL,
  [image] NVARCHAR(4000) NOT NULL,
  [price] FLOAT NOT NULL,
  [title] NVARCHAR(1000) NOT NULL,
  [description] NVARCHAR(4000) NOT NULL,
  [cateID] INT NOT NULL,
  [sell_ID] INT NOT NULL,
  [quantity] INT NOT NULL,
  [date] NVARCHAR(100) NOT NULL
);

INSERT INTO [product] VALUES
('Ao so mi basic','https://product.hstatic.net/1000356017/product/z4321581633039_ab14a7bf60b4310440d32c257801c54b_138cc426e98441aaa71177a60e4942c3_grande.jpg',100,'Ao so mi basic','Ao so mi basic tre trung nang dong', 2,2,49,'04-08-2023'),
('Ao phong basic','https://boo.vn/media/catalog/product/cache/8d8fdfafaad87c521293245b3f6eed47/q/1/q1.jpg',120,'Ao phong basic','Tre trung nang dong, thoai mai',2,2,50,'04-08-2023'),
('Ao Polo basic','https://boo.vn/media/catalog/product/cache/8d8fdfafaad87c521293245b3f6eed47/q/1/q1.jpg',130,'Ao Polo basic','Phong cach, thoi thuong', 2,2,50,'04-08-2023');


