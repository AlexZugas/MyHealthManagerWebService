USE [MYHEALTHMANAGER]
GO
/****** Object:  Table [dbo].[Container]    Script Date: 11/15/2016 21:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Container](
	[ContainerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](45) NOT NULL,
 CONSTRAINT [PK_Container] PRIMARY KEY CLUSTERED 
(
	[ContainerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/15/2016 21:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[SecondName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Weight] [decimal](7, 3) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([UserId], [UserName], [FirstName], [SecondName], [LastName], [Weight]) VALUES (1, N'AlexZugas', N'Jesús', N'Alejandro', N'Zugasti', CAST(75.000 AS Decimal(7, 3)))
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[ProductType]    Script Date: 11/15/2016 21:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/15/2016 21:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[ContainerId] [int] NULL,
	[ProductTypeId] [int] NOT NULL,
	[ProductImage] [varchar](200) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Diet]    Script Date: 11/15/2016 21:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Diet](
	[DietId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Duration] [int] NULL,
	[KgLost] [decimal](8, 3) NULL,
	[DifficultyLevel] [int] NULL,
	[EnabledBy] [int] NOT NULL,
	[CaloriesPerDay] [decimal](8, 3) NULL,
 CONSTRAINT [PK_Diet] PRIMARY KEY CLUSTERED 
(
	[DietId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserProducts]    Script Date: 11/15/2016 21:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProducts](
	[UserProductsId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_UserProducts] PRIMARY KEY CLUSTERED 
(
	[UserProductsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDiets]    Script Date: 11/15/2016 21:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDiets](
	[UserDietsId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[DietId] [int] NOT NULL,
 CONSTRAINT [PK_UserDiets] PRIMARY KEY CLUSTERED 
(
	[UserDietsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Diet_User_EnabledBy]    Script Date: 11/15/2016 21:36:52 ******/
ALTER TABLE [dbo].[Diet]  WITH CHECK ADD  CONSTRAINT [FK_Diet_User_EnabledBy] FOREIGN KEY([EnabledBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Diet] CHECK CONSTRAINT [FK_Diet_User_EnabledBy]
GO
/****** Object:  ForeignKey [FK_Product_Container_ContainerId]    Script Date: 11/15/2016 21:36:52 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Container_ContainerId] FOREIGN KEY([ContainerId])
REFERENCES [dbo].[Container] ([ContainerId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Container_ContainerId]
GO
/****** Object:  ForeignKey [FK_Product_ProductType_ProductTypeId]    Script Date: 11/15/2016 21:36:52 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType_ProductTypeId] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([ProductTypeId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType_ProductTypeId]
GO
/****** Object:  ForeignKey [FK_UserDiets_Diet_DietId]    Script Date: 11/15/2016 21:36:52 ******/
ALTER TABLE [dbo].[UserDiets]  WITH CHECK ADD  CONSTRAINT [FK_UserDiets_Diet_DietId] FOREIGN KEY([DietId])
REFERENCES [dbo].[Diet] ([DietId])
GO
ALTER TABLE [dbo].[UserDiets] CHECK CONSTRAINT [FK_UserDiets_Diet_DietId]
GO
/****** Object:  ForeignKey [FK_UserDiets_User_UserId]    Script Date: 11/15/2016 21:36:52 ******/
ALTER TABLE [dbo].[UserDiets]  WITH CHECK ADD  CONSTRAINT [FK_UserDiets_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserDiets] CHECK CONSTRAINT [FK_UserDiets_User_UserId]
GO
/****** Object:  ForeignKey [FK_UserProducts_Product_ProductId]    Script Date: 11/15/2016 21:36:52 ******/
ALTER TABLE [dbo].[UserProducts]  WITH CHECK ADD  CONSTRAINT [FK_UserProducts_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[UserProducts] CHECK CONSTRAINT [FK_UserProducts_Product_ProductId]
GO
/****** Object:  ForeignKey [FK_UserProducts_User_UserId]    Script Date: 11/15/2016 21:36:52 ******/
ALTER TABLE [dbo].[UserProducts]  WITH CHECK ADD  CONSTRAINT [FK_UserProducts_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserProducts] CHECK CONSTRAINT [FK_UserProducts_User_UserId]
GO
