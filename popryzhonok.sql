USE [Popryzhenok]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 19.02.2022 15:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IDAgentType] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nchar](50) NOT NULL,
	[Logotype] [nvarchar](1000) NOT NULL,
	[Adress] [nvarchar](100) NOT NULL,
	[Priority] [int] NOT NULL,
	[Director] [nvarchar](50) NOT NULL,
	[INN] [int] NOT NULL,
	[KPP] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 19.02.2022 15:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 19.02.2022 15:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PassportSerias] [int] NOT NULL,
	[PassportNumder] [int] NOT NULL,
	[IssuedBy] [nvarchar](50) NOT NULL,
	[AdressRegistration] [nvarchar](50) NOT NULL,
	[BankDetails] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 19.02.2022 15:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [int] NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
	[IDRole] [nchar](1) NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.02.2022 15:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IDProductType] [int] NOT NULL,
	[Articul] [int] NOT NULL,
	[CountOfEmployees] [int] NOT NULL,
	[WorkshopNumber] [int] NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 19.02.2022 15:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] NOT NULL,
	[IDProduct] [int] NOT NULL,
	[IDAgent] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[CountOfProduct] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 19.02.2022 15:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19.02.2022 15:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Code] [nchar](1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19.02.2022 15:30:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IDRole] [nchar](1) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (0, N'huihuio', 1, N'yioyuioy', N'iyuiyuio                                          ', N'\agents\icon.png', N'iyoyiyui', 6767, N'hgjkgj', 678678, 678678)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (1, N'МонтажОрионУрал', 1, N'pzaitev@blokin.org', N'(35222)67-39-26                                   ', N'\agents\agent_96.png', N'027573, Тамбовская область, город Коломна, ул. Ленина, 20', 50, N'Давыдоваа Нина Евгеньевна', 1692286718, 181380912)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (8, N'ТверьМетизУралСнос', 3, N'rlazareva@novikov.ru', N'(35222)57-92-75                                   ', N'\agents\agent_109.png', N'880551, Ленинградская область, город Красногорск, ул. Гоголя, 61', 165, N'Зоя Андреевна Соболева', 1076095397, 947828491)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (10, N'Флот', 4, N'gerasim.makarov@kornilov.ru', N'8-800-144-25-38                                   ', N'\agents\agent_87.png', N'505562, Тюменская область, город Наро-Фоминск, пр. Косиора, 11', 473, N'Василий Андреевич Ковалёв', 1112170258, 382584255)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (15, N'ЭлектроРемОрионЛизинг', 4, N'anfisa.fedotova@tvetkov.ru', N'(495)519-97-41                                    ', N'\agents\agent_68.png', N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64', 198, N'Тарасова Дан Львович', 1340072597, 500478249)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (16, N'Компания ТелекомХмельГаражПром', 3, N'qkolesnikova@kalinina.ru', N'(812)983-91-73                                    ', N'\agents\agent_71.png', N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69', 457, N'Костина Татьяна Борисовна', 1614623826, 824882264)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (38, N'РемГаражЛифт', 2, N'novikova.gleb@sestakov.ru', N'8-800-772-27-53                                   ', N'\agents\agent_65.png', N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89', 374, N'Филатов Владимир Максимович', 1656477206, 988968838)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (40, N'ЮпитерЛенГараж-М', 1, N'larkipova@gorbunov.ru', N'(495)327-58-25                                    ', N'\agents\agent_48.png', N'339507, Московская область, город Видное, ул. Космонавтов, 11', 470, N'Васильева Валерия Борисовна', 2038393690, 259672761)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (41, N'ОрионСофтВодСнос', 4, N'isukanov@sobolev.com', N'(35222)59-75-11                                   ', N'\agents\agent_97.png', N'577227, Калужская область, город Павловский Посад, наб. Чехова, 35', 361, N'Мухина Ян Фёдорович', 1522348613, 977738715)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (48, N'БашкирЮпитерТомск', 4, N'dyckov.veniamin@kotova.ru', N'(812)189-59-57                                    ', N'\agents\agent_59.png', N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51', 139, N'Фадеева Раиса Александровна', 1606315697, 217799345)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (55, N'БашкирФлотМотор-H', 1, N'morozova.nika@kazakova.ru', N'(495)793-84-82                                    ', N'\agents\agent_36.png', N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94', 416, N'Марат Алексеевич Фролов', 1657476072, 934931159)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (60, N'Вод', 4, N'savva86@zaiteva.ru', N'(495)142-19-84                                    ', N'\agents\agent_129.png', N'964386, Оренбургская область, город Чехов, пл. Косиора, 80', 359, N'Зоя Романовна Селезнёва', 1296063939, 447430051)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (87, N'Асбоцемент', 3, N'antonin19@panfilov.ru', N'8-800-211-16-23                                   ', N'\agents\agent_34.png', N'030119, Курганская область, город Дмитров, пер. Славы, 47', 273, N'Никитинаа Антонина Андреевна', 1261407459, 745921890)
INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Email], [Phone], [Logotype], [Adress], [Priority], [Director], [INN], [KPP]) VALUES (92, N'Бух', 5, N'belova.vikentii@konstantinova.net', N'+7(922)375-49-21                                  ', N'\agents\agent_78.png', N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68', 82, N'Татьяна Сергеевна Королёваа', 1953785418, 122905583)
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
INSERT [dbo].[AgentType] ([ID], [Title]) VALUES (1, N'МКК')
INSERT [dbo].[AgentType] ([ID], [Title]) VALUES (2, N'ОАО')
INSERT [dbo].[AgentType] ([ID], [Title]) VALUES (3, N'ООО')
INSERT [dbo].[AgentType] ([ID], [Title]) VALUES (4, N'ЗАО')
INSERT [dbo].[AgentType] ([ID], [Title]) VALUES (5, N'МФО')
INSERT [dbo].[AgentType] ([ID], [Title]) VALUES (6, N'ПАО')
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [LastName], [FirstName], [Patronymic], [DateOfBirth], [PassportSerias], [PassportNumder], [IssuedBy], [AdressRegistration], [BankDetails]) VALUES (1, N'dsfg', N'ssdfgsdf', N'sfgsdfg', CAST(N'2001-11-11' AS Date), 5634535, 3563456, N'dfghdfgh', N'dgfhdfhdf', 54634536)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[Manager] ([ID], [Firstname], [Lastname], [Email], [Adress], [IDRole]) VALUES (0, N'sadfasf', N'sfdasd', N'asdfasdf', N'asdfasdf', N'm')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (0, N'hkljkl', 1, 978789, 789089, 89707, 879078.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (1, N'Попрыгунчик детский красный 1289', 4, 82925345, 4, 10, 1919.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (2, N'Попрыгунчик детский желтый 6678', 2, 80007300, 2, 1, 1768.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (3, N'Попрыгунчик детский 6888', 1, 13875235, 4, 12, 1972.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (4, N'Попрыгунчик для мальчиков 3929', 1, 2158097, 1, 9, 255.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (5, N'Попрыгунчик детский 2071', 1, 3157982, 3, 6, 275.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (6, N'Попрыгунчик для собачек 5096', 3, 67975083, 4, 9, 1465.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (7, N'Попрыгунчик для мальчиков 5389', 3, 70873532, 3, 2, 1739.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (8, N'Попрыгунчик детский розовый 5376', 1, 74291677, 4, 6, 1889.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (9, N'Попрыгунчик для мальчиков 3307', 4, 30269726, 4, 10, 1533.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (10, N'Попрыгунчик для кошечек 2604', 1, 11890154, 2, 7, 842.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (11, N'Шар 6366', 3, 25514523, 4, 4, 1932.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (12, N'Попрыгунчик детский желтый 6051', 4, 88211092, 4, 12, 727.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (13, N'Попрыгунчик для девочек 2311', 3, 25262035, 4, 1, 1308.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (14, N'Попрыгунчик для собачек 4387', 5, 89607276, 3, 8, 912.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (15, N'Попрыгун 3016', 4, 74919447, 1, 12, 615.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (16, N'Попрыгунчик детский красный 3240', 2, 88098604, 3, 8, 882.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (17, N'Попрыгунчик детский розовый 1657', 1, 86558177, 4, 3, 662.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (18, N'Попрыгунчик детский красный 6591', 3, 79704172, 5, 7, 592.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (19, N'Попрыгунчик для девочек 1895', 4, 54983244, 4, 4, 1586.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (20, N'Попрыгунчик для кошечек 3741', 3, 43987093, 5, 4, 1668.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (21, N'Попрыгунчик детский красный 3839', 2, 26655484, 5, 2, 1921.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (22, N'Попрыгунчик детский красный 4969', 1, 10614909, 5, 12, 913.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (23, N'Попрыгунчик для собачек 5754', 4, 79018408, 2, 8, 633.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (24, N'Попрыгунчик для собачек 4485', 3, 33440129, 2, 12, 1995.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (25, N'Попрыгунчик для девочек 1656', 4, 22217580, 5, 6, 1494.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (26, N'Попрыгунчик для мальчиков 4791', 2, 45540528, 3, 11, 1260.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (27, N'Попрыгунчик для девочек 6849', 3, 10084400, 1, 11, 933.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (28, N'Попрыгунчик детский желтый 1371', 4, 85514178, 3, 7, 252.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (29, N'Попрыгунчик для девочек 3389', 3, 26434211, 3, 10, 597.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (30, N'Попрыгунчик детский розовый 5197', 4, 89612317, 1, 3, 1948.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (31, N'Попрыгунчик для собачек 3500', 2, 79994924, 2, 9, 1142.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (32, N'Попрыгун 6882', 5, 12732041, 1, 6, 809.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (33, N'Попрыгунчик для кошечек 4740', 5, 80698285, 1, 6, 1973.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (34, N'Шар 2243', 3, 42536654, 3, 12, 1247.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (35, N'Попрыгунчик детский красный 1740', 3, 43330133, 5, 3, 1749.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (36, N'Попрыгунчик детский красный 5400', 3, 68237918, 4, 5, 1570.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (37, N'Попрыгунчик для девочек 1560', 1, 47378395, 5, 6, 235.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (38, N'Шар 4124', 4, 39025230, 5, 8, 1160.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (39, N'Попрыгунчик детский желтый 2582', 3, 32125209, 3, 11, 1730.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (40, N'Попрыгунчик детский 6029', 2, 69184347, 3, 7, 419.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (41, N'Попрыгун 2299', 3, 34750945, 2, 2, 1688.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (42, N'Попрыгунчик детский красный 1972', 2, 59509797, 1, 7, 794.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (43, N'Попрыгунчик детский 5117', 2, 80875656, 3, 12, 338.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (44, N'Попрыгунчик детский розовый 5501', 3, 25409940, 2, 7, 652.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (45, N'Попрыгунчик детский розовый 6346', 4, 30282346, 1, 10, 1024.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (46, N'Попрыгун 6412', 2, 28152672, 2, 9, 523.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (47, N'Попрыгунчик детский 1916', 3, 73345857, 5, 8, 832.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (48, N'Попрыгунчик для собачек 4529', 2, 81713527, 3, 6, 1923.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (49, N'Попрыгунчик для собачек 4381', 4, 27301447, 2, 5, 1234.0000)
INSERT [dbo].[Product] ([ID], [Title], [IDProductType], [Articul], [CountOfEmployees], [WorkshopNumber], [Cost]) VALUES (50, N'Попрыгунчик детский розовый 2694', 2, 13340356, 4, 6, 1691.0000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductSale] ([ID], [IDProduct], [IDAgent], [StartDate], [CountOfProduct]) VALUES (3, 24, 38, CAST(N'2012-11-07' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [IDProduct], [IDAgent], [StartDate], [CountOfProduct]) VALUES (8, 17, 38, CAST(N'2018-02-28' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [IDProduct], [IDAgent], [StartDate], [CountOfProduct]) VALUES (12, 45, 38, CAST(N'2015-02-02' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [IDProduct], [IDAgent], [StartDate], [CountOfProduct]) VALUES (14, 47, 40, CAST(N'2013-12-23' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [IDProduct], [IDAgent], [StartDate], [CountOfProduct]) VALUES (42, 38, 16, CAST(N'2016-02-26' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [IDProduct], [IDAgent], [StartDate], [CountOfProduct]) VALUES (48, 40, 92, CAST(N'2014-03-06' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [IDProduct], [IDAgent], [StartDate], [CountOfProduct]) VALUES (53, 17, 40, CAST(N'2015-03-28' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [IDProduct], [IDAgent], [StartDate], [CountOfProduct]) VALUES (56, 29, 87, CAST(N'2014-06-04' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [IDProduct], [IDAgent], [StartDate], [CountOfProduct]) VALUES (82, 43, 48, CAST(N'2019-10-08' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [IDProduct], [IDAgent], [StartDate], [CountOfProduct]) VALUES (89, 38, 55, CAST(N'2010-11-17' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [IDProduct], [IDAgent], [StartDate], [CountOfProduct]) VALUES (92, 12, 15, CAST(N'2019-03-06' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [IDProduct], [IDAgent], [StartDate], [CountOfProduct]) VALUES (93, 24, 16, CAST(N'2017-10-14' AS Date), 20)
GO
INSERT [dbo].[ProductType] ([ID], [Title]) VALUES (1, N' Для маленьких деток')
INSERT [dbo].[ProductType] ([ID], [Title]) VALUES (2, N' Для больших деток')
INSERT [dbo].[ProductType] ([ID], [Title]) VALUES (3, N' Взрослый')
INSERT [dbo].[ProductType] ([ID], [Title]) VALUES (4, N' Цифровой')
INSERT [dbo].[ProductType] ([ID], [Title]) VALUES (5, N' Упругий')
GO
INSERT [dbo].[Role] ([Code], [Title]) VALUES (N'a', N'admin')
INSERT [dbo].[Role] ([Code], [Title]) VALUES (N'g', N'agent')
INSERT [dbo].[Role] ([Code], [Title]) VALUES (N'm', N'manager')
GO
INSERT [dbo].[User] ([ID], [Username], [Password], [IDRole]) VALUES (1, N'admin', N'admin', N'a')
INSERT [dbo].[User] ([ID], [Username], [Password], [IDRole]) VALUES (2, N'manager', N'manager', N'm')
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([IDAgentType])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([Code])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Role]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([IDProductType])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([IDAgent])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([Code])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
