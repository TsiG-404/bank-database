--

--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: ACCOUNTS
CREATE TABLE [ACCOUNTS] (
"AccountID" integer NOT NULL,
"RemainMoney" integer NOT NULL,
"ClientID" integer NOT NULL,
"AcType" varchar(20) NOT NULL,
PRIMARY KEY ([AccountID]) 
FOREIGN KEY([ClientID])
REFERENCES [CLIENTS]([ID])
);

-- Table: CARDS
CREATE TABLE [CARDS] (
"CardID" integer NOT NULL,
"Pin" integer(4) NOT NULL,
"End" date NOT NULL,
PRIMARY KEY ([CardID]) 
);

-- Table: CLIENTS
CREATE TABLE [CLIENTS] (
"ID" integer NOT NULL,
"Name" varchar(20) NOT NULL,
"Subname" varchar (20) NOT NULL,
"FatherName" varchar(20) NOT NULL,
"City" varchar(40) NOT NULL,
"Address" varchar(50) NOT NULL,
"AdNumber" integer NOT NULL,
"PostalCode" integer NOT NULL,
"AFM" integer NOT NULL,
"AT" integer NOT NULL,
PRIMARY KEY ([ID]) );

-- Table: EBANK
CREATE TABLE [EBANK] (
"MailID" varchar(50) NOT NULL,
"Username" varchar(50) NOT NULL,
"Password" varchar(50) NOT NULL,
"ClientID" integer NOT NULL,
"AccountID" integer,
PRIMARY KEY ([MailID]) 
FOREIGN KEY([ClientID])
REFERENCES [CLIENTS]([ID]),

FOREIGN KEY([AccountID])
REFERENCES[ACCOUNTS]([AccountID])

);

-- Table: EMPLOYEES
CREATE TABLE [EMPLOYEES] (
"ID" integer NOT NULL,
"Name" varchar(20) NOT NULL,
"SubName" varchar(20) NOT NULL,
"Address" varchar(50) NOT NULL,
"Phone" integer NOT NULL,
PRIMARY KEY ([ID]) 
);

-- Table: PHONES
CREATE TABLE [PHONES] (
"Number" integer NOT NULL,
"ClientID" integer NOT NULL,
PRIMARY KEY ([Number]) 
FOREIGN KEY([ClientID])
REFERENCES [CLIENTS]([ID])
);

-- Table: SERVICING
CREATE TABLE [SERVICING] (
"ServiceID" integer NOT NULL,
"CleintID" integer NOT NULL,
"EmployeeID" integer NOT NULL,
"Date" date NOT NULL,
"Time" time NOT NULL,
PRIMARY KEY ([ServiceID]),
FOREIGN KEY ([CleintID])
REFERENCES [CLIENTS]([ID]),
FOREIGN KEY ([EmployeeID])
REFERENCES [EMPLOYEES]([ID]) );

-- Table: TRANSACTIONS
CREATE TABLE [TRANSACTIONS] (
"TransactionID" integer NOT NULL,
"AccountID" integer NOT NULL,
"Amount" integer NOT NULL,
"TransType" varchar(8) NOT NULL,
"Date" date NOT NULL,
"Time" time NOT NULL,
PRIMARY KEY ([TransactionID]),
FOREIGN KEY ([AccountID])
REFERENCES [ACCOUNTS]([AccountID]),
FOREIGN KEY ([Amount])
REFERENCES [ACCOUNTS]([RemainMoney])
 );

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
