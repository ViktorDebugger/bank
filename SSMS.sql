CREATE TABLE [Person] (
  [id] integer PRIMARY KEY,
  [first_name] nvarchar(255),
  [last_name] nvarchar(255),
  [birthday] date,
  [itn] char(10)
)
GO

CREATE TABLE [Account] (
  [id] integer PRIMARY KEY,
  [card_type] char(16),
  [card_number] char(16),
  [cvv] char(3),
  [pin] char(4),
  [amount] float,
  [currency] char(3),
  [registration_date] date,
  [valid_until] date,
  [person_id] integer
)
GO

CREATE TABLE [Operation] (
  [id] integer,
  [operation_type] varchar(30),
  [operation_datetime] datetime,
  [sender_account] integer,
  [sender_person] integer,
  [recipient_account] integer,
  [recipient_person] integer,
  [amount] float
)
GO

CREATE TABLE [Credit] (
  [id] integer,
  [limit] float,
  [dept] float,
  [interest_rate] float,
  [account_id] integer
)
GO

CREATE TABLE [Deposit] (
  [id] integer,
  [amount] float,
  [interest_rate] float,
  [account_id] integer
)
GO

ALTER TABLE [Account] ADD FOREIGN KEY ([person_id]) REFERENCES [Person] ([id])
GO

ALTER TABLE [Operation] ADD FOREIGN KEY ([sender_account]) REFERENCES [Account] ([id])
GO

ALTER TABLE [Operation] ADD FOREIGN KEY ([recipient_account]) REFERENCES [Account] ([id])
GO

ALTER TABLE [Operation] ADD FOREIGN KEY ([sender_person]) REFERENCES [Person] ([id])
GO

ALTER TABLE [Operation] ADD FOREIGN KEY ([recipient_person]) REFERENCES [Person] ([id])
GO

ALTER TABLE [Credit] ADD FOREIGN KEY ([account_id]) REFERENCES [Account] ([id])
GO

ALTER TABLE [Deposit] ADD FOREIGN KEY ([account_id]) REFERENCES [Account] ([id])
GO
