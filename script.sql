USE [master]
GO
DROP DATABASE IF EXISTS NestF
/****** Object:  Database [NestF]    Script Date: 11/13/2022 11:34:27 AM ******/
CREATE DATABASE [NestF]
GO
ALTER DATABASE [NestF] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NestF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NestF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NestF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NestF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NestF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NestF] SET ARITHABORT OFF 
GO
ALTER DATABASE [NestF] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NestF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NestF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NestF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NestF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NestF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NestF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NestF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NestF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NestF] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NestF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NestF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NestF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NestF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NestF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NestF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NestF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NestF] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NestF] SET  MULTI_USER 
GO
ALTER DATABASE [NestF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NestF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NestF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NestF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NestF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NestF] SET QUERY_STORE = OFF
GO
USE [NestF]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[phone] [char](10) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[gender] [bit] NOT NULL,
	[point] [int] NOT NULL,
	[role] [char](2) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBill]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBill](
	[billID] [int] IDENTITY(1,1) NOT NULL,
	[cusPhone] [char](10) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[transactionID] [varchar](50) NOT NULL,
	[statusID] [int] NOT NULL,
	[time] [datetime] NOT NULL,
	[total] [float] NOT NULL,
	[cancelReason] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblBill] PRIMARY KEY CLUSTERED 
(
	[billID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBillDetail]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBillDetail](
	[billDetailID] [int] IDENTITY(1,1) NOT NULL,
	[billID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[total] [decimal](18, 0) NOT NULL,
	[selPhone] [char](10) NOT NULL,
 CONSTRAINT [PK_tblBillDetail] PRIMARY KEY CLUSTERED 
(
	[billDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCart]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCart](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[cusPhone] [char](10) NOT NULL,
	[productID] [int] NOT NULL,
	[amount] [int] NOT NULL,
 CONSTRAINT [PK_tblCart] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblProductType] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedbacks]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedbacks](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NULL,
	[cusPhone] [char](10) NULL,
	[comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblFeedbacks] PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIncome]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIncome](
	[incomeID] [int] IDENTITY(1,1) NOT NULL,
	[selPhone] [char](10) NULL,
	[date] [date] NULL,
	[total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tblIncome] PRIMARY KEY CLUSTERED 
(
	[incomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPost]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPost](
	[postID] [int] IDENTITY(1,1) NOT NULL,
	[adPhone] [char](10) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[postDate] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[thumbnail] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblPost] PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryID] [int] NOT NULL,
	[discountPrice] [float] NOT NULL,
	[productDes] [nvarchar](max) NULL,
	[image] [nvarchar](max) NOT NULL,
	[status] [bit] NOT NULL,
	[detailDes] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductSeller]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductSeller](
	[productSellerID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NOT NULL,
	[selPhone] [char](10) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_tblProductSeller] PRIMARY KEY CLUSTERED 
(
	[productSellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVoucher]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVoucher](
	[voucherID] [int] IDENTITY(1,1) NOT NULL,
	[typeID] [int] NOT NULL,
	[cusPhone] [char](10) NOT NULL,
	[status] [bit] NOT NULL,
	[expiredDate] [date] NOT NULL,
 CONSTRAINT [PK_tblVoucher] PRIMARY KEY CLUSTERED 
(
	[voucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVoucherType]    Script Date: 11/13/2022 11:34:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVoucherType](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[voucherName] [nvarchar](50) NOT NULL,
	[saleValue] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[point] [int] NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblVoucherType] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAccount] ([phone], [password], [name], [address], [gender], [point], [role], [status]) VALUES (N'0869274367', N'123456', N'Mạnh Toàn', N'123 Long Thạnh Mỹ TP HCM', 0, 0, N'US', 1)
INSERT [dbo].[tblAccount] ([phone], [password], [name], [address], [gender], [point], [role], [status]) VALUES (N'0988123123', N'123123', N'Đức Duy', N'123 Nguyễn Văn Tăng', 0, 0, N'SE', 1)
INSERT [dbo].[tblAccount] ([phone], [password], [name], [address], [gender], [point], [role], [status]) VALUES (N'0988222222', N'123456', N'Phạm Công', N'456 Nguyễn Văn Tăng', 1, 0, N'SE', 1)
INSERT [dbo].[tblAccount] ([phone], [password], [name], [address], [gender], [point], [role], [status]) VALUES (N'0988333333', N'123456', N'Nguyễn Toàn', N'789 Nguyễn Văn Tăng', 0, 0, N'SE', 1)
INSERT [dbo].[tblAccount] ([phone], [password], [name], [address], [gender], [point], [role], [status]) VALUES (N'0988444444', N'123456', N'Phạm Phúc Thành Công', N'111 Nguyễn Văn Tăng', 0, 81000, N'US', 1)
INSERT [dbo].[tblAccount] ([phone], [password], [name], [address], [gender], [point], [role], [status]) VALUES (N'0988555555', N'123456', N'Nguyễn Đình Tiến', N'222 Nguyễn Văn Tăng', 1, 500000, N'US', 1)
INSERT [dbo].[tblAccount] ([phone], [password], [name], [address], [gender], [point], [role], [status]) VALUES (N'0988666666', N'123456', N'Phan Đức Duy', N'333 Nguyễn Văn Tăng', 1, 150000, N'US', 1)
INSERT [dbo].[tblAccount] ([phone], [password], [name], [address], [gender], [point], [role], [status]) VALUES (N'0988777777', N'123456', N'Đinh Tuấn Dũng', N'444 Nguyễn Văn Tăng', 0, 10000, N'US', 1)
INSERT [dbo].[tblAccount] ([phone], [password], [name], [address], [gender], [point], [role], [status]) VALUES (N'0988999999', N'123123', N'Nguyễn Đình Tiến', N'Hoàng Diệu 2', 0, 0, N'AD', 1)
GO
SET IDENTITY_INSERT [dbo].[tblBill] ON 

INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (12, N'0988444444', N'111 Nguyễn Văn Tăng', N'2UX72135UR359060N', 4, CAST(N'2022-09-11T21:28:59.137' AS DateTime), 7200000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (13, N'0988444444', N'111 Nguyễn Văn Tăng', N'2TD40443KV3689746', 4, CAST(N'2022-09-12T21:31:52.347' AS DateTime), 6570000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (14, N'0988444444', N'111 Nguyễn Văn Tăng', N'34J85265L1172721M', 5, CAST(N'2022-10-11T21:36:17.383' AS DateTime), 4250000, N'Muốn thay đổi sản phẩm trong đơn hàng')
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (15, N'0988555555', N'222 Nguyễn Văn Tăng', N'6WR59176RV348745D', 5, CAST(N'2022-10-11T21:37:32.007' AS DateTime), 9800000, N'Đổi ý, không muốn mua nữa')
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (16, N'0988555555', N'222 Nguyễn Văn Tăng', N'1XN56842SG290970J', 4, CAST(N'2022-10-12T21:38:11.367' AS DateTime), 7240000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (17, N'0988777777', N'444 Nguyễn Văn Tăng', N'62703850DC7779845', 4, CAST(N'2022-10-13T21:39:33.160' AS DateTime), 19520000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (18, N'0988777777', N'444 Nguyễn Văn Tăng', N'9HT73222E60240509', 4, CAST(N'2022-10-13T00:00:00.000' AS DateTime), 5850000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (19, N'0988777777', N'444 Nguyễn Văn Tăng', N'0NE59990J19699611', 4, CAST(N'2022-10-14T00:00:00.000' AS DateTime), 10050000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (20, N'0988666666', N'333 Nguyễn Văn Tăng', N'48C61594WW816021K', 4, CAST(N'2022-10-14T00:00:00.000' AS DateTime), 3950000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (21, N'0988444444', N'123 Nguyễn Văn Tăng', N'48A88316UF642741F', 3, CAST(N'2022-10-15T00:00:00.000' AS DateTime), 12300000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (22, N'0988444444', N'123 Nguyễn Văn Tăng', N'86723808BF947031X', 3, CAST(N'2022-10-16T00:00:00.000' AS DateTime), 6120000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (23, N'0988444444', N'123 Nguyễn Văn Tăng', N'31555357CD695010R', 4, CAST(N'2022-10-17T11:49:29.340' AS DateTime), 6640000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (24, N'0988444444', N'123 Nguyễn Văn Tăng', N'2GT067306W6401836', 4, CAST(N'2022-10-20T11:49:57.140' AS DateTime), 6650000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (25, N'0988444444', N'123 Nguyễn Văn Tăng', N'9F613775WM2193453', 3, CAST(N'2022-11-01T11:51:14.837' AS DateTime), 2020000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (26, N'0988444444', N'123 Nguyễn Văn Tăng', N'4CC16343EL310173N', 4, CAST(N'2022-11-01T11:51:38.290' AS DateTime), 9950000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (27, N'0988444444', N'123 Nguyễn Văn Tăng', N'03S89289B5934953R', 4, CAST(N'2022-11-01T12:25:25.933' AS DateTime), 2550000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (28, N'0988444444', N'123 Nguyễn Văn Tăng', N'7CB61990Y3415694N', 3, CAST(N'2022-11-03T13:11:01.780' AS DateTime), 6240000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (29, N'0988444444', N'123 Nguyễn Văn Tăng', N'4JJ17827WG5950222', 3, CAST(N'2022-11-04T13:11:43.997' AS DateTime), 13400000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (30, N'0988444444', N'123 Nguyễn Văn Tăng', N'8TY71897JY939743F', 4, CAST(N'2022-11-04T13:12:36.493' AS DateTime), 6330000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (31, N'0988444444', N'123 Nguyễn Văn Tăng', N'9F433160NU218314N', 1, CAST(N'2022-11-07T13:13:53.387' AS DateTime), 6450000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (32, N'0988444444', N'123 Nguyễn Văn Tăng', N'5A1824507Y6134432', 3, CAST(N'2022-11-07T13:14:29.823' AS DateTime), 5660000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (33, N'0988444444', N'123 Nguyễn Văn Tăng', N'2JJ9450195045940R', 2, CAST(N'2022-11-11T13:17:40.657' AS DateTime), 5690000, NULL)
INSERT [dbo].[tblBill] ([billID], [cusPhone], [address], [transactionID], [statusID], [time], [total], [cancelReason]) VALUES (34, N'0988444444', N'123 Nguyễn Văn Tăng', N'4A6282691N905882U', 4, CAST(N'2022-11-13T13:44:04.437' AS DateTime), 6840000, NULL)
SET IDENTITY_INSERT [dbo].[tblBill] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBillDetail] ON 

INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (1, 12, 3, 2, 3600000, CAST(7200000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (2, 13, 10, 1, 650000, CAST(650000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (3, 13, 7, 1, 5200000, CAST(5200000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (4, 13, 11, 1, 720000, CAST(720000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (5, 14, 13, 1, 650000, CAST(650000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (6, 14, 3, 1, 3600000, CAST(3600000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (7, 15, 4, 1, 3950000, CAST(3950000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (8, 15, 7, 1, 5200000, CAST(5200000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (9, 15, 10, 1, 650000, CAST(650000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (10, 16, 14, 1, 790000, CAST(790000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (11, 16, 12, 1, 1250000, CAST(1250000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (12, 16, 7, 1, 5200000, CAST(5200000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (13, 17, 11, 1, 720000, CAST(720000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (14, 17, 6, 1, 4750000, CAST(4750000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (15, 17, 7, 1, 5200000, CAST(5200000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (16, 17, 5, 1, 4900000, CAST(4900000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (17, 17, 4, 1, 3950000, CAST(3950000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (18, 18, 10, 1, 650000, CAST(650000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (19, 18, 7, 1, 5200000, CAST(5200000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (20, 19, 7, 1, 5200000, CAST(5200000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (21, 19, 3, 1, 3600000, CAST(3600000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (22, 19, 12, 1, 1250000, CAST(1250000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (23, 20, 4, 1, 3950000, CAST(3950000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (24, 21, 6, 1, 4750000, CAST(4750000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (25, 21, 3, 1, 3600000, CAST(3600000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (26, 21, 4, 1, 3950000, CAST(3950000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (27, 22, 11, 1, 720000, CAST(720000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (28, 22, 13, 1, 650000, CAST(650000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (29, 22, 6, 1, 4750000, CAST(4750000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (30, 23, 10, 1, 650000, CAST(650000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (31, 23, 7, 1, 5200000, CAST(5200000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (32, 23, 14, 1, 790000, CAST(790000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (33, 24, 12, 1, 1250000, CAST(1250000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (34, 24, 10, 1, 650000, CAST(650000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (35, 24, 6, 1, 4750000, CAST(4750000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (36, 25, 13, 1, 650000, CAST(650000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (37, 25, 11, 1, 720000, CAST(720000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (38, 25, 10, 1, 650000, CAST(650000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (39, 26, 6, 1, 4750000, CAST(4750000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (40, 26, 7, 1, 5200000, CAST(5200000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (41, 27, 13, 2, 650000, CAST(1300000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (42, 27, 12, 1, 1250000, CAST(1250000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (43, 28, 2, 1, 3500000, CAST(3500000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (44, 28, 14, 1, 790000, CAST(790000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (45, 28, 13, 3, 650000, CAST(1950000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (46, 29, 5, 2, 4900000, CAST(9800000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (47, 29, 3, 1, 3600000, CAST(3600000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (48, 30, 6, 1, 4750000, CAST(4750000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (49, 30, 14, 2, 790000, CAST(1580000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (50, 31, 12, 2, 1250000, CAST(2500000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (51, 31, 4, 1, 3950000, CAST(3950000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (52, 32, 2, 1, 3500000, CAST(3500000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (53, 32, 11, 3, 720000, CAST(2160000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (54, 33, 11, 2, 720000, CAST(1440000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (55, 33, 13, 1, 650000, CAST(650000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (56, 33, 3, 1, 3600000, CAST(3600000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (57, 34, 6, 1, 4750000, CAST(4750000 AS Decimal(18, 0)), N'0988222222')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (58, 34, 13, 2, 650000, CAST(1300000 AS Decimal(18, 0)), N'0988123123')
INSERT [dbo].[tblBillDetail] ([billDetailID], [billID], [productID], [quantity], [price], [total], [selPhone]) VALUES (59, 34, 14, 1, 790000, CAST(790000 AS Decimal(18, 0)), N'0988123123')
SET IDENTITY_INSERT [dbo].[tblBillDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCart] ON 

INSERT [dbo].[tblCart] ([cartID], [cusPhone], [productID], [amount]) VALUES (36, N'0988777777', 3, 1)
SET IDENTITY_INSERT [dbo].[tblCart] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (1, N'Tổ yến thô')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (2, N'Tổ yến tinh chế')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (3, N'Yến chưng tươi')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (4, N'Yến chưng sẵn')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblIncome] ON 

INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (1, N'0988123123', CAST(N'2022-09-16' AS Date), CAST(10000000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (2, N'0988333333', CAST(N'2022-09-17' AS Date), CAST(7480000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (3, N'0988222222', CAST(N'2022-09-16' AS Date), CAST(5350000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (4, N'0988222222', CAST(N'2022-09-16' AS Date), CAST(7170000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (5, N'0988123123', CAST(N'2022-09-16' AS Date), CAST(9460000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (6, N'0988333333', CAST(N'2022-09-16' AS Date), CAST(8380000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (7, N'0988222222', CAST(N'2022-09-16' AS Date), CAST(6270000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (8, N'0988123123', CAST(N'2022-09-16' AS Date), CAST(9340000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (9, N'0988333333', CAST(N'2022-09-16' AS Date), CAST(6350000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (10, N'0988333333', CAST(N'2022-09-16' AS Date), CAST(8300000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (11, N'0988222222', CAST(N'2022-09-16' AS Date), CAST(9760000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (12, N'0988123123', CAST(N'2022-09-16' AS Date), CAST(6600000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (13, N'0988123123', CAST(N'2022-09-16' AS Date), CAST(8190000 AS Decimal(18, 0)))
INSERT [dbo].[tblIncome] ([incomeID], [selPhone], [date], [total]) VALUES (14, N'0988123123', CAST(N'2022-09-16' AS Date), CAST(8400000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[tblIncome] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPost] ON 

INSERT [dbo].[tblPost] ([postID], [adPhone], [title], [postDate], [status], [content], [thumbnail]) VALUES (1, N'0988999999', N'Yến sào biếu Tết: Món quà ý nghĩa, gửi gắm yêu thương', CAST(N'2022-09-20T04:40:27.000' AS DateTime), 1, N'<div class="text-start ms-4">
        <p>Yến sào là một loại thực phẩm quý hiếm có giá trị dinh dưỡng cũng như mang giá kinh tế cao, vì vậy thường
            được nhiều người lựa chọn làm quà tặng dành cho người thân, bạn bè, đồng nghiệp hay cấp trên. Trong bài viết
            này, Lifenest sẽ cùng bạn đọc giải đáp những ý nghĩa xoay quanh quà tặng yến sào biếu Tết.&nbsp;</p>
        <h4>Yến sào biếu Tết – xu hướng quà tặng thịnh hành 2021</h4>
        <p>Trước đây, xu hướng biếu Tết quen thuộc thường là những món quà mang ý nghĩa trang trí, trưng bày như tranh,
            tượng, đồng hồ, các loại rượu quý,… Tuy nhiên, trong xã hội hiện đại ngày nay khi môi trường ngày càng ô
            nhiễm, nguồn nước bị nhiễm hóa chất, thói quen sinh hoạt thiếu khoa học,… làm ảnh hưởng xấu đến sức khỏe của
            con người thì một món quà ý nghĩa, tốt cho sức khỏe, ngừa nhiều bệnh tật chính là lựa chọn hàng đầu.&nbsp;
        </p>
        <figure class="text-center">
            <img src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/09/yen-sao-bieu-tet-1.jpg"
                alt="Yến sào biếu Tết - xu hướng quà tặng trong những năm gần đây" class="col-10">
            <figcaption><em>Yến sào biếu Tết – xu hướng quà tặng trong những năm gần đây</em></figcaption>
        </figure>
        <p>Xu hướng lựa chọn quà biếu từ năm nay đã có sự thay đổi, điều này xuất phát từ thực tế nhu cầu chăm sóc sức
            khỏe của ông bà, bố mẹ, người thân khi tuổi càng lớn, sức khỏe suy giảm. Lựa chọn một món quà với tiêu chí
            bổ dưỡng, giúp phòng và điều trị các loại bệnh là cách phù hợp nhất để bày tỏ lòng hiếu thuận.&nbsp;</p>
        <p>Đối với bạn bè, đồng nghiệp hay cấp trên, đây là những đối tượng có cuộc sống đầy đủ về kinh tế tuy nhiên lại
            thường không có nhiều thời gian để chăm sóc cho bản thân và gia đình. Lúc này, quà Tết yến sào chính là sự
            lựa chọn hoàn hảo dành cho cả người thân, bạn bè và đồng nghiệp. Mang ý nghĩa và giá trị dinh dưỡng cao, phù
            hợp với mọi đối tượng sử dụng, vô cùng tiện ích, thiết thực.&nbsp;</p>
        <h4>Tại sao nên lựa chọn yến sào làm quà Tết?</h4>
        <p>Không phải ngẫu nhiên yến sào trở thành “trend” và được lựa chọn làm món quà biếu Tết trong những năm gần
            đây. Những lý do khiến yến sào trở thành sản phẩm được nhiều người chọn làm quà biếu Tết là:</p>
        <h5>Yến sào tốt cho sức khỏe&nbsp;</h5>
        <figure class="text-center">
            <img src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/09/yen-sao-bieu-tet-2.jpg"
                alt="Yến sào chứa nhiều dưỡng chất tốt cho sức khỏe của con người" class="col-10">
            <figcaption><em>Yến sào chứa nhiều dưỡng chất tốt cho sức khỏe của con người</em></figcaption>
        </figure>
        <p>Trong yến sào có chứa 2 thành phần dưỡng chất chính gồm Glycol và Protein. Trong đó, Glycol gồm 7 loại đường
            dễ dàng hấp thụ trong cơ thể và protein gồm 18 loại acid amin (trong đó có nhiều loại dưỡng chất mà cơ thể
            không tự thay thế được), hơn 31 nguyên tố vi lượng cùng khoáng chất thiết yếu dành cho cơ thể con
            người.&nbsp;</p>
        <p>Theo các nghiên cứu đã chỉ ra rằng, sử dụng tổ yến đều đặn 3 lần/tuần sẽ giúp tăng cường hệ miễn dịch, cải
            thiện các chức năng tim gan và huyết áp, tăng cường khả năng hấp thu các chất dinh dưỡng, giải trừ các độc
            tố trong máu, điều hòa chức năng sinh lý ở cả đàn ông và phụ nữ,…</p>
        <p>Yến sào có thể được sử dụng để tạo ra các món ăn đa dạng, bổ dưỡng đối với mọi đối tượng khác nhau, từ người
            mới ốm dậy đến bà mẹ đang mang thai, người già có thể trạng kém,…</p>
        <h5>Bí quyết làm đẹp tuyệt vời của chị em&nbsp;</h5>
        <p>Trong tổ yến có chứa thành phần Threonine, đây là chất giúp da tổng hợp và sản sinh ra elastin và collagen. Giúp
            làn da giảm mụn, mờ tàn nhang, làm hồng da, giảm quá trình lão hóa giúp lưu giữ vẻ đẹp thanh xuân cho phái
            đẹp.&nbsp;</p>
        <p>Yến sào chỉ chứa đường tự nhiên galactose không hề chứa chất béo, phù hợp sử dụng hàng ngày mà không làm tăng
            cân. Ngoài ra, trong tổ yến còn chứa hàm lượng lớn canxi và sắt, đây là các nguyên tố bổ dưỡng cho hệ thần
            kinh và trí não cũng như lưu thông tuần hoàn máu tốt, giúp hệ xương luôn khỏe mạnh. Manga, brom, kẽm, đồng
            cũng là thành phần giúp chị em chống lão hóa cho da, bảo vệ da khỏi những tia cực tím độc hại.&nbsp;</p>
        <h5>Giúp giải tỏa căng thẳng và mệt mỏi&nbsp;</h5>
        <p>Yến sào biếu Tết là lựa chọn hợp lý dành cho những người làm việc trí óc, phải chịu áp lực và căng thẳng
            thường xuyên. Trong tổ yến có chứa các nguyên tố vi lượng như Mn, Cu, Zn, Br giúp ổn định hệ thống thần
            kinh, tăng cường trí nhớ và giữ tinh thần luôn minh mẫn. Giảm căng thẳng và giúp người dùng ngủ ngon và sâu
            giấc hơn.&nbsp;</p>
        <h5>Yến sào sử dụng được cho mọi đối tượng&nbsp;</h5>
        <figure class="text-center">
            <img src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/07/yensaokhanhoavn-banner-yensao.jpg"
                alt="Yến sào phù hợp sử dụng cho nhiều đối tượng khác nhau" class="col-10">
            <figcaption><em>Yến sào phù hợp sử dụng cho nhiều đối tượng khác nhau</em></figcaption>
        </figure>
        <p>Tổ yến là thực phẩm giàu chất dinh dưỡng có thể sử dụng cho mọi đối tượng, cụ thể:&nbsp;</p>
        <ul>
            <li class="mb-4">Trẻ em trên 1 tuổi: Trong yến sào chứa tổ hợp axit amin cùng nhiều dưỡng chất quý khác. Sử dụng yến sào
                thường xuyên sẽ giúp tăng cường khả năng miễn dịch ở trẻ. Tăng cường sức đề kháng cho các cơ quan nội
                tạng như gan, phổi và nội tiết trong cơ thể trẻ. Khi mới dùng chỉ nên sử dụng liều lượng nhỏ chỉ khoảng
                70mg mỗi ngày. Sau khi cơ thể đã thích nghi có thể tăng liều lượng lên. Tổ yến sử dụng tốt cho trẻ biếng
                ăn, suy dinh dưỡng, viêm đường hô hấp, mất ngủ hoặc ngủ không sâu giấc.&nbsp;</li>
            <li class="mb-4">Người lớn tuổi: Theo các nghiên cứu khoa học đã chỉ ra tổ yến tăng cường sức khỏe đề kháng và hệ miễn
                dịch cho người già. Cải thiện các chức năng tim mạch, ổn định huyết áp, hỗ trợ hệ hô hấp hoạt động tốt
                hơn. Đặc biệt giúp loại bỏ các độc tố trong máu phù hợp với những người thường xuyên sử dụng các chất
                kích thích.&nbsp;</li>
            <li class="mb-4">Phụ nữ đang mang thai và sau sinh: Chỉ sử dụng yến sào cho phụ nữ mang thai trên 3 tháng với liều lượng
                2 bát tổ yến/tuần. Tốt nhất nên chế biến thành món cháo tổ yến hoặc các món hầm cùng các nguyên liệu
                khác để tăng thêm dưỡng chất cho cả mẹ và bé. Đối với phụ nữ sau sinh 3 tháng có thể sử dụng yến sào
                giúp tăng cường sức đề kháng, giảm các bệnh hậu sản và có nguồn sữa dồi dào để nuôi con.&nbsp;</li>
            <li class="mb-4">Đối với nam giới: Trong yến sào có chứa 11,4% chất L- Arginine, đây là chất giảm sự rối loạn cương dương
                và ham muốn nam giới. Vì vậy, sử dụng tổ yến sẽ giúp điều hòa chức năng tình dục và sinh lý đàn ông.
                Ngoài ra hai loại axit amin là Valine ( 4,12%) và Isoleucine( 2,04%) giúp điều hòa protein, cân bằng
                nitơ và các chất cần thiết giúp nam giới hồi sức sau những giờ tập thể thao, và tình trạng mệt mỏi, căng
                thẳng do công việc cũng được giảm đi đáng kể.&nbsp;</li>
        </ul>
        <h4>Các loại yến được ưa chuộng làm quà tặng</h4>
        <p>Hiện nay yến sào được chia thành nhiều loại khác nhau, dựa vào nguồn gốc chia thành yến tự nhiên và yến nuôi.
            Chia theo màu sắc có các loại tổ yến chính gồm huyết yến và bạch yến. Tuy nhiên để phân loại yến sào theo
            nguồn gốc thì sẽ rất khó, bởi chúng không có nhiều sự khác biệt. Do đó, người ta thường lựa chọn tổ yến dựa
            theo màu sắc bởi nó có sự chênh lệch rõ ràng về giá cả theo màu sắc.&nbsp;</p>
        <figure class="text-center">
            <img src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/03/yen-huyet-dao.jpg"
                alt="Huyết yến và bạch yến là những loại tổ yến được ưa chuộng làm quà tặng nhất hiện nay"
                class="col-10">
            <figcaption><em>Huyết yến và bạch yến là những loại tổ yến được ưa chuộng làm quà tặng nhất hiện nay</em>
            </figcaption>
        </figure>
        <h5>Bạch yến</h5>
        <p>Bạch yến có màu trắng ngà, mặt tổ yến và sợi yến thường dày hơn. Đây là loại tổ yến khá phổ biến, được nhiều
            người lựa chọn bởi giá trị dinh dưỡng cao không thua kém bất kỳ loại tổ yến nào khác. Bạch yến được tạo ra
            từ nước dãi của chim yến, do đó chúng có mùi đặc trưng. Khi chưng tổ yến sẽ thấy các sợi yến nở đều, dai có
            thể sử dụng cho các thành viên trong gia đình từ trẻ nhỏ đến người già.&nbsp;</p>
        <h5>Huyết yến</h5>
        <p>Huyết yến là loại yến sào “thượng hạng” nhất trong các loại tổ yến. Đặc điểm của huyết yến đó là có màu đỏ
            tươi, mép viền có màu trắng. Số lượng huyết yến hiếm, chiếm tỉ lệ nhỏ nên giá trị kinh tế của nó rất cao
            khoảng vài chục triệu đồng cho 1kg tổ yến. Hơn nữa, giá trị dinh dưỡng của huyết yến cũng cao hơn nhiều lần
            so với bạch yến.&nbsp;</p>
        <p>Trên đây, chúng ta đã tìm hiểu về ý nghĩa cũng như lý do yến sào biếu Tết được nhiều người
            lựa chọn trong những năm gần đây. Để có thể sở hữu sản phẩm tổ yến chất lượng làm quà tặng trong dịp Tết,
            bạn nên tìm đến các địa chỉ uy tín. Tránh mua phải sản phẩm kém chất lượng làm ảnh hưởng đến giá trị và ý
            nghĩa muốn gửi gắm qua món quà.&nbsp;</p>
    </div>', N'img/post1.jpg')
INSERT [dbo].[tblPost] ([postID], [adPhone], [title], [postDate], [status], [content], [thumbnail]) VALUES (2, N'0988999999', N'Yến chưng đường phèn để được bao lâu? Những lưu ý khi thực hiện', CAST(N'2022-09-20T15:54:39.000' AS DateTime), 1, N'<div class="text-start ms-4">
        <p>Tổ yến được biết đến là nguyên liệu quý hiếm, tốt cho sức khỏe con người.
            Trong đó, yến chưng đường phèn là
            món ăn được nhiều người yêu thích bởi nó rất dễ thực hiện và giữ nguyên được những công dụng tuyệt vời
            của tổ yến tự nhiên. Vậy, yến chưng đường phèn để được bao lâu? Hãy cùng tìm hiểu vấn đề này qua bài
            viết dưới đây.&nbsp;</p>
        <h4>Yến chưng đường phèn để được bao lâu trong từng trường hợp khác nhau?&nbsp;</h4>
        <p>Thông thường, các món ăn chế biến từ tổ yến dù là yến sào, yến chưng, súp chè,… đều nên sử dụng ngay sau khi
            chưng nấu. Bởi đây là thời điểm các dưỡng chất trong yến sẽ được giữ trọn vẹn 100%, đảm bảo chất lượng
            tuyệt đối. Ngoài ra, hương vị của món ăn vừa hoàn thành cũng thơm ngon và hấp dẫn hơn.&nbsp;</p>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/03/yen-chung-duong-phen.jpg"
                alt="Yến chưng đường phèn để trong bao lâu tùy vào từng trường hợp">
            <figcaption><em>Yến chưng đường phèn để trong bao lâu tùy
                    vào từng trường hợp</em></figcaption>
        </figure>
        <p>Những món như yến chưng táo đỏ hạt chia, yến chưng táo
            đỏ hạt sen,… lại càng đòi hỏi độ hấp dẫn và kích thích vị giác tốt trong quá trình thưởng thức.
            Do đó, không nên lưu trữ và bảo quản quá lâu.&nbsp;<br>
            <span>Tuy nhiên trong một số tình huống bắt buộc bảo quản thì chỉ nên lưu trữ yến
                chưng tối đa 14 ngày trong điều kiện tốt. Đặc biệt, các món ăn làm từ yến chưng sẵn cho bé cần lưu ý kỹ
                về thời gian lưu trữ trước khi sử dụng.&nbsp;</span><br>
            <span>Tùy vào từng trường hợp mà yến chưng đường phèn có các mốc thời gian bảo
                quản cơ bản cụ thể như sau:&nbsp;</span>
        </p>
        <ul>
            <li class="mb-2"><span>Yến sau khi chưng đặt ở điều
                    kiện nhiệt độ phòng chỉ nên lưu trữ trong khoảng thời gian 5 giờ</span></li>
            <li class="mb-2"><span>Yến chưng tươi với hạt sen, hạt
                    chia, kỳ tử,… chỉ bảo quản và lưu trữ tối đa 10 ngày&nbsp;</span></li>
            <li class="mb-2"><span>Yến chưng không đường hoặc yến
                    chưng đường phèn có thể bảo quản lâu hơn trong khoảng thời gian 14 ngày</span></li>
            <li class="mb-2"><span>Ngoài ra, trong trường hợp yến
                    chưng được bảo quản ở trong ngăn đông thì người dùng có thể lưu trữ món ăn trong khoảng 3
                    tháng.&nbsp;</span></li>
        </ul>
        <h4>Yến chưng đường phèn có tác dụng gì?&nbsp;</h4>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/03/yen-chung-duong-phen2.jpg"
                alt="Yến chưng đường phèn có tác dụng tuyệt vời đối với sức khỏe của con người">
            <figcaption><em>Yến chưng đường phèn có tác dụng tuyệt vời
                đối với sức khỏe của con người&nbsp;</em></figcaption>
        </figure>
        <p><span>Yến chưng đường phèn là một món ăn bổ dưỡng với nhiều công dụng tuyệt vời, cụ
                thể:&nbsp;</span></p>
        <ul>
            <li class="mb-2" aria-level="1"><span>Bồi bổ cơ thể, tăng cường sức
                    khỏe: Người bị suy nhươc, trẻ mới ốm dậy, trẻ chậm lớn, người lớn tuổi,… Đây đều là những đối tượng
                    nên sử dụng yến chưng đường phèn thường xuyên để bồi bổ và tăng cường sức khỏe.&nbsp;</span></li>
            <li class="mb-2" aria-level="1"><span>Tăng cường hệ miễn dịch: Trong
                    yến có chứa nhiều axit amin, các nguyên tố vi lượng. Do đó, bổ sung yến chưng cơ thể giúp cân bằng
                    quá trình trao đổi chất và khả năng miễn dịch.&nbsp;</span></li>
            <li class="mb-2" aria-level="1"><span>tốt cho hệ thần kinh: Trong tổ
                    yến có chứa nhiều vi dưỡng chất Zn, Cu,… có công dụng ổn định hệ thần kinh, tăng cường trí nhớ và
                    giúp người dùng có giấc ngủ sâu hơn.&nbsp;</span></li>
            <li class="mb-2" aria-level="1"><span>Bổ máu: Trong yến có chứa sắt
                    đóng vai trò quan trọng trong việc tổng hợp hemoglobin – chất đóng vai trò vận chuyển oxy đến các
                    tác bào của cơ thể</span></li>
            <li class="mb-2" aria-level="1"><span>Bổ phế: Yến sào thích hợp cho
                    những người ho kéo dài, suy nhược cơ thể hồi phục sức khỏe nhanh chóng</span></li>
            <li class="mb-2" aria-level="1"><span>Làm đẹp da: Trong yến sào có
                    chứa một lượng threonine giúp kích thích sản sinh collagen và elastin. Giúp da luôn hồng hào, giảm
                    mụn và các vết thâm nám cũng như tàn nhang trên da.&nbsp;</span></li>
            <li class="mb-2" aria-level="1"><span>Ổn định huyết áp: Với những
                    người có tiền sử huyết áp cao dùng tổ yến sẽ giúp ổn định nhịp tim và cải thiện chức năng tuần hoàn
                    trong cơ thể.</span></li>
            <li class="mb-2" aria-level="1"><span>Tốt cho phụ nữ mang thai và sau
                    sinh: Sở hữu hàm lượng chất dinh dưỡng cao, giúp chị em tăng cường sức khỏe trong suốt thai kỳ. Đồng
                    thời phục hồi nhanh sau sinh và làm mờ vết sẹo mổ nhanh chóng.&nbsp;</span></li>
        </ul>
        <h4>Cách thực hiện yến chưng đường phèn</h4>
        <p><span>Yến sào là nguyên liệu được xếp vào hàng “cao lương mỹ vị” giúp tăng cường
                sức khỏe, phòng tránh bệnh tật cho con người. Thích hợp với các đối tượng như trẻ em, người gia, người
                mắc bệnh nặng, đặc biệt là phụ nữ có thai. Trong tổ yến có chứa một hàm lượng lớn axit amin, các khoáng
                chất và vi chất mà cơ thể con người không thể tự tổng hợp và chuyển hóa được.</span></p>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2020/12/to-yen-sao-khanh-hoa-lifenest34.jpg"
                alt="Cách chưng yến đường phèn dễ thực hiện tại nhà">
            <figcaption><em>Cách chưng yến đường phèn dễ thực hiện tại
                nhà</em></figcaption>
        </figure>
        <p><span>Dưới đây là cách chưng yến với đường phèn đúng cách mà vẫn giữ nguyên được
                dưỡng chất quý giá có trong yến sào.&nbsp;</span></p>
        <h5>Nguyên liệu cần chuẩn bị&nbsp;</h5>
        <ul>
            <li aria-level="1"><span>Yến sào tinh chế: 1
                    tổ&nbsp;</span></li>
            <li aria-level="1"><span>Đường phèn&nbsp;</span></li>
            <li aria-level="1"><span>Nước sạch&nbsp;</span></li>
            <li aria-level="1"><span>Gừng&nbsp;</span></li>
        </ul>
        <h5>Cách thực hiện&nbsp;</h5>
        <p><span>Cách thực hiện món yến chưng đường phèn khá đơn giản, dễ làm. Dưới đây là các
                bước làm mà bạn có thể tham khảo.&nbsp;</span></p>
        <ul>
            <li class="mb-2" aria-level="1"><span>Bước 1: Ngâm yến sào đã chuẩn
                    bị trong nước sạch trong khoảng 30 phút. Nếu chỗ yến chưa tơi bạn có thể lấy tay bóp nát. Sau đó sử
                    dụng rây để loại bỏ nước yến. Cho yến vào thố, đổ nước sạch vào cho yến ngập hơn một chút rồi tiến
                    hành chưng.&nbsp;</span></li>
            <li class="mb-2" aria-level="1"><span>Bước 2: Chưng yến dưới ngọn lửa
                    nhỏ trong thời gian khoảng 20-30 phút. Nếu bạn sợ nước tràn vào yến thì có thể tham khảo sử dụng
                    xửng hấp</span></li>
            <li class="mb-2" aria-level="1"><span>Bước 3: Bạn có thể bỏ thêm chút
                    gừng vào nước yến cho đỡ lạnh bụng. Cạo sạch vỏ và cắt thành từng miếng nhỏ hoặc sợi. Khi yến chín,
                    bạn tắt bếp sau đó mới cho đường phèn và gừng đã thái sẵn vào. Đảo đều và đợi khi nước yến nguội là
                    có thể thưởng thức ngay.&nbsp;</span></li>
        </ul>
        <p><span>Bạn có thể dùng khi yến chưng đường phèn còn nóng hoặc để nguội đều được. Mỗi
                ngày chỉ nên sử dụng khoảng 5 gram, và sử dụng đều đặn để bổ sung dưỡng chất cho cơ thể.&nbsp;</span>
        </p>       
        <h4>Những lưu ý khi thực hiện yến chưng đường phèn</h4>
        <p><span>Yến sào là một nguyên liệu tốt cho sức khỏe của con người, tuy nhiên làm thế
                nào để yến phát huy hết công dụng sau khi chế biến thì không phải ai cũng biết. Do đó, khi chế biến và
                sử dụng món tổ yến chưng đường phèn bạn cần lưu ý những điều sau:&nbsp;</span><br>
            <i><span>Những lưu ý khi chế biến và sử dụng yến chưng đường phèn&nbsp;</span></i>
        </p>
        <ul>
            <li class="mb-2" aria-level="1"><span>Tùy vào khẩu vị của từng người
                    mà cho lượng đường phèn phù hợp với người dùng.&nbsp;</span></li>
            <li class="mb-2" aria-level="1"><span>Lượng nước bên trong thố đã bao
                    gồm nước, yến và các nguyên liệu khác không quá 90% chiều cao thố. Bởi khi nhiệt độ cao thì nước bên
                    trong sẽ dâng lên và tràn vào trong chén chứa yến. Điều này vô tình sẽ khiến tác dụng của yến bị
                    giảm đi.&nbsp;</span></li>
            <li class="mb-2" aria-level="1"><span>Nên chưng yến với đường phèn ở
                    nhiệt độ vừa phải không quá 80 độ C, tránh làm mất đi các chất protein bên trong yến&nbsp;</span>
            </li>
            <li class="mb-2" aria-level="1"><span>Muốn cho món ăn yến chưng đường
                    phèn ngon và hương vị đậm đà nên đun nấu trong khoảng thời gian từ 20-30 phút.&nbsp;</span></li>
            <li class="mb-2" aria-level="1"><span>Chỉ nên cho đường phèn sau khi
                    quá trình chưng yến đã hoàn thành, điều này giúp cho dưỡng chất của yến được đảm bảo hoàn
                    toàn.&nbsp;</span></li>
            <li class="mb-2" aria-level="1"><span>Trong tổ yến có nhiều dưỡng
                    chất tốt cho cơ thể con người. Tuy nhiên nếu lạm dụng quá nhiều dễ gây ra tình trạng đau nhức, khó
                    chịu,… Do đó, tùy theo độ tuổi, thể trạng,… mà sử dụng liều lượng yến cho phù hợp.&nbsp;</span></li>
            <li class="mb-2" aria-level="1"><span>Nên sử dụng yến chưng đường
                    phèn vào buổi sáng khi mới ngủ dậy hoặc khi đói bụng hay trước khi đi ngủ.&nbsp;</span></li>
            <li class="mb-2" aria-level="1"><span>Không chưng yến bằng nồi inox
                    hay nồi nhôm bởi sẽ làm mất đi các dưỡng chất quý giá cho yến sào.&nbsp;</span></li>
            <li class="mb-2" aria-level="1"><span>Nên sử dụng thêm một vài lát
                    gừng mỏng vào món yến chưng đường phèn. Gừng có tính nóng sẽ làm trung hòa tính hàn của tổ yến. Giúp
                    bạn không cảm thấy lạnh bụng khi ăn và làm tăng thêm hương vị lạ miệng cho bát yến.&nbsp;</span>
            </li>
            <li class="mb-2" aria-level="1"><span>Bạn có thể hâm nóng tổ yến, tuy
                    nhiên hạn chế không sử dụng lò vi sóng bởi nhiệt độ cao sẽ phá hủy đi các dưỡng chất tốt có trong
                    yến chưng.</span></li>
        </ul>
        <p><span>Chắc hẳn, thông qua bài viết trên bạn đã có câu trả lời cho vấn đề “yến chưng
                đường phèn để được bao lâu?”. Hy vọng, với những thông tin mà Lifenest cung cấp bạn có thể tự tin chưng
                yến thật ngon, bảo quản và lưu trữ đúng cách để bổ sung dưỡng chất cho các thành viên trong gia
                đình.&nbsp;</span></p>
    </div>', N'img/post2.jpg')
INSERT [dbo].[tblPost] ([postID], [adPhone], [title], [postDate], [status], [content], [thumbnail]) VALUES (3, N'0988999999', N'Hướng dẫn sử dụng yến sào cho trẻ suy dinh dưỡng', CAST(N'2022-09-06T11:42:32.000' AS DateTime), 1, N'<div class="text-start ms-4">
        <p><span>Suy dinh dưỡng là tình trạng trẻ bị thiếu hụt một số chất cần thiết cho
                sự phát triển về mặt thể chất. Phần lớn suy dinh dưỡng đều kèm theo hậu quả chán ăn, biếng ăn nên mẹ
                cần có kế hoạch bồi bổ yến sào cho trẻ suy dinh dưỡng đúng cách để có thể giúp bé bổ sung đủ
                vitamin, khoáng chất cần thiết nhất.&nbsp;</span><br>
            <span>Trẻ bị suy dinh dưỡng thậm chí còn đối mặt với nguy cơ mắc nhiều căn
                bệnh do chức năng hệ miễn dịch kém, sức khỏe yếu. Vì vậy, hãy tham khảo ngay cách sử dụng yến sào
                cho con để cải thiện thể chất cho bé ngay từ hôm nay.</span>
        </p>
        <h4>Tác dụng của yến sào đối với trẻ suy dinh dưỡng</h4>
        <p><span>Từ thời vua chúa, yến sào đã được ví như một loại “cao lương mỹ vị” với
                những tác dụng quý đối với sức khỏe. Với trẻ em, đặc biệt là trẻ suy dinh dưỡng, yến sào có những
                lợi ích cụ thể như sau:</span></p>
        <ul>
            <li class="mb-2"><span>Kích thích vị giác, khiến
                    trẻ lấy lại hứng thú ăn uống và có cảm giác thèm, muốn ăn nhờ sở hữu vị ngọt thanh, kết cấu mềm
                    dễ thưởng thức.&nbsp;</span></li>
            <li class="mb-2"><span>Tăng cường sức khỏe thể
                    chất cho bé nhanh chóng, giúp bé có thêm nhiều năng lượng cho các hoạt động hàng ngày với hàm
                    lượng dưỡng chất dồi dào có trong thành phần.&nbsp;</span></li>
            <li class="mb-2"><span>Kích thích hệ tiêu hóa hoạt
                    động tốt hơn, hấp thu dinh dưỡng hiệu quả. Vốn dĩ trẻ bị suy dinh dưỡng gặp vấn đề với việc hấp
                    thu nên mới xảy ra tình trạng thiếu chất. Tuy vậy, yến sào lại sở hữu các thành phần axit amin
                    tiêu biểu như histidine, threonine nên hoàn toàn có thể xử lý được vấn đề này.&nbsp;</span></li>
            <li class="mb-2"><span>Nâng cao chức năng hệ tiêu
                    hóa, hệ hô hấp, hỗ trợ các hoạt động hay các quá trình chuyển hóa trơn tru hơn. Tác dụng này có
                    được là nhờ khả năng bổ phổi và dạ dày của yến sào – một trong những lợi ích được khai thác bởi
                    Đông y.&nbsp;</span></li>
            <li class="mb-2"><span>Cân bằng lại chế độ dinh
                    dưỡng của trẻ với hàm lượng vitamin dồi dào cùng nhiều khoáng chất vi lượng đa dạng, phong
                    phú.&nbsp;</span></li>
            <li class="mb-2"><span>Giúp trẻ suy dinh dưỡng có
                    thể hồi phục nhanh sau những lần bị ốm và nhanh lành vết thương.&nbsp;</span></li>
            <li class="mb-2"><span>Nâng cao chức năng hệ miễn
                    dịch, giúp trẻ tăng cường đề kháng để phòng bệnh hiệu quả.&nbsp;</span></li>
        </ul>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/04/yen-sao-cho-tre-thieu-dinh-duong.jpg"
                alt="Tác dụng của yến sào cho trẻ suy dinh dưỡng">
            <figcaption><i><span>Tác
                        dụng của yến sào cho trẻ suy dinh dưỡng</span></i></figcaption>
        </figure>
        <h4>Hướng dẫn sử dụng yến sào cho trẻ đúng cách</h4>
        <p><span>Để bé yêu hấp thụ những dưỡng chất từ yến sào, mẹ nên tham khảo ngay
                những khuyến nghị cụ thể dưới đây để hạn chế những tác dụng phụ không đáng có.&nbsp;</span></p>
        <h5>Liều lượng bổ sung yến sào</h5>
        <p><span>Yến sào chứa hàm lượng dinh dưỡng cao nên nếu không có định mức cụ thể,
                việc cho bé bổ sung quá nhiều tổ yến có thể dẫn đến tình
                trạng thừa chất. Bên cạnh đó, yến sào vốn là “nhất phẩm” có giá thành đắt đỏ, nên điều quan trọng
                nhất khi sử dụng yến sào là thưởng thức sao cho hiệu quả chứ không phải thưởng thức thật
                nhiều.&nbsp;</span><br><br>
            <span>Hệ tiêu hóa của trẻ có thể còn non nớt nên khi chuẩn bị các món với tổ
                yến cho con, mẹ nên nắm rõ những khuyến nghị cụ thể về liều lượng như sau:</span>
        </p>
        <ul>
            <li class="mb-2"><span>Trẻ dưới 1 tuổi: Không nên
                    cho bé ăn tổ yến vào giai đoạn này vì hệ tiêu hóa của bé chưa đủ khả năng hấp thụ dinh
                    dưỡng.&nbsp;</span></li>
            <li class="mb-2"><span>Trẻ từ 1 tuổi đến 3 tuổi:
                    Đây là thời điểm phù hợp để tăng cường sức khỏe và nâng cao đề kháng cho con nhờ những dưỡng
                    chất từ tổ yến. Mẹ có thể cho bé ăn các món chế biến từ yến sào hàng ngày với lượng bắt đầu từ
                    0.5 gram một ngày. Khi cơ thể bé đã thích nghi với việc hấp thu dinh dưỡng từ tổ yến, mẹ có thể
                    tăng lượng yến từ 1 gram đến 1.5 gram một ngày.&nbsp;</span></li>
            <li class="mb-2"><span>Trẻ từ 4 tuổi đến 10 tuổi:
                    Đây là thời điểm con đã bắt đầu có nhiều hoạt động thể chất và trí tuệ nên cần bổ sung năng
                    lượng thường xuyên. Dinh dưỡng từ tổ yến sẽ giúp trẻ duy trì mọi hoạt động hàng ngày. Bố mẹ nên
                    cho trẻ bổ sung từ 1-2 gram yến mỗi ngày và thưởng thích hàng ngày.&nbsp;</span></li>
        </ul>
        <h5>Thời điểm sử dụng tổ yến cho trẻ suy dinh dưỡng</h5>
        <p><span>Dưỡng chất từ yến sào sẽ có tác dụng tốt nhất với sức khỏe khi trẻ thưởng
                thức vào lúc bụng đói. Lifenest gợi ý bố mẹ hãy cho con ăn các món từ tổ yến vào thời điểm sáng sớm
                hoặc trước khi đi ngủ từ 30 phút đến 1 tiếng.&nbsp;</span><br><br>
            <span>Một khuyến cáo nhỏ về thời điểm sử dụng yến sào cho bé mà bố mẹ nên
                biết, đó là tuyệt đối không cho con ăn tổ yến trước bữa chính. Điều này sẽ làm khiến bé cảm thấy no
                lưng lửng, không có cảm giác thèm ăn các món khác. Đây cũng là cách thưởng thức yến sào thiếu khoa
                học bố mẹ nên tránh.&nbsp;</span>
        </p>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/03/yen-sao-vs-tre-em.jpg"
                alt="Sử dụng yến sào đúng thời điểm giúp kích thích vị giác cho bé">
            <figcaption><i><span>Sử
                        dụng yến sào đúng thời điểm giúp kích thích vị giác cho bé</span></i></figcaption>
        </figure>
        <h5>Những cấm kỵ khi bổ sung yến sào cho trẻ</h5>
        <p><span>Dù có nguồn gốc tự nhiên, lại khá lành tính nhưng mẹ vẫn nên đọc kỹ những
                khuyến cáo sau để tránh việc cho trẻ thưởng thức tổ yến sai cách, dẫn đến những hậu quả khó lường.
                Cụ thể:</span></p>
        <ul>
            <li class="mb-2"><span>Tuyệt đối không cho trẻ
                    dưới 1 tuổi ăn yến sào dưới bất kỳ hình thức nào: Thời điểm này, nguồn dinh dưỡng cần thiết nhất
                    với bé là sữa mẹ, không phải những dưỡng chất từ yến sào. Khi cho bé sơ sinh ăn yến, mẹ sẽ khó
                    kiểm soát được những nguy cơ mà hệ tiêu hóa gặp phải.&nbsp;</span></li>
            <li class="mb-2"><span>Không cho trẻ ăn quá nhiều
                    yến sào: Tâm lý bổ sung thực phẩm tốt cho con sẽ khiến nhiều bậc phụ huynh cho rằng ăn tổ yến
                    càng nhiều càng tốt. Thực tế, việc thưởng thức yến thiếu khoa học chỉ gây lãng phí và khiến bé
                    khó tiêu, đầy bụng.&nbsp;</span></li>
        </ul>
        <h4>02 cách chế biến yến sào cho trẻ suy dinh dưỡng</h4>
        <p><span>Tổ yến có vị ngọt thanh, tính mát, dễ dàng kết hợp với nhiều nguyên liệu
                khác để làm nên những món ăn hấp dẫn, kích thích vị giác trẻ, đặc biệt là trẻ suy dinh dưỡng, biếng
                ăn. Tuy nhiên, trong bài viết này, Lifenest chỉ giới thiệu tới mẹ 2 công thức chế biến yến sào đơn
                giản, tiết kiệm thời gian nhất.&nbsp;</span></p>
        <h5>Công thức số 1: Yến chưng đường phèn</h5>
        <p><span>Nguyên liệu cho món ăn nhẹ này chỉ bao gồm tổ yến tinh chế và đường phèn.
                Về cách làm, do sử dụng tổ yến đã được làm sạch lông nên bạn sẽ không tốn nhiều thời gian sơ chế.
                Sau khi ngâm yến khoảng 10 phút đến khi tơi thành sợi, bạn chỉ cần cho yến vào một bát nhỏ và đặt
                vào nồi hấp cách thủy trong khoảng 20 phút. Công đoạn tiếp theo, bạn khuấy tan đường phèn và thêm
                vào bát yến, đợi thêm 5 phút là có thể tắt bếp và dọn ra cho bé ăn.&nbsp;</span></p>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/03/tac-dung-yen-chung-duong-phen.jpg"
                alt="Thành phẩm món yến hấp đường phèn">
            <figcaption><i><span>Thành
                        phẩm món yến hấp đường phèn</span></i></figcaption>
        </figure>
        <h5>Công thức số 2: Cháo tổ yến nấu thịt</h5>
        <p><span>Để chuẩn bị cho món cháo tổ yến, mẹ cần
                mua sẵn tổ yến
                tinh chế, gạo và thịt heo xay hoặc thịt gà đã băm nhuyễn (tùy theo khẩu vị của con). Việc cần làm
                đầu tiên khi nấu bất kỳ món nào từ tổ yến đó là ngâm yến với nước lạnh trong 10 phút. Với món ăn
                này, bạn nên tách thành 2 nồi nấu: một nồi hầm cháo và một nồi chưng yến.&nbsp;</span></p>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/03/chao-to-yen-thit-bam.jpg"
                alt="Thành phẩm món cháo tổ yến thịt băm">
            <figcaption>
                <i><span>Thành phẩm món cháo tổ yến thịt
                        băm</span></i>
            </figcaption>
        </figure>
        <p><span>Chuẩn bị một nồi ninh cháo với thịt, trong thời gian đó, bạn thực hiện
                hấp tổ yến cách thủy trong khoảng 20 phút. Sau khi cháo đã nhừ, tổ yến đã chín, bạn đem tổ yến đổ
                vào nồi cháo rồi khuấy đều dưới lửa nhỏ trong khoảng 5 phút là hoàn thành. Món ăn này có thể làm món
                ăn bữa chính cho bé hoặc món ăn nhẹ vào bữa sáng để con có đủ năng lượng cho cả một ngày
                dài.&nbsp;</span><br><br>
            <span>Bổ sung yến sào cho trẻ suy dinh dưỡng là cách cải thiện tình hình trẻ
                biếng ăn và không có hứng thú với việc ăn uống khá hiệu quả. Mẹ nên có kế hoạch sử dụng yến sào khoa
                học cho con để nhanh chóng điều chỉnh được sự mất cân bằng dinh dưỡng, giúp bé tăng cường sức khỏe
                thể lực và duy trì được sức đề kháng tốt, ngăn ngừa được nhiều bệnh tật tấn công. Đừng quên lưu tâm
                những khuyến nghị về liều lượng và cách dùng như trên nhé!</span><br>
            &nbsp;
        </p>
    </div>', N'img/post3.jpg')
INSERT [dbo].[tblPost] ([postID], [adPhone], [title], [postDate], [status], [content], [thumbnail]) VALUES (4, N'0988999999', N'TOP 4 cách nấu cháo yến thơm ngon, bổ dưỡng cho bé yêu', CAST(N'2022-09-22T21:44:22.000' AS DateTime), 1, N'<div class="text-start ms-4">
        <p>Yến sào là loại thực phẩm giàu dinh dưỡng với hàm lượng protein cao cùng nhiều
            axit amin và khoáng chất vi lượng cần thiết cho cơ thể. Yến sào cũng có rất nhiều lợi ích cho sức khỏe bé
            yêu nên rất nhiều mẹ quan tâm và tìm kiếm công thức. Trong bài viết này, hãy cùng khám phá 4 cách nấu cháo
            yến cho bé và tìm hiểu những lưu ý khi cho con sử dụng món ăn bổ dưỡng này nhé.&nbsp;</p>
        <h4>4 Cách nấu cháo tổ yến cho bé</h4>
        <p>Mẹ có thể dựa vào 4 công thức đơn giản dưới đây để tìm ra một món cháo phù hợp
            nhất với khẩu vị của bé hoặc cũng có thể liên tục thay đổi các món giữa các tuần cho con yêu. Mỗi món cháo
            sẽ sử dụng những nguyên liệu khác nhau kết hợp với tổ yến để có được sự tổng hòa tốt nhất về hương vị, mùi
            thơm và giá trị dinh dưỡng.&nbsp;</p>
        <h5>1. Cháo tổ yến bí đỏ</h5>
        <p>Nguyên liệu cần chuẩn bị: 10g tổ yến, 100g bí đỏ, 100g gạo nếp và 100g gạo tẻ
            (nếu bé ăn ít, chỉ ăn một bữa thì nên giảm lượng gạo đi), gia vị các loại.&nbsp;<br>
            Các bước thực hiện như sau:
        </p>
        <ul>
            <li class="mb-2"><span>Bước 1: Sơ chế tổ yến và ngâm với nước lạnh
                    đến khi tổ yến mềm ra, tan thành sợi là có thể đem đi hấp chín hoặc chưng.&nbsp;</span></li>
            <li class="mb-2"><span>Bước 2: Vo sạch gạo rồi đem ninh
                    nhừ. Trong thời gian đợi cháo chín, bạn có thể gọt vỏ bí, rửa sạch, hấp chín và dùng thìa tán
                    nhuyễn. Bí
                    đỏ khi chín rất mềm nên bạn không cần tốn thời gian chuẩn bị máy xay sinh tốt, chỉ cần đánh bằng
                    thìa
                    cũng nhuyễn được.&nbsp;</span></li>
            <li class="mb-2"><span>Bước 3: Cho tổ yến thái nhỏ và bí
                    đỏ vào nồi cháo rồi nêm nếm gia vị vừa ăn cho bé là xong.&nbsp;</span></li>
        </ul>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/03/yen-bi-do.jpg"
                alt="Món cháo yến bí đỏ vừa có màu sắc bắt mắt lại có vị ngọt đặc trưng nên bé nào cũng thích">
            <figcaption><em>Món cháo yến bí đỏ vừa có màu sắc bắt mắt lại
                    có vị ngọt đặc trưng nên bé nào cũng thích</em></figcaption>
        </figure>
        <h5>2. Cháo tổ yến thịt gà</h5>
        <p><span>Nguyên liệu cần chuẩn bị bao gồm: 1 tổ yến khoảng trên dưới 10g (nên chọn mua
                loại sơ chế sẵn hoặc chưng sẵn), gạo tẻ và gạo nếp khoảng 1 nắm mỗi loại, 30g ức gà, ½ củ cà rốt và một
                nhánh gừng nhỏ.&nbsp;</span><br>
            <span>Các bước thực hiện như sau:</span>
        </p>
        <ul>
            <li class="mb-2"><span>Bước 1: Nếu mua tổ yến thô, bạn cần
                    rửa sạch bụi bẩn và ngâm với nước lạnh trong khoảng 30 phút đến khi yến mềm thành sợi là được. Sau
                    đó,
                    bạn vớt ra để ráo nước rồi đem hấp chín. Nếu mua tổ yến chưng sẵn, bạn có thể bỏ qua bước
                    này.&nbsp;</span></li>
            <li class="mb-2"><span>Bước 2: Thịt gà sau khi luộc chín
                    đem xé sợi hoặc băm nhỏ, xay nhuyễn.&nbsp;</span></li>
            <li class="mb-2"><span>Bước 3: Chuẩn bị nồi nấu cháo và
                    cho gạo đã vo sạch cùng nước luộc gà vào để tăng thêm vị ngọt đậm đà cho món cháo. Tiếp theo, bạn
                    xắt cà
                    rốt hạt lựu và cho vào ninh cùng để bé được bổ sung vitamin A từ loại củ này.&nbsp;</span></li>
            <li class="mb-2"><span>Bước 4: Khi cháo và cà rốt đã chín,
                    bạn cho thịt gà và phần tổ yến cắt vụn vào rồi đun nhỏ lửa thêm khoảng 5-10 phút là hoàn
                    thành.&nbsp;</span></li>
            <li class="mb-2"><span>Bước 5: Nếu bé sợ mùi nồng, cay của
                    gừng, mẹ không nên bỏ nguyên liệu này vào cháo. Với những bé đã quen với mùi gừng, mẹ có thể bỏ vào
                    lúc
                    nấu và vớt ra trước khi cho bé ăn.&nbsp;</span></li>
        </ul>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/03/to-yen-uc-ga.jpg"
                alt="Món cháo tổ yến kết hợp với ức gà">
            <figcaption><em>Món cháo tổ yến kết hợp với ức gà</em></figcaption>
        </figure>
        <h5>3. Cháo tổ yến thịt băm</h5>
        <p><span>Nguyên liệu cần chuẩn bị: 200g gạo tẻ hoặc nếp + tẻ, 10g tổ yến, 50g thịt heo
                xay, gia vị, hành lá.&nbsp;</span><br>
            <span>Các bước thực hiện như sau:</span>
        </p>
        <ul>
            <li class="mb-2"><span>Bước 1: Thực hiện
                    sơ chế tổ yến thô bằng cách rửa sạch cho hết
                    bụi bẩn, sau đó đem ngâm với nước lạnh để tổ yến mềm, tan thành sợi là được. Nếu mua tổ yến chế biến
                    sẵn, bạn sẽ tiết kiệm được thời gian cho công đoạn này.&nbsp;</span></li>
            <li class="mb-2"><span>Bước 2: Thịt heo nên mua luôn loại
                    xay, sau đó đem ướp một chút gia vị cho vừa ăn.&nbsp;</span></li>
            <li class="mb-2"><span>Bước 3: Chuẩn bị nồi áp suất hoặc
                    nồi thông thường để nấu cháo. Khi nấu bằng nồi áp suất, cháo sẽ nhanh nhừ hơn.&nbsp;</span></li>
            <li class="mb-2"><span>Bước 4: Bạn có thể xào qua thịt
                    trước khi cho vào nồi cháo hoặc cho trực tiếp thịt sống vào cùng với tổ yến rồi đợi trong khoảng
                    10-15
                    phút là hoàn thành.&nbsp;</span></li>
        </ul>
        <p><span>Nếu bé ăn được hành, mẹ có thể rắc thêm chút hành lá bên trên bát cháo để màu sắc
                món ăn thêm bắt mắt, thu hút bé hơn.&nbsp;</span></p>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/03/chao-to-yen-thit-bam.jpg"
                alt="Cách làm món cháo yến thịt bằm cũng rất đơn giản do không phải sơ chế nhiều nguyên liệu">
            <figcaption id="caption-attachment-1572" class="wp-caption-text">Cách làm món cháo yến thịt bằm cũng rất đơn
                giản do không phải sơ chế nhiều nguyên liệu</figcaption>
        </figure>
        <h5>4. Cháo tổ yến chim bồ câu</h5>
        <p><span>Nguyên liệu cần chuẩn bị: chim bồ câu đã làm sạch, tổ yến, hạt sen, đỗ xanh, gia
                vị.&nbsp;</span><br>
            <span>Các bước thực hiện như sau:&nbsp;</span>
        </p>
        <ul>
            <li class="mb-2"><span>Bước 1: Chim bồ câu sau khi được
                    làm sạch có thể làm chín theo 1 trong 2 cách sau: Đem chim đi hấp chín rồi lọc nguyên phần thịt để
                    dành
                    nấu cháo còn phần xương bỏ đi hoặc cho trực tiếp chim bồ câu sống vào nồi ninh cùng với cháo. Khi
                    chín,
                    bạn đem ra gỡ lấy thịt. Nhìn chung, hai cách này không có nhiều điểm khác biệt, chỉ có điểm đáng chú
                    ý
                    là cháo có ninh cùng chim bồ câu sẽ ngọt đậm đà hơn. Tuy nhiên, nếu không gỡ và lọc xương cẩn thận,
                    bé
                    có thể sẽ ăn phải những phần xương vụn.&nbsp;</span></li>
            <li class="mb-2"><span>Bước 2: Vo sạch gạo và đem ninh
                    cùng đỗ xanh, hạt sen.&nbsp;</span></li>
            <li class="mb-2"><span>Bước 3: Tổ yến sau khi sơ chế, ngâm
                    mềm đem hấp chín hoặc chưng cách thủy.&nbsp;</span></li>
            <li class="mb-2"><span>Bước 4: Sau khi cháo chín, bạn cho
                    tổ yến băm nhỏ và thịt chim vào nồi rồi đun nhỏ lửa trong khoảng 5-10 phút là có thể bày ra
                    ăn.&nbsp;&nbsp;</span></li>
        </ul>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/03/chao-to-yen-chim-bo-cau.jpg"
                alt="Món cháo tổ yến chim bồ câu cùng hạt sen và đỗ xanh">
            <figcaption id="caption-attachment-1573" class="wp-caption-text">Món cháo tổ yến chim bồ câu cùng hạt sen và
                đỗ
                xanh</figcaption>
        </figure>
        <h4>Lợi ích của cháo tổ yến với sức khỏe bé</h4>
        <p><span>Yến sào là thực phẩm có tính bình, vị ngọt, đã từng là cao lương mỹ vị trong thời
                vua chúa nhưng đang dần phổ biến hơn với nhiều đối tượng khách hàng những năm gần đây. Tổ yến sở hữu
                nhiều
                thành phần dinh dưỡng đa dạng với công dụng cụ thể với sức khỏe bé như sau:</span></p>
        <ul>
            <li class="mb-2"><span>Sắt và Canxi giúp tăng cường sức
                    khỏe hệ xương, giúp xương chắc hơn, trí nhớ cũng được phát triển tốt hơn.</span></li>
            <li class="mb-2"><span>Crom giúp hệ tiêu hóa hoạt động
                    hiệu quả hơn dù hàm lượng thấp.</span></li>
            <li class="mb-2"><span>Se có khả năng chống oxy hóa cao,
                    giúp chống lại các gốc tự do tấn công sức khỏe.&nbsp;</span></li>
            <li class="mb-2"><span>Sắt còn hỗ trợ sản sinh thêm nhiều
                    tế bào hồng cầu, tránh tình trạng thiếu máu xảy ra.</span></li>
            <li class="mb-2"><span>Một số nguyên tố khác có vai trò
                    trong việc phục hồi các tế bào bị tổn thương, kích thích sản sinh tế bào mới.&nbsp;</span></li>
            <li class="mb-2"><span>Nâng cao hệ miễn dịch, hạn chế tình
                    trạng cảm cúm và các bệnh về đường hô hấp.&nbsp;</span></li>
        </ul>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/03/yen-tuoi.jpg"
                alt="Tổ yến sau khi ngâm sẽ tan thành cái sợi mềm như hình">
            <figcaption><em>Tổ yến sau khi ngâm sẽ tan thành cái sợi mềm
                    như hình</em></figcaption>
        </figure>
        <h4>Lưu ý khi cho bé ăn cháo tổ yến</h4>
        <p><span>Cháo tổ yến có nhiều lợi ích “vàng” cho sự phát triển của bé nhưng mẹ không nên
                vì thế mà lạm dụng, cho bé ăn nhiều hơn mức cần thiết. Khi thưởng thức cháo không khoa học, bé sẽ không
                thu
                nạp được lượng dinh dưỡng cần thiết. Đôi khi, một số thành phần khác được kết hợp trong cháo còn khiến
                mệt
                mỏi, khó tiêu hơn. Chính vì vậy, trước khi cho bé ăn cháo tổ yến, mẹ nên tham khảo qua những lưu ý cơ
                bản
                sau đây.&nbsp;</span></p>
        <ul>
            <li class="mb-2"><span>Không cho trẻ dưới 1 tuổi ăn cháo
                    tổ yến bởi hệ tiêu hóa của trẻ chưa trưởng thành, chưa có khả năng xử lý tốt những loại thực phẩm
                    giàu
                    đạm như tổ yến. Nếu mẹ cho bé ăn cháo yến trong giai đoạn này, bé có thẻ bị tiêu chảy, đầy
                    bụng,…</span>
            </li>
            <li class="mb-2"><span>Không nên cho trẻ ăn quá định mức
                    cần thiết. Các chuyên gia dinh dưỡng khuyến nghị, trẻ chỉ nên ăn từ 2-3 bữa cháo tổ yến một tuần để
                    đảm
                    bảo hấp thu hiệu quả hơn.&nbsp;</span></li>
            <li class="mb-2"><span>Định mức phù hợp cho bé 1-3 tuổi là
                    50g tổ yến/tháng và bé 3-10 tuổi là 100g tổ yến/tháng. Nếu mẹ cho bé ăn quá lượng yến so với con số
                    này,
                    hệ tiêu hóa của bé sẽ bị ảnh hưởng.&nbsp;</span></li>
        </ul>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2020/12/yen-sao-cho-be.jpg"
                alt="Cần ước tính định mức phù hợp để tổ yến phát huy lợi ích với sức khỏe">
            <figcaption><em>Cần ước tính định mức phù hợp để tổ yến phát huy
                    lợi ích với sức khỏe</em></figcaption>
        </figure>
        <p><span>Hy vọng những công thức nấu cháo tổ yến được Lifenest chia sẻ trên đây đã gợi ý
                cho mẹ thực đơn phù hợp với khẩu vị của bé. Việc ăn ngon cũng quan trọng nhưng trên hết, mẹ vẫn cần lưu
                ý
                đến định mức và cách ăn uống khoa học để phân chia định mức các bữa ăn phù hợp, giúp bé yêu khỏe mạnh,
                thông
                minh hơn.&nbsp;</span><br>
            Nếu khách hàng muốn đặt mua yến sào vùng Yến Khánh Hòa có thể đặt mua tại</p>
        <ul>
            <li>Website : <a href="homePage">Nest-F</a></li>
            <li>Hotline: 0915.228.822</li>
            <li>Trụ sở chính : Vịnh Ninh Vân xã Ninh Hòa TP.Nha Trang tỉnh Khánh Hòa</li>
        </ul>
    </div>', N'img/post4.jpg')
INSERT [dbo].[tblPost] ([postID], [adPhone], [title], [postDate], [status], [content], [thumbnail]) VALUES (5, N'0988999999', N'Yến chưng mật ong: Cách chế biến thơm ngon bổ dưỡng nhất', CAST(N'2022-09-07T02:34:33.000' AS DateTime), 1, N'<div class="text-start ms-4">
        <p><span>Tổ yến là món ngon bổ dưỡng có công dụng tốt với sức khỏe của con người. Hiện
                nay, yến được chế biến dưới nhiều hình thức khác nhau, trong đó yến chưng mật ong là cách làm phổ biến,
                được nhiều người ưa chuộng. Đây là sự kết hợp hoàn hảo chứa đựng những tinh túy của hai loại thực phẩm
                cực kỳ bổ dưỡng. Trong bài viết này, Lifenest sẽ giới thiệu đến bạn cách chế biến yến chưng mật ong vô
                cùng đơn giản, dễ làm và giúp giữ lại các chất dinh dưỡng một cách hiệu quả.&nbsp;</span></p>
        <h4>Cách lựa chọn nguyên liệu</h4>
        <p><span>Để có một món ăn ngon thì việc lựa chọn nguyên liệu chất lượng là điều vô
                cùng quan trọng. Dưới đây là cách chọn yến và mật ong chi tiết mà bạn có thể tham khảo.&nbsp;</span></p>
        <h5>Cách chọn yến</h5>
        <p><span>Yến sào cần được chọn lựa kỹ lưỡng, bạn nên lựa chọn sản phẩm của các nhà sản
                xuất uy tín, đảm bảo chất lượng và nguồn gốc rõ ràng. Không nên mua sản phẩm không có nhãn mác bao bì
                tràn lan trên vỉa hè, các chợ bởi sẽ dễ là hàng giả, hàng nhái, hàng kém chất lượng.&nbsp;</span></p>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2021/01/tho-nhat-yen19.jpg"
                alt="Cách lựa chọn yến sào">
            <figcaption><em>Cách lựa chọn yến sào</em></figcaption>
        </figure>
        <p><span>Về quy trình yến được chia làm hai loại gồm yến thô và yến tinh chế. Nếu dựa
                vào nguồn gốc yến được chia làm yến đảo và yến nuôi.&nbsp;</span><br><br>
            <span>Yến thô là loại yến chưa trải qua các công đoạn xử lý. Do đó, khi lựa chọn
                yến thô bạn nên chọn tổ yến già với các sợi yến nổi rõ, ít tạp chất và ít lông bám trên tổ yến. Tổ bạch
                yến thô thường có màu trắng vàng hoặc vàng sậm. Trong khi đó, hồng yến thường có màu vàng cam tự nhiên,
                tùy vào độ tuổi của tổ yến mà sẽ có màu sắc từ cam nhạt đến cam đậm. Yến huyết có màu yến tự nhiên đậm
                hơn hồng yến, có vân yến nổi rõ hơn.</span><br><br>
            <span>Tổ yến tinh chế là loại yến đã được làm sạch lông, sấy khô và bảo quản kỹ
                lưỡng trước khi đưa đến tay người tiêu dùng. Tổ yến đạt tiêu chuẩn là khi đặt lên tay có cảm giác khô,
                bóp nhẹ dễ vỡ. Sợi yến được sấy khô với kích thước không đều nhau.</span><br><br>
            <span>Yến sào đã qua tinh chế có màu hơi ngả vàng, khi ngâm nước sẽ trắng trong
                trở lại và không tan trong nước. Kích thước sợi yến sẽ to hơn lúc khô khoảng 2-3 lần và sau khi chưng sẽ
                to hơn ban đầu khoảng 4-5 lần. Mùi của sợi yến tinh chế cũng nhạt hơn yến thô, đây cũng là đặc tính để
                bạn có thể dễ dàng phân biệt giữa yến thô và yến tinh chế. Tùy vào nhu cầu sử dụng mà bạn có thể lựa
                chọn loại yến sào cho phù hợp.&nbsp;</span>
        </p>
        <h5>Cách chọn mật ong</h5>
        <p><span >Mật ong cần lựa chọn loại tốt, nếu có thể bạn nên lựa chọn mật ong rừng. Hoặc
                có thể lựa chọn sử dụng mật ong nhà nhưng cần đảm bảo là loại nguyên chất không được pha trộn với
                đường.&nbsp;</span></p>
        <h4>Cách chế biến yến với mật ong an toàn và bổ dưỡng</h4>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2020/12/to-yen-sao-khanh-hoa-lifenest27.jpg"
                alt="Yến chưng mật ong là món ngon bổ dưỡng">
            <figcaption><em>Yến chưng mật ong là món ngon bổ dưỡng</em>
            </figcaption>
        </figure>
        <p><span >Nguyên liệu cần chuẩn bị bao gồm:&nbsp;</span></p>
        <ul>
            <li class="mb-2"><span >Yến sào: 1 tổ khoảng 10 gram
                    (cho khoảng 3-4 người ăn). Hoặc bạn cũng có thể tham khảo ý kiến của bác sĩ&nbsp;</span></li>
            <li class="mb-2"><span >Mật ong: 20ml&nbsp;</span></li>
            <li class="mb-2"><span >Đường phèn: 20gram&nbsp;</span>
            </li>
            <li class="mb-2"><span >Vài lát gừng tươi thái
                    mỏng</span></li>
        </ul>
        <p><span >Quy trình chưng yến sào với mật ong:&nbsp;</span></p>
        <ul>
            <li class="mb-2"><span >Bước 1: Cho yến sào khô vào bát
                    sạch, sau đó đổ nước và ngâm để yến sào nở ra. Tùy vào từng loại yến sào mà bạn ngâm trong thời gian
                    khác nhau. Thời gian ngâm dao động trong khoảng từ 20 phút đến 2 tiếng.&nbsp;</span></li>
            <li class="mb-2"><span >Bước 2: Cho yến sào sau khi sơ
                    chế vào bát, bỏ thêm nước sạch và tiến hành hấp cách thủy trong vòng 20 phút. Ban đầu điều chỉnh bếp
                    ở lửa to, sau khi nước trong nồi đã sôi bạn điều chỉnh bếp nhỏ lại để tránh cạn nước. Lưu ý, không
                    cho mật ong vào chưng cùng yến sào ngay từ đầu.&nbsp;</span></li>
            <li class="mb-2"><span >Bước 3: Hòa mật ong cùng một
                    chút nước ấm, sau khi thấy yến đã chín và nở thì tiến hành cho mật ong vào. Tùy vào khẩu vị của từng
                    người mà thêm gừng rồi tiếp tục đun thêm 5 phút.&nbsp;</span></li>
            <li class="mb-2"><span >Bước 4: Tắt bếp và múc phần yến
                    sào chưng mật ong ra bát. Bạn có thể sử dụng lúc nóng hay lạnh đều được bởi nhiệt độ nóng hay lạnh
                    cũng không làm ảnh hưởng đến dinh dưỡng của món ăn này.&nbsp;</span></li>
        </ul>
        <p><span >Tuy nhiên, các chuyên gia dinh dưỡng khuyên rằng, nên ăn yến sào vào lúc đói
                bụng nhất. Thời điểm phù hợp để sử dụng món ăn này là vào buổi sáng, giữa chiều hoặc buổi tối trước khi
                đi ngủ.&nbsp;</span></p>
        <h4>Những lưu ý khi thực hiện</h4>
        <p><span >Để món tổ yến chưng mật ong phát huy tối đa công dụng, chúng ta cần chú ý
                những vấn đề sau:&nbsp;</span></p>
        <ul>
            <li class="mb-2"><span >Chưng yến đúng thời gian, tránh
                    để lâu làm mất chất dinh dưỡng của tổ yến&nbsp;</span></li>
            <li class="mb-2"><span >Sau khi chưng tổ yến khoảng 20
                    phút rồi mới cho mật ong vào. Tránh cho mật ong vào từ đầu sẽ làm mất đi dưỡng chất ở cả trong yến
                    và mật ong.&nbsp;</span></li>
            <li class="mb-2"><span >Sử dụng yến chưng mật ong vào
                    buổi sáng sớm giúp dạ dày hoạt động tốt nhất</span></li>
            <li class="mb-2"><span >Yến kết hợp cùng mật ong là món
                    ăn mang đến nhiều dưỡng chất tốt cho cơ thể. Tuy nhiên, nếu lạm dụng quá nhiều sẽ gây thừa chất,
                    không tốt cho sức khỏe con người.&nbsp;</span></li>
        </ul>
        <h4>Tổ yến và mật ong có tác dụng gì với cơ thể?</h4>
        <p><span >Yến chưng mật ong là món ăn ngon, là sự kết hợp ngọt thanh của mật ong cùng
                với tổ yến – “thượng tẩm”, chỉ được dùng cho vua chúa trong cung đình ngày xưa. Món ăn này sở hữu nhiều
                công dụng đối với sức khỏe con người, cụ thể:&nbsp;</span></p>
        <h5>Công dụng tổ yến</h5>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2020/12/to-yen-sao-khanh-hoa-lifenest16.jpg"
                alt="Tổ yến có thể sử dụng cho mọi đối tượng khác nhau">
            <figcaption><em>Tổ yến có thể sử dụng cho mọi đối tượng khác</em>
                nhau</figcaption>
        </figure>
        <p><span >Trong tổ yến có chứa khoảng 45-55% protein không béo, 18 axit amin cùng với
                khoảng 30 vitamin và các khoáng chất thiết yếu. Loại nguyên liệu này tốt cho cả người già trẻ nhỏ và phụ
                nữ mang thai.&nbsp;</span><br><br>
            <span >Tổ yến có tác dụng hiệu quả&nbsp;trong việc tăng cường hệ thống miễn dịch,
                tăng sức đề kháng và phòng chống các bệnh về huyết áp và tim mạch. Bên cạnh đó, yến sào còn là món ăn bổ
                dưỡng tốt cho xương khớp, chống lão hóa, giữ dáng thon, tăng cường sinh lực và giảm cân hiệu
                quả.&nbsp;</span><br><br>
            <span >Hiện nay, tổ yến thường có 3 loại bạch yến, hồng yến và huyết yến đều có
                công dụng và lượng chất dinh dưỡng tương đương nhau. Trên thị trường hiện nay có nhiều địa chỉ cung cấp
                yến sào với xuất xứ khác nhau. Do đó, khách hàng chỉ nên mua yến sào ở những địa chỉ uy tín, chất lượng
                và lâu đời trong lĩnh vực này. Một trong những thương hiệu được nhiều khách hàng tin tưởng lựa chọn là
                yến sào Lifenest.&nbsp;</span>
        </p>
        <h5>Công dụng mật ong</h5>
        <p><span >Trong mật ong có chứa hàm lượng lớn vitamin B và vitamin C tốt cho việc dưỡng
                da. Tuy có vị ngọt nhưng mật ong lại cung cấp năng lượng cho cơ thể khá ít, hỗ trợ việc giảm cân hiệu
                quả. Sử dụng 100ml mật ong cơ thể chỉ hấp thu được khoảng 294 calorie.&nbsp;</span></p>
        <figure class="text-center"><img class="col-10"
                src="https://yensaokhanhhoa.vn/wp-content/uploads/2020/12/to-yen-sao-khanh-hoa-lifenest2.jpg"
                alt="To Yen Sao Khanh Hoa Lifenest2Trong mật ong có chứa hàm lượng lớn vitamin B, C, E và Pinocembrin&nbsp;">
            <figcaption><em>Trong mật ong có chứa hàm lượng lớn vitamin
                B, C, E và Pinocembrin&nbsp;</em></figcaption>
        </figure>
        <p><span >Nhằm duy trì các hoạt động hằng ngày, cơ thể vẫn phải đốt cháy một lượng mỡ
                thừa để sản sinh ra năng lượng phục vụ cơ thể. Ngoài ra, mật ong tốt cho hệ tiêu hóa, hỗ trợ dạ dày hoạt
                động linh hoạt hơn. Khi sử dụng mật ong, cơ thể của bạn không tích tụ các mỡ thừa, đốt cháy mỡ sản sinh
                ra năng lượng giúp giảm béo hiệu quả. Mật ong có chứa lượng lớn Vitamin C, E và Pinocembrin – 2 chất
                chống oxy hóa tự nhiên giúp ngăn ngừa và làm giảm nguy cơ mắc các bệnh liên quan đến tim
                mạch.&nbsp;</span><br><br>
            <span >Yến sào và mật ong khi kết hợp với
                nhau không gây ra tác dụng phụ mà ngược lại, có công dụng tốt cho sức khỏe của con người. Khi kết hợp 2
                loại thực phẩm này với nhau sẽ tạo nên món ăn cực kỳ thơm ngon và bổ dưỡng. Đặc biệt, yến sào chưng mật
                ong bổ trợ, tăng cường sức khỏe cho người hay mệt mỏi mất ngủ, giấc ngủ không ngon và ngủ không sâu
                giấc.</span><br><br>
            <span >Hy vọng những thông tin mà Lifenest vừa cung cấp trên đây sẽ giúp bạn biết
                cách chế biến yến chưng mật ong đúng chuẩn. Đừng quên, sử dụng yến sào chất lượng, uy tín và đúng liều
                lượng sẽ giúp chúng ta có một món ăn ngon và giàu dưỡng chất cho cơ thể</span>
        </p>
    </div>', N'img/post5.jpg')
SET IDENTITY_INSERT [dbo].[tblPost] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProducts] ON 

INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (1, N'Tổ yến thô cao cấp tiêu chuẩn 100g', 3500000, 400, 1, 2850000, N'<p><strong>Phân nhóm : </strong> Tổ yến thô còn lông<br />
<strong>Phân loại :</strong> Cao cấp<br />
<strong>Trọng lượng :</strong> 100gr (12 – 14 miếng/hộp)<br />
<strong>Bộ sản phẩm gồm :</strong></p>

<ul>
	<li>100gr tổ yến tinh chế đặc biệt</li>
	<li>1 hộp đường phèn</li>
	<li>1 hộp sen Huế đặc sản/Táo đỏ Hàn Quốc</li>
</ul>

<p><strong>Mùi :</strong> Tanh nhẹ đặc trưng (mùi biển)<br />
<strong>Bảo quản :</strong> 2 năm theo chỉ định bảo quản</p>
', N'img/product1.png-ptthimg/product2.png-ptthimg/product3.png-ptthimg/product4.png-ptthimg/product5.png-ptth', 0, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (2, N'Tổ yến thô đặc biệt tiêu chuẩn 100g', 3950000, 400, 1, 3500000, N'<p><strong>Phân nhóm: </strong> Tổ yến thô còn lông<br />
<strong>Phân loại:</strong> Đặc biệt<br />
<strong>Trọng lượng:</strong> 100gr (12 – 14 miếng/hộp)<br />
<strong>Bộ sản phẩm gồm:</strong></p>

<ul>
	<li>100gr tổ yến tinh chế đặc biệt</li>
	<li>1 hộp đường phèn</li>
	<li>1 hộp sen Huế đặc sản/Táo đỏ Hàn Quốc</li>
</ul>

<p><strong>Mùi :</strong> Tanh nhẹ đặc trưng (mùi biển)<br />
<strong>Bảo quản :</strong> 2 năm theo chỉ định bảo quản</p>
', N'img/product2.png-ptthimg/product2.png-ptthimg/product2.png-ptthimg/product2.png-ptthimg/product2.png-ptth', 1, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (3, N'Tổ yến tinh chế cao cấp 100g', 4050000, 400, 2, 3600000, N'<p><strong>Phân nhóm: </strong> Yến sào tinh chế<br />
<strong>Phân loại: </strong> Cao Cấp<br />
<strong>Trọng lượng: </strong> 100gr (10-12 miếng/hộp)<br />
<strong>Bộ sản phẩm gồm: </strong></p>

<ul>
	<li>100gr tổ yến tinh chế đặc biệt</li>
	<li>1 hộp đường phèn</li>
	<li>1 hộp sen Huế đặc sản/Táo đỏ Hàn Quốc</li>
</ul>

<p><strong>Mùi :</strong> Tanh nhẹ đặc trưng (mùi biển)<br />
<strong>Bảo quản :</strong> 2 năm theo chỉ định bảo quản</p>
', N'img/product3.png-ptthimg/product3.png-ptthimg/product3.png-ptthimg/product3.png-ptthimg/product3.png-ptth', 1, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (4, N'Tổ yến tinh chế đặc biệt 100g', 4500000, 490, 2, 3950000, N'<p><strong>Phân nhóm: </strong> Yến sào tinh chế<br />
<strong>Phân loại: </strong> Đặc biệt<br />
<strong>Trọng lượng: </strong> 100gr (10-12 miếng/hộp)<br />
<strong>Bộ sản phẩm gồm: </strong></p>

<ul>
	<li>100gr tổ yến tinh chế đặc biệt</li>
	<li>1 hộp đường phèn</li>
	<li>1 hộp sen Huế đặc sản/Táo đỏ Hàn Quốc</li>
</ul>

<p><strong>Mùi :</strong> Tanh nhẹ đặc trưng (mùi biển)<br />
<strong>Bảo quản :</strong> 2 năm theo chỉ định bảo quản</p>
', N'img/product4.png-ptthimg/product4.png-ptthimg/product4.png-ptthimg/product4.png-ptthimg/product4.png-ptth', 1, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (5, N'Tổ yến tinh chế nguyên sợi đặc biệt 100g', 4900000, 400, 2, 0, N'<p><strong>Phân nhóm: </strong> Yến sào tinh chế nguyên sợi<br />
<strong>Phân loại: </strong> Đặc biệt<br />
<strong>Trọng lượng: </strong> 100gr (12-17 miếng/hộp)<br />
<strong>Bộ sản phẩm gồm: </strong></p>

<ul>
	<li>100gr tổ yến tinh chế đặc biệt</li>
	<li>1 hộp đường phèn</li>
	<li>1 hộp sen Huế đặc sản/Táo đỏ Hàn Quốc</li>
</ul>

<p><strong>Mùi :</strong> Tanh nhẹ đặc trưng (mùi biển)<br />
<strong>Bảo quản :</strong> 2 năm theo chỉ định bảo quản</p>
', N'img/product5.png-ptthimg/product5.png-ptthimg/product5.png-ptthimg/product5.png-ptthimg/product5.png-ptth', 1, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (6, N'Tổ yến rút lông khô thượng hạng 100g', 5500000, 400, 2, 4750000, N'<p><strong>Phân nhóm: </strong> Yến sào rút lông khô Thượng Hạng<br />
<strong>Phân loại: </strong> Cao Cấp<br />
<strong>Trọng lượng: </strong> 100gr (18-22 miếng/hộp)<br />
<strong>Bộ sản phẩm gồm: </strong></p>

<ul>
	<li>100gr tổ yến tinh chế đặc biệt</li>
	<li>1 hộp đường phèn</li>
	<li>1 hộp sen Huế đặc sản/Táo đỏ Hàn Quốc</li>
</ul>

<p><strong>Mùi :</strong> Tanh nhẹ đặc trưng (mùi biển)<br />
<strong>Bảo quản :</strong> 2 năm theo chỉ định bảo quản</p>
', N'img/product6.png-ptthimg/product6.png-ptthimg/product6.png-ptthimg/product6.png-ptthimg/product6.png-ptth', 1, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (7, N'Yến sào tinh chế định hình 5a xuất khẩu', 5200000, 400, 2, 0, N'<p><strong>Phân nhóm: </strong> Yến sào tinh chế định hình 5A<br />
<strong>Phân loại: </strong> Đặc biệt<br />
<strong>Trọng lượng: </strong> 100gr (11-15 miếng/hộp)<br />
<strong>Bộ sản phẩm gồm: </strong></p>

<ul>
	<li>100gr tổ yến tinh chế đặc biệt</li>
	<li>1 hộp đường phèn</li>
	<li>1 hộp sen Huế đặc sản/Táo đỏ Hàn Quốc</li>
</ul>

<p><strong>Mùi :</strong> Tanh nhẹ đặc trưng (mùi biển)<br />
<strong>Bảo quản :</strong> 2 năm theo chỉ định bảo quản</p>
', N'img/product7.png-ptthimg/product7.png-ptthimg/product7.png-ptthimg/product7.png-ptthimg/product7.png-ptth', 1, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (8, N'Chân yến tinh chế đặc biệt 100g', 4050000, 0, 2, 3600000, N'<p><strong>Phân nhóm: </strong> Chân yến sào tinh chế<br />
<strong>Phân loại: </strong> Đặc biệt<br />
<strong>Trọng lượng: </strong> 100gr<br />
<strong>Bộ sản phẩm gồm: </strong></p>

<ul>
	<li>100gr tổ yến tinh chế đặc biệt</li>
	<li>1 hộp đường phèn</li>
	<li>1 hộp sen Huế đặc sản/Táo đỏ Hàn Quốc</li>
</ul>

<p><strong>Mùi :</strong> Tanh nhẹ đặc trưng (mùi biển)<br />
<strong>Bảo quản :</strong> 2 năm theo chỉ định bảo quản</p>
', N'img/product8.png-ptthimg/product8.png-ptthimg/product8.png-ptthimg/product8.png-ptthimg/product8.png-ptth', 1, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (9, N'Yến tinh chế vuông đặc biệt 100g', 3600000, 0, 2, 0, N'<p><strong>Phân nhóm: </strong> Yến sào tinh chế vuông đặc biệt<br />
<strong>Phân loại: </strong> Đặc biệt<br />
<strong>Trọng lượng: </strong> 100gr (18-22 miếng/hộp)<br />
<strong>Bộ sản phẩm gồm: </strong></p>

<ul>
	<li>100gr tổ yến tinh chế đặc biệt</li>
	<li>1 hộp đường phèn</li>
	<li>1 hộp sen Huế đặc sản/Táo đỏ Hàn Quốc</li>
</ul>

<p><strong>Mùi :</strong> Tanh nhẹ đặc trưng (mùi biển)<br />
<strong>Bảo quản :</strong> 2 năm theo chỉ định bảo quản</p>
', N'img/product9.png-ptthimg/product9.png-ptthimg/product9.png-ptthimg/product9.png-ptthimg/product9.png-ptth', 1, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (10, N'COMBO 6 chai yến chưng tươi 70ml', 650000, 400, 3, 0, N'<p><strong>Phân nhóm: </strong> Yến chưng tươi theo yêu cầu<br />
<strong>Hàm lượng yến tươi: </strong> 5gr yến tươi = 1gr yến thô<br />
<strong>Dung tích: </strong> 6 x 70ml<br />
<strong>Đóng gói: </strong> Lọ thủy tinh có nắp đậy kín<br />
<strong>Đặc trưng: </strong></p>

<ul>
	<li>Tổ yến chưng sẵn nguyên chất theo hàm lượng từ chuyên gia.</li>
	<li>Giữ nguyên hương vị, dinh dưỡng, và độ mềm dẻo của tổ yến.</li>
	<li>Không chất bảo quản, phụ gia, chất tạo mùi.</li>
</ul>
', N'img/product10.png-ptthimg/product10.png-ptthimg/product10.png-ptthimg/product10.png-ptthimg/product10.png-ptth', 1, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (11, N'COMBO Yến chưng tươi 100ml', 950000, 400, 3, 720000, N'<p><strong>Phân nhóm: </strong> Yến chưng tươi theo yêu cầu<br />
<strong>Hàm lượng yến tươi: </strong> 15gr = 2gr yến thô (khẩu phần dùng thử/người lớn)<br />
<strong>Dung tích: </strong> 4 x 100ml<br />
<strong>Đóng gói: </strong> Lọ thủy tinh có nắp đậy kín<br />
<strong>Đặc trưng: </strong></p>

<ul>
	<li>Tổ yến chưng sẵn nguyên chất theo hàm lượng từ chuyên gia.</li>
	<li>Giữ nguyên hương vị, dinh dưỡng, và độ mềm dẻo của tổ yến.</li>
	<li>Không chất bảo quản, phụ gia, chất tạo mùi.</li>
</ul>
', N'img/product11.png-ptthimg/product11.png-ptthimg/product11.png-ptthimg/product11.png-ptthimg/product11.png-ptth', 1, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (12, N'COMBO Yến chưng tươi 300ml – mua 3 tặng 3', 1250000, 400, 3, 0, N'<p><strong>Phân nhóm: </strong> Yến chưng tươi theo yêu cầu<br />
<strong>Hàm lượng yến tươi: </strong> 30gr = 4,5gr yến thô (chuẩn hiệu quả hấp thu 1 người lớn)<br />
<strong>Dung tích: </strong> 300ml<br />
<strong>Đóng gói: </strong> Lọ thủy tinh có nắp đậy kín<br />
<strong>Đặc trưng: </strong></p>

<ul>
	<li>Tổ yến chưng sẵn nguyên chất theo hàm lượng từ chuyên gia.</li>
	<li>Giữ nguyên hương vị, dinh dưỡng, và độ mềm dẻo của tổ yến.</li>
	<li>Không chất bảo quản, phụ gia, chất tạo mùi.</li>
</ul>
', N'img/product12.png-ptthimg/product12.png-ptthimg/product12.png-ptthimg/product12.png-ptthimg/product12.png-ptth', 1, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (13, N'COMBO 6 lọ Yến chưng sẵn 100% yến vị truyền thống', 650000, 400, 4, 0, N'<p><strong>Loại sản phẩm: </strong>Yến Chưng Đường phèn<br />
<strong>Dành cho: </strong>Mọi lứa tuổi có thể dùng được<br />
<strong>Phần trăm yến: </strong>100%<br />
<strong>Chế biến: </strong>Chưng Cách thủy khép kín<br />
<strong>Thành phần: </strong>Tổ yến tươi 100%, đường phèn, nước RO tiệt trùng, Hương thiên nhiên<br />
<strong>Lượng đường: </strong>Vừa phải, không quá ngọt<br />
<strong>Thể tích: </strong>70ml</p>
', N'img/product13.png-ptthimg/product13.png-ptthimg/product13.png-ptthimg/product13.png-ptthimg/product13.png-ptth', 1, NULL)
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [categoryID], [discountPrice], [productDes], [image], [status], [detailDes]) VALUES (14, N'[Set quà] COMBO 8 hũ yến chưng sẵn 100% yến', 1020000, 400, 4, 790000, N'<p><strong>Loại sản phẩm: </strong>Yến Chưng Đường phèn<br />
<strong>Dành cho: </strong>Mọi lứa tuổi có thể dùng được<br />
<strong>Phần trăm yến: </strong>100%<br />
<strong>Chế biến: </strong>Chưng Cách thủy khép kín<br />
<strong>Thành phần: </strong>Tổ yến tươi 100%, đường phèn, nước RO tiệt trùng, hương thiên nhiên<br />
<strong>Lượng đường: </strong>Vừa phải, không quá ngọt<br />
<strong>Thể tích: </strong>70ml</p>
', N'img/product14.png-ptthimg/product14.png-ptthimg/product14.png-ptthimg/product14.png-ptthimg/product14.png-ptth', 1, NULL)
SET IDENTITY_INSERT [dbo].[tblProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProductSeller] ON 

INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (1, 1, N'0988123123', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (2, 2, N'0988123123', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (3, 3, N'0988123123', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (4, 4, N'0988123123', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (5, 5, N'0988222222', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (6, 6, N'0988222222', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (7, 7, N'0988222222', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (8, 8, N'0988222222', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (9, 9, N'0988123123', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (10, 10, N'0988123123', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (11, 11, N'0988123123', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (12, 12, N'0988123123', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (13, 13, N'0988123123', 1)
INSERT [dbo].[tblProductSeller] ([productSellerID], [productID], [selPhone], [isActive]) VALUES (14, 14, N'0988123123', 1)
SET IDENTITY_INSERT [dbo].[tblProductSeller] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStatus] ON 

INSERT [dbo].[tblStatus] ([statusID], [status]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[tblStatus] ([statusID], [status]) VALUES (2, N'Chờ lấy hàng')
INSERT [dbo].[tblStatus] ([statusID], [status]) VALUES (3, N'Đang giao')
INSERT [dbo].[tblStatus] ([statusID], [status]) VALUES (4, N'Đã giao')
INSERT [dbo].[tblStatus] ([statusID], [status]) VALUES (5, N'Đã hủy')
SET IDENTITY_INSERT [dbo].[tblStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tblVoucher] ON 

INSERT [dbo].[tblVoucher] ([voucherID], [typeID], [cusPhone], [status], [expiredDate]) VALUES (1, 1, N'0988444444', 1, CAST(N'2022-11-21' AS Date))
INSERT [dbo].[tblVoucher] ([voucherID], [typeID], [cusPhone], [status], [expiredDate]) VALUES (2, 4, N'0988555555', 1, CAST(N'2022-11-22' AS Date))
INSERT [dbo].[tblVoucher] ([voucherID], [typeID], [cusPhone], [status], [expiredDate]) VALUES (3, 2, N'0988777777', 1, CAST(N'2022-11-21' AS Date))
INSERT [dbo].[tblVoucher] ([voucherID], [typeID], [cusPhone], [status], [expiredDate]) VALUES (4, 4, N'0988444444', 0, CAST(N'2022-10-03' AS Date))
INSERT [dbo].[tblVoucher] ([voucherID], [typeID], [cusPhone], [status], [expiredDate]) VALUES (5, 1, N'0988666666', 1, CAST(N'2022-09-30' AS Date))
INSERT [dbo].[tblVoucher] ([voucherID], [typeID], [cusPhone], [status], [expiredDate]) VALUES (6, 3, N'0988555555', 1, CAST(N'2022-11-23' AS Date))
INSERT [dbo].[tblVoucher] ([voucherID], [typeID], [cusPhone], [status], [expiredDate]) VALUES (7, 3, N'0988444444', 1, CAST(N'2022-12-07' AS Date))
INSERT [dbo].[tblVoucher] ([voucherID], [typeID], [cusPhone], [status], [expiredDate]) VALUES (8, 3, N'0988444444', 0, CAST(N'2022-11-10' AS Date))
INSERT [dbo].[tblVoucher] ([voucherID], [typeID], [cusPhone], [status], [expiredDate]) VALUES (9, 4, N'0988444444', 1, CAST(N'2022-12-11' AS Date))
INSERT [dbo].[tblVoucher] ([voucherID], [typeID], [cusPhone], [status], [expiredDate]) VALUES (10, 3, N'0988444444', 1, CAST(N'2022-12-11' AS Date))
SET IDENTITY_INSERT [dbo].[tblVoucher] OFF
GO
SET IDENTITY_INSERT [dbo].[tblVoucherType] ON 

INSERT [dbo].[tblVoucherType] ([typeID], [voucherName], [saleValue], [quantity], [point], [status]) VALUES (1, N'Giảm 500k', 500000, 100, 4700, 1)
INSERT [dbo].[tblVoucherType] ([typeID], [voucherName], [saleValue], [quantity], [point], [status]) VALUES (2, N'Giảm 300k', 300000, 100, 2800, 1)
INSERT [dbo].[tblVoucherType] ([typeID], [voucherName], [saleValue], [quantity], [point], [status]) VALUES (3, N'Giảm 1000k', 1000000, 98, 9000, 1)
INSERT [dbo].[tblVoucherType] ([typeID], [voucherName], [saleValue], [quantity], [point], [status]) VALUES (4, N'Giảm 100k', 100000, 9999, 1000, 1)
SET IDENTITY_INSERT [dbo].[tblVoucherType] OFF
GO
ALTER TABLE [dbo].[tblAccount] ADD  CONSTRAINT [DF_tblAccount_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[tblBill]  WITH CHECK ADD  CONSTRAINT [FK__tblBill__cusPhon__5165187F] FOREIGN KEY([cusPhone])
REFERENCES [dbo].[tblAccount] ([phone])
GO
ALTER TABLE [dbo].[tblBill] CHECK CONSTRAINT [FK__tblBill__cusPhon__5165187F]
GO
ALTER TABLE [dbo].[tblBill]  WITH CHECK ADD FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblBillDetail]  WITH CHECK ADD  CONSTRAINT [FK__tblBillDe__billI__4F7CD00D] FOREIGN KEY([billID])
REFERENCES [dbo].[tblBill] ([billID])
GO
ALTER TABLE [dbo].[tblBillDetail] CHECK CONSTRAINT [FK__tblBillDe__billI__4F7CD00D]
GO
ALTER TABLE [dbo].[tblBillDetail]  WITH CHECK ADD  CONSTRAINT [FK__tblBillDe__produ__5070F446] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblBillDetail] CHECK CONSTRAINT [FK__tblBillDe__produ__5070F446]
GO
ALTER TABLE [dbo].[tblCart]  WITH CHECK ADD  CONSTRAINT [FK__tblCart__cusPhon__534D60F1] FOREIGN KEY([cusPhone])
REFERENCES [dbo].[tblAccount] ([phone])
GO
ALTER TABLE [dbo].[tblCart] CHECK CONSTRAINT [FK__tblCart__cusPhon__534D60F1]
GO
ALTER TABLE [dbo].[tblCart]  WITH CHECK ADD  CONSTRAINT [FK__tblCart__product__5441852A] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblCart] CHECK CONSTRAINT [FK__tblCart__product__5441852A]
GO
ALTER TABLE [dbo].[tblFeedbacks]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedba__cusPh__59FA5E80] FOREIGN KEY([cusPhone])
REFERENCES [dbo].[tblAccount] ([phone])
GO
ALTER TABLE [dbo].[tblFeedbacks] CHECK CONSTRAINT [FK__tblFeedba__cusPh__59FA5E80]
GO
ALTER TABLE [dbo].[tblFeedbacks]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedba__produ__59063A47] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblFeedbacks] CHECK CONSTRAINT [FK__tblFeedba__produ__59063A47]
GO
ALTER TABLE [dbo].[tblIncome]  WITH CHECK ADD  CONSTRAINT [FK__tblIncome__selPh__5629CD9C] FOREIGN KEY([selPhone])
REFERENCES [dbo].[tblAccount] ([phone])
GO
ALTER TABLE [dbo].[tblIncome] CHECK CONSTRAINT [FK__tblIncome__selPh__5629CD9C]
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD  CONSTRAINT [FK__tblPost__adPhone__5535A963] FOREIGN KEY([adPhone])
REFERENCES [dbo].[tblAccount] ([phone])
GO
ALTER TABLE [dbo].[tblPost] CHECK CONSTRAINT [FK__tblPost__adPhone__5535A963]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK__tblProduc__categ__4E88ABD4] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK__tblProduc__categ__4E88ABD4]
GO
ALTER TABLE [dbo].[tblProductSeller]  WITH CHECK ADD  CONSTRAINT [FK__tblProduc__produ__5BE2A6F2] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblProductSeller] CHECK CONSTRAINT [FK__tblProduc__produ__5BE2A6F2]
GO
ALTER TABLE [dbo].[tblProductSeller]  WITH CHECK ADD  CONSTRAINT [FK__tblProduc__selPh__5AEE82B9] FOREIGN KEY([selPhone])
REFERENCES [dbo].[tblAccount] ([phone])
GO
ALTER TABLE [dbo].[tblProductSeller] CHECK CONSTRAINT [FK__tblProduc__selPh__5AEE82B9]
GO
ALTER TABLE [dbo].[tblVoucher]  WITH CHECK ADD  CONSTRAINT [FK__tblVouche__cusPh__5812160E] FOREIGN KEY([cusPhone])
REFERENCES [dbo].[tblAccount] ([phone])
GO
ALTER TABLE [dbo].[tblVoucher] CHECK CONSTRAINT [FK__tblVouche__cusPh__5812160E]
GO
ALTER TABLE [dbo].[tblVoucher]  WITH CHECK ADD  CONSTRAINT [FK__tblVouche__typeI__571DF1D5] FOREIGN KEY([typeID])
REFERENCES [dbo].[tblVoucherType] ([typeID])
GO
ALTER TABLE [dbo].[tblVoucher] CHECK CONSTRAINT [FK__tblVouche__typeI__571DF1D5]
GO
USE [master]
GO
ALTER DATABASE [NestF] SET  READ_WRITE 
GO
