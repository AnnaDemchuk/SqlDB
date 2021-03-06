USE [PersonsOrders]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 01.11.2020 21:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID_order] [int] IDENTITY(1,1) NOT NULL,
	[SUM_order] [money] NOT NULL,
	[ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 01.11.2020 21:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[Age] [int] NOT NULL,
	[City] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (1, 333.0000, 2)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (2, 333.0000, 2)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (3, 333.0000, 4)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (4, 1000.0000, 5)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (5, 775.0000, 6)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (6, 500.0000, 6)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (7, 333.0000, 1)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (8, 486.0000, 1)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (9, 777.0000, 2)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (10, 20000.0000, 3)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (11, 9000.0000, 7)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (12, 1100.0000, 8)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (13, 200.0000, 15)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (14, 900.0000, 15)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (15, 800.0000, 8)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (16, 375.0000, 9)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (17, 2000.0000, 10)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (18, 450.0000, 20)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (19, 2000.0000, 18)
INSERT [dbo].[Orders] ([ID_order], [SUM_order], [ID]) VALUES (21, 50.5000, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (1, N'Ivan', N'Tereshchcnko', 23, N'Kiev')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (2, N'Petya', N'Zarja', 32, N'Boston')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (3, N'Vasja', N'Pjatochkin', 18, N'Odessa')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (4, N'Konstantin', N'Zayarskiy', 40, N'Dnepr')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (5, N'Dasha', N'Lavruch', 22, N'London')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (6, N'Katja', N'Golovan', 21, N'Kiev')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (7, N'Varvara', N'Koloborotko', 50, N'Lviv')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (8, N'Roman', N'Kolos', 27, N'Kiev')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (9, N'Vladimir', N'Robko', 33, N'Moscow')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (10, N'Ivan', N'Mortinenko', 43, N'Piter')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (11, N'Vova', N'Kolomoyskiy', 25, N'Kiev')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (12, N'Mugin', N'Yank', 23, N'Tokio')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (13, N'Ludmila', N'Merin', 56, N'Kiev')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (14, N'Tanya', N'Lychik', 39, N'Chernigov')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (15, N'Svetlana', N'Vinnichuk', 28, N'Kiev')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (16, N'Sergey', N'Gonchar', 26, N'Kiev')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (17, N'Alexandr', N'Philipenko', 23, N'Kiev')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (18, N'Anja', N'Yurchuk', 24, N'Charkiv')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (19, N'Potap', N'Potapenko', 30, N'Vinnizya')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (20, N'Slavik', N'Gorban', 21, N'Kiev')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (21, N'Test1_LN', N'Test2_LN', 20, N'Kiev_test')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (22, N'Test1_LN', N'Test2_LN', 20, N'Kiev_test')
INSERT [dbo].[Persons] ([ID], [FirstName], [LastName], [Age], [City]) VALUES (23, N'UpdateName', N'UprateLastName', 99, N'Vavilon')
SET IDENTITY_INSERT [dbo].[Persons] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ID])
REFERENCES [dbo].[Persons] ([ID])
GO
