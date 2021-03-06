USE [LoginData]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 1.05.2020 19:02:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Admin] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book]    Script Date: 1.05.2020 19:02:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Bookid] [int] IDENTITY(1,1) NOT NULL,
	[Bookname] [nvarchar](50) NOT NULL,
	[isbn] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Bookid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[kullanıcı]    Script Date: 1.05.2020 19:02:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kullanıcı](
	[kullanıcıid] [int] IDENTITY(1,1) NOT NULL,
	[bookid] [int] NOT NULL,
	[kitapid] [int] NOT NULL,
	[retundate] [date] NOT NULL,
 CONSTRAINT [PK_kullanıcı] PRIMARY KEY CLUSTERED 
(
	[kullanıcıid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 1.05.2020 19:02:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([AdminID], [Admin], [Password]) VALUES (1, N'sait', N'celik')
SET IDENTITY_INSERT [dbo].[admin] OFF
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Bookid], [Bookname], [isbn]) VALUES (1, N'pala84', N'8634512')
INSERT [dbo].[Book] ([Bookid], [Bookname], [isbn]) VALUES (2, N'pala', N'841561324189652')
INSERT [dbo].[Book] ([Bookid], [Bookname], [isbn]) VALUES (3, N'pala84fgvd', N'5799753293685')
INSERT [dbo].[Book] ([Bookid], [Bookname], [isbn]) VALUES (4, N'pala84dsafd', N'3245456345344')
INSERT [dbo].[Book] ([Bookid], [Bookname], [isbn]) VALUES (5, N'sdfsd', N'62361230')
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[kullanıcı] ON 

INSERT [dbo].[kullanıcı] ([kullanıcıid], [bookid], [kitapid], [retundate]) VALUES (2, 1, 1, CAST(N'2020-06-10' AS Date))
INSERT [dbo].[kullanıcı] ([kullanıcıid], [bookid], [kitapid], [retundate]) VALUES (3, 1, 2, CAST(N'2020-06-10' AS Date))
SET IDENTITY_INSERT [dbo].[kullanıcı] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [Password]) VALUES (1, N'sait', N'celik')
INSERT [dbo].[User] ([UserID], [Username], [Password]) VALUES (2, N'sa', N'as')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[kullanıcı]  WITH CHECK ADD  CONSTRAINT [FK_kullanıcı_Book] FOREIGN KEY([bookid])
REFERENCES [dbo].[Book] ([Bookid])
GO
ALTER TABLE [dbo].[kullanıcı] CHECK CONSTRAINT [FK_kullanıcı_Book]
GO
ALTER TABLE [dbo].[kullanıcı]  WITH CHECK ADD  CONSTRAINT [FK_kullanıcı_User] FOREIGN KEY([kitapid])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[kullanıcı] CHECK CONSTRAINT [FK_kullanıcı_User]
GO
