CREATE TABLE RegisteredUser (
	userID		char(4) PRIMARY KEY,
	LastName	char(20),
	FirstName	char(20),
	Street		varchar(20),
	City		varchar(20),
	Zip		integer,
	Email		varchar(30),
	Phone		integer,
	Kids		integer,
	CampName	varchar(30),
CONSTRAINT User_fkey FOREIGN KEY(CampName) REFERENCES Camp(Name));

CREATE TABLE Kids (
	childID		char(4) PRIMARY KEY,
	ParentID	char(4),
	LastName	char(20),
	FirstName	char(20),
	Grade		integer,
	School		varchar(30),
	Allergies	varchar(10),
	Age		integer,
	CampLength	varchar(10),
CONSTRAINT Kids_fkey FOREIGN KEY(ParentID) REFERENCES RegisteredUser(userID));

CREATE TABLE StoreItem (
	ItemID		char(4) PRIMARY KEY,
	Name		varchar(20),
	Quantity	integer,
	Sold		integer,
	Image		varchar(30),
	Price		number(10,2));

CREATE TABLE Camp (
	CampID		char(4) PRIMARY KEY,
	Name		varchar(30),
	Location	varchar(30),
	Capacity	integer,
	CurrentKids	integer,
	Season		varchar(10),
CONSTRAINT Camp_cons1 CHECK (Season in ('Summer','Winter','Both'));

CREATE TABLE Forum (
	PostID		char(4) PRIMARY KEY,
	ThreadID	char(4),
	PostDate	DATE,
	Content		varchar(256),
	MemberId	char(4),
CONSTRAINT Forum_fkey FOREIGN KEY(MemberID) REFERENCES RegisteredUser(userID));

CREATE TABLE Order (
	TransactionID	char(4) PRIMARY KEY,
	UserID		char(4),
	LastName	char(20),
	FirstName	char(20),
	Street		varchar(20),
	City		varchar(20),
	Zip		integer,
	Email		varchar(30),
	Phone		integer,
	OrderItemID	char(4),
	ItemName	varchar(20),
	ItemQuantity	integer,
	ItemPrice	integer,
CONSTRAINT Order_fkey FOREIGN KEY(OrderItemID) REFERENCES StoreItem(ItemID));
