USE [BuildingSiteManagement]
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment](
	[apartmentID] [int] IDENTITY(1,1) NOT NULL,
	[apartmentName] [varchar](55) NOT NULL,
	[street] [varchar](25) NULL,
	[city] [varchar](25) NULL,
	[state] [varchar](10) NULL,
	[zip_code] [char](5) NULL,
	[residentCounter] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[apartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssistantManager]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssistantManager](
	[assistantManagerID] [int] IDENTITY(1,1) NOT NULL,
	[personID] [int] NULL,
	[managerID] [int] NULL,
	[residentID] [int] NULL,
	[assistantManagerName] [varchar](55) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[assistantManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[billID] [int] IDENTITY(1,1) NOT NULL,
	[billDesc] [varchar](50) NULL,
	[subscriptionID] [int] NULL,
	[billAmount] [float] NULL,
	[billImage] [image] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[billID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Controller]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Controller](
	[controllerID] [int] IDENTITY(1,1) NOT NULL,
	[personID] [int] NULL,
	[residentID] [int] NULL,
	[controllerName] [varchar](55) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[controllerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Decisions]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Decisions](
	[DecisionID] [int] IDENTITY(1,1) NOT NULL,
	[ApartmentID] [int] NULL,
	[DecisionDescription] [varchar](50) NULL,
	[VoteYes] [int] NULL,
	[VoteNo] [int] NULL,
	[DecisionDate] [date] NULL,
	[isAccepted] [varchar](50) NULL,
	[isFullOrMajority] [varchar](50) NULL,
 CONSTRAINT [PK_Decisions] PRIMARY KEY CLUSTERED 
(
	[DecisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expense]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expense](
	[ExpenseId] [int] IDENTITY(1,1) NOT NULL,
	[RecieptId] [int] NULL,
	[ControllerId] [int] NULL,
 CONSTRAINT [PK_Expense] PRIMARY KEY CLUSTERED 
(
	[ExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[managerID] [int] IDENTITY(1,1) NOT NULL,
	[personID] [int] NULL,
	[apartmentID] [int] NULL,
	[residentID] [int] NULL,
	[managerName] [varchar](55) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[managerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movedFlat]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movedFlat](
	[flatHistory] [int] IDENTITY(1,1) NOT NULL,
	[oldFlatID] [int] NULL,
	[newFlatID] [int] NULL,
	[apartmentID] [int] NULL,
	[enteranceDate] [date] NULL,
	[leavingDate] [date] NULL,
 CONSTRAINT [PK_movedFlat] PRIMARY KEY CLUSTERED 
(
	[flatHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[paymentID] [int] IDENTITY(1,1) NOT NULL,
	[receiptID] [int] NULL,
	[residentID] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[personID] [int] IDENTITY(1,1) NOT NULL,
	[apartmentID] [int] NULL,
	[personName] [varchar](55) NULL,
	[personStatus] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonStatus]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonStatus](
	[statusID] [tinyint] NOT NULL,
	[statusName] [varchar](50) NULL,
 CONSTRAINT [PK_PersonStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptDescription] [varchar](50) NULL,
	[ResidentID] [int] NULL,
	[ReceiptAmount] [float] NULL,
	[ReceiptTime] [date] NULL,
 CONSTRAINT [PK_Reciept] PRIMARY KEY CLUSTERED 
(
	[ReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resident]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resident](
	[residentID] [int] IDENTITY(1,1) NOT NULL,
	[personID] [int] NULL,
	[apartmentID] [int] NULL,
	[residentName] [varchar](55) NOT NULL,
	[residentPhoneNum] [varchar](55) NOT NULL,
	[paidFlag] [int] NOT NULL,
	[flatId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[residentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 23.01.2023 22:14:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[SubscriptionID] [int] IDENTITY(1,1) NOT NULL,
	[SubscriptionType] [varchar](50) NULL,
	[managerID] [int] NULL,
	[expenseID] [int] NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[SubscriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Apartment] ON 

INSERT [dbo].[Apartment] ([apartmentID], [apartmentName], [street], [city], [state], [zip_code], [residentCounter]) VALUES (3, N'Deniz', N'Bestekar', N'Ankara', N'Cankaya', N'06510', 23)
INSERT [dbo].[Apartment] ([apartmentID], [apartmentName], [street], [city], [state], [zip_code], [residentCounter]) VALUES (4, N'Beyazsaray', N'Ayvali', N'Ankara', N'Keçiören', N'06780', 16)
SET IDENTITY_INSERT [dbo].[Apartment] OFF
GO
SET IDENTITY_INSERT [dbo].[AssistantManager] ON 

INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (7, 30, 16, 31, N'Yunus Bayhan')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (48, 27, 13, 28, N'Umut Okur')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (49, 28, 13, 29, N'Ezgi Ergül')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (50, 31, 13, 32, N'Hilal Kabanli')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (51, 32, 13, 33, N'Ali Yilmaz')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (52, 33, 13, 34, N'Fatih Nar')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (53, 34, 13, 35, N'Taha Tuncay')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (54, 35, 13, 36, N'Ahmet Ali')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (55, 36, 13, 37, N'deneme')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (56, 37, 13, 38, N'mert')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (57, 38, 13, 39, N'babba')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (58, 39, 13, 40, N'abo')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (59, 40, 13, 41, N'mert try')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (60, 41, 13, 42, N'mert try')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (61, 42, 13, 43, N'mert try2')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (62, 43, 13, 44, N'mert deneme3')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (63, 44, 13, 45, N'brooo')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (64, 45, 13, 46, N'ooo')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (65, 45, 14, 46, N'ooo')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (66, 44, 14, 45, N'brooo')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (67, 43, 14, 44, N'mert deneme3')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (68, 42, 14, 43, N'mert try2')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (69, 41, 14, 42, N'mert try')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (70, 40, 14, 41, N'mert try')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (71, 39, 14, 40, N'abo')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (72, 38, 14, 39, N'babba')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (73, 37, 14, 38, N'mert')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (74, 36, 14, 37, N'deneme')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (75, 35, 14, 36, N'Ahmet Ali')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (76, 34, 14, 35, N'Taha Tuncay')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (77, 33, 14, 34, N'Fatih Nar')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (78, 32, 14, 33, N'Ali Yilmaz')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (79, 31, 14, 32, N'Hilal Kabanli')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (80, 28, 14, 29, N'Ezgi Ergül')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (81, 27, 14, 28, N'Umut Okur')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (82, 27, 16, 28, N'Umut Okur')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (83, 28, 16, 29, N'Ezgi Ergül')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (84, 31, 16, 32, N'Hilal Kabanli')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (85, 32, 16, 33, N'Ali Yilmaz')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (86, 33, 16, 34, N'Fatih Nar')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (87, 34, 16, 35, N'Taha Tuncay')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (88, 35, 16, 36, N'Ahmet Ali')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (89, 36, 16, 37, N'deneme')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (90, 37, 16, 38, N'mert')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (91, 38, 16, 39, N'babba')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (92, 39, 16, 40, N'abo')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (93, 40, 16, 41, N'mert try')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (94, 41, 16, 42, N'mert try')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (95, 42, 16, 43, N'mert try2')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (96, 43, 16, 44, N'mert deneme3')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (97, 44, 16, 45, N'brooo')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (98, 45, 16, 46, N'ooo')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (99, 46, 13, 47, N'assistantdeneme')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (100, 46, 14, 47, N'assistantdeneme')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (101, 46, 16, 47, N'assistantdeneme')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (102, 47, 13, 48, N'afdsdsamgsfa')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (103, 47, 14, 48, N'afdsdsamgsfa')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (104, 47, 16, 48, N'afdsdsamgsfa')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (105, 48, 13, 49, N'dsffdsagasags')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (106, 48, 14, 49, N'dsffdsagasags')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (107, 48, 16, 49, N'dsffdsagasags')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (108, 49, 13, 50, N'ANAN')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (109, 49, 14, 50, N'ANAN')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (110, 49, 16, 50, N'ANAN')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (111, 50, 13, 51, N'Anananan')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (112, 50, 14, 51, N'Anananan')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (113, 50, 16, 51, N'Anananan')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (114, 51, 13, 52, N'hadiolımmm')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (115, 52, 13, NULL, N'masıfmbfmadbafdbmobmfda')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (116, 53, 13, NULL, N'apsldpafböopdöbofad')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (117, 54, 13, 55, N'OLAMK')
INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (118, 55, 13, 56, N'adfsmsıafgmgaf')
SET IDENTITY_INSERT [dbo].[AssistantManager] OFF
GO
SET IDENTITY_INSERT [dbo].[Controller] ON 

INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (6, 31, 32, N'Hilal Kabanli')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (7, 32, 33, N'Ali Yilmaz')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (8, 56, NULL, N'conttttt')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (9, 27, 28, N'Umut Okur')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (790, 28, 29, N'Ezgi Ergül')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (791, 30, 31, N'Yunus Bayhan')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (792, 33, 34, N'Fatih Nar')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (793, 34, 35, N'Taha Tuncay')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (794, 35, 36, N'Ahmet Ali')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (795, 36, 37, N'deneme')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (796, 37, 38, N'mert')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (797, 38, 39, N'babba')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (798, 39, 40, N'abo')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (799, 40, 41, N'mert try')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (800, 41, 42, N'mert try')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (801, 42, 43, N'mert try2')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (802, 43, 44, N'mert deneme3')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (803, 44, 45, N'brooo')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (804, 45, 46, N'ooo')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (805, 46, 47, N'assistantdeneme')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (806, 47, 48, N'afdsdsamgsfa')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (807, 48, 49, N'dsffdsagasags')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (808, 49, 50, N'ANAN')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (809, 50, 51, N'Anananan')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (810, 51, 52, N'hadiolımmm')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (811, 52, 53, N'masıfmbfmadbafdbmobmfda')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (812, 53, 54, N'apsldpafböopdöbofad')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (813, 54, 55, N'OLAMK')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (814, 55, 56, N'adfsmsıafgmgaf')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (815, 57, 58, N'conttt2')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (816, 58, 59, N'ccccorrttt')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (817, 59, 60, N'asdgasgcccorrt')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (818, 60, 61, N'ccccconnnnttrorllelr')
SET IDENTITY_INSERT [dbo].[Controller] OFF
GO
SET IDENTITY_INSERT [dbo].[Decisions] ON 

INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (1, 3, N'olur mu öyle yoh yav', 30, 10, CAST(N'2024-03-04' AS Date), N'YES', NULL)
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (2, 3, N'olur mu öyle yoh yav', 30, 10, CAST(N'2002-03-04' AS Date), N'YES', NULL)
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (3, 3, N'olur mu öyle yoh yav', 30, 10, CAST(N'2002-03-04' AS Date), N'YES', NULL)
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (4, 3, N'yine yanginlar yine ben', 30, 20, CAST(N'2023-02-02' AS Date), N'YES', NULL)
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (5, 4, N'ouyy hee', 31, 62, CAST(N'2025-03-03' AS Date), N'NO', NULL)
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (6, 4, N'aidat', 3, 2, CAST(N'2022-03-04' AS Date), N'YES', NULL)
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (7, 4, N'aidat', 30, 20, CAST(N'2022-03-04' AS Date), N'YES', NULL)
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (8, 4, N'aidat', 30, 20, CAST(N'2022-04-05' AS Date), N'YES', NULL)
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (9, 4, N'aidat', 31, 20, CAST(N'2024-01-01' AS Date), N'YES', NULL)
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (10, 3, N'aidat', 10, 0, CAST(N'2022-12-12' AS Date), NULL, N'Full')
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (11, 3, N'aidat', 10, 0, CAST(N'2022-12-12' AS Date), NULL, N'Full')
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (12, 3, N'afsdasgfasg', 10, 1, CAST(N'2022-12-12' AS Date), NULL, N'Majority')
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (13, 3, N'dasgfsagfsafasb', 10, 0, CAST(N'2022-12-12' AS Date), NULL, N'Full')
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (14, 3, N'dasdfagaf', 10, 0, CAST(N'2022-12-12' AS Date), NULL, NULL)
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (15, 3, N'adfsogfkgagapkgpa', 10, 0, CAST(N'2022-12-12' AS Date), NULL, NULL)
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted], [isFullOrMajority]) VALUES (16, 3, N'dskapgmpomafpobdpambdpmfd', 10, 0, CAST(N'2022-12-12' AS Date), N'YES', N'Full')
SET IDENTITY_INSERT [dbo].[Decisions] OFF
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (13, 27, 3, 28, N'Umut Okur')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (14, 28, 4, 29, N'Ezgi Ergül')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (16, 30, 4, 31, N'Yunus Bayhan')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (17, 31, 3, 32, N'Hilal Kabanli')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (18, 32, 4, 33, N'Ali Yilmaz')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (19, 33, 3, 34, N'Fatih Nar')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (20, 34, 4, 35, N'Taha Tuncay')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (21, 35, 4, 36, N'Ahmet Ali')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (22, 36, 3, 37, N'deneme')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (23, 37, 3, 38, N'mert')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (24, 38, 3, 39, N'babba')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (25, 39, 3, 40, N'abo')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (26, 40, 3, 41, N'mert try')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (27, 41, 3, 42, N'mert try')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (28, 42, 4, 43, N'mert try2')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (29, 43, 4, 44, N'mert deneme3')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (30, 44, 4, 45, N'brooo')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (31, 45, 3, 46, N'ooo')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (32, 46, 3, 47, N'assistantdeneme')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (33, 47, 3, 48, N'afdsdsamgsfa')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (34, 48, 3, 49, N'dsffdsagasags')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (35, 49, 3, 50, N'ANAN')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (36, 50, 3, 51, N'Anananan')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (37, 51, 3, 52, N'hadiolımmm')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (38, 52, 4, 53, N'masıfmbfmadbafdbmobmfda')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (39, 53, 3, 54, N'apsldpafböopdöbofad')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (40, 54, 4, 55, N'OLAMK')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (41, 55, 4, 56, N'adfsmsıafgmgaf')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (42, 58, 3, 59, N'ccccorrttt')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (43, 59, 3, 60, N'asdgasgcccorrt')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (44, 60, 3, 61, N'ccccconnnnttrorllelr')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (45, 61, 3, 62, N'mjıjıımklkjj')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (46, 56, 3, 57, N'conttttt')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (47, 57, 4, 58, N'conttt2')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (48, 62, 4, 63, N'bhjbhjbkj')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (49, 63, 4, 64, N'nıunuınuınuınıu')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (50, 66, 3, NULL, N'gfsddfgdgf')
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
SET IDENTITY_INSERT [dbo].[movedFlat] ON 

INSERT [dbo].[movedFlat] ([flatHistory], [oldFlatID], [newFlatID], [apartmentID], [enteranceDate], [leavingDate]) VALUES (1, 4, 5, 3, CAST(N'2021-12-12' AS Date), CAST(N'2022-12-12' AS Date))
SET IDENTITY_INSERT [dbo].[movedFlat] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (27, 3, N'Umut Okur', 1)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (28, 4, N'Ezgi Ergül', 1)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (30, 4, N'Yunus Bayhan', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (31, 3, N'Hilal Kabanli', 3)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (32, 4, N'Ali Yilmaz', 3)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (33, 3, N'Fatih Nar', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (34, 4, N'Taha Tuncay', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (35, 4, N'Ahmet Ali', 1)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (36, 3, N'deneme', 1)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (37, 3, N'mert', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (38, 3, N'babba', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (39, 3, N'abo', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (40, 3, N'mert try', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (41, 3, N'mert try', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (42, 4, N'mert try2', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (43, 4, N'mert deneme3', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (44, 4, N'brooo', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (45, 3, N'ooo', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (46, 3, N'assistantdeneme', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (47, 3, N'afdsdsamgsfa', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (48, 3, N'dsffdsagasags', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (49, 3, N'ANAN', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (50, 3, N'Anananan', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (51, 3, N'hadiolımmm', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (52, 4, N'masıfmbfmadbafdbmobmfda', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (53, 3, N'apsldpafböopdöbofad', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (54, 4, N'OLAMK', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (55, 4, N'adfsmsıafgmgaf', 1)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (56, 3, N'conttttt', 3)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (57, 4, N'conttt2', 3)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (58, 3, N'ccccorrttt', 3)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (59, 3, N'asdgasgcccorrt', 3)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (60, 3, N'ccccconnnnttrorllelr', 3)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (61, 3, N'mjıjıımklkjj', 1)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (62, 4, N'bhjbhjbkj', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (63, 4, N'nıunuınuınuınıu', 1)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (64, 4, N'opoppoop', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (65, 4, N'opkpjıpjpppo', 2)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (66, 3, N'gfsddfgdgf', 1)
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
INSERT [dbo].[PersonStatus] ([statusID], [statusName]) VALUES (1, N'Manager')
INSERT [dbo].[PersonStatus] ([statusID], [statusName]) VALUES (2, N'AsistantManger')
INSERT [dbo].[PersonStatus] ([statusID], [statusName]) VALUES (3, N'Controller')
INSERT [dbo].[PersonStatus] ([statusID], [statusName]) VALUES (4, N'Resident')
INSERT [dbo].[PersonStatus] ([statusID], [statusName]) VALUES (5, N'Serviceman')
INSERT [dbo].[PersonStatus] ([statusID], [statusName]) VALUES (6, N'Repairmen')
GO
SET IDENTITY_INSERT [dbo].[Resident] ON 

INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (28, 27, 3, N'Umut Okur', N'+905639453868', 0, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (29, 28, 4, N'Ezgi Ergül', N'+905639125464', 0, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (31, 30, 4, N'Yunus Bayhan', N'+905229457431', 1, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (32, 31, 3, N'Hilal Kabanli', N'+905639453868', 1, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (33, 32, 4, N'Ali Yilmaz', N'+905639453868', 1, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (34, 33, 3, N'Fatih Nar', N'+905133563961', 0, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (35, 34, 4, N'Taha Tuncay', N'+905133563961', 1, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (36, 35, 4, N'Ahmet Ali', N'+90555444', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (37, 36, 3, N'deneme', N'+90555444', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (38, 37, 3, N'mert', N'+90555444', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (39, 38, 3, N'babba', N'+90555444', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (40, 39, 3, N'abo', N'+90555444', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (41, 40, 3, N'mert try', N'', 1, 4)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (42, 41, 3, N'mert try', N'', 1, 4)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (43, 42, 4, N'mert try2', N'+90555', 1, 5)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (44, 43, 4, N'mert deneme3', N'+905444', 1, 8)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (45, 44, 4, N'brooo', N'+905444', 1, 8)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (46, 45, 3, N'ooo', N'', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (47, 46, 3, N'assistantdeneme', N'3243234342', 1, 6)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (48, 47, 3, N'afdsdsamgsfa', N'3243234342', 1, 6)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (49, 48, 3, N'dsffdsagasags', N'3243234342', 1, 6)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (50, 49, 3, N'ANAN', N'3252532', 1, 8)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (51, 50, 3, N'Anananan', N'3252532', 1, 8)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (52, 51, 3, N'hadiolımmm', N'324432', 1, 7)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (53, 52, 4, N'masıfmbfmadbafdbmobmfda', N'32432432', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (54, 53, 3, N'apsldpafböopdöbofad', N'32432432', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (55, 54, 4, N'OLAMK', N'32432432', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (56, 55, 4, N'adfsmsıafgmgaf', N'32432432', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (57, 56, 3, N'conttttt', N'3243232532', 0, 9)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (58, 57, 4, N'conttt2', N'3243232532', 0, 9)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (59, 58, 3, N'ccccorrttt', N'324325325', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (60, 59, 3, N'asdgasgcccorrt', N'324325325', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (61, 60, 3, N'ccccconnnnttrorllelr', N'324325325', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (62, 61, 3, N'mjıjıımklkjj', N'6546757576', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (63, 62, 4, N'bhjbhjbkj', N'6546757576', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (64, 63, 4, N'nıunuınuınuınıu', N'67668868', 1, 3)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (65, 64, 4, N'opoppoop', N'156416', 1, 5)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (66, 65, 4, N'opkpjıpjpppo', N'156416', 1, 5)
SET IDENTITY_INSERT [dbo].[Resident] OFF
GO
/****** Object:  Index [UQ__Assistan__5F99AB33DFF0A8FD]    Script Date: 23.01.2023 22:14:13 ******/
ALTER TABLE [dbo].[AssistantManager] ADD UNIQUE NONCLUSTERED 
(
	[personID] ASC,
	[managerID] ASC,
	[residentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Controll__95D00CE9A8FB940D]    Script Date: 23.01.2023 22:14:13 ******/
ALTER TABLE [dbo].[Controller] ADD UNIQUE NONCLUSTERED 
(
	[personID] ASC,
	[residentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Manager__E14E47B0AABE135D]    Script Date: 23.01.2023 22:14:13 ******/
ALTER TABLE [dbo].[Manager] ADD UNIQUE NONCLUSTERED 
(
	[personID] ASC,
	[apartmentID] ASC,
	[residentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Resident__EC7D7D6CA13B758B]    Script Date: 23.01.2023 22:14:13 ******/
ALTER TABLE [dbo].[Resident] ADD UNIQUE NONCLUSTERED 
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssistantManager]  WITH CHECK ADD FOREIGN KEY([managerID])
REFERENCES [dbo].[Manager] ([managerID])
GO
ALTER TABLE [dbo].[AssistantManager]  WITH CHECK ADD FOREIGN KEY([personID])
REFERENCES [dbo].[Person] ([personID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssistantManager]  WITH CHECK ADD FOREIGN KEY([residentID])
REFERENCES [dbo].[Resident] ([residentID])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Subscription] FOREIGN KEY([subscriptionID])
REFERENCES [dbo].[Subscription] ([SubscriptionID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Subscription]
GO
ALTER TABLE [dbo].[Controller]  WITH CHECK ADD FOREIGN KEY([personID])
REFERENCES [dbo].[Person] ([personID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Controller]  WITH CHECK ADD FOREIGN KEY([residentID])
REFERENCES [dbo].[Resident] ([residentID])
GO
ALTER TABLE [dbo].[Decisions]  WITH CHECK ADD  CONSTRAINT [FK_Decisions_Apartment] FOREIGN KEY([ApartmentID])
REFERENCES [dbo].[Apartment] ([apartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Decisions] CHECK CONSTRAINT [FK_Decisions_Apartment]
GO
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_Controller] FOREIGN KEY([ControllerId])
REFERENCES [dbo].[Controller] ([controllerID])
GO
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_Controller]
GO
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_Reciept] FOREIGN KEY([RecieptId])
REFERENCES [dbo].[Receipt] ([ReceiptID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_Reciept]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD FOREIGN KEY([apartmentID])
REFERENCES [dbo].[Apartment] ([apartmentID])
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD FOREIGN KEY([personID])
REFERENCES [dbo].[Person] ([personID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD FOREIGN KEY([residentID])
REFERENCES [dbo].[Resident] ([residentID])
GO
ALTER TABLE [dbo].[movedFlat]  WITH CHECK ADD  CONSTRAINT [FK_movedFlat_Apartment] FOREIGN KEY([apartmentID])
REFERENCES [dbo].[Apartment] ([apartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[movedFlat] CHECK CONSTRAINT [FK_movedFlat_Apartment]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Receipt] FOREIGN KEY([receiptID])
REFERENCES [dbo].[Receipt] ([ReceiptID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Receipt]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD FOREIGN KEY([apartmentID])
REFERENCES [dbo].[Apartment] ([apartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_PersonStatus] FOREIGN KEY([personStatus])
REFERENCES [dbo].[PersonStatus] ([statusID])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_PersonStatus]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Reciept_Resident] FOREIGN KEY([ResidentID])
REFERENCES [dbo].[Resident] ([residentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Reciept_Resident]
GO
ALTER TABLE [dbo].[Resident]  WITH CHECK ADD FOREIGN KEY([personID])
REFERENCES [dbo].[Person] ([personID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Expense] FOREIGN KEY([expenseID])
REFERENCES [dbo].[Expense] ([ExpenseId])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Expense]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_Manager] FOREIGN KEY([managerID])
REFERENCES [dbo].[Manager] ([managerID])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscriptions_Manager]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD CHECK  (([PersonStatus]>(0) AND [PersonStatus]<(5)))
GO
ALTER TABLE [dbo].[Resident]  WITH CHECK ADD CHECK  (([paidFlag]=(0) OR [paidFlag]=(1)))
GO
