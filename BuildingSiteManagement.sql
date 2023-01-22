USE [BuildingSiteManagement]
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 22-Jan-23 21:34:12 ******/
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
/****** Object:  Table [dbo].[AssistantManager]    Script Date: 22-Jan-23 21:34:12 ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 22-Jan-23 21:34:12 ******/
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
/****** Object:  Table [dbo].[Controller]    Script Date: 22-Jan-23 21:34:12 ******/
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
/****** Object:  Table [dbo].[Decisions]    Script Date: 22-Jan-23 21:34:12 ******/
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
	[DecisionDate] [datetime] NULL,
	[isAccepted] [varchar](5) NULL,
 CONSTRAINT [PK_Decisions] PRIMARY KEY CLUSTERED 
(
	[DecisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expense]    Script Date: 22-Jan-23 21:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expense](
	[ExpenseId] [int] NOT NULL,
	[RecieptId] [int] NULL,
	[ControllerId] [int] NULL,
 CONSTRAINT [PK_Expense] PRIMARY KEY CLUSTERED 
(
	[ExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 22-Jan-23 21:34:12 ******/
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
/****** Object:  Table [dbo].[movedFlat]    Script Date: 22-Jan-23 21:34:12 ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 22-Jan-23 21:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[ResidentId] [int] NULL,
	[RecieptId] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 22-Jan-23 21:34:12 ******/
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
/****** Object:  Table [dbo].[PersonStatus]    Script Date: 22-Jan-23 21:34:12 ******/
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
/****** Object:  Table [dbo].[Receipt]    Script Date: 22-Jan-23 21:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptDescription] [varchar](50) NULL,
	[ResidentID] [int] NULL,
	[ReceiptAmount] [float] NULL,
	[ReceiptTime] [timestamp] NULL,
	[isExpense] [int] NULL,
 CONSTRAINT [PK_Reciept] PRIMARY KEY CLUSTERED 
(
	[ReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resident]    Script Date: 22-Jan-23 21:34:12 ******/
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
	[enteranceDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[residentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 22-Jan-23 21:34:12 ******/
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

INSERT [dbo].[Apartment] ([apartmentID], [apartmentName], [street], [city], [state], [zip_code], [residentCounter]) VALUES (3, N'Deniz', N'Bestekar', N'Ankara', N'Cankaya', N'06510', NULL)
INSERT [dbo].[Apartment] ([apartmentID], [apartmentName], [street], [city], [state], [zip_code], [residentCounter]) VALUES (4, N'Beyazsaray', N'Ayvali', N'Ankara', N'Keçiören', N'06780', NULL)
SET IDENTITY_INSERT [dbo].[Apartment] OFF
GO
SET IDENTITY_INSERT [dbo].[AssistantManager] ON 

INSERT [dbo].[AssistantManager] ([assistantManagerID], [personID], [managerID], [residentID], [assistantManagerName]) VALUES (7, 30, 16, 31, N'Yunus Bayhan')
SET IDENTITY_INSERT [dbo].[AssistantManager] OFF
GO
SET IDENTITY_INSERT [dbo].[Controller] ON 

INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (6, 31, 32, N'Hilal Kabanli')
INSERT [dbo].[Controller] ([controllerID], [personID], [residentID], [controllerName]) VALUES (7, 32, 33, N'Ali Yilmaz')
SET IDENTITY_INSERT [dbo].[Controller] OFF
GO
SET IDENTITY_INSERT [dbo].[Decisions] ON 

INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted]) VALUES (1, 3, N'Oylama yapildi', 30, 15, CAST(N'2023-01-22T20:57:46.333' AS DateTime), N'YES')
INSERT [dbo].[Decisions] ([DecisionID], [ApartmentID], [DecisionDescription], [VoteYes], [VoteNo], [DecisionDate], [isAccepted]) VALUES (2, 3, N'Oylama yapildi', 35, 15, CAST(N'2023-01-22T21:29:09.630' AS DateTime), N'YES')
SET IDENTITY_INSERT [dbo].[Decisions] OFF
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (13, 27, 3, 28, N'Umut Okur')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (14, 28, 4, 29, N'Ezgi Ergül')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (16, 30, 4, 31, N'Yunus Bayhan')
SET IDENTITY_INSERT [dbo].[Manager] OFF
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

INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId], [enteranceDate]) VALUES (28, 27, 3, N'Umut Okur', N'+905639453868', 1, NULL, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId], [enteranceDate]) VALUES (29, 28, 4, N'Ezgi Ergül', N'+905639125464', 1, NULL, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId], [enteranceDate]) VALUES (31, 30, 4, N'Yunus Bayhan', N'+905229457431', 1, NULL, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId], [enteranceDate]) VALUES (32, 31, 3, N'Hilal Kabanli', N'+905639453868', 1, NULL, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId], [enteranceDate]) VALUES (33, 32, 4, N'Ali Yilmaz', N'+905639453868', 1, NULL, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId], [enteranceDate]) VALUES (34, 33, 3, N'Fatih Nar', N'+905133563961', 0, NULL, NULL)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId], [enteranceDate]) VALUES (35, 34, 4, N'Taha Tuncay', N'+905133563961', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Resident] OFF
GO
/****** Object:  Index [UQ__Assistan__5F99AB33F8A71C1F]    Script Date: 22-Jan-23 21:34:12 ******/
ALTER TABLE [dbo].[AssistantManager] ADD UNIQUE NONCLUSTERED 
(
	[personID] ASC,
	[managerID] ASC,
	[residentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Controll__95D00CE98559689A]    Script Date: 22-Jan-23 21:34:12 ******/
ALTER TABLE [dbo].[Controller] ADD UNIQUE NONCLUSTERED 
(
	[personID] ASC,
	[residentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Manager__E14E47B02084B61C]    Script Date: 22-Jan-23 21:34:12 ******/
ALTER TABLE [dbo].[Manager] ADD UNIQUE NONCLUSTERED 
(
	[personID] ASC,
	[apartmentID] ASC,
	[residentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Resident__EC7D7D6C103401EB]    Script Date: 22-Jan-23 21:34:12 ******/
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
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Reciept] FOREIGN KEY([RecieptId])
REFERENCES [dbo].[Receipt] ([ReceiptID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Reciept]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Resident] FOREIGN KEY([ResidentId])
REFERENCES [dbo].[Resident] ([residentID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Resident]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Resident1] FOREIGN KEY([ResidentId])
REFERENCES [dbo].[Resident] ([residentID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Resident1]
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
