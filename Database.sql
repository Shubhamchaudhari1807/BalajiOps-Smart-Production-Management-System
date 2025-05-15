USE [DbCattleFeed]
GO
/****** Object:  Table [dbo].[GRNLine]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRNLine](
	[GRNLineId] [int] IDENTITY(1,1) NOT NULL,
	[GRNHeaderId] [int] NULL,
	[ProductId] [int] NULL,
	[ItemId] [int] NULL,
	[UnitId] [int] NULL,
	[POQty] [decimal](18, 2) NULL,
	[AcceptedQty] [decimal](18, 2) NULL,
	[RejectedQty] [decimal](18, 2) NULL,
	[FreeQty] [decimal](18, 2) NULL,
	[PORate] [decimal](18, 2) NULL,
	[BasicAmount] [decimal](18, 2) NULL,
	[DiscountPercentage] [decimal](18, 2) NULL,
	[DiscountAmount] [decimal](18, 2) NULL,
	[TaxableAmount] [decimal](18, 2) NULL,
	[TaxId] [int] NULL,
	[TaxAmount] [decimal](18, 2) NULL,
	[PayableAmount] [decimal](18, 2) NULL,
	[PurchaseLineId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GRNLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseHeader]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseHeader](
	[PurchaseHeaderId] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseDate] [datetime] NULL,
	[PersonId] [int] NULL,
	[PlantId] [int] NULL,
	[GodownId] [int] NULL,
	[BasicAmount] [decimal](18, 2) NULL,
	[TaxAmount] [decimal](18, 2) NULL,
	[DiscountAmount] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PurchaseHeader] PRIMARY KEY CLUSTERED 
(
	[PurchaseHeaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionLine]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionLine](
	[ProductionLineId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ItemId] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[QuantityRequired] [decimal](18, 2) NULL,
	[Stock] [decimal](18, 2) NULL,
	[ProductionHeaderId] [int] NULL,
	[GRNLineId] [int] NULL,
	[GRNHeaderId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductionLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseLine]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseLine](
	[PurchaseLineId] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseHeaderId] [int] NULL,
	[ProductId] [int] NULL,
	[ItemId] [int] NULL,
	[PackingId] [int] NULL,
	[UnitId] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Rate] [decimal](18, 2) NULL,
	[BasicAmount] [decimal](18, 2) NULL,
	[DiscountPercentage] [decimal](18, 2) NULL,
	[DiscountAmount] [decimal](18, 2) NULL,
	[TaxableAmount] [decimal](18, 2) NULL,
	[TaxId] [int] NULL,
	[TaxAmount] [decimal](18, 2) NULL,
	[PayableAmount] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](20) NULL,
	[Flammable] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tax]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax](
	[TaxId] [int] IDENTITY(1,1) NOT NULL,
	[TaxName] [nvarchar](20) NULL,
	[TaxPercentage] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[PersonTypeId] [int] NULL,
	[PersonName] [nvarchar](20) NULL,
	[PersonAddress] [nvarchar](30) NULL,
	[PersonContact] [nvarchar](20) NULL,
	[PersonEmail] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ItemName] [nvarchar](20) NULL,
	[Max_Qty] [decimal](18, 2) NULL,
	[Min_Qty] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRNHeader]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRNHeader](
	[GRNHeaderId] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseHeaderId] [int] NULL,
	[GRNDate] [datetime] NULL,
	[VehicleNo] [nvarchar](20) NULL,
	[VehicleWeight] [decimal](18, 2) NULL,
	[VehicleLoadedWeight] [decimal](18, 2) NULL,
	[DCNo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[GRNHeaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[StockDetails]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[StockDetails] as
SELECT GHeader.GRNHeaderId, GHeader.PurchaseHeaderId, GHeader.GRNDate, GHeader.VehicleNo, GHeader.VehicleWeight, GHeader.VehicleLoadedWeight, GHeader.DCNo, GLine.GRNLineId, GLine.ProductId, GLine.ItemId, GLine.UnitId, 
                  GLine.POQty, GLine.AcceptedQty, GLine.RejectedQty, GLine.FreeQty, GLine.PORate, GLine.DiscountPercentage, GLine.TaxId, GLine.PurchaseLineId, PLine.PackingId, PHeader.PurchaseDate, PHeader.PersonId, person.PersonName, 
                  person.PersonAddress, person.PersonContact, person.PersonEmail, person.PersonTypeId, tax.TaxName, tax.TaxPercentage, P.ProductName, P.Flammable, I.ItemName, I.Max_Qty, I.Min_Qty, U.UnitName, ProdLine.QuantityRequired
FROM     dbo.GRNHeader AS GHeader INNER JOIN
                  dbo.GRNLine AS GLine ON GHeader.GRNHeaderId = GLine.GRNHeaderId INNER JOIN
                  dbo.PurchaseLine AS PLine ON GLine.PurchaseLineId = PLine.PurchaseLineId INNER JOIN
                  dbo.PurchaseHeader AS PHeader ON PLine.PurchaseHeaderId = PHeader.PurchaseHeaderId INNER JOIN
                  dbo.Tax AS tax ON GLine.TaxId = tax.TaxId INNER JOIN
                  dbo.Product AS P ON GLine.ProductId = P.ProductId INNER JOIN
                  dbo.Item AS I ON GLine.ItemId = I.ItemId INNER JOIN
                  dbo.Person AS person ON PHeader.PersonId = person.PersonId INNER JOIN
                  dbo.Unit AS U ON GLine.UnitId = U.UnitId INNER JOIN
				  ProductionLine ProdLine ON ProdLine.GRNLineId=GLine.GRNLineId
GO
/****** Object:  View [dbo].[PurchaseDetails]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PurchaseDetails]
AS
SELECT CONVERT(nvarchar(20), header.PurchaseDate, 103) AS purchase_order_date, header.PurchaseHeaderId AS purchase_order_number, p.ProductName, i.ItemName, person.PersonName, t.TaxName, CAST(ISNULL(line.Quantity, 0) 
                  * ISNULL(line.Rate, 0) AS decimal(18, 2)) AS basic_amount, CAST(ISNULL(line.Quantity, 0) * ISNULL(line.Rate, 0) * line.DiscountPercentage / 100 AS decimal(18, 2)) AS discount_amount, CAST(ISNULL(line.Quantity, 0) * ISNULL(line.Rate, 0) 
                  - ISNULL(line.Quantity, 0) * ISNULL(line.Rate, 0) * line.DiscountPercentage / 100 AS decimal(18, 2)) AS taxable_amount, CAST((ISNULL(line.Quantity, 0) * ISNULL(line.Rate, 0) - ISNULL(line.Quantity, 0) * ISNULL(line.Rate, 0) 
                  * ISNULL(line.DiscountPercentage, 0) / 100) * ISNULL(t.TaxPercentage, 0) / 100 AS decimal(18, 2)) AS tax_amount, CAST(ISNULL(line.Quantity, 0) * ISNULL(line.Rate, 0) - (ISNULL(line.Quantity, 0) * ISNULL(line.Rate, 0) 
                  * line.DiscountPercentage / 100 + (ISNULL(line.Quantity, 0) * ISNULL(line.Rate, 0) - ISNULL(line.Quantity, 0) * ISNULL(line.Rate, 0) * ISNULL(line.DiscountPercentage, 0) / 100) * ISNULL(t.TaxPercentage, 0) / 100) AS decimal(18, 2)) 
                  AS payable_amount, line.PurchaseLineId, line.PurchaseHeaderId, line.ProductId, line.ItemId, line.PackingId, line.UnitId, line.Quantity, line.Rate, line.BasicAmount, line.DiscountPercentage, line.DiscountAmount, line.TaxableAmount, 
                  line.TaxId, line.TaxAmount, line.PayableAmount, header.PersonId
FROM     dbo.PurchaseLine AS line INNER JOIN
                  dbo.PurchaseHeader AS header ON header.PurchaseHeaderId = line.PurchaseHeaderId INNER JOIN
                  dbo.Item AS i ON line.ItemId = i.ItemId INNER JOIN
                  dbo.Product AS p ON i.ProductId = p.ProductId INNER JOIN
                  dbo.Person AS person ON header.PersonId = person.PersonId INNER JOIN
                  dbo.Tax AS t ON line.TaxId = t.TaxId
GO
/****** Object:  Table [dbo].[Company]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](max) NULL,
	[GST] [nvarchar](max) NULL,
	[CompanyAddress] [nvarchar](max) NULL,
	[CompanyLogo] [nvarchar](max) NULL,
	[CompanyContactNo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Costing]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costing](
	[CostId] [int] IDENTITY(1,1) NOT NULL,
	[Cost_Type] [nvarchar](20) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormulationHeader]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormulationHeader](
	[FormulationHeaderId] [int] IDENTITY(1,1) NOT NULL,
	[FormulationName] [nvarchar](max) NULL,
	[FormulationDate] [datetime] NULL,
	[ProductId] [int] NULL,
	[ItemId] [int] NULL,
	[FormulationCode] [nvarchar](max) NULL,
	[UnitId] [int] NULL,
	[FormulaQty] [decimal](18, 2) NULL,
	[attr1] [int] NULL,
	[AcFlag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[FormulationHeaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormulationLine]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormulationLine](
	[FormulationLineId] [int] IDENTITY(1,1) NOT NULL,
	[FormulationHeaderId] [int] NULL,
	[ProductId] [int] NULL,
	[ItemId] [int] NULL,
	[ItemQty] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[FormulationLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Godown]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Godown](
	[GodownId] [int] IDENTITY(1,1) NOT NULL,
	[PlantId] [int] NULL,
	[GodownName] [nvarchar](20) NULL,
	[GodownAddress] [nvarchar](20) NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GodownId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packing]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packing](
	[PackingId] [int] IDENTITY(1,1) NOT NULL,
	[PackingName] [nvarchar](max) NULL,
	[PackingFirstConversion] [nvarchar](max) NULL,
	[PackingSecondConversion] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PackingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonType]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonType](
	[PersonTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PersonType] [nvarchar](50) NULL,
 CONSTRAINT [PK_PersonType] PRIMARY KEY CLUSTERED 
(
	[PersonTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plant]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plant](
	[PlantId] [int] IDENTITY(1,1) NOT NULL,
	[ComapnyId] [int] NULL,
	[PlantName] [nvarchar](30) NULL,
	[Capacity] [nvarchar](20) NULL,
	[PlantAddress] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[PlantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionHeader]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionHeader](
	[ProductionHeaderId] [int] IDENTITY(1,1) NOT NULL,
	[FormulationHeaderId] [int] NULL,
	[ProductionDate] [datetime] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[ActualQty] [decimal](18, 2) NULL,
	[LossQty] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductionHeaderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userTable]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userTable](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[UserEmail] [nvarchar](max) NULL,
	[UserPass] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 
GO
INSERT [dbo].[Company] ([CompanyId], [CompanyName], [GST], [CompanyAddress], [CompanyLogo], [CompanyContactNo]) VALUES (1, N'Code Dot Solution', N'GSTIN12345678', N'Tarangan Bungalow,Varzadi Road,Shirpur 425405', NULL, N'7249221454')
GO
INSERT [dbo].[Company] ([CompanyId], [CompanyName], [GST], [CompanyAddress], [CompanyLogo], [CompanyContactNo]) VALUES (2, N'OakForge Manufacturing', N'GSTIN123ABCDE456FG', N'Latur', NULL, N'9876543210')
GO
INSERT [dbo].[Company] ([CompanyId], [CompanyName], [GST], [CompanyAddress], [CompanyLogo], [CompanyContactNo]) VALUES (4, N'HRX', N'GSTINQRST1234UVWX56', N'Aurangabad', NULL, N'9765432150')
GO
INSERT [dbo].[Company] ([CompanyId], [CompanyName], [GST], [CompanyAddress], [CompanyLogo], [CompanyContactNo]) VALUES (5, N'Bl', N'GSTINABCD1234EFG567', N'Latur', NULL, N'9876543218')
GO
INSERT [dbo].[Company] ([CompanyId], [CompanyName], [GST], [CompanyAddress], [CompanyLogo], [CompanyContactNo]) VALUES (6, N'Alpha ', N'GSTINQRST1234UVWX16', N'Jaipur', NULL, N'8927412938')
GO
INSERT [dbo].[Company] ([CompanyId], [CompanyName], [GST], [CompanyAddress], [CompanyLogo], [CompanyContactNo]) VALUES (7, N'Alpha ', N'GSTIN98765HIJKL4321', N'Latur', N'~/SaveImage/Katrina-Kaif243600663.jpg', N'9876543210')
GO
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[FormulationHeader] ON 
GO
INSERT [dbo].[FormulationHeader] ([FormulationHeaderId], [FormulationName], [FormulationDate], [ProductId], [ItemId], [FormulationCode], [UnitId], [FormulaQty], [attr1], [AcFlag]) VALUES (1, N'iOS Device', CAST(N'2024-04-30T00:00:00.000' AS DateTime), 2, 11, N'iPhone 13 Pro- /4/24/0001', NULL, CAST(13.00 AS Decimal(18, 2)), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FormulationHeader] OFF
GO
SET IDENTITY_INSERT [dbo].[FormulationLine] ON 
GO
INSERT [dbo].[FormulationLine] ([FormulationLineId], [FormulationHeaderId], [ProductId], [ItemId], [ItemQty]) VALUES (1, 1, 1, 1, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[FormulationLine] ([FormulationLineId], [FormulationHeaderId], [ProductId], [ItemId], [ItemQty]) VALUES (2, 1, 1, 2, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[FormulationLine] ([FormulationLineId], [FormulationHeaderId], [ProductId], [ItemId], [ItemQty]) VALUES (3, 1, 1, 3, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[FormulationLine] ([FormulationLineId], [FormulationHeaderId], [ProductId], [ItemId], [ItemQty]) VALUES (4, 1, 1, 4, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[FormulationLine] ([FormulationLineId], [FormulationHeaderId], [ProductId], [ItemId], [ItemQty]) VALUES (5, 1, 1, 5, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[FormulationLine] ([FormulationLineId], [FormulationHeaderId], [ProductId], [ItemId], [ItemQty]) VALUES (6, 1, 1, 6, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[FormulationLine] ([FormulationLineId], [FormulationHeaderId], [ProductId], [ItemId], [ItemQty]) VALUES (7, 1, 1, 7, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[FormulationLine] ([FormulationLineId], [FormulationHeaderId], [ProductId], [ItemId], [ItemQty]) VALUES (8, 1, 1, 8, CAST(3.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[FormulationLine] ([FormulationLineId], [FormulationHeaderId], [ProductId], [ItemId], [ItemQty]) VALUES (9, 1, 1, 9, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[FormulationLine] ([FormulationLineId], [FormulationHeaderId], [ProductId], [ItemId], [ItemQty]) VALUES (10, 1, 1, 10, CAST(2.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[FormulationLine] OFF
GO
SET IDENTITY_INSERT [dbo].[Godown] ON 
GO
INSERT [dbo].[Godown] ([GodownId], [PlantId], [GodownName], [GodownAddress], [CompanyId]) VALUES (1, 1, N'Shingave Godown', N'At Post Shingave', 1)
GO
INSERT [dbo].[Godown] ([GodownId], [PlantId], [GodownName], [GodownAddress], [CompanyId]) VALUES (2, 2, N'Nandurabar  Godown', N'At Post Nandurabar', 1)
GO
INSERT [dbo].[Godown] ([GodownId], [PlantId], [GodownName], [GodownAddress], [CompanyId]) VALUES (3, 1, N'Shahada Godown', N'Shahada', 1)
GO
SET IDENTITY_INSERT [dbo].[Godown] OFF
GO
SET IDENTITY_INSERT [dbo].[GRNHeader] ON 
GO
INSERT [dbo].[GRNHeader] ([GRNHeaderId], [PurchaseHeaderId], [GRNDate], [VehicleNo], [VehicleWeight], [VehicleLoadedWeight], [DCNo]) VALUES (1, 1, CAST(N'2024-04-30T00:00:00.000' AS DateTime), N'MH18BR2345', CAST(120.00 AS Decimal(18, 2)), CAST(119.00 AS Decimal(18, 2)), N'4532')
GO
INSERT [dbo].[GRNHeader] ([GRNHeaderId], [PurchaseHeaderId], [GRNDate], [VehicleNo], [VehicleWeight], [VehicleLoadedWeight], [DCNo]) VALUES (2, 2, CAST(N'2024-05-01T00:00:00.000' AS DateTime), N'MH18BR2354', CAST(845.00 AS Decimal(18, 2)), CAST(254.00 AS Decimal(18, 2)), N'5678')
GO
INSERT [dbo].[GRNHeader] ([GRNHeaderId], [PurchaseHeaderId], [GRNDate], [VehicleNo], [VehicleWeight], [VehicleLoadedWeight], [DCNo]) VALUES (3, 3, CAST(N'2024-05-01T00:00:00.000' AS DateTime), N'MH18BR2354', CAST(134.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), N'4532')
GO
SET IDENTITY_INSERT [dbo].[GRNHeader] OFF
GO
SET IDENTITY_INSERT [dbo].[GRNLine] ON 
GO
INSERT [dbo].[GRNLine] ([GRNLineId], [GRNHeaderId], [ProductId], [ItemId], [UnitId], [POQty], [AcceptedQty], [RejectedQty], [FreeQty], [PORate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount], [PurchaseLineId]) VALUES (1, 1, 1, 1, 3, CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(14000.00 AS Decimal(18, 2)), CAST(70000.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(1400.00 AS Decimal(18, 2)), CAST(68600.00 AS Decimal(18, 2)), 2, CAST(1372.00 AS Decimal(18, 2)), CAST(69972.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[GRNLine] ([GRNLineId], [GRNHeaderId], [ProductId], [ItemId], [UnitId], [POQty], [AcceptedQty], [RejectedQty], [FreeQty], [PORate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount], [PurchaseLineId]) VALUES (2, 1, 1, 2, 3, CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), CAST(48500.00 AS Decimal(18, 2)), 3, CAST(1455.00 AS Decimal(18, 2)), CAST(49955.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[GRNLine] ([GRNLineId], [GRNHeaderId], [ProductId], [ItemId], [UnitId], [POQty], [AcceptedQty], [RejectedQty], [FreeQty], [PORate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount], [PurchaseLineId]) VALUES (3, 1, 1, 3, 3, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(12000.00 AS Decimal(18, 2)), CAST(36000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1800.00 AS Decimal(18, 2)), CAST(34200.00 AS Decimal(18, 2)), 4, CAST(1368.00 AS Decimal(18, 2)), CAST(35568.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[GRNLine] ([GRNLineId], [GRNHeaderId], [ProductId], [ItemId], [UnitId], [POQty], [AcceptedQty], [RejectedQty], [FreeQty], [PORate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount], [PurchaseLineId]) VALUES (4, 1, 1, 4, 3, CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(11000.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2200.00 AS Decimal(18, 2)), CAST(107800.00 AS Decimal(18, 2)), 2, CAST(2156.00 AS Decimal(18, 2)), CAST(109956.00 AS Decimal(18, 2)), 4)
GO
INSERT [dbo].[GRNLine] ([GRNLineId], [GRNHeaderId], [ProductId], [ItemId], [UnitId], [POQty], [AcceptedQty], [RejectedQty], [FreeQty], [PORate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount], [PurchaseLineId]) VALUES (5, 1, 1, 5, 3, CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(2500.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(75.00 AS Decimal(18, 2)), CAST(2425.00 AS Decimal(18, 2)), 3, CAST(72.75 AS Decimal(18, 2)), CAST(2497.75 AS Decimal(18, 2)), 5)
GO
INSERT [dbo].[GRNLine] ([GRNLineId], [GRNHeaderId], [ProductId], [ItemId], [UnitId], [POQty], [AcceptedQty], [RejectedQty], [FreeQty], [PORate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount], [PurchaseLineId]) VALUES (6, 2, 1, 6, 3, CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(11500.00 AS Decimal(18, 2)), CAST(57500.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(1150.00 AS Decimal(18, 2)), CAST(56350.00 AS Decimal(18, 2)), 2, CAST(1127.00 AS Decimal(18, 2)), CAST(57477.00 AS Decimal(18, 2)), 6)
GO
INSERT [dbo].[GRNLine] ([GRNLineId], [GRNHeaderId], [ProductId], [ItemId], [UnitId], [POQty], [AcceptedQty], [RejectedQty], [FreeQty], [PORate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount], [PurchaseLineId]) VALUES (7, 2, 1, 7, 3, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(4500.00 AS Decimal(18, 2)), CAST(4500.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(135.00 AS Decimal(18, 2)), CAST(4365.00 AS Decimal(18, 2)), 3, CAST(130.95 AS Decimal(18, 2)), CAST(4495.95 AS Decimal(18, 2)), 7)
GO
INSERT [dbo].[GRNLine] ([GRNLineId], [GRNHeaderId], [ProductId], [ItemId], [UnitId], [POQty], [AcceptedQty], [RejectedQty], [FreeQty], [PORate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount], [PurchaseLineId]) VALUES (8, 2, 1, 8, 3, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(6000.00 AS Decimal(18, 2)), CAST(18000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), CAST(17100.00 AS Decimal(18, 2)), 4, CAST(684.00 AS Decimal(18, 2)), CAST(17784.00 AS Decimal(18, 2)), 8)
GO
INSERT [dbo].[GRNLine] ([GRNLineId], [GRNHeaderId], [ProductId], [ItemId], [UnitId], [POQty], [AcceptedQty], [RejectedQty], [FreeQty], [PORate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount], [PurchaseLineId]) VALUES (9, 2, 1, 9, 3, CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2500.00 AS Decimal(18, 2)), CAST(12500.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), CAST(12250.00 AS Decimal(18, 2)), 2, CAST(245.00 AS Decimal(18, 2)), CAST(12495.00 AS Decimal(18, 2)), 9)
GO
INSERT [dbo].[GRNLine] ([GRNLineId], [GRNHeaderId], [ProductId], [ItemId], [UnitId], [POQty], [AcceptedQty], [RejectedQty], [FreeQty], [PORate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount], [PurchaseLineId]) VALUES (10, 2, 1, 10, 3, CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), CAST(2500.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(2450.00 AS Decimal(18, 2)), 3, CAST(73.50 AS Decimal(18, 2)), CAST(2523.50 AS Decimal(18, 2)), 10)
GO
INSERT [dbo].[GRNLine] ([GRNLineId], [GRNHeaderId], [ProductId], [ItemId], [UnitId], [POQty], [AcceptedQty], [RejectedQty], [FreeQty], [PORate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount], [PurchaseLineId]) VALUES (11, 3, 1, 7, 2, CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), 1, CAST(20.00 AS Decimal(18, 2)), CAST(2020.00 AS Decimal(18, 2)), 11)
GO
INSERT [dbo].[GRNLine] ([GRNLineId], [GRNHeaderId], [ProductId], [ItemId], [UnitId], [POQty], [AcceptedQty], [RejectedQty], [FreeQty], [PORate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount], [PurchaseLineId]) VALUES (12, 3, 1, 8, 2, CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), 2, CAST(1000.00 AS Decimal(18, 2)), CAST(51000.00 AS Decimal(18, 2)), 12)
GO
SET IDENTITY_INSERT [dbo].[GRNLine] OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON 
GO
INSERT [dbo].[Item] ([ItemId], [ProductId], [ItemName], [Max_Qty], [Min_Qty]) VALUES (1, 1, N'Mobile-Body', CAST(15.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemId], [ProductId], [ItemName], [Max_Qty], [Min_Qty]) VALUES (2, 1, N'Speaker', CAST(25.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemId], [ProductId], [ItemName], [Max_Qty], [Min_Qty]) VALUES (3, 1, N'MotherBoard', CAST(20.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemId], [ProductId], [ItemName], [Max_Qty], [Min_Qty]) VALUES (4, 1, N'iPhone Display', CAST(20.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemId], [ProductId], [ItemName], [Max_Qty], [Min_Qty]) VALUES (5, 1, N'USB Socket', CAST(15.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemId], [ProductId], [ItemName], [Max_Qty], [Min_Qty]) VALUES (6, 1, N'Battery', CAST(10.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemId], [ProductId], [ItemName], [Max_Qty], [Min_Qty]) VALUES (7, 1, N'Front Camera', CAST(10.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemId], [ProductId], [ItemName], [Max_Qty], [Min_Qty]) VALUES (8, 1, N'Back Camera', CAST(15.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemId], [ProductId], [ItemName], [Max_Qty], [Min_Qty]) VALUES (9, 1, N'Flash', CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemId], [ProductId], [ItemName], [Max_Qty], [Min_Qty]) VALUES (10, 1, N'Sim Socket', CAST(25.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Item] ([ItemId], [ProductId], [ItemName], [Max_Qty], [Min_Qty]) VALUES (11, 2, N'iPhone 13 Pro', CAST(3.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Packing] ON 
GO
INSERT [dbo].[Packing] ([PackingId], [PackingName], [PackingFirstConversion], [PackingSecondConversion]) VALUES (1, N'1x1', N'1', N'1')
GO
INSERT [dbo].[Packing] ([PackingId], [PackingName], [PackingFirstConversion], [PackingSecondConversion]) VALUES (2, N'1x6', N'1', N'6')
GO
INSERT [dbo].[Packing] ([PackingId], [PackingName], [PackingFirstConversion], [PackingSecondConversion]) VALUES (3, N'1x12', N'1', N'12')
GO
SET IDENTITY_INSERT [dbo].[Packing] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 
GO
INSERT [dbo].[Person] ([PersonId], [PersonTypeId], [PersonName], [PersonAddress], [PersonContact], [PersonEmail]) VALUES (1, 1, N'Sapana Trader', N'Hinjewadi, Pune', N'8766526948', N'sapanatrader@gmail.com')
GO
INSERT [dbo].[Person] ([PersonId], [PersonTypeId], [PersonName], [PersonAddress], [PersonContact], [PersonEmail]) VALUES (2, 1, N'Balaji Enterprises', N'Dange Chowk, Pune', N'7645654532', N'balajienterprises@gmail.com')
GO
INSERT [dbo].[Person] ([PersonId], [PersonTypeId], [PersonName], [PersonAddress], [PersonContact], [PersonEmail]) VALUES (3, 1, N'KGN Trader', N'Airoli, Mumbai', N'7654321987', N'kgntrader@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonType] ON 
GO
INSERT [dbo].[PersonType] ([PersonTypeId], [PersonType]) VALUES (1, N'Agent')
GO
INSERT [dbo].[PersonType] ([PersonTypeId], [PersonType]) VALUES (2, N'Supplier')
GO
INSERT [dbo].[PersonType] ([PersonTypeId], [PersonType]) VALUES (3, N'Employer')
GO
SET IDENTITY_INSERT [dbo].[PersonType] OFF
GO
SET IDENTITY_INSERT [dbo].[Plant] ON 
GO
INSERT [dbo].[Plant] ([PlantId], [ComapnyId], [PlantName], [Capacity], [PlantAddress]) VALUES (1, 6, N'Catelfood', N'150', N'At Post dhule')
GO
INSERT [dbo].[Plant] ([PlantId], [ComapnyId], [PlantName], [Capacity], [PlantAddress]) VALUES (2, 1, N'Material Plant', N'100', N'At Post Nandurabar')
GO
SET IDENTITY_INSERT [dbo].[Plant] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Flammable]) VALUES (1, N'Raw Material', N'No')
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Flammable]) VALUES (2, N'Finished Goods', N'No')
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Flammable]) VALUES (3, N'Medicines', N'No')
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Flammable]) VALUES (4, N'Vaccines', N'No')
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductionHeader] ON 
GO
INSERT [dbo].[ProductionHeader] ([ProductionHeaderId], [FormulationHeaderId], [ProductionDate], [Quantity], [ActualQty], [LossQty]) VALUES (4, 1, CAST(N'2024-05-01T00:00:00.000' AS DateTime), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[ProductionHeader] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductionLine] ON 
GO
INSERT [dbo].[ProductionLine] ([ProductionLineId], [ProductId], [ItemId], [Quantity], [QuantityRequired], [Stock], [ProductionHeaderId], [GRNLineId], [GRNHeaderId]) VALUES (1, 1, 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 4, 1, 1)
GO
INSERT [dbo].[ProductionLine] ([ProductionLineId], [ProductId], [ItemId], [Quantity], [QuantityRequired], [Stock], [ProductionHeaderId], [GRNLineId], [GRNHeaderId]) VALUES (2, 1, 2, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 4, 2, 1)
GO
INSERT [dbo].[ProductionLine] ([ProductionLineId], [ProductId], [ItemId], [Quantity], [QuantityRequired], [Stock], [ProductionHeaderId], [GRNLineId], [GRNHeaderId]) VALUES (3, 1, 3, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 4, 3, 1)
GO
INSERT [dbo].[ProductionLine] ([ProductionLineId], [ProductId], [ItemId], [Quantity], [QuantityRequired], [Stock], [ProductionHeaderId], [GRNLineId], [GRNHeaderId]) VALUES (4, 1, 4, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 4, 4, 1)
GO
INSERT [dbo].[ProductionLine] ([ProductionLineId], [ProductId], [ItemId], [Quantity], [QuantityRequired], [Stock], [ProductionHeaderId], [GRNLineId], [GRNHeaderId]) VALUES (5, 1, 5, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 4, 5, 1)
GO
INSERT [dbo].[ProductionLine] ([ProductionLineId], [ProductId], [ItemId], [Quantity], [QuantityRequired], [Stock], [ProductionHeaderId], [GRNLineId], [GRNHeaderId]) VALUES (6, 1, 6, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 4, 6, 2)
GO
INSERT [dbo].[ProductionLine] ([ProductionLineId], [ProductId], [ItemId], [Quantity], [QuantityRequired], [Stock], [ProductionHeaderId], [GRNLineId], [GRNHeaderId]) VALUES (7, 1, 7, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 4, 7, 2)
GO
INSERT [dbo].[ProductionLine] ([ProductionLineId], [ProductId], [ItemId], [Quantity], [QuantityRequired], [Stock], [ProductionHeaderId], [GRNLineId], [GRNHeaderId]) VALUES (8, 1, 9, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 4, 9, 2)
GO
INSERT [dbo].[ProductionLine] ([ProductionLineId], [ProductId], [ItemId], [Quantity], [QuantityRequired], [Stock], [ProductionHeaderId], [GRNLineId], [GRNHeaderId]) VALUES (9, 1, 7, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 4, 11, 3)
GO
INSERT [dbo].[ProductionLine] ([ProductionLineId], [ProductId], [ItemId], [Quantity], [QuantityRequired], [Stock], [ProductionHeaderId], [GRNLineId], [GRNHeaderId]) VALUES (10, 1, 10, CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 4, 10, 2)
GO
INSERT [dbo].[ProductionLine] ([ProductionLineId], [ProductId], [ItemId], [Quantity], [QuantityRequired], [Stock], [ProductionHeaderId], [GRNLineId], [GRNHeaderId]) VALUES (11, 1, 8, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 4, 8, 2)
GO
INSERT [dbo].[ProductionLine] ([ProductionLineId], [ProductId], [ItemId], [Quantity], [QuantityRequired], [Stock], [ProductionHeaderId], [GRNLineId], [GRNHeaderId]) VALUES (12, 1, 8, CAST(3.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 4, 12, 3)
GO
SET IDENTITY_INSERT [dbo].[ProductionLine] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseHeader] ON 
GO
INSERT [dbo].[PurchaseHeader] ([PurchaseHeaderId], [PurchaseDate], [PersonId], [PlantId], [GodownId], [BasicAmount], [TaxAmount], [DiscountAmount], [TotalAmount]) VALUES (1, CAST(N'2024-04-01T00:00:00.000' AS DateTime), 1, 1, 1, CAST(268500.00 AS Decimal(18, 2)), CAST(8468.25 AS Decimal(18, 2)), CAST(6975.00 AS Decimal(18, 2)), CAST(269993.25 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseHeader] ([PurchaseHeaderId], [PurchaseDate], [PersonId], [PlantId], [GodownId], [BasicAmount], [TaxAmount], [DiscountAmount], [TotalAmount]) VALUES (2, CAST(N'2024-04-02T00:00:00.000' AS DateTime), 2, 2, 2, CAST(95000.00 AS Decimal(18, 2)), CAST(2909.75 AS Decimal(18, 2)), CAST(2485.00 AS Decimal(18, 2)), CAST(95424.75 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseHeader] ([PurchaseHeaderId], [PurchaseDate], [PersonId], [PlantId], [GodownId], [BasicAmount], [TaxAmount], [DiscountAmount], [TotalAmount]) VALUES (3, CAST(N'2024-05-01T00:00:00.000' AS DateTime), 1, 2, 2, CAST(52000.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(53000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[PurchaseHeader] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseLine] ON 
GO
INSERT [dbo].[PurchaseLine] ([PurchaseLineId], [PurchaseHeaderId], [ProductId], [ItemId], [PackingId], [UnitId], [Quantity], [Rate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount]) VALUES (1, 1, 1, 1, 1, 3, CAST(5.00 AS Decimal(18, 2)), CAST(14000.00 AS Decimal(18, 2)), CAST(70000.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(1400.00 AS Decimal(18, 2)), CAST(68600.00 AS Decimal(18, 2)), 2, CAST(1372.00 AS Decimal(18, 2)), CAST(69972.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseLine] ([PurchaseLineId], [PurchaseHeaderId], [ProductId], [ItemId], [PackingId], [UnitId], [Quantity], [Rate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount]) VALUES (2, 1, 1, 2, 2, 3, CAST(10.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(1500.00 AS Decimal(18, 2)), CAST(48500.00 AS Decimal(18, 2)), 3, CAST(2425.00 AS Decimal(18, 2)), CAST(50925.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseLine] ([PurchaseLineId], [PurchaseHeaderId], [ProductId], [ItemId], [PackingId], [UnitId], [Quantity], [Rate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount]) VALUES (3, 1, 1, 3, 3, 3, CAST(3.00 AS Decimal(18, 2)), CAST(12000.00 AS Decimal(18, 2)), CAST(36000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1800.00 AS Decimal(18, 2)), CAST(34200.00 AS Decimal(18, 2)), 4, CAST(2394.00 AS Decimal(18, 2)), CAST(36594.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseLine] ([PurchaseLineId], [PurchaseHeaderId], [ProductId], [ItemId], [PackingId], [UnitId], [Quantity], [Rate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount]) VALUES (4, 1, 1, 4, 1, 3, CAST(10.00 AS Decimal(18, 2)), CAST(11000.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2200.00 AS Decimal(18, 2)), CAST(107800.00 AS Decimal(18, 2)), 2, CAST(2156.00 AS Decimal(18, 2)), CAST(109956.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseLine] ([PurchaseLineId], [PurchaseHeaderId], [ProductId], [ItemId], [PackingId], [UnitId], [Quantity], [Rate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount]) VALUES (5, 1, 1, 5, 2, 3, CAST(5.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(2500.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(75.00 AS Decimal(18, 2)), CAST(2425.00 AS Decimal(18, 2)), 3, CAST(121.25 AS Decimal(18, 2)), CAST(2546.25 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseLine] ([PurchaseLineId], [PurchaseHeaderId], [ProductId], [ItemId], [PackingId], [UnitId], [Quantity], [Rate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount]) VALUES (6, 2, 1, 6, 1, 3, CAST(5.00 AS Decimal(18, 2)), CAST(11500.00 AS Decimal(18, 2)), CAST(57500.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(1150.00 AS Decimal(18, 2)), CAST(56350.00 AS Decimal(18, 2)), 2, CAST(1127.00 AS Decimal(18, 2)), CAST(57477.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseLine] ([PurchaseLineId], [PurchaseHeaderId], [ProductId], [ItemId], [PackingId], [UnitId], [Quantity], [Rate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount]) VALUES (7, 2, 1, 7, 2, 3, CAST(1.00 AS Decimal(18, 2)), CAST(4500.00 AS Decimal(18, 2)), CAST(4500.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(135.00 AS Decimal(18, 2)), CAST(4365.00 AS Decimal(18, 2)), 3, CAST(218.25 AS Decimal(18, 2)), CAST(4583.25 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseLine] ([PurchaseLineId], [PurchaseHeaderId], [ProductId], [ItemId], [PackingId], [UnitId], [Quantity], [Rate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount]) VALUES (8, 2, 1, 8, 3, 3, CAST(3.00 AS Decimal(18, 2)), CAST(6000.00 AS Decimal(18, 2)), CAST(18000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(900.00 AS Decimal(18, 2)), CAST(17100.00 AS Decimal(18, 2)), 4, CAST(1197.00 AS Decimal(18, 2)), CAST(18297.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseLine] ([PurchaseLineId], [PurchaseHeaderId], [ProductId], [ItemId], [PackingId], [UnitId], [Quantity], [Rate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount]) VALUES (9, 2, 1, 9, 1, 3, CAST(5.00 AS Decimal(18, 2)), CAST(2500.00 AS Decimal(18, 2)), CAST(12500.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), CAST(12250.00 AS Decimal(18, 2)), 2, CAST(245.00 AS Decimal(18, 2)), CAST(12495.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseLine] ([PurchaseLineId], [PurchaseHeaderId], [ProductId], [ItemId], [PackingId], [UnitId], [Quantity], [Rate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount]) VALUES (10, 2, 1, 10, 2, 3, CAST(10.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), CAST(2500.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), CAST(2450.00 AS Decimal(18, 2)), 3, CAST(122.50 AS Decimal(18, 2)), CAST(2572.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseLine] ([PurchaseLineId], [PurchaseHeaderId], [ProductId], [ItemId], [PackingId], [UnitId], [Quantity], [Rate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount]) VALUES (11, 3, 1, 7, 1, 2, CAST(10.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), 1, CAST(0.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PurchaseLine] ([PurchaseLineId], [PurchaseHeaderId], [ProductId], [ItemId], [PackingId], [UnitId], [Quantity], [Rate], [BasicAmount], [DiscountPercentage], [DiscountAmount], [TaxableAmount], [TaxId], [TaxAmount], [PayableAmount]) VALUES (12, 3, 1, 8, 1, 2, CAST(10.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), 2, CAST(1000.00 AS Decimal(18, 2)), CAST(51000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[PurchaseLine] OFF
GO
SET IDENTITY_INSERT [dbo].[Tax] ON 
GO
INSERT [dbo].[Tax] ([TaxId], [TaxName], [TaxPercentage]) VALUES (1, N'GST - 0 %', CAST(0.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tax] ([TaxId], [TaxName], [TaxPercentage]) VALUES (2, N'GST - 2 %', CAST(2.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tax] ([TaxId], [TaxName], [TaxPercentage]) VALUES (3, N'GST - 5 %', CAST(5.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Tax] ([TaxId], [TaxName], [TaxPercentage]) VALUES (4, N'GST - 7 %', CAST(7.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Tax] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 
GO
INSERT [dbo].[Unit] ([UnitId], [UnitName]) VALUES (1, N'Kg')
GO
INSERT [dbo].[Unit] ([UnitId], [UnitName]) VALUES (2, N'No')
GO
INSERT [dbo].[Unit] ([UnitId], [UnitName]) VALUES (3, N'Gram')
GO
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[userTable] ON 
GO
INSERT [dbo].[userTable] ([userid], [UserEmail], [UserPass]) VALUES (1, N'jayesh@gmail.com', N'admin')
GO
SET IDENTITY_INSERT [dbo].[userTable] OFF
GO
ALTER TABLE [dbo].[FormulationHeader] ADD  DEFAULT ((1)) FOR [AcFlag]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Plant]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Sp_Plant]
as begin
SELECT P.PlantId,m.CompanyName,P.Capacity,P.PlantName
  FROM Plant P
  inner join Company m on
  m.CompanyId=P.ComapnyId
  end
GO
/****** Object:  StoredProcedure [dbo].[SpAllPurchase]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpAllPurchase]
as begin
Select 
CONVERT (nvarchar(20),header.PurchaseDate,103) as [purchase_order_date],
header.PurchaseHeaderId as [purchase_order_number],
p.ProductName, i.ItemName, person.PersonName, t.TaxName,line.quantity,line.rate,
CAST((ISNULL(line.quantity,0) *ISNULL(line.rate,0))as decimal(18,2)) as [basic_amount],
CAST((ISNULL (line.quantity,0) * ISNULL(line.rate,0) * line.DiscountPercentage)/100 as decimal(18,2)) as [discount_amount],
CAST((ISNULL(line.quantity,0) *ISNULL(line.rate,0))-(ISNULL (line.quantity,0) * ISNULL(line.rate,0)) * (line.DiscountPercentage)/100 as decimal(18,2)) as [taxable_amount],
CAST(((isnull(line.quantity,0)*isnull(line.rate,0))-(((ISNULL(line.quantity,0)*ISNULL(line.rate,0)*ISNULL(line.DiscountPercentage,0))/100)))*isnull(t.TaxPercentage,0)/100 as decimal(18,2)) as [tax_amount],
CAST((ISNULL(line.quantity,0) *ISNULL(line.rate,0))-(ISNULL (line.quantity,0) * ISNULL(line.rate,0)) * (line.DiscountPercentage)/100 as decimal(18,2)) + CAST(((isnull(line.quantity,0)*isnull(line.rate,0))-(((ISNULL(line.quantity,0)*ISNULL(line.rate,0)*ISNULL(line.DiscountPercentage,0))/100)))*isnull(t.TaxPercentage,0)/100 as decimal(18,2)) as [payable_amount]

from PurchaseLine line
inner join PurchaseHeader header
on header.PurchaseHeaderId = line.PurchaseHeaderId
inner join Item i on line.ItemId = i.ItemId
inner join Product p on i.ProductId = p.ProductId
inner join Person person on header.PersonId = person.PersonId
inner join Tax t on line.TaxId = t.TaxId
end
GO
/****** Object:  StoredProcedure [dbo].[SpCalculateStock]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpCalculateStock]
as begin
select GRNLineId,ISNULL(sum(AcceptedQty+FreeQty),0) as Stockinfo
from StockDetails
group by GRNLineId
order by GRNLineId asc
end

select * from StockDetails

exec [SpCalculateStock]

ALTER TABLE Students
ADD StudentRollNo INT;
GO
/****** Object:  StoredProcedure [dbo].[SpCompany]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpCompany]
as
begin
SELECT [CompanyId]
      ,[CompanyName]
      ,[GST]
      ,[CompanyAddress]
      ,[CompanyContactNo]
  FROM [dbo].[Company]
  end
GO
/****** Object:  StoredProcedure [dbo].[SpCosting]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpCosting]
as begin
SELECT [CostId]
      ,[Cost_Type]
      ,[Amount]
      ,[Date]
  FROM [dbo].[Costing]
  end
GO
/****** Object:  StoredProcedure [dbo].[SpDatewise]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpDatewise]
@fromdate nvarchar(20),
@ToDate nvarchar(20)
as
begin 
select purchase_order_number,purchase_order_date,ProductName,ItemName,PersonName,TaxName,basic_amount,discount_amount,taxable_amount,tax_amount,payable_amount,Quantity,Rate,BasicAmount,DiscountPercentage,DiscountAmount,TaxableAmount,PayableAmount
from PurchaseDetails p
where purchase_order_date<=convert(nvarchar(20),@fromdate) and
purchase_order_date>=convert(nvarchar(20),@ToDate)
end
GO
/****** Object:  StoredProcedure [dbo].[SpFormulation]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpFormulation]
as begin
SELECT FormulationId
      ,FormulationCode
      ,ProductId
      ,ItemId
      ,FormulaQuantity
      ,PurchaseLineId
      ,FormulationHeaderId
  FROM [dbo].[Formulation]
  end
GO
/****** Object:  StoredProcedure [dbo].[SpFormulationHeader]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpFormulationHeader]
as begin
SELECT [FormulationHeaderId]
      ,[FormulationName]
      ,[FormulationDate]
  FROM [dbo].[FormulationHeader]
  end
GO
/****** Object:  StoredProcedure [dbo].[SpFormulationMax]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpFormulationMax]
as begin
select ISNULL(MAX(FormulationHeaderId),0)+1
as FormulaMaxId
from [dbo].[FormulationHeader]
end
GO
/****** Object:  StoredProcedure [dbo].[SpGetFormulationHeaderInfo]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpGetFormulationHeaderInfo]
@FormulationId int
as begin 
select I.ItemName,FHeader.FormulaQty
from FormulationHeader FHeader
inner join Item I on FHeader.ItemId=I.ItemId
where FHeader.FormulationHeaderId=@FormulationId
end
GO
/****** Object:  StoredProcedure [dbo].[SpGetHeaderInfo]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpGetHeaderInfo]
@POId int
as begin 
select purchase_order_date,p.PersonName,p.PersonContact
from PurchaseDetails PrDetail
inner join Person p on PrDetail.PersonId=p.PersonId
where PrDetail.purchase_order_number=@POId
end
GO
/****** Object:  StoredProcedure [dbo].[SpGodown]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpGodown]
as begin
SELECT GodownId
      ,PlantId
      ,GodownName
      ,GodownAddress
  FROM Godown
  end
GO
/****** Object:  StoredProcedure [dbo].[SpGRNLineData]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpGRNLineData]
@POId int
as begin
select PLine.PurchaseHeaderId,PurchaseLineId,Pr.ProductId,I.ItemId,Pr.ProductName,I.ItemName,Quantity,
Rate,T.TaxName,T.TaxId,PLine.DiscountPercentage,U.UnitName,U.UnitId,PLine.BasicAmount,PLine.DiscountAmount,PLine.TaxableAmount,PLine.TaxAmount,PLine.PayableAmount,T.TaxPercentage
from PurchaseLine PLine,Product Pr,Tax T,PurchaseHeader PHeader,Item I,Unit U
where PLine.ProductId=Pr.ProductId and
T.TaxId=PLine.TaxId and PLine.PurchaseHeaderId=PHeader.PurchaseHeaderId
and I.ItemId=PLine.ItemId and U.UnitId=PLine.UnitId and PLine.PurchaseHeaderId=@POId
end
GO
/****** Object:  StoredProcedure [dbo].[SpItem]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpItem]
as begin
SELECT [ItemId]
      ,[ProductId]
      ,[ItemName]
      ,[Max_Qty]
      ,[Min_Qty]
  FROM [dbo].[Item]
  end
GO
/****** Object:  StoredProcedure [dbo].[SpItemWiseDateWise]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpItemWiseDateWise]
@ItemId int,
@FromDate nvarchar(40),
@ToDate nvarchar(40)
as begin
select purchase_order_number,purchase_order_date,ProductName,ItemName,PersonName,TaxName,basic_amount,discount_amount,taxable_amount,tax_amount,payable_amount,Quantity,Rate,BasicAmount,DiscountPercentage,DiscountAmount,TaxableAmount,PayableAmount
from PurchaseDetails p
where p.ItemId=@ItemId
and purchase_order_date>=@FromDate 
and purchase_order_date<=@ToDate
end
GO
/****** Object:  StoredProcedure [dbo].[SpPacking]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpPacking]
as begin
SELECT [PackingId]
      ,[PackingName]
      ,[PackingFirstConversion]
      ,[PackingSecondConversion]
  FROM [dbo].[Packing]
  end
GO
/****** Object:  StoredProcedure [dbo].[SpPerson]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpPerson]
as begin
SELECT [PersonId]
      ,[PersonTypeId]
      ,[PersonName]
      ,[PersonAddress]
      ,[PersonContact]
      ,[PersonEmail]
  FROM [dbo].[Person]
  end
GO
/****** Object:  StoredProcedure [dbo].[SpPlant]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpPlant]
as begin
SELECT P.PlantId,m.CompanyName,P.Capacity,P.PlantName
  FROM Plant P
  inner join Company m on
  m.CompanyId=P.ComapnyId
  end
GO
/****** Object:  StoredProcedure [dbo].[SpProduct]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpProduct]
as begin
SELECT [ProductId]
      ,[ProductName]
      ,[Flammable]
  FROM [dbo].[Product]
  end
GO
/****** Object:  StoredProcedure [dbo].[SpProduction]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpProduction]
as begin
SELECT [ProductionId]
      ,[ItemId]
      ,[Production_Quantity]
      ,[PurchaseLineId]
  FROM [dbo].[Production]
  end
GO
/****** Object:  StoredProcedure [dbo].[SpProductionLineData]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpProductionLineData]
@FormulationId INT
AS 
BEGIN 
    SELECT 
        FLine.ProductId,
        FLine.ItemId,
        FLine.ItemQty,
        Pr.ProductName,
        I.ItemName,
        ISNULL(SUM(S.AcceptedQty), 0) + ISNULL(SUM(S.FreeQty), 0) AS Stock,
		GLine.GRNLineId,
		GLine.GRNHeaderId
    FROM 
        FormulationLine FLine
    INNER JOIN 
        Product Pr ON FLine.ProductId = Pr.ProductId
    INNER JOIN 
        Item I ON FLine.ItemId = I.ItemId
    INNER JOIN 
        FormulationHeader FHeader ON FLine.FormulationHeaderId = FHeader.FormulationHeaderId
    INNER JOIN 
        StockDetails S ON S.ItemId = FLine.ItemId
	 INNER JOIN 
        GRNLine GLine ON S.ItemId = GLine.ItemId
    WHERE 
        FLine.FormulationHeaderId = @FormulationId
    GROUP BY 
        FLine.ProductId, 
        FLine.ItemId, 
        FLine.ItemQty, 
        Pr.ProductName, 
        I.ItemName,
		GLine.GRNLineId,
		GLine.GRNHeaderId
END
GO
/****** Object:  StoredProcedure [dbo].[SpProductionLineData1]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpProductionLineData1]
@FormulationId INT
AS 
BEGIN 
    SELECT 
        FLine.ProductId,
        FLine.ItemId,
        FLine.ItemQty,
        Pr.ProductName,
        ISNULL(SUM(S.AcceptedQty), 0) + ISNULL(SUM(S.FreeQty), 0) AS Stock,
        GLine.GRNLineId,
        GLine.GRNHeaderId,
        ISNULL(SUM(S.AcceptedQty), 0) + ISNULL(SUM(S.FreeQty), 0) - ISNULL(SUM(PL.QuantityRequired), 0) AS RemainingStock
    FROM 
        FormulationLine FLine
    INNER JOIN 
        Product Pr ON FLine.ProductId = Pr.ProductId
    INNER JOIN 
        Item I ON FLine.ItemId = I.ItemId
    INNER JOIN 
        FormulationHeader FHeader ON FLine.FormulationHeaderId = FHeader.FormulationHeaderId
    INNER JOIN 
        StockDetails S ON S.ItemId = FLine.ItemId
    INNER JOIN 
        GRNLine GLine ON S.GRNLineId = GLine.GRNLineId
    LEFT JOIN 
        (SELECT ItemId, SUM(QuantityRequired) AS QuantityRequired 
         FROM ProductionLine 
         GROUP BY ItemId) PL ON PL.ItemId = FLine.ItemId
    WHERE 
        FLine.FormulationHeaderId = @FormulationId
    GROUP BY 
        FLine.ProductId, 
        FLine.ItemId, 
        FLine.ItemQty, 
        Pr.ProductName, 
        GLine.GRNLineId,
        GLine.GRNHeaderId,
        PL.QuantityRequired  -- Include QuantityRequired in GROUP BY
END
GO
/****** Object:  StoredProcedure [dbo].[SpProductWiseDateWise]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpProductWiseDateWise]
@ProductId int,
@FromDate nvarchar(40),
@ToDate nvarchar(40)
as begin
select purchase_order_number,purchase_order_date,ProductName,ItemName,PersonName,TaxName,basic_amount,discount_amount,taxable_amount,tax_amount,payable_amount,Quantity,Rate,BasicAmount,DiscountPercentage,DiscountAmount,TaxableAmount,PayableAmount
from PurchaseDetails p
where p.ProductId=@ProductId
and purchase_order_date>=convert(nvarchar(40),@FromDate) 
and purchase_order_date<=convert(nvarchar(40),@ToDate)
end
GO
/****** Object:  StoredProcedure [dbo].[SpPurchaseHeader]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpPurchaseHeader]
as begin 
SELECT [PurchaseHeaderId]
      ,[PurchaseDate]
      ,[PersonId]
      ,[BasicAmount]
      ,[TaxAmount]
      ,[TotalAmount]
      ,[PlantId]
      ,[GodownId]
      ,[DiscountAmount]
  FROM [dbo].[PurchaseHeader]
  end
GO
/****** Object:  StoredProcedure [dbo].[SpSupplierWise]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpSupplierWise]
@SupplierId int
as begin
select purchase_order_number,purchase_order_date,ProductName,ItemName,PersonName,TaxName,basic_amount,discount_amount,taxable_amount,tax_amount,payable_amount,Quantity,Rate,BasicAmount,DiscountPercentage,DiscountAmount,TaxableAmount,PayableAmount,PersonId
from PurchaseDetails p
where p.PersonId=@SupplierId
end
GO
/****** Object:  StoredProcedure [dbo].[SpSupplierwiseDatewise]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SpSupplierwiseDatewise]
@SupplierId int,
@FromDate nvarchar(40),
@ToDate nvarchar(40)
as begin
select purchase_order_number,purchase_order_date,ProductName,ItemName,PersonName,TaxName,basic_amount,discount_amount,taxable_amount,tax_amount,payable_amount,Quantity,Rate,BasicAmount,DiscountPercentage,DiscountAmount,TaxableAmount,PayableAmount
from PurchaseDetails p
where p.ProductId=@SupplierId
and purchase_order_date>=convert(nvarchar(40),@FromDate) 
and purchase_order_date<=convert(nvarchar(40),@ToDate)
end
GO
/****** Object:  StoredProcedure [dbo].[SpTax]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpTax]
as begin
SELECT [TaxId]
      ,[TaxName]
      ,[TaxPercentage]
  FROM [dbo].[Tax]
  end
GO
/****** Object:  StoredProcedure [dbo].[SpUnit]    Script Date: 12-11-2024 19:09:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpUnit]
as begin
SELECT [UnitId]
      ,[UnitName]
  FROM [dbo].[Unit]
  end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[63] 4[3] 2[29] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "line"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 275
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "header"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 338
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 343
               Left = 48
               Bottom = 506
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 511
               Left = 48
               Bottom = 652
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "person"
            Begin Extent = 
               Top = 658
               Left = 48
               Bottom = 821
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 826
               Left = 48
               Bottom = 967
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PurchaseDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PurchaseDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PurchaseDetails'
GO
