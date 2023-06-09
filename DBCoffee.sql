USE [master]
GO
/****** Object:  Database [DBCoffee]    Script Date: 4/1/2023 10:04:10 ******/
CREATE DATABASE [DBCoffee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBCoffee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\DBCoffee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBCoffee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\DBCoffee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBCoffee] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBCoffee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBCoffee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBCoffee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBCoffee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBCoffee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBCoffee] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBCoffee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBCoffee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBCoffee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBCoffee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBCoffee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBCoffee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBCoffee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBCoffee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBCoffee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBCoffee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBCoffee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBCoffee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBCoffee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBCoffee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBCoffee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBCoffee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBCoffee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBCoffee] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBCoffee] SET  MULTI_USER 
GO
ALTER DATABASE [DBCoffee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBCoffee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBCoffee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBCoffee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBCoffee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBCoffee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBCoffee] SET QUERY_STORE = OFF
GO
USE [DBCoffee]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 4/1/2023 10:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id_bill] [int] NOT NULL,
	[id_customers] [int] NULL,
	[id_product] [int] NULL,
	[quantity] [nchar](10) NULL,
	[total_bill] [float] NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[id_bill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 4/1/2023 10:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id_customers] [int] NOT NULL,
	[customer_name] [nvarchar](50) NULL,
	[phone_number] [int] NULL,
	[password] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[id_customers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[details]    Script Date: 4/1/2023 10:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[details](
	[id_details] [int] NOT NULL,
	[id_customers] [int] NULL,
	[quantity] [int] NULL,
	[total_detail] [float] NULL,
	[date] [datetime] NULL,
	[id_product] [int] NULL,
 CONSTRAINT [PK_details] PRIMARY KEY CLUSTERED 
(
	[id_details] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 4/1/2023 10:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id_product] [int] NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[id_product_type] [int] NULL,
	[images] [nvarchar](50) NULL,
	[description] [nvarchar](1000) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products_type]    Script Date: 4/1/2023 10:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products_type](
	[id_product_type] [int] NOT NULL,
	[product_type_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_products_type] PRIMARY KEY CLUSTERED 
(
	[id_product_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[revenue]    Script Date: 4/1/2023 10:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[revenue](
	[id_revenue] [int] NOT NULL,
	[id_details] [int] NULL,
	[date] [date] NULL,
	[total_revenue] [float] NULL,
	[sum_quantity] [int] NULL,
 CONSTRAINT [PK_revenue] PRIMARY KEY CLUSTERED 
(
	[id_revenue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 4/1/2023 10:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id_user] [int] NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[customers] ([id_customers], [customer_name], [phone_number], [password], [address]) VALUES (1, N'11', 1, N'1', N'1')
GO
INSERT [dbo].[products] ([id_product], [product_name], [price], [id_product_type], [images], [description], [quantity]) VALUES (1, N'Cà phê trứng', 10000, 1, N'ca-phe-trung.jpg', N'Cà phê trứng là một loại thức uống thơm ngon có nguồn gốc xuất xứ từ những năm 1950 tại Hà Nội, mùi thơm đặc trưng của cà phê kết hợp với vị trứng béo ngậy đã làm nên 1 loại thức uống đặc biệt', 5)
INSERT [dbo].[products] ([id_product], [product_name], [price], [id_product_type], [images], [description], [quantity]) VALUES (2, N'Cappuccino', 30000, 1, N'cappuccino.jpg', N'Cappuchino là thức uống hòa quyện giữa hương thơm của sữa, vị béo của bọt kem cùng vị đậm đà từ cà phê Espresso. Tất cả tạo nên một hương vị đặc biệt, nhẹ nhàng, trầm lắng và tinh tế', 5)
INSERT [dbo].[products] ([id_product], [product_name], [price], [id_product_type], [images], [description], [quantity]) VALUES (3, N'Latte macchiato', 30000, 1, N'latte-macchiato.jpg', N'Latte macchiato là một loại đồ uống nóng rất được ưa chuộng. Thành phần gồm có cà phê espresso và sữa. Về cơ bản thì latte macchiatio giống như cà phê sữa, nhưng lượng sữa nhiều hơn', 5)
INSERT [dbo].[products] ([id_product], [product_name], [price], [id_product_type], [images], [description], [quantity]) VALUES (4, N'Cà phê đen nóng', 30000, 1, N'ca-phe-den.jpg', N'Không ngọt ngào như Bạc xỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng', 5)
INSERT [dbo].[products] ([id_product], [product_name], [price], [id_product_type], [images], [description], [quantity]) VALUES (5, N'Mocaccino', 40000, 1, N'mocaccino.jpg', N'Mocaccino được làm từ espresso và nữa nóng, nhưng được thêm mùi vị socola, thông thường được làm từ bột socola, nhưng ngày nay đa phần các biến thể được từ siro socola. Cà phê Mocaccino bao gồm socola đen hay socola sữa', 5)
INSERT [dbo].[products] ([id_product], [product_name], [price], [id_product_type], [images], [description], [quantity]) VALUES (6, N'Bạc xỉu đá', 18000, 1, N'bac-xiu-da.jpg', N'Bạc xỉu chính là "Ly sữa trắng kèm một chút cà phê". Thức uống này rất phù hợp những ai vừa muốn trải nghiệm chút vị đắng của cà phê vừa muốn thưởng thức vị ngọt béo ngậy từ sữa', 5)
INSERT [dbo].[products] ([id_product], [product_name], [price], [id_product_type], [images], [description], [quantity]) VALUES (7, N'Corretto', 19000, 1, N'Corretto.jpg', N'Caffè Corretto, một thức uống có cồn chứa caffein của Ý, bao gồm một tách cà phê espresso với một lượng nhỏ rượu, thường là grappa, và đôi khi là sambuca hoặc rượu mạnh. Nó còn được gọi là "cà phê espresso corretto"', 6)
INSERT [dbo].[products] ([id_product], [product_name], [price], [id_product_type], [images], [description], [quantity]) VALUES (8, N'Phin Sữa Đá', 40000, 1, N'phin-sua-da.jpg', N'Cà phê rang xay được chiết xuất chậm rãi từng giọt một thông qua dụng cụ lọc bằng kim loại có tên là ''Phin'', bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá, có hoặc không có sữa đặc.', 6)
GO
INSERT [dbo].[products_type] ([id_product_type], [product_type_name]) VALUES (1, N'Do uong')
INSERT [dbo].[products_type] ([id_product_type], [product_type_name]) VALUES (2, N'thuc an')
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_customers] FOREIGN KEY([id_customers])
REFERENCES [dbo].[customers] ([id_customers])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_customers]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_products]
GO
ALTER TABLE [dbo].[details]  WITH CHECK ADD  CONSTRAINT [FK_details_customers] FOREIGN KEY([id_customers])
REFERENCES [dbo].[customers] ([id_customers])
GO
ALTER TABLE [dbo].[details] CHECK CONSTRAINT [FK_details_customers]
GO
ALTER TABLE [dbo].[details]  WITH CHECK ADD  CONSTRAINT [FK_details_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[details] CHECK CONSTRAINT [FK_details_products]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_products_type] FOREIGN KEY([id_product_type])
REFERENCES [dbo].[products_type] ([id_product_type])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_products_type]
GO
ALTER TABLE [dbo].[revenue]  WITH CHECK ADD  CONSTRAINT [FK_revenue_details] FOREIGN KEY([id_details])
REFERENCES [dbo].[details] ([id_details])
GO
ALTER TABLE [dbo].[revenue] CHECK CONSTRAINT [FK_revenue_details]
GO
USE [master]
GO
ALTER DATABASE [DBCoffee] SET  READ_WRITE 
GO
