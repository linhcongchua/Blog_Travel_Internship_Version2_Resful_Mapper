USE [Blog_Travel_Internship]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/7/2021 6:05:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/7/2021 6:05:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[CategoryDes] [nvarchar](500) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/7/2021 6:05:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NULL,
	[AccountID] [int] NULL,
	[CommentContent] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 5/7/2021 6:05:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[ShortDes] [nvarchar](500) NULL,
	[PostContent] [nvarchar](max) NULL,
	[Thumbnail] [nvarchar](50) NULL,
	[CategoryID] [int] NULL,
	[AuthorID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/7/2021 6:05:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[RoleDes] [nvarchar](250) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [Username], [Password], [FullName], [Phone], [RoleID], [Status]) VALUES (1, N'admin', N'123456', N'Admin', N'0971741127', 1, 1)
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [FullName], [Phone], [RoleID], [Status]) VALUES (2, N'user1', N'123456', N'Linh', N'0971741127', 2, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDes]) VALUES (1, N'Am Thuc', N'Am Thuc')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDes]) VALUES (2, N'Ha Noi', N'Ha Noi')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDes]) VALUES (3, N'Ho Chi Minh', N'Ho Chi Minh')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDes]) VALUES (4, N'Da Nang', N'Da Nang')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [Title], [ShortDes], [PostContent], [Thumbnail], [CategoryID], [AuthorID], [CreatedDate], [ModifiedDate], [isActive]) VALUES (1, N'Món Ngon Hà Nội, 88 Quán Ngon Hà Nội không thể bỏ qua', N'NULLHà Nội là một điểm đến du lịch không thể bỏ qua khi đi du lịch miên bắc, đây là điểm đến du lịch hội tụ nhiều yếu tố từ Du lịch văn hóa, lịch sử, thưởng lãm phong cảnh, du lịch nghỉ dưỡng v.v.v Bên cạnh việc thăm quan Hà Nội bạn cũng có cơ hội thưởng thức những Món Ngon Hà Nội, đa số các món ăn ngon này đều tập trung ở khu vực Phố Cổ Hà Nội', N'Phở Bát Đàn: Phở Bát Đàn ngon nổi tiếng khắp Hà Nội, nói đến phở Bát Đàn người ta nghĩ ngay tới cảnh xếp hàng vào mỗi buổi sáng để có được một bát phở ngon. Quán khá đông vào các ngày thứ 7 và CN, đa phần thực khách tới đây vì Bát Phở ngon theo đúng cách Hà Nội. Nếu bạn là người thích được phục vụ chu đáo hay ngại xếp hàng thì đây sẽ không phải là quán Phở bạn đang mong đợi. Nói vậy thôi những ngày trong tuần cũng không đến nỗi quá đông.
Phở Bát Đàn mang thiệu hiệu gia truyền chính gốc. Tô phở Bát Đàn đặc trưng cho phở bò Hà Nội truyền thống, thơm phức, béo ngậy, nước dùng trong veo, miếng thịt bò tươi hồng, mềm mịn, đầy đặn đã tạo nên sức hấp dẫn không chỉ với người Hà Nội mà còn với thực khách gần xa, trong và ngoài nước tìm đến.
Kinh nghiệm nếu bạn tới ăn là nên đi 2 người, 1 người mua Phở còn 1 người ra giữ chỗ trước. Địa chỉ quán ở 49 Bát Đàn, quán mở lúc sáng từ 6h30 – 8h30. Tới muộn là lại không được ăn đó nhé.

Bún ốc Hàng Chai: Hàng Chai là một con phố nhỏ nối Hàng Rươi và Hàng Cót, quán Bún ốc Cô Thêm ở góc đường Hàng Chai này đã nổi tiếng 25 năm nay với một loại nước dùng đặc biệt có vị chua nhẹ của dấm bỗng. Quán có những khách hàng lâu năm, từ hồi bát bún ốc chỉ có giá 2k đến hiện nay là 30k. Quán đông khách nhất khoảng 9-10h sáng, bạn có thể phải xếp hàng khá lâu để thưởng thức món bún ốc nổi tiếng này nhưng càng ngày vẫn càng có nhiều khách hàng không nề hà gì việc xếp hàng ở đây cả.', N'anh-hn.jpg', 1, 2, CAST(N'2021-05-07 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[Post] ([PostID], [Title], [ShortDes], [PostContent], [Thumbnail], [CategoryID], [AuthorID], [CreatedDate], [ModifiedDate], [isActive]) VALUES (2, N'Phở Ngon Hà Nội, 7 Quán Phở ngon nức tiếng Hà Thành', N'Phở là một món ngon có tiếng ở Hà Nội. Các Quán Phở Ngon Hà Nội thì có khá nhiều, nằm rải rác ở khắp các quận Nội Thành. Người dân Hà Nôi ăn Phở vào các buổi sáng hàng ngày, một món ăn dễ ăn và hương vị ngon. Với những người bạn đi Du lịch Hà Nội thì các món Phở ăn sáng là một trải nghiệm khó quên. Bài viết dưới đây sẽ giới thiệu 7 Quán Phở Ngon ở Hà Nội, một số nằm trong khu du lịch Phố Cổ, khá thuận tiện cho bạn đi lại và thưởng thức.', N'1. Phở Bát Đàn
Phở Bát Đàn ngon nổi tiếng khắp Hà Nội, nói đến phở Bát Đàn người ta nghĩ ngay tới cảnh xếp hàng vào mỗi buổi sáng để có được một bát phở ngon. Quán khá đông vào các ngày thứ 7 và CN, đa phần thực khách tới đây vì Bát Phở ngon theo đúng cách Hà Nội. Nếu bạn là người thích được phục vụ chu đáo hay ngại xếp hàng thì đây sẽ không phải là quán Phở bạn đang mong đợi. Nói vậy thôi những ngày trong tuần cũng không đến nỗi quá đông.

Phở Bát Đàn mang thiệu hiệu gia truyền chính gốc. Tô phở Bát Đàn đặc trưng cho phở bò Hà Nội truyền thống, thơm phức, béo ngậy, nước dùng trong veo, miếng thịt bò tươi hồng, mềm mịn, đầy đặn đã tạo nên sức hấp dẫn không chỉ với người Hà Nội mà còn với thực khách gần xa, trong và ngoài nước tìm đến.

Kinh nghiệm nếu bạn tới ăn là nên đi 2 người, 1 người mua Phở còn 1 người ra giữ chỗ trước. Địa chỉ quán ở 49 Bát Đàn, quán mở lúc sáng từ 6h30 – 8h30. Tới muộn là lại không được ăn đó nhé. 2. Phở Thìn
Nổi tiếng đã hơn 30 năm nay. Phở Thìn ở 13 phố Lò Đúc, tuy khá xa trung tâm phố cổ Hà Nội nhưng lại được nhiều người dân Hà Nội yêu thích và hay lui tới ăn. Phở ngon cốt ở nước Phở, nước phở Thìn có độ ngọ từ xương ninh kèm gia vị. Ngoài nước phở ngon, thịt bò ở đây cũng được xào trên một lò lửa nhiệt độ cao, mỡ đun nóng già, miếng thịt vừa ngọt, vừa ngậy lại thơm hương gừng lửa bùng lên.

Khi ăn Phở bạn cũng đừng quên thêm nếm các loại gia vị khác cho hợp khẩu vị như: tương ớt, tiêu, hoặc cho thêm nước mắm hoặ gia vị tùy độ đậm nhạt tùy mỗi người. Ăn phở Hà Nội thì bạn cũng đừng quên ăn kèm Quẩy, đây cũng là 1 trong những yếu tố khiến thực khách có muốn ăn phở ở quán hay ko? Quán mở cửa từ 5 giờ sáng đến 9 giờ tối nhưng hầu như không lúc nào ngớt khách.', N'pho.jpg', 1, 2, CAST(N'2021-05-07 00:00:00.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [RoleDes]) VALUES (1, N'ADMIN', NULL)
INSERT [dbo].[Role] ([RoleID], [RoleName], [RoleDes]) VALUES (2, N'USER', NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category]
GO
