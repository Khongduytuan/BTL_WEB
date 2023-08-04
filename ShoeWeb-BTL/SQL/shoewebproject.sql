CREATE DATABASE shoewebbtl
USE shoewebbtl;

CREATE TABLE [account] (
  [uID] INT IDENTITY(1,1) NOT NULL,
  [user] NVARCHAR(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [pass] NVARCHAR(45) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [isSell] INT NOT NULL,
  [isAdmin] INT NOT NULL,
  [name] NVARCHAR(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL,
  [address] NVARCHAR(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL,
  [phone] NVARCHAR(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT NULL,
  PRIMARY KEY ([uID])
);

BEGIN TRANSACTION;
INSERT INTO [account] VALUES ('admin','123456',1,1,'Admin','Admin','Admin'),
                             ('sell','123456',1,0,NULL,NULL,NULL),
                             ('hoangduong','123456',0,0,'Nguyen Hoang Duong','Bac Ninh, Viet Nam','0123456789'),
                             ('hoangduongnguyen','123456',0,0,'Nguyen Hoang Duong','Ha Dong, Ha Noi, Viet Nam','0123456789'),
                             ('abc','123456',0,0,NULL,NULL,NULL),
                             ('System','123',0,0,'Nguyen Van A','Thanh Xuan, Ha Noi','0123456789'),
                             ('khanh','1234',0,0,'Nguyen Van Khanh','Thanh Xuan, Ha Noi','0123456789'),
                             ('khanh2','123456789',0,0,'123456','123456','123456');

COMMIT TRANSACTION;

CREATE TABLE [cart] (
  [AccountID] INT NOT NULL PRIMARY KEY,
  [ProductID] INT NULL,
  [Amount] INT NULL
);

BEGIN TRANSACTION;
COMMIT TRANSACTION;

CREATE TABLE [category] (
  [cid] INT NOT NULL PRIMARY KEY,
  [cname] NVARCHAR(1000) NOT NULL
);

BEGIN TRANSACTION;
INSERT INTO [category] VALUES (1,'JORDAN'),(2,'NIKE AIR FORCE'),(3,'FOOTBAL');
COMMIT TRANSACTION;

CREATE TABLE [history] (
  [date] DATE NOT NULL,
  [user] NVARCHAR(45) NOT NULL,
  [product] NVARCHAR(45) NOT NULL,
  [quantity] NVARCHAR(45) NOT NULL,
  [totalprice] NVARCHAR(45) NOT NULL
);

BEGIN TRANSACTION;
INSERT INTO [history] VALUES ('2022-05-17','hoangduong','Jordan 1','1','180.0'),
                             ('2022-05-19','hoangduong','Nike  Premium','1','150.0'),
                             ('2022-05-19','hoangduong','Nike Shadow 2','1','160.0'),
                             ('2022-05-20','hoangduong','Nike Force','1','180.0');
COMMIT TRANSACTION;

CREATE TABLE [order] (
  [id] INT IDENTITY(14,1) NOT NULL PRIMARY KEY,
  [accountID] INT NOT NULL,
  [orderDate] NVARCHAR(255) NOT NULL
);

BEGIN TRANSACTION;
INSERT INTO [order] VALUES (2,'10/05/2022'),
                           (1,'test'),
                           (3,'2022-05-12T22:41:44.018923500'),
                           (3,'2022-05-12T22:59:51.919489100'),
                           (8,'2022-05-13T00:57:29.756701800'),
                           (3,'2022-05-13T11:27:23.740356'),
                           (1,'2022-05-13T15:43:12.106118100'),
                           (4,'2022-05-17T14:45:19.075291900'),
                           (3,'2022-05-17T15:53:49.668791900'),
                           (3,'2022-05-19T18:20:13.778947400'),
                           (3,'2022-05-19T18:21:36.510085900'),
                           (3,'2022-05-20T08:22:16.866512700');
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
('Nike','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f094af40-f82f-4fb9-a246-e031bf6fc411/air-force-1-07-shoe-NMmm1B.png',100,'Nike Air Force 1 ','The radiance lives on in the Nike Air Force 1 ', the b-ball icon that puts a fresh spin on what you know best: crisp leather, bold colours and the perfect amount of flash to make you shine.',2,2,49,'10-05-2022'),
('Nike 1','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/aee23c65-5ed1-4a07-aeff-180b2ad74c00/air-force-1-07-shoe-NMmm1B.png',120,'Nike Air Force 1 ','The radiance lives on in the Nike Air Force 1 ', the b-ball icon that puts a fresh spin on what you know best: crisp leather, bold colours and the perfect amount of flash to make you shine.',2,2,50,'10-05-2022'),
('Nike 2','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/64999541-d10f-4bc6-b0d3-5a143bbecf77/air-force-1-07-shoe-NMmm1B.png',130,'Nike Air Force 1 ','The radiance lives on in the Nike Air Force 1 ', the b-ball icon that puts a fresh spin on what you know best: crisp leather, bold colours and the perfect amount of flash to make you shine.',2,2,50,'10-05-2022'),
('Nike LV8 EMB','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/e28d2e35-8a74-49e7-996a-778a815fe065/air-force-1-07-lv8-emb-shoes-3qf7r1.png',140,'Nike Air Force 1 ','The radiance lives on with the b-ball original. Crossing hardwood comfort with off-court flair, it puts a fresh spin on what you know best: era-echoing, '80s construction, bold details and nothin\'-but-net style.',2,2,50,'10-05-2022'),
('Nike Shadow','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/21385d10-9b67-4719-907b-97e761874d3e/air-force-1-shadow-shoes-mN8Glx.png',150,'Nike Air Force 1 Shadow Green','The radiance lives on with the b-ball original. Crossing hardwood comfort with off-court flair, it puts a fresh spin on what you know best: era-echoing, '80s construction, bold details and nothin\'-but-net style.',2,2,50,'10-05-2022'),
('Nike Shadow 2','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/76976120-1c43-4b97-8e7e-251f0b9684e8/air-force-1-shadow-shoes-mN8Glx.png',160,'Nike Air Force 1 Shadow Pink','The radiance lives on with the b-ball original. Crossing hardwood comfort with off-court flair, it puts a fresh spin on what you know best: era-echoing, \'80s construction, bold details and nothin\'-but-net style.',2,2,49,'10-05-2022'),
('Nike Shadow 3','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/4621066a-6e19-49e5-a2d7-4e7e5eade298/air-force-1-shadow-shoes-mN8Glx.png',170,'Nike Air Force 1 Shadow','The radiance lives on with the b-ball original. Crossing hardwood comfort with off-court flair, it puts a fresh spin on what you know best: era-echoing, \'80s construction, bold details and nothin\'-but-net style.',2,2,50,'10-05-2022'),
('Nike  Premium','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/08105925-b788-48d7-8381-99257fcd0281/air-force-1-07-shoes-dbvfjQ.png',150,'Nike Air Force 1 ','The radiance lives on with the b-ball original. Crossing hardwood comfort with off-court flair, it puts a fresh spin on what you know best: era-echoing, \'80s construction, bold details and nothin\'-but-net style.',2,2,49,'10-05-2022'),
('Nike Force','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/22191d2e-0b52-49fc-9b68-c03edd91dad0/force-1-toggle-younger-shoe-BDVjjK.png',180,'Nike Force 1 Toggle','The radiance lives on with the b-ball original. Crossing hardwood comfort with off-court flair, it puts a fresh spin on what you know best: era-echoing, \'80s construction, bold details and nothin\'-but-net style.',2,2,49,'10-05-2022'),
('Jordan 1','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/9146f1f8-e561-4fd6-b1fc-d4ddcad66fed/air-jordan-1-shoes-d1vgvb.png',180,'Air Jordan 1','Shift into casual mode with the Air Jordan 1.Rich with iconic hoops heritage, the wardrobe staple steps up its game with GORE-TEX material and buttery nubuck leather overlays.A reflective Swoosh shines along the sides.',1,2,49,'10-05-2022'),
('Jordan MA2','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/eeffc3fb-b18d-4db4-966b-2629ed2a30c4/jordan-ma2-shoe-qw1Z6m.png',150,'Jordan MA2','Shift into casual mode with the Air Jordan 1.Rich with iconic hoops heritage, the wardrobe staple steps up its game with GORE-TEX material and buttery nubuck leather overlays.A reflective Swoosh shines along the sides.',1,2,50,'10-05-2022'),
('Jordan NFH','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/5b734c61-39ab-44b2-b18d-53963181f6d8/jordan-air-nfh-shoes-1msFvZ.png',165,'Jordan Air NFH','Shift into casual mode with the Air Jordan 1.Rich with iconic hoops heritage, the wardrobe staple steps up its game with GORE-TEX material and buttery nubuck leather overlays.A reflective Swoosh shines along the sides.',1,2,50,'10-05-2020'),
('Jordan Retro','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/eb4fd3e6-71cc-4a34-8b65-0f5dbba2a7b6/air-jordan-6-retro-shoes-4m3b9d.png',185,'Air Jordan 6 Retro','Shift into casual mode with the Air Jordan 1.Rich with iconic hoops heritage, the wardrobe staple steps up its game with GORE-TEX material and buttery nubuck leather overlays.A reflective Swoosh shines along the sides.',1,2,50,'10-05-2020'),
('Jordan SE','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6da91d9c-038b-4104-9f50-b6c50ade106e/air-jordan-1-mid-se-shoes-bwRXft.png',200,'Air Jordan 1 Mid SE','Shift into casual mode with the Air Jordan 1.Rich with iconic hoops heritage, the wardrobe staple steps up its game with GORE-TEX material and buttery nubuck leather overlays.A reflective Swoosh shines along the sides.',1,2,50,'10-05-2020'),
('Jordan Air','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/3c526174-8f08-41df-bf58-c0a158e74d35/jordan-air-nfh-bayou-shoe-3JqHmN.png',100,'Jordan Air NFH '','Shift into casual mode with the Air Jordan 1.Rich with iconic hoops heritage, the wardrobe staple steps up its game with GORE-TEX material and buttery nubuck leather overlays.A reflective Swoosh shines along the sides.',1,2,50,'2020-05-10'),
('Legend 9','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/022cde50-18e5-4b81-b63e-c71340a43e7f/tiempo-legend-9-academy-mg-multi-ground-football-boot-8Vvl8G.png',120,'Nike Tiempo Legend 9 Academy MG','1 of our lightest Tiempos to date, the Nike Tiempo Legend 9 Academy MG lets you go on the offensive with a low-profile design that\'s reinvented for attackers. The upper has raised textures backed by soft foam pods for precise dribbling, passing and shooting, while studs on the bottom provide traction for quick cuts and sudden stops.',3,2,50,'2020-05-10'),
('Phantom GT2','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0e089df8-44f3-49ce-ba75-825b0eab1bec/phantom-gt2-academy-mg-multi-ground-football-boot-Mnr9D7.png',100,'Nike Phantom GT2 Academy MG','The Nike Mercurial Vapor 14 Club elevates a classic with gold and silver accents for a look that\'s fit for champions. A grippy texture throughout the upper provides precise control when dribbling at higher speeds.',3,2,50,'2020-05-10'),
('Vapor 14','https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/67cfc9bf-4006-4e4a-958a-e82517199ce8/mercurial-vapor-14-club-mg-multi-ground-football-boots-6M4M03.png',120,'Nike Mercurial Vapor 14 Club MG','The Nike Mercurial Vapor 14 Club elevates a classic with gold and silver accents for a look that\'s fit for champions. A grippy texture throughout the upper provides precise control when dribbling at higher speeds.',3,2,50,'10-05-2022');
