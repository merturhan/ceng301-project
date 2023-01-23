USE [BuildingSiteManagement]
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[AssistantManager]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[Controller]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[Decisions]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[Expense]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[Manager]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[movedFlat]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[Person]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[PersonStatus]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[Receipt]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[Resident]    Script Date: 24.01.2023 01:35:33 ******/
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
/****** Object:  Table [dbo].[Subscription]    Script Date: 24.01.2023 01:35:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[SubscriptionID] [int] IDENTITY(1,1) NOT NULL,
	[SubscriptionType] [varchar](50) NULL,
	[managerID] [int] NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[SubscriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Apartment] ON 

INSERT [dbo].[Apartment] ([apartmentID], [apartmentName], [street], [city], [state], [zip_code], [residentCounter]) VALUES (3, N'Deniz', N'Bestekar', N'Ankara', N'Cankaya', N'06510', 3)
INSERT [dbo].[Apartment] ([apartmentID], [apartmentName], [street], [city], [state], [zip_code], [residentCounter]) VALUES (4, N'Beyazsaray', N'Ayvali', N'Ankara', N'Keçiören', N'06780', 2)
SET IDENTITY_INSERT [dbo].[Apartment] OFF
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

INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (51, 67, 3, 67, N'Ali Yılmaz')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (54, 71, 4, 70, N'Ezgi Mercan')
INSERT [dbo].[Manager] ([managerID], [personID], [apartmentID], [residentID], [managerName]) VALUES (55, 68, 3, 68, N'Mehmet Demir')
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
SET IDENTITY_INSERT [dbo].[movedFlat] ON 

INSERT [dbo].[movedFlat] ([flatHistory], [oldFlatID], [newFlatID], [apartmentID], [enteranceDate], [leavingDate]) VALUES (1, 4, 5, 3, CAST(N'2021-12-12' AS Date), CAST(N'2022-12-12' AS Date))
SET IDENTITY_INSERT [dbo].[movedFlat] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (67, 3, N'Ali Yılmaz', 1)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (68, 3, N'Mehmet Demir', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (69, 4, N'Deniz Feriha', 4)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (71, 4, N'Ezgi Mercan', 1)
INSERT [dbo].[Person] ([personID], [apartmentID], [personName], [personStatus]) VALUES (72, 3, N'adsaadsad', 1)
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

INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (67, 67, 3, N'Ali Yılmaz', N'+9053112395834', 1, 1)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (68, 68, 3, N'Mehmet Demir', N'+905123980953', 0, 2)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (69, 69, 4, N'Deniz Feriha', N'+905338976274', 0, 1)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (70, 71, 4, N'Ezgi Mercan', N'+9053231414134', 1, 2)
INSERT [dbo].[Resident] ([residentID], [personID], [apartmentID], [residentName], [residentPhoneNum], [paidFlag], [flatId]) VALUES (71, 72, 3, N'adsaadsad', N'+9053253253253', 1, 5)
SET IDENTITY_INSERT [dbo].[Resident] OFF
GO
/****** Object:  Index [UQ__Assistan__5F99AB33DFF0A8FD]    Script Date: 24.01.2023 01:35:33 ******/
ALTER TABLE [dbo].[AssistantManager] ADD UNIQUE NONCLUSTERED 
(
	[personID] ASC,
	[managerID] ASC,
	[residentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Controll__95D00CE9A8FB940D]    Script Date: 24.01.2023 01:35:33 ******/
ALTER TABLE [dbo].[Controller] ADD UNIQUE NONCLUSTERED 
(
	[personID] ASC,
	[residentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Manager__E14E47B0AABE135D]    Script Date: 24.01.2023 01:35:33 ******/
ALTER TABLE [dbo].[Manager] ADD UNIQUE NONCLUSTERED 
(
	[personID] ASC,
	[apartmentID] ASC,
	[residentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Resident__EC7D7D6CA13B758B]    Script Date: 24.01.2023 01:35:33 ******/
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
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Reciept_Resident]
GO
ALTER TABLE [dbo].[Resident]  WITH CHECK ADD FOREIGN KEY([personID])
REFERENCES [dbo].[Person] ([personID])
ON UPDATE CASCADE
ON DELETE CASCADE
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
