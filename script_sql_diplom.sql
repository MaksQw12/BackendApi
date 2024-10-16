USE [maksdiplom_]
GO
/****** Object:  Table [dbo].[Basket]    Script Date: 5/15/2024 5:36:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryProduct]    Script Date: 5/15/2024 5:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CategoryProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 5/15/2024 5:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IsProduct] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Estimation] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/15/2024 5:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdBasket] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/15/2024 5:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Count] [int] NOT NULL,
	[Article] [nvarchar](max) NOT NULL,
	[IdCategory] [int] NOT NULL,
	[IdSupplier] [int] NOT NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 5/15/2024 5:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplaierName] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/15/2024 5:36:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CategoryProduct] ON 

INSERT [dbo].[CategoryProduct] ([Id], [CategoryName]) VALUES (1, N'Белье')
INSERT [dbo].[CategoryProduct] ([Id], [CategoryName]) VALUES (1002, N'Подушки')
INSERT [dbo].[CategoryProduct] ([Id], [CategoryName]) VALUES (1003, N'Одеяла')
INSERT [dbo].[CategoryProduct] ([Id], [CategoryName]) VALUES (1004, N'Пледы')
INSERT [dbo].[CategoryProduct] ([Id], [CategoryName]) VALUES (1005, N'Покрывала')
INSERT [dbo].[CategoryProduct] ([Id], [CategoryName]) VALUES (1006, N'Пододеяльники')
INSERT [dbo].[CategoryProduct] ([Id], [CategoryName]) VALUES (1007, N'string')
INSERT [dbo].[CategoryProduct] ([Id], [CategoryName]) VALUES (1008, N'1008string')
INSERT [dbo].[CategoryProduct] ([Id], [CategoryName]) VALUES (2002, N'мяу')
SET IDENTITY_INSERT [dbo].[CategoryProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ProductName], [Description], [Price], [Count], [Article], [IdCategory], [IdSupplier], [Image]) VALUES (1, N'11', N'qw', CAST(12 AS Decimal(18, 0)), 1, N'123', 1002, 2, NULL)
INSERT [dbo].[Product] ([Id], [ProductName], [Description], [Price], [Count], [Article], [IdCategory], [IdSupplier], [Image]) VALUES (2, N'number2', N'number2', CAST(223 AS Decimal(18, 0)), 2, N'223', 1, 2, NULL)
INSERT [dbo].[Product] ([Id], [ProductName], [Description], [Price], [Count], [Article], [IdCategory], [IdSupplier], [Image]) VALUES (3, N'qw', N'qw', CAST(12 AS Decimal(18, 0)), 1, N'123', 1, 1002, NULL)
INSERT [dbo].[Product] ([Id], [ProductName], [Description], [Price], [Count], [Article], [IdCategory], [IdSupplier], [Image]) VALUES (4, N'qw', N'qw', CAST(12 AS Decimal(18, 0)), 1, N'123', 1006, 1003, NULL)
INSERT [dbo].[Product] ([Id], [ProductName], [Description], [Price], [Count], [Article], [IdCategory], [IdSupplier], [Image]) VALUES (2004, N'123321', N'123321', CAST(123321 AS Decimal(18, 0)), 123321, N'123321', 2002, 2002, NULL)
INSERT [dbo].[Product] ([Id], [ProductName], [Description], [Price], [Count], [Article], [IdCategory], [IdSupplier], [Image]) VALUES (2005, N'123321', N'123321', CAST(123321 AS Decimal(18, 0)), 123321, N'123321', 1, 1, NULL)
INSERT [dbo].[Product] ([Id], [ProductName], [Description], [Price], [Count], [Article], [IdCategory], [IdSupplier], [Image]) VALUES (2008, N'321', N'321', CAST(321 AS Decimal(18, 0)), 321, N'321', 1, 1, NULL)
INSERT [dbo].[Product] ([Id], [ProductName], [Description], [Price], [Count], [Article], [IdCategory], [IdSupplier], [Image]) VALUES (2009, N'2009', N'2009', CAST(999 AS Decimal(18, 0)), 999, N'999', 2002, 2002, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([Id], [SupplaierName], [Country], [City]) VALUES (1, N'Enk2001', N'France', N'Paris')
INSERT [dbo].[Suppliers] ([Id], [SupplaierName], [Country], [City]) VALUES (2, N'Nike', N'America', N'Los-Angeles')
INSERT [dbo].[Suppliers] ([Id], [SupplaierName], [Country], [City]) VALUES (1002, N'4321', N'4321', N'4321')
INSERT [dbo].[Suppliers] ([Id], [SupplaierName], [Country], [City]) VALUES (1003, N'4321', N'4321', N'4321')
INSERT [dbo].[Suppliers] ([Id], [SupplaierName], [Country], [City]) VALUES (2002, N'string', N'string', N'string')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [Email]) VALUES (5, N'Test', N'Test@mail.ru')
INSERT [dbo].[User] ([Id], [UserName], [Email]) VALUES (6, N'Test_2', N'Test2@mail.ru')
INSERT [dbo].[User] ([Id], [UserName], [Email]) VALUES (7, N'Test', N'Tes3t@mail.ru')
INSERT [dbo].[User] ([Id], [UserName], [Email]) VALUES (8, N'Test', N'Tes22t@mail.ru')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_Product]
GO
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_User]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Product] FOREIGN KEY([IsProduct])
REFERENCES [dbo].[Product] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Product]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Basket] FOREIGN KEY([IdBasket])
REFERENCES [dbo].[Basket] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Basket]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_CategoryProduct] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[CategoryProduct] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_CategoryProduct]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Suppliers] FOREIGN KEY([IdSupplier])
REFERENCES [dbo].[Suppliers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Suppliers]
GO
