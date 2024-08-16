Create database FintechVaults;

create table [User](
UserID int primary key identity(1,1),
FullName varchar(80),
Email varchar(70),
[Password] varchar(50),
MobileNo bigint);

create table Account(
AccountID int primary key identity(4210001,1),
UserID int foreign key references [User](UserID),
Balance bigint,
AccountType varchar(30)
);

create table Charges(
ChargeID int primary key,
TransactionAmount int,
ChargeAmount int);

insert into Charges(ChargeID,TransactionAmount,ChargeAmount)
Values 
(1,0,0),
(2,10000,250),
(3,50000,1750),
(4,500000,10000),
(5,2000000,70000),
(6,10000000,300000);

create table [Policy](
PolicyID int primary key identity(1,1),
PolicyText Text);

insert into [Policy](PolicyText)
values
('We use your information to provide and manage your accounts and services.'),
('We use your information to process transactions and send you transaction-related communications.'),
('We use your information to verify your identity and prevent fraud.'),
('We use your information to comply with legal and regulatory requirements.'),
('We use your information to improve our services and develop new products.'),
('We use your information to  send you promotional materials and offers'),
('We will share your information with third parties when you have given us explicit permission to do so.'),
('We may disclose your information to comply with legal obligations, court orders, or government requests.'),
('In the event of a merger, acquisition, or sale of assets, your information may be transferred as part of the transaction.'),
('We use advanced encryption technology to protect your data during transmission.'),
('Access to your information is restricted to authorized personnel only.'),
('We continuously monitor our systems for potential vulnerabilities and attacks.');

create table [Transaction](
TransactionID int primary key identity(1,1),
AccountID int foreign key references Account(AccountID),
BeneficiaryID int,
ChargeID int foreign key references Charges(ChargeID),
TransactionType varchar(20) check(TransactionType IN ('Debited','Credited')),
Amount bigint,
[TimeStamp] varchar(50));

create sequence CardNumber as bigint
start with 4201100060208000
increment by 5;

create sequence CVV as int
start with 100 
increment by 1;

create table CreditCard(
CardID int primary key identity(1,1),
AccountID int foreign key references Account(AccountID),
CardNumber BIGINT DEFAULT NEXT VALUE FOR CardNumber,
ExpiryDate varchar(30),
CVV int default next value for CVV,
ActivationStatus varchar(30) default 'NotActivated',
CardName varchar(30),
CardPin int default 0);
 