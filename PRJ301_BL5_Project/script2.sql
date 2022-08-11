--drop database PRJ301
--create database PRJ301
USE [PRJ301]

create table [dbo].[Role](
	[roleID] [int] primary key,
	[roleName] [nvarchar](50) NOT NULL
)

CREATE TABLE [dbo].[Account](
	[uID] [int] primary key IDENTITY(1,1),
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[role] [int] foreign key references Role
)

CREATE TABLE [dbo].[Category](
	[cID] [int] primary key,
	[cName] [nvarchar](50) NOT NULL
)

CREATE TABLE [dbo].[Product](
	[id] [int] identity(1,1) primary key,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] FOREIGN KEY REFERENCES Category(cID),
	[sellID] [int] FOREIGN KEY REFERENCES Account([uID])
)

create table [dbo].[Order](
	[orderID] [int] identity(1,1) primary key,
	[userID] [int] foreign key references Account([uID]),
	[discount] float,
	[total] float,	
	[status] varchar(100)
)

create table [dbo].[OrderDetail](
	[orderID] [int] foreign key references [Order]([orderID]),
	[productID] [int] foreign key references Product([id]),
	quantity int not null,
	price float
)

INSERT [dbo].[Role] ( [roleID],[roleName]) VALUES ( 0,N'user')
INSERT [dbo].[Role] ( [roleID],[roleName]) VALUES ( 1,N'seller')
INSERT [dbo].[Role] ( [roleID],[roleName]) VALUES ( 2,N'admin')

INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Casey', N'UCB7ZM', 1)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Anjolie', N'SNZ6HE', 2)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Ferris', N'RXH3XJ', 2)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Katell', N'HWV8ZN', 0)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Zahir', N'NPX7OF', 1)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Conan', N'WIZ5VZ', 1)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Cade', N'ZSW2LU', 0)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Micah', N'RVV5SR', 0)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Rowan', N'VAI6XR', 2)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Kirby', N'DNX6JK', 1)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Tanisha', N'XWU7JP', 2)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Howard', N'TSR5MR', 2)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Tana', N'EHS8CM', 0)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Hadassah', N'YOY7ZW', 0)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Echo', N'IGE8TN', 1)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Slade', N'OFO6QS', 0)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Devin', N'IBM6RZ', 1)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Rafael', N'WZA0IH', 0)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'Dominique', N'IKV0IX', 0)
INSERT [dbo].[Account] ([user], [pass], [role]) VALUES ( N'admin', N'123', 2)

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Linh Kiện PC')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Màn Hình')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Headsets & Bàn Phím')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Chuột & Lót Chuột')

INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Case Deepcool MATREXX 40 3FS', N'https://product.hstatic.net/1000026716/product/03_65c61865e13b469db0c9fde701ff54dd.jpg', 100.0, N'Case Deepcool MATREXX 40 3FS (3 fan RGB)', N'Tuy là case khá nhỏ gọn nhưng được hỗ trợ khả năng làm mát cực kỳ ấn tượng với ba quạt LED đi cùng. Cùng với đó case được trang bị một tấm kính cường lực mặt bên để tăng thêm tính thẩm mỹ của vỏ case.', 1,1)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Case XIGMATEK GEMINI II PINK 3FB', N'https://file.hstatic.net/1000026716/file/gearvn-case-xigmatek-gemini-ii-pink-3fb-premium-gaming-m-atx-1_e0d2bf8925df4ecdbe31568930b6eeed.png', 98.0, N'Case XIGMATEK GEMINI II PINK 3FB - PREMIUM GAMING M-ATX', N'Để tránh những va đập không đáng có lên các bộ phận máy tính bạn không thể không sở hữu case XIGMATEK GEMINI II Pink 3FB - PREMIUM GAMING M-ATX. Sản phẩm mang đến không gian tối ưu cho các linh kiện tương thích từ đó tạo ra không gian hoạt động phù hợp và gọn gàng nhất.', 1,5)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Màn hình ACER EK220Q', N'https://file.hstatic.net/1000026716/file/gearvn-man-hinh-acer-ek220q-22-75hz-1_96f7a0ee8ef643c393fefe2047cdfddc.png', 99.0, N'Màn hình ACER EK220Q 22" 75Hz', N'Bạn đang tìm kiếm một chiếc màn hình máy tính vừa hỗ trợ khả năng làm việc vừa có thể chiến game nhẹ nhàng. Thiết kế tinh tế, khả năng hiển thị sắc nét là tất cả những gì mà Acer EK220Q sở hữu.', 2,6)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Mainboard GIGABYTE Z690 AORUS ELITE AX DDR4 (rev. 1.0) V2', N'https://file.hstatic.net/1000026716/file/gearvn-gigabyte-z690-aorus-elite-ax-ddr4-_rev._1.0_-1_7ec5504e36a5435eb5cf199470c0b7ae_grande.png', 90.0, N'Mainboard GIGABYTE Z690 AORUS ELITE AX DDR4 (rev. 1.0)', N'Là một bo mạch chủ tầm trung cùng với thiết kế vương giả tăng tính quyền lực dàn PC của bạn. Vị vua mới của nền tảng chơi game tiếp tục được ra mắt bởi AORUS huyền thoại với việc cung cấp năng lượng mạnh mẽ nhất và thiết kế nhiệt chiếm ưu thế, được tôn vinh với công nghệ ép xung bộ nhớ hoàn chỉnh để giúp cho PC của bạn ổn định với hiệu suất tốt nhất của Alder Lake.', 1,10)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Màn hình Asus TUF GAMING VG249Q1A', N'https://file.hstatic.net/1000026716/file/gearvn-man-hinh-asus-tuf-vg249q1a-1_4c495743651e46b8a08389e75b615628.png', 110.0, N'Màn hình Asus TUF GAMING VG249Q1A 24" IPS 165Hz Gsync compatible chuyên game', N'Màn hình Asus TUF GAMING VG249Q1A rộng 23,8 inch, sử dụng tấm nền IPS độ phân giải Full HD (1920x1080) với tốc độ làm mới 165Hz cực nhanh. TUF VG249Q1R được thiết kế dành cho các game thủ chuyên nghiệp và những người chơi muốn hòa mình vào các trò chơi thực sự.', 2,15)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Bàn phím AKKO 3084 v2 RGB Black', N'https://file.hstatic.net/1000026716/file/gearvn-ban-phim-akko-3084-v2-rgb-black-1_4aa690d9419f4ffa961aade30ad74e19.png', 85.0, N'Bàn phím AKKO 3084 v2 RGB Black', N'AKKO 3084 v2 RGB Black là bàn phím cơ sở hữu nhiều ưu điểm từ thiết kế đến tính năng hoạt động.', 3,17)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Bàn phím AKKO 3068 v2 RGB White', N'https://file.hstatic.net/1000026716/file/gearvn-ban-phim-akko-3068-v2-rgb-white-2_15f16ece63c54efbb5e265c33fd4d5ac_grande.png', 85.0, N'Bàn phím AKKO 3068 v2 RGB White', N'AKKO 3068 v2 RGB White là dòng bàn phím AKKO thuộc series 3068 mới nhất. Đây là dòng bàn phím cơ sở hữu thiết kế nhỏ gọn với tone màu sang trọng và dễ dàng mang đi bất kỳ đâu thích hợp cho dân văn phòng và người dùng thích những góc máy chơi game, học tập theo phong cách "Minimal".', 3,1)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Chuột MSI Clutch GM08', N'https://file.hstatic.net/1000026716/file/gearvn-chuot-msi-clutch-gm08-1_87b7a9cecfb345d28b278ba4f7bbd9c5.png', 52.0, N'Chuột MSI Clutch GM08', N'Chuột gaming MSI Clutch GM08 sở hữu thiết kế gọn, nhẹ thuận tiện để game thủ dễ dàng thao tác trong mọi tựa game. Độ nhạy cao cho phép bạn di chuyển và nhắm mục tiêu một cách dễ dàng với sự nhanh nhẹn và chính xác.', 4,5)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Card màn hình ASUS Dual GeForce RTX 3060 V2 O12G GDDR6 (LHR)', N'https://file.hstatic.net/1000026716/file/dual-rtx3060-o12g-01_d8055b41e27047d0a876826d8ff73568.jpg', 77.0, N'Card màn hình ASUS Dual GeForce RTX 3060 V2 O12G GDDR6 (LHR)', N'Card màn hình Asus DUAL GeForce RTX 3060 O12G là sản phẩm mới nhất của nhà Asus thuộc dòng NVIDIA 3000 Series (bao gồm RTX 3060, RTX 3070, RTX 3080, RTX 3090). Khác với những người anh em của mình khi chỉ sở hữu 2 quạt cùng thiết kế nhỏ gọn, chiếc card màn hình này vẫn sở hữu cho mình một hiệu năng vô cùng đáng nể.', 1,6)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Màn hình ViewSonic VA2732-H', N'https://product.hstatic.net/1000026716/product/va2732-mh_f01_pc_h_cf324ffb0be84db4b7a0a78a56264cb5.jpg', 70.0, N' Màn hình ViewSonic VA2732-H 27" IPS 75Hz viền mỏng', N'Màn hình có độ phân giải Full HD 1920x1080 cho hiệu suất hình ảnh pixel-by-pixel không thể tin được. Bạn sẽ trải nghiệm độ rõ nét và chi tiết đáng kinh ngạc cho dù đang làm việc, chơi game hay tận hưởng những nội dung giải trí đa phương tiện mới nhất.', 2,10)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Bàn phím cơ AKKO 3108SP Pink Akko Switch V2', N'https://product.hstatic.net/1000026716/product/ban-phim-co-akko-3108sp-pink-02_29a97d3908584a7ab3d9f5f1c4e4644d.jpg', 86.0, N'Bàn phím AKKO 3108SP Pink Akko Switch V2', N'AKKO 3108SP Pink Akko Switch V2 là một trong những sản phẩm có thiết kế tối giản với màu hồng xinh xắn phù hợp với việc chơi game và làm việc hằng ngày.', 3,15)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Tai nghe Logitech G431', N'https://file.hstatic.net/1000026716/file/gearvn-tai-nghe-logitech-g431-1_bdeeca7d36d2404dad64276a86c0eb9d_grande.jpg', 51.0, N'Logitech G431 Headset', N'Âm thanh vòm DTS Headphone:X 2.0 thế hệ mới, sử dụng phần mềm G HUB của Logitech, cho phép bạn nghe thấy kẻ thù đang ẩn nấp phía sau, các tín hiệu khả năng đặc biệt và môi trường đắm chìm - tất cả xung quanh bạn. Trải nghiệm âm thanh 3D vượt xa các kênh 7.1 để khiến bạn cảm thấy như đang thực hiện hành động.', 3,17)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Chuột Razer Viper V2 Pro White', N'https://product.hstatic.net/1000026716/product/thumbtainghe_312cb0b8ffd24335b2f89e6ce98aae4f.png', 62.0, N'Chuột Razer Viper V2 Pro White', N'Razer vừa ra mắt chuột Viper V2 Pro, sản phẩm này nhẹ hơn 20% so với dòng Viper Ultimate trước đây. Thế hệ chuột gaming này của Razer có sự kết hợp của switch thế hệ mới, tuổi thọ pin tốt hơn và cảm biến quang học Focus Pro 30K.', 4,1)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Lót chuột Asus ROG Scabbard II', N'https://file.hstatic.net/1000026716/file/gearvn-lot-chuot-asus-rog-scabbard-ii-eva-edition-1_bdafe25610fb4f7cb6ff767a203c6e6b.png', 23.0, N'Lót chuột Asus ROG Scabbard II EVA Edition', N'ASUS ROG SCABBARD II tạo tiền đề cho những trận chiến hoành tráng nhất và những chiến thắng đáng kinh ngạc của bạn. Bàn di chuột chơi game mở rộng này cung cấp không gian rộng rãi cho bàn phím, chuột và các thiết bị chơi game khác của bạn, khiến nó trở thành khu vực tổ chức lý tưởng trước khi bạn tham gia trận chiến.', 4,5)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Tản nhiệt Cooler Master Hyper 212 ARGB', N'https://file.hstatic.net/1000026716/file/gearvn-tan-nhiet-cooler-master-hyper-212-argb-2_0bf72e02664f4c6d8045476f47d8e2af_grande.png', 36.0, N'Tản nhiệt Cooler Master Hyper 212 ARGB', N'Cánh quạt màu trắng mờ tăng cường cho phép phân tán ánh sáng sống động hơn, mang đến cho "công trình" của bạn độ sáng ngoạn mục phù hợp với cảm giác chơi game. Khả năng tương thích được chứng nhận với Bo mạch chủ Asus Aura, ASRock RGB, GIGABYTE và MSI RGB.', 1,6)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'CPU Intel Core i9 12900KS', N'https://product.hstatic.net/1000026716/product/preview_1_i9k_special_box_right_26064d1b0cdc48b1a81fef46b9804046.jpg', 64.0, N'Intel Core i9 12900KS / 3.4GHz Turbo 5.5GHz / 16 Nhân 24 Luồng / 30MB / LGA 1700', N'Một chiếc CPU vừa được ra mắt, được coi là phiên bản đặc biệt của tiền bối i9-12900K với cái tên Intel Core i9-12900KS.', 1,10)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Card màn hình GIGABYTE AORUS GeForce RTX 3080 Ti MASTER 12G', N'https://product.hstatic.net/1000026716/product/9_6e49d9aef75d4becbd682e507b727963.png', 101.0, N'Card màn hình GIGABYTE AORUS GeForce RTX 3080 Ti MASTER 12G', N'Card màn hình GIGABYTE AORUS GeForce RTX 3080 Ti MASTER 12G với thiết kế mạch tuyệt vời với vật liệu cao cấp, không chỉ tối đa hóa sự xuất sắc của GPU mà còn duy trì hoạt động ổn định và tuổi thọ cao. GeForce RTX ™ 3080 Ti với bộ nhớ 12 GB và băng thông bộ nhớ 912 GB / s có 10240 lõi CUDA®, lõi dò tia thế hệ thứ 2 và lõi tensor thế hệ thứ 3 hoạt động song song.', 1,15)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Tai nghe DareU EH925 Black Red RGB', N'https://file.hstatic.net/1000026716/file/gearvn-tai-nghe-dareu-eh925-black-red-rgb-1_6a82bd84a6814db19d54184fa37a3ea3.jpg', 32.0, N'Tai nghe DareU EH925 Black Red RGB', N'Tai nghe DareU EH925 7.1 RGB Black Red là chiếc tai nghe over-ear đến từ thương hiệu nổi lên với các phụ kiện gear giá rẻ như bàn phím cơ và chuột, ...', 3,17)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Chuột SteelSeries Aerox 5 Wireless', N'https://file.hstatic.net/1000026716/file/gearvn-chuot-steelseries-aerox-5-wireless_485475a51d074380ac41b624c9cf9ac5_grande.png', 49.0, N'Chuột SteelSeries Aerox 5 Wireless', N'SteelSeries Aerox 5 Wireless là một trong những sản phẩm gaming sở hữu thiết kế chuột công thái học mang đến cảm giác thoải mái cho người dùng trong nhiều giờ liền. Nếu bạn đang tìm cho giải pháp khi sử dụng chuột máy tính trong nhiều giờ liền mà không mỏi cổ tay thì đây sẽ là sự lựa chọn bạn không nên bỏ qua.', 4,1)
INSERT [dbo].[Product] ([name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (N'Màn hình cong ASUS TUF GAMING VG30VQL1A', N'https://product.hstatic.net/1000026716/product/tai_xuong__1__ca6a9e52dc37411a97d89d6f0bf74d3d.png', 123.0, N'Màn hình cong ASUS TUF GAMING VG30VQL1A 30" 200Hz 1ms HDR', N'Nếu bạn đang tìm cho mình chiếc màn hình gaming kích thước lớn với giả cả hợp lý thì ASUS TUF GAMING VG30VQL1A 30" 200Hz 1ms HDR chắc chắn sẽ làm hài lòng tất cả các điều kiện bạn đặt ra khi tìm một chiếc màn hình máy tính làm việc, chơi game, xem phim giải trí đỉnh cao.', 2,1)


select * from Account
select * from Product