SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

USE [pubs]
GO

-- Create Table [dbo].[jobs]
Print 'Create Table [dbo].[jobs]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[jobs] (
		[job_id]       [smallint] IDENTITY(1, 1) NOT NULL,
		[job_desc]     [varchar](50) NOT NULL,
		[min_lvl]      [tinyint] NOT NULL,
		[max_lvl]      [tinyint] NOT NULL,
		CONSTRAINT [PK__jobs__6E32B6A51A14E395]
		PRIMARY KEY
		CLUSTERED
		([job_id])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[jobs]
	ADD
	CONSTRAINT [CK__jobs__min_lvl__1CF15040]
	CHECK
	([min_lvl]>=(10))
GO
ALTER TABLE [dbo].[jobs]
CHECK CONSTRAINT [CK__jobs__min_lvl__1CF15040]
GO
ALTER TABLE [dbo].[jobs]
	ADD
	CONSTRAINT [CK__jobs__max_lvl__1DE57479]
	CHECK
	([max_lvl]<=(250))
GO
ALTER TABLE [dbo].[jobs]
CHECK CONSTRAINT [CK__jobs__max_lvl__1DE57479]
GO
ALTER TABLE [dbo].[jobs]
	ADD
	CONSTRAINT [DF__jobs__job_desc__1BFD2C07]
	DEFAULT ('New Position - title not formalized yet') FOR [job_desc]
GO
ALTER TABLE [dbo].[jobs] SET (LOCK_ESCALATION = TABLE)
GO

