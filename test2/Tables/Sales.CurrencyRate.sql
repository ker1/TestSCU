SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [Sales].[CurrencyRate]
Print 'Create Table [Sales].[CurrencyRate]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[CurrencyRate] (
		[CurrencyRateID]       [int] IDENTITY(1, 1) NOT NULL,
		[CurrencyRateDate]     [datetime] NOT NULL,
		[FromCurrencyCode]     [nchar](3) NOT NULL,
		[ToCurrencyCode]       [nchar](3) NOT NULL,
		[AverageRate]          [money] NOT NULL,
		[EndOfDayRate]         [money] NOT NULL,
		[ModifiedDate]         [datetime] NOT NULL,
		CONSTRAINT [PK_CurrencyRate_CurrencyRateID]
		PRIMARY KEY
		CLUSTERED
		([CurrencyRateID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Currency exchange rates.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for CurrencyRate records.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'CurrencyRateID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the exchange rate was obtained.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'CurrencyRateDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Exchange rate was converted from this currency code.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'FromCurrencyCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Exchange rate was converted to this currency code.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'ToCurrencyCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Average exchange rate for the day.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'AverageRate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Final exchange rate for the day.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'EndOfDayRate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'INDEX', N'PK_CurrencyRate_CurrencyRateID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'CONSTRAINT', N'PK_CurrencyRate_CurrencyRateID'
GO
ALTER TABLE [Sales].[CurrencyRate]
	ADD
	CONSTRAINT [DF_CurrencyRate_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'CONSTRAINT', N'DF_CurrencyRate_ModifiedDate'
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode]
	ON [Sales].[CurrencyRate] ([CurrencyRateDate], [FromCurrencyCode], [ToCurrencyCode])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'INDEX', N'AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode'
GO
ALTER TABLE [Sales].[CurrencyRate] SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE [Sales].[CurrencyRate]
	WITH CHECK
	ADD CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode]
	FOREIGN KEY ([FromCurrencyCode]) REFERENCES [Sales].[Currency] ([CurrencyCode])
ALTER TABLE [Sales].[CurrencyRate]
	CHECK CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode]

GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Currency.FromCurrencyCode.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'CONSTRAINT', N'FK_CurrencyRate_Currency_FromCurrencyCode'
GO
ALTER TABLE [Sales].[CurrencyRate]
	WITH CHECK
	ADD CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode]
	FOREIGN KEY ([ToCurrencyCode]) REFERENCES [Sales].[Currency] ([CurrencyCode])
ALTER TABLE [Sales].[CurrencyRate]
	CHECK CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode]

GO
EXEC sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Currency.ToCurrencyCode.', 'SCHEMA', N'Sales', 'TABLE', N'CurrencyRate', 'CONSTRAINT', N'FK_CurrencyRate_Currency_ToCurrencyCode'
GO

