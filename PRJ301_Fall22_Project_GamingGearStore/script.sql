USE [master]
GO
/****** Object:  Database [PRJ301]    Script Date: 11/8/2022 2:07:25 PM ******/
CREATE DATABASE [PRJ301]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DATNGUYEN\MSSQL\DATA\PRJ301.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DATNGUYEN\MSSQL\DATA\PRJ301_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ301] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301', N'ON'
GO
ALTER DATABASE [PRJ301] SET QUERY_STORE = OFF
GO
USE [PRJ301]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/8/2022 2:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[role] [int] NULL,
 CONSTRAINT [PK__Account__DD771E3C408474E1] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/8/2022 2:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[uID] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[payment] [float] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[uID] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/8/2022 2:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cID] [int] NOT NULL,
	[cName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/8/2022 2:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NULL,
	[shipDate] [date] NULL,
	[uID] [int] NULL,
	[payment] [float] NULL,
	[shipping] [float] NULL,
	[total] [float] NULL,
	[status] [varchar](20) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 11/8/2022 2:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[orderID] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_OrdersDetail] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/8/2022 2:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sellID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/8/2022 2:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storage]    Script Date: 11/8/2022 2:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[pid] [int] NOT NULL,
	[num_left] [int] NOT NULL,
 CONSTRAINT [PK_Storage] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (1, N'A', N'123', N'HN        ', N'012312', N'asd@gmail.com', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (2, N'B', N'123', N'HN        ', N'0913725   ', N'asd@gmail.com', 2)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (3, N'C', N'123', N'HN        ', N'2097405   ', N'asd@gmail.com', 2)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (4, N'D', N'123', N'HN        ', N'09565065  ', N'asd@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (5, N'E', N'123', N'HCM       ', N'06565095  ', N'asd@gmail.com', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (6, N'F', N'123', N'HCM       ', N'00590565  ', N'asd@gmail.com', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (7, N'G', N'123', N'HCM       ', N'05260959  ', N'asd@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (8, N'H', N'123', N'HCM       ', N'00059590  ', N'asd@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (9, N'I', N'123', N'HN        ', N'05960590  ', N'asd@gmail.com', 2)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (10, N'J', N'123', N'HN        ', N'095200959 ', N'asd@gmail.com', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (11, N'K', N'123', N'HN        ', N'09590909  ', N'asd@gmail.com', 2)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (12, N'L', N'123', N'HN        ', N'09095900  ', N'asd@gmail.com', 2)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (13, N'M', N'123', N'HCM       ', N'0959009   ', N'asd@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (14, N'N', N'123', N'HN        ', N'09095959  ', N'asd@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (15, N'O', N'123', N'HCM       ', N'065989    ', N'asd@gmail.com', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (16, N'P', N'123', N'HCM       ', N'09590994  ', N'asd@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (17, N'Q', N'123', N'HN        ', N'0659565+  ', N'asd@gmail.com', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (18, N'R', N'123', N'HN        ', N'0230163   ', N'asd@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (19, N'S', N'123', N'HN        ', N'102320    ', N'asd@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (20, N'admin', N'123', N'HN        ', N'31656214  ', N'asd@gmail.com', 2)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (21, N'admin123', N'123', N'HN        ', N'6540645   ', N'asd@gmail.com', 2)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (22, N'datnc', N'123', N'HN        ', N'0656464   ', N'asd@gmail.com', 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [address], [phone], [email], [role]) VALUES (30, N'sale manager', N'123', N'HCM', N'0506546   ', N'asd@gmail.com', 3)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([cID], [cName]) VALUES (1, N'Linh Kiện PC')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (2, N'Case')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (3, N'Màn Hình')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (4, N'Tai Nghe')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (5, N'Bàn Phím')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (6, N'Chuột')
INSERT [dbo].[Category] ([cID], [cName]) VALUES (7, N'Lót chuột')
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [uID], [payment], [shipping], [total], [status]) VALUES (1, CAST(N'2022-11-08' AS Date), CAST(N'2022-11-13' AS Date), 22, 98, 0.49, 98.49, N'delivering')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [uID], [payment], [shipping], [total], [status]) VALUES (2, CAST(N'2022-11-08' AS Date), CAST(N'2022-11-13' AS Date), 22, 3332, 6.66, 3338.66, N'delivering')
INSERT [dbo].[Orders] ([orderID], [orderDate], [shipDate], [uID], [payment], [shipping], [total], [status]) VALUES (3, CAST(N'2022-11-08' AS Date), CAST(N'2022-11-13' AS Date), 30, 200, 0.4, 200.4, N'delivering')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (1, N'Case Deepcool MATREXX 40 3FS', N'https://product.hstatic.net/1000026716/product/03_65c61865e13b469db0c9fde701ff54dd.jpg', 100.0000, N'Case Deepcool MATREXX 40 3FS (3 fan RGB)', N'Tuy là case khá nhỏ gọn nhưng được hỗ trợ khả năng làm mát cực kỳ ấn tượng với ba quạt LED đi cùng. Cùng với đó case được trang bị một tấm kính cường lực mặt bên để tăng thêm tính thẩm mỹ của vỏ case.', 2, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (2, N'Case XIGMATEK GEMINI II PINK 3FB', N'https://file.hstatic.net/1000026716/file/gearvn-case-xigmatek-gemini-ii-pink-3fb-premium-gaming-m-atx-1_e0d2bf8925df4ecdbe31568930b6eeed.png', 98.0000, N'Case XIGMATEK GEMINI II PINK 3FB - PREMIUM GAMING M-ATX', N'Để tránh những va đập không đáng có lên các bộ phận máy tính bạn không thể không sở hữu case XIGMATEK GEMINI II Pink 3FB - PREMIUM GAMING M-ATX. Sản phẩm mang đến không gian tối ưu cho các linh kiện tương thích từ đó tạo ra không gian hoạt động phù hợp và gọn gàng nhất.', 2, 5)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (3, N'Màn hình ACER EK220Q', N'https://file.hstatic.net/1000026716/file/gearvn-man-hinh-acer-ek220q-22-75hz-1_96f7a0ee8ef643c393fefe2047cdfddc.png', 99.0000, N'Màn hình ACER EK220Q 22" 75Hz', N'Bạn đang tìm kiếm một chiếc màn hình máy tính vừa hỗ trợ khả năng làm việc vừa có thể chiến game nhẹ nhàng. Thiết kế tinh tế, khả năng hiển thị sắc nét là tất cả những gì mà Acer EK220Q sở hữu.', 3, 6)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (4, N'Mainboard GIGABYTE Z690 AORUS ELITE AX DDR4 (rev. 1.0) V2', N'https://file.hstatic.net/1000026716/file/gearvn-gigabyte-z690-aorus-elite-ax-ddr4-_rev._1.0_-1_7ec5504e36a5435eb5cf199470c0b7ae_grande.png', 90.0000, N'Mainboard GIGABYTE Z690 AORUS ELITE AX DDR4 (rev. 1.0)', N'Là một bo mạch chủ tầm trung cùng với thiết kế vương giả tăng tính quyền lực dàn PC của bạn. Vị vua mới của nền tảng chơi game tiếp tục được ra mắt bởi AORUS huyền thoại với việc cung cấp năng lượng mạnh mẽ nhất và thiết kế nhiệt chiếm ưu thế, được tôn vinh với công nghệ ép xung bộ nhớ hoàn chỉnh để giúp cho PC của bạn ổn định với hiệu suất tốt nhất của Alder Lake.', 1, 10)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (5, N'Màn hình Asus TUF GAMING VG249Q1A', N'https://file.hstatic.net/1000026716/file/gearvn-man-hinh-asus-tuf-vg249q1a-1_4c495743651e46b8a08389e75b615628.png', 110.0000, N'Màn hình Asus TUF GAMING VG249Q1A 24" IPS 165Hz Gsync compatible chuyên game', N'Màn hình Asus TUF GAMING VG249Q1A rộng 23,8 inch, sử dụng tấm nền IPS độ phân giải Full HD (1920x1080) với tốc độ làm mới 165Hz cực nhanh. TUF VG249Q1R được thiết kế dành cho các game thủ chuyên nghiệp và những người chơi muốn hòa mình vào các trò chơi thực sự.', 3, 15)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (6, N'Bàn phím AKKO 3084 v2 RGB Black', N'https://file.hstatic.net/1000026716/file/gearvn-ban-phim-akko-3084-v2-rgb-black-1_4aa690d9419f4ffa961aade30ad74e19.png', 85.0000, N'Bàn phím AKKO 3084 v2 RGB Black', N'AKKO 3084 v2 RGB Black là bàn phím cơ sở hữu nhiều ưu điểm từ thiết kế đến tính năng hoạt động.', 5, 17)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (7, N'Bàn phím AKKO 3068 v2 RGB White', N'https://file.hstatic.net/1000026716/file/gearvn-ban-phim-akko-3068-v2-rgb-white-2_15f16ece63c54efbb5e265c33fd4d5ac_grande.png', 85.0000, N'Bàn phím AKKO 3068 v2 RGB White', N'AKKO 3068 v2 RGB White là dòng bàn phím AKKO thuộc series 3068 mới nhất. Đây là dòng bàn phím cơ sở hữu thiết kế nhỏ gọn với tone màu sang trọng và dễ dàng mang đi bất kỳ đâu thích hợp cho dân văn phòng và người dùng thích những góc máy chơi game, học tập theo phong cách "Minimal".', 5, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (8, N'Chuột MSI Clutch GM08', N'https://file.hstatic.net/1000026716/file/gearvn-chuot-msi-clutch-gm08-1_87b7a9cecfb345d28b278ba4f7bbd9c5.png', 52.0000, N'Chuột MSI Clutch GM08', N'Chuột gaming MSI Clutch GM08 sở hữu thiết kế gọn, nhẹ thuận tiện để game thủ dễ dàng thao tác trong mọi tựa game. Độ nhạy cao cho phép bạn di chuyển và nhắm mục tiêu một cách dễ dàng với sự nhanh nhẹn và chính xác.', 6, 5)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (9, N'Card màn hình ASUS Dual GeForce RTX 3060 V2 O12G GDDR6 (LHR)', N'https://file.hstatic.net/1000026716/file/dual-rtx3060-o12g-01_d8055b41e27047d0a876826d8ff73568.jpg', 77.0000, N'Card màn hình ASUS Dual GeForce RTX 3060 V2 O12G GDDR6 (LHR)', N'Card màn hình Asus DUAL GeForce RTX 3060 O12G là sản phẩm mới nhất của nhà Asus thuộc dòng NVIDIA 3000 Series (bao gồm RTX 3060, RTX 3070, RTX 3080, RTX 3090). Khác với những người anh em của mình khi chỉ sở hữu 2 quạt cùng thiết kế nhỏ gọn, chiếc card màn hình này vẫn sở hữu cho mình một hiệu năng vô cùng đáng nể.', 1, 6)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (10, N'Màn hình ViewSonic VA2732-H', N'https://product.hstatic.net/1000026716/product/va2732-mh_f01_pc_h_cf324ffb0be84db4b7a0a78a56264cb5.jpg', 70.0000, N' Màn hình ViewSonic VA2732-H 27" IPS 75Hz viền mỏng', N'Màn hình có độ phân giải Full HD 1920x1080 cho hiệu suất hình ảnh pixel-by-pixel không thể tin được. Bạn sẽ trải nghiệm độ rõ nét và chi tiết đáng kinh ngạc cho dù đang làm việc, chơi game hay tận hưởng những nội dung giải trí đa phương tiện mới nhất.', 3, 10)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (11, N'Bàn phím cơ AKKO 3108SP Pink Akko Switch V2', N'https://product.hstatic.net/1000026716/product/ban-phim-co-akko-3108sp-pink-02_29a97d3908584a7ab3d9f5f1c4e4644d.jpg', 86.0000, N'Bàn phím AKKO 3108SP Pink Akko Switch V2', N'AKKO 3108SP Pink Akko Switch V2 là một trong những sản phẩm có thiết kế tối giản với màu hồng xinh xắn phù hợp với việc chơi game và làm việc hằng ngày.', 5, 15)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (12, N'Tai nghe Logitech G431', N'https://file.hstatic.net/1000026716/file/gearvn-tai-nghe-logitech-g431-1_bdeeca7d36d2404dad64276a86c0eb9d_grande.jpg', 51.0000, N'Logitech G431 Headset', N'Âm thanh vòm DTS Headphone:X 2.0 thế hệ mới, sử dụng phần mềm G HUB của Logitech, cho phép bạn nghe thấy kẻ thù đang ẩn nấp phía sau, các tín hiệu khả năng đặc biệt và môi trường đắm chìm - tất cả xung quanh bạn. Trải nghiệm âm thanh 3D vượt xa các kênh 7.1 để khiến bạn cảm thấy như đang thực hiện hành động.', 4, 17)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (13, N'Chuột Razer Viper V2 Pro White', N'https://product.hstatic.net/1000026716/product/thumbtainghe_312cb0b8ffd24335b2f89e6ce98aae4f.png', 62.0000, N'Chuột Razer Viper V2 Pro White', N'Razer vừa ra mắt chuột Viper V2 Pro, sản phẩm này nhẹ hơn 20% so với dòng Viper Ultimate trước đây. Thế hệ chuột gaming này của Razer có sự kết hợp của switch thế hệ mới, tuổi thọ pin tốt hơn và cảm biến quang học Focus Pro 30K.', 6, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (14, N'Lót chuột Asus ROG Scabbard II', N'https://file.hstatic.net/1000026716/file/gearvn-lot-chuot-asus-rog-scabbard-ii-eva-edition-1_bdafe25610fb4f7cb6ff767a203c6e6b.png', 23.0000, N'Lót chuột Asus ROG Scabbard II EVA Edition', N'ASUS ROG SCABBARD II tạo tiền đề cho những trận chiến hoành tráng nhất và những chiến thắng đáng kinh ngạc của bạn. Bàn di chuột chơi game mở rộng này cung cấp không gian rộng rãi cho bàn phím, chuột và các thiết bị chơi game khác của bạn, khiến nó trở thành khu vực tổ chức lý tưởng trước khi bạn tham gia trận chiến.', 7, 5)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (15, N'Tản nhiệt Cooler Master Hyper 212 ARGB', N'https://file.hstatic.net/1000026716/file/gearvn-tan-nhiet-cooler-master-hyper-212-argb-2_0bf72e02664f4c6d8045476f47d8e2af_grande.png', 36.0000, N'Tản nhiệt Cooler Master Hyper 212 ARGB', N'Cánh quạt màu trắng mờ tăng cường cho phép phân tán ánh sáng sống động hơn, mang đến cho "công trình" của bạn độ sáng ngoạn mục phù hợp với cảm giác chơi game. Khả năng tương thích được chứng nhận với Bo mạch chủ Asus Aura, ASRock RGB, GIGABYTE và MSI RGB.', 1, 6)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (16, N'CPU Intel Core i9 12900KS', N'https://product.hstatic.net/1000026716/product/preview_1_i9k_special_box_right_26064d1b0cdc48b1a81fef46b9804046.jpg', 64.0000, N'Intel Core i9 12900KS / 3.4GHz Turbo 5.5GHz / 16 Nhân 24 Luồng / 30MB / LGA 1700', N'Một chiếc CPU vừa được ra mắt, được coi là phiên bản đặc biệt của tiền bối i9-12900K với cái tên Intel Core i9-12900KS.', 1, 10)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (17, N'Card màn hình GIGABYTE AORUS GeForce RTX 3080 Ti MASTER 12G', N'https://product.hstatic.net/1000026716/product/9_6e49d9aef75d4becbd682e507b727963.png', 101.0000, N'Card màn hình GIGABYTE AORUS GeForce RTX 3080 Ti MASTER 12G', N'Card màn hình GIGABYTE AORUS GeForce RTX 3080 Ti MASTER 12G với thiết kế mạch tuyệt vời với vật liệu cao cấp, không chỉ tối đa hóa sự xuất sắc của GPU mà còn duy trì hoạt động ổn định và tuổi thọ cao. GeForce RTX ™ 3080 Ti với bộ nhớ 12 GB và băng thông bộ nhớ 912 GB / s có 10240 lõi CUDA®, lõi dò tia thế hệ thứ 2 và lõi tensor thế hệ thứ 3 hoạt động song song.', 1, 15)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (18, N'Tai nghe DareU EH925 Black Red RGB', N'https://file.hstatic.net/1000026716/file/gearvn-tai-nghe-dareu-eh925-black-red-rgb-1_6a82bd84a6814db19d54184fa37a3ea3.jpg', 32.0000, N'Tai nghe DareU EH925 Black Red RGB', N'Tai nghe DareU EH925 7.1 RGB Black Red là chiếc tai nghe over-ear đến từ thương hiệu nổi lên với các phụ kiện gear giá rẻ như bàn phím cơ và chuột, ...', 4, 17)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (19, N'Chuột SteelSeries Aerox 5 Wireless', N'https://file.hstatic.net/1000026716/file/gearvn-chuot-steelseries-aerox-5-wireless_485475a51d074380ac41b624c9cf9ac5_grande.png', 49.0000, N'Chuột SteelSeries Aerox 5 Wireless', N'SteelSeries Aerox 5 Wireless là một trong những sản phẩm gaming sở hữu thiết kế chuột công thái học mang đến cảm giác thoải mái cho người dùng trong nhiều giờ liền. Nếu bạn đang tìm cho giải pháp khi sử dụng chuột máy tính trong nhiều giờ liền mà không mỏi cổ tay thì đây sẽ là sự lựa chọn bạn không nên bỏ qua.', 6, 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (20, N'Màn hình cong ASUS TUF GAMING VG30VQL1A', N'https://product.hstatic.net/1000026716/product/tai_xuong__1__ca6a9e52dc37411a97d89d6f0bf74d3d.png', 120.0000, N'Màn hình cong ASUS TUF GAMING VG30VQL1A 30" 200Hz 1ms HDR', N'Nếu bạn đang tìm cho mình chiếc màn hình gaming kích thước lớn với giả cả hợp lý thì ASUS TUF GAMING VG30VQL1A 30" 200Hz 1ms HDR chắc chắn sẽ làm hài lòng tất cả các điều kiện bạn đặt ra khi tìm một chiếc màn hình máy tính làm việc, chơi game, xem phim giải trí đỉnh cao.', 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (0, N'user')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (1, N'seller')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (2, N'admin')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (3, N'sale manager')
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__role__267ABA7A] FOREIGN KEY([role])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__role__267ABA7A]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([uID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([uID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetail_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrdersDetail_Orders]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetail_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrdersDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__sellID__2C3393D0] FOREIGN KEY([sellID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__sellID__2C3393D0]
GO
ALTER TABLE [dbo].[Storage]  WITH CHECK ADD  CONSTRAINT [FK_Storage_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Storage] CHECK CONSTRAINT [FK_Storage_Product]
GO
USE [master]
GO
ALTER DATABASE [PRJ301] SET  READ_WRITE 
GO
