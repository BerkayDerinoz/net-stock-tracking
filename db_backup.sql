USE [StockTracking_Data]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 23.05.2021 22:24:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 23.05.2021 22:24:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateCreated] [datetime2](7) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 23.05.2021 22:24:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Photo] [nvarchar](max) NULL,
	[Stock] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateCreated] [datetime2](7) NULL,
	[Description] [nvarchar](max) NULL,
	[DescriptionIndex] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210522195110_product_table', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210522201948_updated_product_table', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210523091610_table_product', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210523124520_order_table', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210523124926_updated_order_table', N'5.0.6')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Price], [Photo], [Stock], [IsDeleted], [DateCreated], [Description], [DescriptionIndex]) VALUES (1, N'Baskılı Kısa Tişört', CAST(79.99 AS Decimal(18, 2)), N'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F97%2F5a%2F975a591eb0f9a444cd20d36c31eeb60b0955e492.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 20, 0, CAST(N'2021-05-22T13:30:00.0000000' AS DateTime2), N'Önü baskı motifli, kısa ve geniş kesimli jarse tişört. Yakası ribana şeritli, düşük omuzlu, kısa ve geniş kollu, etek ucu kıvrık kenarlı.', N'Sezonun trendi Baskılı Kısa Tişört')
INSERT [dbo].[Product] ([Id], [Name], [Price], [Photo], [Stock], [IsDeleted], [DateCreated], [Description], [DescriptionIndex]) VALUES (2, N'Mavi T-Shirt', CAST(90.00 AS Decimal(18, 2)), N'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F65%2Fd3%2F65d3cc8e6e975b2e1b1c25ddd7572158283b416a.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 20, 0, CAST(N'2021-05-22T13:40:00.0000000' AS DateTime2), N'Pamuklu kalın jarseden, yuvarlak yakalı tişört.

', N'Sezonun trendi mavi tshirt')
INSERT [dbo].[Product] ([Id], [Name], [Price], [Photo], [Stock], [IsDeleted], [DateCreated], [Description], [DescriptionIndex]) VALUES (3, N'Kabarık Kollu Elbise', CAST(99.99 AS Decimal(18, 2)), N'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fa3%2Fae%2Fa3aeee931ad6298328cd979a321d399c27faba82.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 20, 0, CAST(N'2021-05-22T13:42:00.0000000' AS DateTime2), N'Nakış işlemeli dokuma kumaştan, kalp yakalı, şekilli kuplu kısa elbise. Önünde oyuk, küçük bir açıklık ve bağcıklar bulunur. Kısa kabarık kollu, omuzları ve kol ağızları ince lastikli, göğüs altında dikişli, hafif kloş etekli.', N'Sezonun trendi Kabarık Kollu Elbise')
INSERT [dbo].[Product] ([Id], [Name], [Price], [Photo], [Stock], [IsDeleted], [DateCreated], [Description], [DescriptionIndex]) VALUES (5, N'Drapeli Straplez Üst', CAST(79.99 AS Decimal(18, 2)), N'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F99%2Fba%2F99ba7ff65e6c8088885433906df3b9bcee5664ab.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_tops_croppedtops%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 20, 0, CAST(N'2021-05-23T13:46:00.0000000' AS DateTime2), N'Pamuklu hafif vualden, hafif drapeli görünüm için büzgülü dikişli kısa straplez üst. Üst ve alt kısmı lastikli ve fırfırlı. Astarlı. Organik pamuktan üretilmiş bu üst, elle boyanmış çayır çiçekleri koleksiyonumuzun bir parçasıdır. Deseni, favori kır çiçeklerini seçip onları sulu boyayla resmeden baskı tasarımcılarımız Kavita, Abigail, Holly ve Florentin tarafından geliştirilmiştir.', N'Sezonun trendi Drapeli Straplez Üst')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product_ProductId]
GO
