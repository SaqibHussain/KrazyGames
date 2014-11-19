--START CREATING TABLES
--CREATE THE TABLE
--USE THE TABLE
--Drop table statements just incase you need them to reset all the tables to nil and reset the IDENTITY Value

DROP DATABASE dbKrazyGames;
GO
CREATE DATABASE dbKrazyGames;
GO
USE dbKrazyGames;
GO
drop table tblOrderLine;
drop table tblOrder;
drop table tblOrderStatus;
drop table tblGameGenre;
drop table tblGameRating;
drop table tblReview;
drop table tblWishlist;
drop table tblProduct;
drop table tblCategory;
drop table tblStatus;
drop table tblRating;
drop table tblGenre;
drop table tblShippingAddress;
drop table tblBillingAddress;
drop table tblDeliveryType;
drop table tblCustomer;
drop table tblCustomerType;
drop table tblCountry;
GO

CREATE TABLE tblCountry
([CountryID] INT IDENTITY,
[Country_Name] NVARCHAR(20) NOT NULL UNIQUE,
[Extention_Code] NVARCHAR(5) NOT NULL UNIQUE,
[Tax_Amount] DECIMAL NOT NULL,
[Delivery_Charge] DECIMAL NOT NULL,
CONSTRAINT PK_Country_CountryID PRIMARY KEY (CountryID));
GO
CREATE TABLE tblCustomerType
([CustomerTypeID] INT IDENTITY,
[CustomerType] NVARCHAR(20),
[CustomerTypeDescription] NVARCHAR(100),
CONSTRAINT PK_tblCustomerType_tblCustomerTypeID PRIMARY KEY (CustomerTypeID));
GO
CREATE TABLE tblCustomer
([CustomerID] INT IDENTITY,
[Title] NVARCHAR(4) NOT NULL CHECK (Title IN('Mr', 'Mrs', 'Miss')),
[FirstName] NVARCHAR(20) NOT NULL,
[Surname] NVARCHAR(20) NOT NULL ,
[Email] NVARCHAR(40) NOT NULL UNIQUE,
[Phone] NVARCHAR(11),
[Mobile] NVARCHAR(11),
[DateOfBirth] DATE NOT NULL,
[CountryID] INT NOT NULL,
[Password] NVARCHAR(40) NOT NULL,
[CustomerTypeID] INT,
CONSTRAINT PK_Customer_CustomerID PRIMARY KEY (CustomerID),
CONSTRAINT FK_Customer_CountryID FOREIGN KEY (CountryID) REFERENCES tblCountry (CountryID),
CONSTRAINT FK_Customer_CustomerTypeID FOREIGN KEY (CustomerTypeID) REFERENCES tblCustomerType (CustomerTypeID));
GO
SET DATEFORMAT dmy;
GO
CREATE TABLE tblBillingAddress
([BillingAddressID] INT IDENTITY,
[House_Name_Number] NVARCHAR(10) NOT NULL,
[Street_Name] NVARCHAR(20) NOT NULL,
[Town] NVARCHAR(20) NOT NULL,
[County] NVARCHAR(20) NOT NULL,
[Post_Zip_Code] NVARCHAR(10) NOT NULL,
[Country_ID] INT NOT NULL,
[CustomerID] INT NOT NULL,
CONSTRAINT PK_BillingAddress_BillingID PRIMARY KEY (BillingAddressID),
CONSTRAINT FK_BillingAddress_CustomerID FOREIGN KEY (CustomerID) REFERENCES tblCustomer (CustomerID),
CONSTRAINT FK_BillingAddress_CountryID FOREIGN KEY (Country_ID) REFERENCES tblCountry (CountryID));
GO
CREATE TABLE tblShippingAddress
([ShippingAddressID] INT IDENTITY,
[House_Name_Number] NVARCHAR(10) NOT NULL,
[Street_Name] NVARCHAR(20) NOT NULL,
[Town] NVARCHAR(20) NOT NULL,
[County] NVARCHAR(20) NOT NULL,
[Post_Zip_Code] NVARCHAR(10) NOT NULL,
[Country_ID] INT NOT NULL,
[CustomerID] INT NOT NULL,
CONSTRAINT PK_ShippingAddress_BillingID PRIMARY KEY (ShippingAddressID),
CONSTRAINT FK_ShippingAddress_CustomerID FOREIGN KEY (CustomerID) REFERENCES tblCustomer (CustomerID),
CONSTRAINT FK_ShippingAddress_CountryID FOREIGN KEY (Country_ID) REFERENCES tblCountry (CountryID));
GO
CREATE TABLE tblGenre
([GenreID] INT IDENTITY,
[GenreName] NVARCHAR(20) NOT NULL UNIQUE,
[GenreDescription] NVARCHAR(50) NOT NULL,
CONSTRAINT PK_Genre_GenreID PRIMARY KEY (GenreID));
GO
CREATE TABLE tblRating
([RatingID] INT IDENTITY,
[RatingName] NVARCHAR(30) NOT NULL UNIQUE,
[RatingDescription] NVARCHAR(60) NOT NULL,
[Image] NVARCHAR (200),
CONSTRAINT PK_Rating_RatingID PRIMARY KEY (RatingID));
GO
CREATE TABLE tblStatus
([StatusID] INT IDENTITY,
[StatusName] NVARCHAR(20) NOT NULL UNIQUE,
[StatusDescription] NVARCHAR(50) NOT NULL,
CONSTRAINT PK_Status_StatusID PRIMARY KEY (StatusID));
GO
CREATE TABLE tblCategory
([CategoryID] INT IDENTITY,
[CategoryName] NVARCHAR(30) NOT NULL UNIQUE,
[CategoryDescription] NVARCHAR(50) NOT NULL,
CONSTRAINT PK_Category_CategoryID PRIMARY KEY (CategoryID));
GO
CREATE TABLE tblProduct
([ProductID] INT IDENTITY,
[Name] NVARCHAR(100) NOT NULL,
[Description] NVARCHAR(500) NOT NULL,
--Max number of digits = 18, always 2 decimal places
[UnitPrice] DECIMAL(18,2) NOT NULL,
--Stored as string so we don't have to include the day of release, only the month
[Release_Date] NVARCHAR(10),
[QuickDescription] NVARCHAR(300) NOT NULL,
--Max number of digits = 18, always 2 decimal places
[Discount] DECIMAL(18,2) NOT NULL,
--Max number of digits = 18, always 2 decimal places
--Stored in grams
[Weight] DECIMAL(18,2) NOT NULL,
[Quantity] INT NOT NULL,
[CategoryID] INT NOT NULL,
[StatusID] INT NOT NULL,
[Image] NVARCHAR(200) NULL,
CONSTRAINT PK_Product_ProductID PRIMARY KEY (ProductID),
CONSTRAINT FK_Product_CategoryID FOREIGN KEY (CategoryID) REFERENCES tblCategory (CategoryID),
CONSTRAINT FK_Product_StatusID FOREIGN KEY (StatusID) REFERENCES tblStatus (StatusID));
GO
CREATE TABLE tblWishlist
([WishlistID] INT IDENTITY,
[CustomerID] INT NOT NULL,
[ProductID] INT NOT NULL,
CONSTRAINT PK_Wishlist_WishlistID PRIMARY KEY (WishlistID),
CONSTRAINT FK_Wishlist_CustomerID FOREIGN KEY (CustomerID) REFERENCES tblCustomer (CustomerID),
CONSTRAINT FK_Wishlist_ProductID FOREIGN KEY (ProductID) REFERENCES tblProduct (ProductID));
GO
CREATE TABLE tblReview
([ReviewID] INT IDENTITY,
[ProductID] INT NOT NULL,
[CustomerID] INT NOT NULL,
[Rating] INT CHECK(Rating BETWEEN 0 AND 5),
[Review] NVARCHAR(100),
CONSTRAINT PK_Review_ReviewID PRIMARY KEY (ReviewID),
CONSTRAINT FK_Review_ProductID FOREIGN KEY (ProductID) REFERENCES tblProduct (ProductID),
CONSTRAINT FK_Review_CustomerID FOREIGN KEY (CustomerID) REFERENCES tblCustomer (CustomerID));
GO
CREATE TABLE tblGameRating
([ProductID] INT NOT NULL,
[RatingID] INT NOT NULL,
CONSTRAINT PK_GameRating PRIMARY KEY (ProductID, RatingID),
CONSTRAINT FK_GameRating_ProductID FOREIGN KEY (ProductID) REFERENCES tblProduct (ProductID),
CONSTRAINT FK_GameRating_RatingID FOREIGN KEY (RatingID) REFERENCES tblRating (RatingID));
GO
CREATE TABLE tblGameGenre
([ProductID] INT NOT NULL,
[GenreID] INT NOT NULL,
CONSTRAINT PK_GameGenre PRIMARY KEY (ProductID, GenreID),
CONSTRAINT FK_GameGenre_ProductID FOREIGN KEY (ProductID) REFERENCES tblProduct (ProductID),
CONSTRAINT FK_GameGenre_GenreID FOREIGN KEY (GenreID) REFERENCES tblGenre (GenreID));
GO
CREATE TABLE tblOrderStatus
([OrderStatusID] INT IDENTITY,
[Description] NVARCHAR(50) NOT NULL UNIQUE,
CONSTRAINT PK_OrderStatus_OrderStatusID PRIMARY KEY (OrderStatusID));
GO
CREATE TABLE tblDeliveryType
([DeliveryTypeID] INT IDENTITY,
[DeliveryType] NVARCHAR(20) NOT NULL UNIQUE,
[ChargeAmount] DECIMAL(18,2) NOT NULL,
CONSTRAINT PK_DeliveryType_DeliveryTypeID  PRIMARY KEY (DeliveryTypeID));
GO
CREATE TABLE tblOrder
([OrderID] INT IDENTITY,
[CustomerID] INT,
[OrderDate] SMALLDATETIME NOT NULL,
[Total] DECIMAL NOT NULL,
[DeliveryTypeID] INT,
[DeliveryTotal] DECIMAL,
[DeliveryTotalCountry] DECIMAL,
[GrandTotal] DECIMAL,
[GrandTotalWithVAT] DECIMAL,
[OrderStatusID] INT NOT NULL, --Used to check for order or shopping basket
CONSTRAINT PK_Order_OrderID PRIMARY KEY (OrderID),
CONSTRAINT FK_Order_CustomerID FOREIGN KEY (CustomerID) REFERENCES tblCustomer (CustomerID),
CONSTRAINT FK_Order_DeliveryTypeID FOREIGN KEY (DeliveryTypeID) REFERENCES tblDeliveryType (DeliveryTypeID),
CONSTRAINT FK_Order_StatusID FOREIGN KEY (OrderStatusID) REFERENCES tblOrderStatus (OrderStatusID));
GO
CREATE TABLE tblOrderLine
([OrderLineID] INT IDENTITY,
[OrderID] INT NOT NULL,
[ProductID] INT NOT NULL,
[GiftOption] CHAR(3) NOT NULL CHECK (GiftOption IN ('YES', 'NO')),
[UnitPrice] DECIMAL NOT NULL,
[Quantity] INT NOT NULL,
[DiscountAmount] DECIMAL NOT NULL,
[DiscountTotal] DECIMAL NOT NULL,
[GrandTotal] DECIMAL NOT NULL,
[UnitWeight] DECIMAL NOT NULL,
[TotalWeight] DECIMAL NOT NULL,
CONSTRAINT P_OrderLine_OrderLineID PRIMARY KEY (OrderLineID),
CONSTRAINT FK_OrderLine_OrderID FOREIGN KEY (OrderID) REFERENCES tblOrder (OrderID),
CONSTRAINT FK_OrderLine_ProductID FOREIGN KEY (ProductID) REFERENCES tblProduct (ProductID));

--END CREATING TABLES


--ADDING DATA
--MAKE SURE YOURE USING THE RIGHT DB
USE dbKrazyGames;

--Country Table (CountryID, Country_Name, Extention_Code, Tax_Amount, Delivery_Charge)
delete from tblCountry;
INSERT INTO tblCountry values ('United Kingdom','+44','.2','2.99');
INSERT INTO tblCountry values ('France','+33','.2','3.99');
INSERT INTO tblCountry values ('Spain','+34','.16','3.49');
INSERT INTO tblCountry values ('Germany','+49','.15','3.99');
INSERT INTO tblCountry values ('Poland','+48','.18','3.49');
INSERT INTO tblCountry values ('Sweden','+46','.2','4.19');
INSERT INTO tblCountry values ('Austria','+43','.15','3.79');
INSERT INTO tblCountry values ('Ukraine','+380','.13','3.69');
INSERT INTO tblCountry values ('Croatia','+385','.17','2.99');
INSERT INTO tblCountry values ('Portugal','+351','.19','4.49');

--Customer Type Table (CustomerTypeID, CustomerType, CustomerTypeDescription)
delete from tblCustomerType;
INSERT INTO tblCustomerType VALUES ('User', 'Ordinary Customer')
INSERT INTO tblCustomerType VALUES ('Employee', 'KrazyGames Employee')
INSERT INTO tblCustomerType VALUES ('Manager', 'System Administrator')
--Customer Table (*CustomerID, Title, FirstName, Surname, Email, Phone, Mobile, DateOfBirth, CountryID, Password)
delete from tblCustomer;
INSERT INTO tblCustomer values ('Mr','Rob','Andrew','rob_andrew92@hotmail.com','01527859458','07865451142','02/01/1992',1,'Password', 1);
INSERT INTO tblCustomer values ('Mrs','Charlotte','Collier','CharlotteCollier@dayrep,com','01218568874','07934286830','12/11/1951',1,'Password', 1);
INSERT INTO tblCustomer values ('Miss','Casey','Piest','CPiest@yahoo.com','8596214523','5845963152','28/06/1985',5,'Password', 1);
INSERT INTO tblCustomer values ('Miss','Isabelle','Nopert','IsabelleN88@teleworm.com','28817502','5462879512','03/12/1988',3,'Password', 1);
INSERT INTO tblCustomer values ('Mr','Bob','Smith','Bob@mail.com','15247584685','1574698245','02/03/1990',9,'Password', 1);
INSERT INTO tblCustomer values ('Mr','Tarek','Vleugels','Tarekvleugels@googlemail.com','0148596321','0496588190','25/12/1949',9,'Password', 1)

INSERT INTO tblCustomer values ('Mr','Birmingham','Birmingham','Birmingham@email.com','0148496321','0446588190','25/12/1949',9,'abcd$abcd1', 1)
INSERT INTO tblCustomer values ('Mr','city','city','city@email.com','0148596321','0496588690','25/12/1949',9,'abcd$abcd1', 2)
INSERT INTO tblCustomer values ('Mr','university','university','university@email.com','0148590321','0496528190','25/12/1949',9,'abcd$abcd1', 3)



--Billing Addresses Table (*BillingAddressID, House_Name_Number, Street_Name, Town, County, Post_Zip_Code, CountryID, CustomerID)
delete from tblBillingAddress;
INSERT INTO tblBillingAddress values ('76','Harehills Lane','Roxburgh','Hereford','TD58RU',1,1);
INSERT INTO tblBillingAddress values ('45','Fox Street','Birmingham','Midlands','B5 5JR',1,2);
INSERT INTO tblBillingAddress values ('1','Hill Close','Moutlon','Northamptonshire','NN1 9UJ',5,3);
INSERT INTO tblBillingAddress values ('27','Back Way','Some Town','Northamptonshire','NN15 6HG',3,4);
INSERT INTO tblBillingAddress values ('23','Orange Lane','Some Other Town','Northamptonshire','NN3 7TY',6,5);

--Shipping Address Table (ShippingAddressID, House_Name_Number, Street_Name, Town, County, Post_Zip_Code, CountryID, CustomerID)
delete from tblShippingAddress;
INSERT INTO tblShippingAddress values ('76','Harehills Lane','Roxburgh','Hereford','TD58RU',1,1);
INSERT INTO tblShippingAddress values ('45','Fox Street','Birmingham','Midlands','B5 5JR',1,2);
INSERT INTO tblShippingAddress values ('1','Hill Close','Moutlon','Northamptonshire','NN1 9UJ',5,3);
INSERT INTO tblShippingAddress values ('27','Back Way','Some Town','Northamptonshire','NN15 6HG',3,4);
INSERT INTO tblShippingAddress values ('23','Orange Lane','Some Other Town','Northamptonshire','NN3 7TY',6,5);


--Genre Table (GenreID, GenreName, GenreDescription)
delete from tblGenre;
INSERT INTO tblGenre values ('Shooter','Combat environment');
INSERT INTO tblGenre values ('Adventure','become an adventurer');
INSERT INTO tblGenre values ('Role Playing','take the place of an adventurer');
INSERT INTO tblGenre values ('Strategy','Skillful thinking required');
INSERT INTO tblGenre values ('Puzzle','Solving puzzles');
INSERT INTO tblGenre values ('Sports','Simulating Sport');
INSERT INTO tblGenre values ('Casual','Simple, easy and fun');

--Product Age Rating Table (e.g. R Rated/Universal) (RatingID, RatingName, RatingDescription)
delete from tblRating;
INSERT INTO tblRating values ('3','recommended for persons over the age of 3', '3.png');
INSERT INTO tblRating values ('7','recommended for persons over the age of 7', '7.png');
INSERT INTO tblRating values ('12','recommended for persons over the age of 12', '12.png');
INSERT INTO tblRating values ('16','recommended for persons over the age of 15', '16.png');
INSERT INTO tblRating values ('18','recommended for persons over the age of 18', '18.png');
INSERT INTO tblRating values ('Bad Language','Contains inappropriate language', 'bad.png');
INSERT INTO tblRating values ('Discrimination','May find offensive', 'dis.png');
INSERT INTO tblRating values ('Drugs','Contains drugs', 'drugs.png');
INSERT INTO tblRating values ('Fear','May find scary', 'fear.png');
INSERT INTO tblRating values ('Gambling','Contains images of gambling', 'gambling.png');
INSERT INTO tblRating values ('Online','Option to play online', 'online.png');
INSERT INTO tblRating values ('Sex','Contains sex', 'sex.png');
INSERT INTO tblRating values ('Violence','Contains violence', 'violence.png');

--Product Status Table (StatusID, StatusName, StatusDescription)
delete from tblStatus;
INSERT INTO tblStatus values ('Available','In stock ready to order.');
INSERT INTO tblStatus values ('Unavailable','Unavailable - More coming soon');

--Product Category Table (CategoryID, CategoryName, CatergoryDescription)
delete from tblCategory
INSERT INTO tblCategory values ('XBOX Game','XBOX Games');
INSERT INTO tblCategory values ('XBOX Console','XBOX Consoles');
INSERT INTO tblCategory values ('XBOX Accesories','XBOX Accesories');
INSERT INTO tblCategory values ('PS3 Game','PS3 Games');
INSERT INTO tblCategory values ('PS3 Console','PS3 Consoles');
INSERT INTO tblCategory values ('PS3 Accesories','PS3 Accesories');
INSERT INTO tblCategory values ('WII Game','WII Games');
INSERT INTO tblCategory values ('WII Console','WII Consoles');
INSERT INTO tblCategory values ('WII Accesories','WII Accesories');
INSERT INTO tblCategory values ('PSP Games','PSP Games');
INSERT INTO tblCategory values ('PSP Console','PSP Consoles');
INSERT INTO tblCategory values ('PSP Accesories','PSP Accesories');
INSERT INTO tblCategory values ('DS Games','DS Games');
INSERT INTO tblCategory values ('DS Consoles','DS Consoles');
INSERT INTO tblCategory values ('DS Accesories','DS Accesories');

--Products table (ProductID, Name, Description, UnitPrice, Release_Date, QuickDescription, Discount, Quantity, Weight, CategoryID, StatusID
delete from tblProduct

INSERT INTO tblProduct values('XBOX 4GB Console','XBOX 4GB Console',169.99,'11/2011','XBOX Console',0.00,1000,10,2,1,'1.jpg');
INSERT INTO tblProduct values('XBOX 250GB Console','XBOX 250GB Console',189.00,'11/2011','XBOX Console',0.00,1000,10,2,1,'2.jpg');
INSERT INTO tblProduct values('PS3 12GB Console','PS3 12GB Console',219.00,'05/2012','PS3 Console',0.00,1000,110,5,1,'3.jpg');
INSERT INTO tblProduct values('PS3 120GB Console','PS3 120GB Console',239.00,'05/2012','PS3 Console',0.00,1000,16,5,1,'4.jpg');
INSERT INTO tblProduct values('PS3 250GB Console','PS3 250GB Console',269.99,'05/2012','PS3 Console',0.00,1000,14,5,1,'5.jpg');
INSERT INTO tblProduct values('PS3 500GB Console','PS3 500GB Console',299.99,'05/2012','PS3 Console',0.00,1000,112,5,1,'5.jpg');
INSERT INTO tblProduct values('WII White Console','WII White Console',139.99,'10/2010','WII Console',0.00,600,155,8,1,'7.jpg');
INSERT INTO tblProduct values('WII Black Console','WII Black Console',149.00,'10/2010','WII Console',0.00,600,200,8,1,'8.jpg');
INSERT INTO tblProduct values('WII Red Console','WII Red Console',159.99,'10/2010','WII Console',0.00,600,15,8,1,'10.jpg');
INSERT INTO tblProduct values('PSP Console','PSP Console',149.99,'09/2011','PSP Console',0.00,200,165,11,1,'11.jpg');
INSERT INTO tblProduct values('DS Black Console','DS Black Console',129.00,'06/2010','DS Console',0.00,150,110,14,1,'12.jpg');
INSERT INTO tblProduct values('DS Red Console','DS Red Console',129.99,'06/2010','DS Console',0.00,150,101,14,1,'13.jpg');
INSERT INTO tblProduct values('DS Blue Console','DS Blue Console',129.99,'06/2010','DS Console',0.00,150,120,14,1,'14.jpg');
INSERT INTO tblProduct values('DS White Console','DS White Console',129.00,'06/2010','DS Console',0.00,150,120,14,1,'15.jpg');
INSERT INTO tblProduct values('XBOX White Wireless Controller','XBOX Wireless Controller',25.77,'11/2011','XBOX Controller',0.00,50,112,3,1,'16.jpg');
INSERT INTO tblProduct values('XBOX Black Wireless Controller','XBOX Wireless Controller',25.77,'11/2011','XBOX Controller',0.00,50,112,3,1,'17.jpg');
INSERT INTO tblProduct values('XBOX Black Wired Controller','XBOX Wired Controller',18.00,'11/2011','XBOX Controller',0.00,30,113,3,1,'18.jpg');
INSERT INTO tblProduct values('XBOX Wireless Headset','XBOX Wireless Headset',25.00,'11/2011','XBOX Headset',0.00,20,115,3,1,'19.jpg');
INSERT INTO tblProduct values('XBOX Wired HeadSet','XBOX Wired Headset',12.50,'11/2011','XBOX Headset',0.00,20,145,3,1,'20.jpg');
INSERT INTO tblProduct values('XBOX Network Adapter','XBOX Network Adapter',45.99,'11/2011','XBOX Adapter',0.00,10,156,3,1,'21.jpg');
INSERT INTO tblProduct values('PS3 Wireless Controller','PS3 Wireless Controller',35.99,'05/2012','XBOX Controller',0.00,50,10,6,1,'22.jpg');
INSERT INTO tblProduct values('PS3 Media Remote','PS3 Media Remote',18.99,'05/2012','Media Remote',0.00,30,145,6,1,'.23jpg');
INSERT INTO tblProduct values('PS3 Wireless Headset','PS3 Wireless Headset',25.00,'05/2012','PS3 Headset',0.00,20,161,6,1,'24.jpg');
INSERT INTO tblProduct values('WII Remote White','WII Remote White',22.99,'10/2010','WII Remote',0.00,20,145,9,1,'25.jpg');
INSERT INTO tblProduct values('WII Remote Black','WII Remote Black',22.99,'10/2010','WII Remote',0.00,20,110,9,1,'26.jpg');
INSERT INTO tblProduct values('WII Remote Red','WII Remote Red',22.50,'10/2010','WII Remote',0.00,20,19,9,1,'27.jpg');
INSERT INTO tblProduct values('WII Steering Wheel','WII Steering Wheel',10.00,'10/2010','WII Remote Mould',0.00,20,18,9,1,'28.jpg');
INSERT INTO tblProduct values('WII Tennis Racket','Tennis Racket',8.99,'10/2010','WII Remote Mould',0.00,20,89,9,1,'29.jpg');
INSERT INTO tblProduct values('WII Golf Club','WII Golf Club',7.99,'10/2010','WII Remote Mould',0.00,20,65,9,1,'30.jpg');
INSERT INTO tblProduct values('PSP Red Case','PSP Red Case',8.00,'09/2011','PSP Case',0.00,10,45,12,1,'31.jpg');
INSERT INTO tblProduct values('PSP White Case','PSP White Case',8.00,'09/2011','PSP Case',0.00,10,32,12,1,'32.jpg');
INSERT INTO tblProduct values('PSP Black Case','PSP Black Case',8.00,'09/2011','PSP Case',0.00,10,56,12,1,'33.jpg');
INSERT INTO tblProduct values('PSP Blue Case','PSP Blue Case',8.00,'09/2011','PSP Case',0.00,10,12,12,1,'34.jpg');
INSERT INTO tblProduct values('PSP Pink Case','PSP Pink Case',8.00,'09/2011','PSP Case',0.00,10,12,12,1,'35.jpg');
INSERT INTO tblProduct values('PSP Red Case','PSP Red Case',8.00,'09/2011','PSP Case',0.00,10,12,12,1,'36.jpg');
INSERT INTO tblProduct values('DS Red Case','DS Red Case',7.00,'06/2010','DS Case',0.00,15,63,15,1,'37.jpg');
INSERT INTO tblProduct values('DS Pink Case','DS Pink Case',7.00,'06/2010','DS Case',0.00,15,41,15,1,'38.jpg');
INSERT INTO tblProduct values('DS White Case','DS White Case',7.00,'06/2010','DS Case',0.00,15,14,15,1,'39.jpg');
INSERT INTO tblProduct values('DS Blue Case','DS Blue Case',7.00,'06/2010','DS Case',0.00,15,123,15,1,'40.jpg');
INSERT INTO tblProduct values('Call Of Duty - Black Ops 2 - XBOX','Call Of Duty - Black Ops 2 - XBOX',39.99,'11/2012','XBOX Game',0.00,123,25,1,1,'41.jpg');
INSERT INTO tblProduct values('Fifa 13 - XBOX','Fifa 13 - XBOX',39.99,'10/2012','XBOX Game',0.00,123,25,1,1,'42.jpg');
INSERT INTO tblProduct values('Forza 4 - XBOX','Forza 4 - XBOX',29.99,'01/2011','XBOX Game',0.00,147,25,1,1,'43.jpg');
INSERT INTO tblProduct values('Pro Evolution Soccer 13 - XBOX','Pro Evolution Soccer 13 - XBOX',35.00,'10/2012','XBOX Game',0.00,123,25,1,1,'44.jpg');
INSERT INTO tblProduct values('The Walking Dead - XBOX','The Walking Dead - XBOX',44.99,'03/2013','XBOX Game',0.00,123,25,1,1,'45.jpg');
INSERT INTO tblProduct values('Gears Of War - XBOX','Gears Of War - XBOX',25.00,'01/2013','XBOX Game',0.00,123,25,1,1,'46.jpg');
INSERT INTO tblProduct values('Sim City - XBOX','Sim City - XBOX',15.00,'06/2011','XBOX Game',0.00,123,25,1,1,'47.jpg');
INSERT INTO tblProduct values('Just Dance 4 - XBOX','Just Dance 4 - XBOX',19.99,'09/2012','XBOX Game',0.00,123,25,1,1,'48.jpg');
INSERT INTO tblProduct values('Skylanders Giants - XBOX','Skylands Giants - XBOX',49.99,'11/2012','XBOX Game',0.00,123,25,1,1,'49.jpg');
INSERT INTO tblProduct values('LEGO - Lord Of The Rings - XBOX','LEGO - Lord OF The Rings - XBOX',39.99,'08/2012','XBOX Game',0.00,123,25,1,1,'50.jpg');
INSERT INTO tblProduct values('Carnival Games - In Action - XBOX','Carnival Games - In Action - XBOX',39.99,'08/2012','XBOX Game',0.00,123,25,1,1,'51.jpg');
INSERT INTO tblProduct values('Battlefield 3 - XBOX','Battlefield 3 - XBOX',39.99,'08/2012','XBOX Game',0.00,123,25,1,1,'52.jpg');
INSERT INTO tblProduct values('Gears of War Judgement - XBOX','Gears of War Judgement - XBOX',39.99,'08/2012','XBOX Game',0.00,123,25,1,1,'53.jpg');
INSERT INTO tblProduct values('Grand Theft Auto: San Andreas - XBOX','Grand Theft Auto: San Andreas - XBOX',39.99,'08/2012','XBOX Game',0.00,123,25,1,1,'54.jpg');
INSERT INTO tblProduct values('Forza Horizon - XBOX','Forza Horizon - XBOX',39.99,'08/2012','XBOX Game',0.00,123,25,1,1,'55.jpg');
INSERT INTO tblProduct values('Need for Speed The Run - XBOX','Need for Speed The Run - XBOX',39.99,'08/2012','XBOX Game',0.00,123,25,1,1,'56.jpg');
INSERT INTO tblProduct values('The Avengers - XBOX','The Avengers - XBOX',39.99,'08/2012','XBOX Game',0.00,123,25,1,1,'57.jpg');
INSERT INTO tblProduct values('Lips - XBOX','Lips - XBOX',39.99,'08/2012','XBOX Game',0.00,123,25,1,1,'58.jpg');
INSERT INTO tblProduct values('Rocksmith - XBOX','Rocksmith - XBOX',39.99,'08/2012','XBOX Game',0.00,123,25,1,1,'59.jpg');
INSERT INTO tblProduct values('Call Of Duty - Black Ops 2 - PS3','Call Of Duty - Black Ops 2 - PS3',39.99,'11/2012','PS3 Game',0.00,123,25,4,1,'60.jpg');
INSERT INTO tblProduct values('Fifa 13 - PS3','Fifa 13 - PS3',39.99,'10/2012','PS3 Game',0.00,123,25,4,1,'61.jpg');
INSERT INTO tblProduct values('Forza 4 - PS3','Forza 4 - PS3',29.99,'01/2011','PS3 Game',0.00,123,25,4,1,'62.jpg');
INSERT INTO tblProduct values('Pro Evolution Soccer 13 - PS3','Pro Evolution Soccer 13 - PS3',35.00,'10/2012','PS3 Game',0.00,123,25,4,1,'63.jpg');
INSERT INTO tblProduct values('The Walking Dead - PS3','The Walking Dead - PS3',44.99,'03/2013','PS3 Game',0.00,123,25,4,1,'64.jpg');
INSERT INTO tblProduct values('Gears Of War - PS3','Gears Of War - PS3',25.00,'01/2013','PS3 Game',0.00,123,25,4,1,'65.jpg');
INSERT INTO tblProduct values('Sim City - PS3','Sim City - PS3',15.00,'06/2011','PS3 Game',0.00,123,25,4,1,'66.jpg');
INSERT INTO tblProduct values('Just Dance 4 - PS3','Just Dance 4 - PS3',19.99,'09/2012','PS3 Game',0.00,123,25,4,1,'67.jpg');
INSERT INTO tblProduct values('Skylanders Giants - PS3','Skylands Giants - PS3',49.99,'11/2012','PS3 Game',0.00,123,25,4,1,'68.jpg');
INSERT INTO tblProduct values('LEGO - Lord Of The Rings - PS3','LEGO - Lord OF The Rings - PS3',39.99,'08/2012','PS3 Game',0.00,123,25,4,1,'69.jpg');
INSERT INTO tblProduct values('Call Of Duty - Black Ops 2 - WII','Call Of Duty - Black Ops 2 - WII',39.99,'11/2012','WII Game',0.00,123,25,7,1,'70.jpg');
INSERT INTO tblProduct values('Fifa 13 - WII','Fifa 13 - WII',39.99,'10/2012','WII Game',0.00,123,25,7,1,'71.jpg');
INSERT INTO tblProduct values('Batman 2 - DC Superheroes - WII','Batman 2 - DC Superheroes - WII',39.99,'10/2012','WII Game',0.00,123,25,7,1,'72.jpg');
INSERT INTO tblProduct values('Pro Evolution Soccer 13 - WII','Pro Evolution Soccer 13 - WII',35.00,'10/2012','WII Game',0.00,123,25,7,1,'73.jpg');
INSERT INTO tblProduct values('The Walking Dead - WII','The Walking Dead - WII',44.99,'03/2013','WII Game',0.00,123,25,7,1,'74.jpg');
INSERT INTO tblProduct values('Gears Of War - WII','Gears Of War - WII',25.00,'01/2013','WII Game',0.00,123,25,7,1,'75.jpg');
INSERT INTO tblProduct values('Sim City - WII','Sim City - WII',15.00,'06/2011','WII Game',0.00,123,25,7,1,'76.jpg');
INSERT INTO tblProduct values('Just Dance 4 - WII','Just Dance 4 - WII',19.99,'09/2012','WII Game',0.00,123,25,7,1,'77.jpg');
INSERT INTO tblProduct values('Skylanders Giants - WII','Skylands Giants - WII',49.99,'11/2012','WII Game',0.00,123,25,7,1,'78.jpg');
INSERT INTO tblProduct values('LEGO - Lord Of The Rings - WII','LEGO - Lord OF The Rings - WII',39.99,'08/2012','WII Game',0.00,123,25,7,1,'79.jpg');
INSERT INTO tblProduct values('Call Of Duty - Black Ops 2 - PSP','Call Of Duty - Black Ops 2 - PSP',39.99,'11/2012','PSP Game',0.00,123,25,10,1,'80.jpg');
INSERT INTO tblProduct values('Fifa 13 - PSP','Fifa 13 - PSP',39.99,'10/2012','PSP Game',0.00,123,25,10,1,'81.jpg');
INSERT INTO tblProduct values('Forza 4 – PSP','Forza 4 - PSP',29.99,'01/2011','PSP Game',0.00,123,25,10,1,'82.jpg');
INSERT INTO tblProduct values('Pro Evolution Soccer 13 - PSP','Pro Evolution Soccer 13 - PSP',35.00,'10/2012','PSP Game',0.00,123,25,10,1,'83.jpg');
INSERT INTO tblProduct values('The Walking Dead - PSP','The Walking Dead - PSP',44.99,'03/2013','PSP Game',0.00,123,25,10,1,'84.jpg');
INSERT INTO tblProduct values('Gears Of War - PSP','Gears Of War - PSP',25.00,'01/2013','PSP Game',0.00,123,25,10,1,'85.jpg');
INSERT INTO tblProduct values('Sim City - PSP','Sim City - PSP',15.00,'06/2011','PSP Game',0.00,123,25,10,1,'86.jpg');
INSERT INTO tblProduct values('Skylanders Giants - PSP','Skylands Giants - PSP',49.99,'11/2012','PSP Game',0.00,123,25,10,1,'87.jpg');
INSERT INTO tblProduct values('LEGO - Lord Of The Rings - PSP','LEGO - Lord OF The Rings - PSP',39.99,'08/2012','PSP Game',0.00,123,25,10,1,'88.jpg');
INSERT INTO tblProduct values('Call Of Duty - Black Ops 2 - DS','Call Of Duty - Black Ops 2 - DS',39.99,'11/2012','DS Game',0.00,123,25,13,1,'89.jpg');
INSERT INTO tblProduct values('Fifa 13 - DS','Fifa 13 - DS',39.99,'10/2012','DS Game',0.00,123,25,13,1,'90.jpg');
INSERT INTO tblProduct values('Forza 4 – DS','Forza 4 - DS',29.99,'01/2011','DS Game',0.00,123,25,13,1,'91.jpg');
INSERT INTO tblProduct values('Pro Evolution Soccer 13 - DS','Pro Evolution Soccer 13 - DS',35.00,'10/2012','DS Game',0.00,123,25,13,1,'92.jpg');
INSERT INTO tblProduct values('The Walking Dead - DS','The Walking Dead - DS',44.99,'03/2013','DS Game',0.00,123,25,13,1,'93.jpg');
INSERT INTO tblProduct values('Gears Of War - DS','Gears Of War - DS',25.00,'01/2013','DS Game',0.00,123,25,13,1,'94.jpg');
INSERT INTO tblProduct values('Sim City - DS','Sim City - DS',15.00,'06/2011','DS Game',0.00,123,25,13,1,'95.jpg');
INSERT INTO tblProduct values('Just Dance 4 - DS','Just Dance 4 - DS',19.99,'09/2012','DS Game',0.00,123,25,13,1,'96.jpg');
INSERT INTO tblProduct values('Skylanders Giants - DS','Skylands Giants - DS',49.99,'11/2012','DS Game',0.00,123,25,13,1,'97.jpg');
INSERT INTO tblProduct values('LEGO - Lord Of The Rings - DS','LEGO - Lord OF The Rings - DS',39.99,'08/2012','DS Game',0.00,123,25,13,1,'98.jpg');

--Wishlist Table
delete from tblWishlist;
INSERT INTO tblWishlist VALUES (1, 1);
INSERT INTO tblWishlist VALUES (1, 2);
INSERT INTO tblWishlist VALUES (1, 3);
INSERT INTO tblWishlist VALUES (1, 7);
INSERT INTO tblWishlist VALUES (1, 10);
INSERT INTO tblWishlist VALUES (1, 19);
INSERT INTO tblWishlist VALUES (3, 7);
INSERT INTO tblWishlist VALUES (4, 2);
INSERT INTO tblWishlist VALUES (5, 12);
INSERT INTO tblWishlist VALUES (5, 32);
INSERT INTO tblWishlist VALUES (5, 12);




--Product Reviews Table (Written by a customer, rated out of 10)(ReviewID, ProductID, CustomerID, Rating, Review)
--Don't need to give review ID
delete from tblReview
INSERT INTO tblReview values(1,1,5,'Great console I use it all the time and KrazyGames has the best price around!');
INSERT INTO tblReview values(12,2,4,'Incredibly fun I take it everywhere with me and brain training is great!');
INSERT INTO tblReview values(18,3,4,'Didnt think it would be that useful but it really does help, worth buying.');
INSERT INTO tblReview values(32,1,4,'Pretty good, doesnt look great but it does the job');
INSERT INTO tblReview values(10,5,0,'This is an absolute waste of time - broke after two days!');

--Link a product to a rating (ProductID, RatingID)
delete from tblGameRating
INSERT INTO tblGameRating values(41,1)
INSERT INTO tblGameRating values(41,6)
INSERT INTO tblGameRating values(41,8)
INSERT INTO tblGameRating values(41,7)
INSERT INTO tblGameRating values(42,1)
INSERT INTO tblGameRating values(42,6)
INSERT INTO tblGameRating values(42,7)
INSERT INTO tblGameRating values(42,5)
INSERT INTO tblGameRating values(43,6)
INSERT INTO tblGameRating values(43,4)
INSERT INTO tblGameRating values(43,7)
INSERT INTO tblGameRating values(43,8)
INSERT INTO tblGameRating values(44,1)
INSERT INTO tblGameRating values(44,3)
INSERT INTO tblGameRating values(44,7)
INSERT INTO tblGameRating values(44,8)
INSERT INTO tblGameRating values(45,1)
INSERT INTO tblGameRating values(45,6)
INSERT INTO tblGameRating values(45,7)
INSERT INTO tblGameRating values(45,8)
INSERT INTO tblGameRating values(46,4)
INSERT INTO tblGameRating values(46,8)
INSERT INTO tblGameRating values(46,7)
INSERT INTO tblGameRating values(46,6)
INSERT INTO tblGameRating values(47,1)
INSERT INTO tblGameRating values(47,6)
INSERT INTO tblGameRating values(47,7)
INSERT INTO tblGameRating values(47,8)
INSERT INTO tblGameRating values(48,4)
INSERT INTO tblGameRating values(48,7)
INSERT INTO tblGameRating values(48,8)
INSERT INTO tblGameRating values(48,6)
INSERT INTO tblGameRating values(49,2)
INSERT INTO tblGameRating values(49,6)
INSERT INTO tblGameRating values(50,1)
INSERT INTO tblGameRating values(50,7)
INSERT INTO tblGameRating values(50,8)
INSERT INTO tblGameRating values(50,6)
INSERT INTO tblGameRating values(51,1)
INSERT INTO tblGameRating values(51,8)
INSERT INTO tblGameRating values(52,7)
INSERT INTO tblGameRating values(52,6)
INSERT INTO tblGameRating values(53,4);
INSERT INTO tblGameRating values(54,5);
INSERT INTO tblGameRating values(55,3);
INSERT INTO tblGameRating values(56,1);
INSERT INTO tblGameRating values(57,2);
INSERT INTO tblGameRating values(58,2);
INSERT INTO tblGameRating values(59,5);
INSERT INTO tblGameRating values(60,2);
INSERT INTO tblGameRating values(61,2);
INSERT INTO tblGameRating values(62,2);
INSERT INTO tblGameRating values(63,4);
INSERT INTO tblGameRating values(64,5);
INSERT INTO tblGameRating values(65,3);
INSERT INTO tblGameRating values(66,1);
INSERT INTO tblGameRating values(67,2);
INSERT INTO tblGameRating values(68,2);
INSERT INTO tblGameRating values(69,5);
INSERT INTO tblGameRating values(70,2);
INSERT INTO tblGameRating values(71,2);
INSERT INTO tblGameRating values(72,2);
INSERT INTO tblGameRating values(73,4);
INSERT INTO tblGameRating values(74,5);
INSERT INTO tblGameRating values(75,3);
INSERT INTO tblGameRating values(76,1);
INSERT INTO tblGameRating values(77,2);
INSERT INTO tblGameRating values(78,2);
INSERT INTO tblGameRating values(79,5);
INSERT INTO tblGameRating values(80,2);
INSERT INTO tblGameRating values(81,2);
INSERT INTO tblGameRating values(82,2);
INSERT INTO tblGameRating values(83,4);
INSERT INTO tblGameRating values(84,5);
INSERT INTO tblGameRating values(85,3);
INSERT INTO tblGameRating values(86,1);
INSERT INTO tblGameRating values(87,2);
INSERT INTO tblGameRating values(88,2);

--Link a product to a genre (ProductID, GenreID)
delete from tblGameGenre
INSERT INTO tblGameGenre values(39,1);
INSERT INTO tblGameGenre values(40,6);
INSERT INTO tblGameGenre values(41,4);
INSERT INTO tblGameGenre values(42,2);
INSERT INTO tblGameGenre values(43,1);
INSERT INTO tblGameGenre values(44,1);
INSERT INTO tblGameGenre values(45,3);
INSERT INTO tblGameGenre values(46,7);
INSERT INTO tblGameGenre values(47,5);
INSERT INTO tblGameGenre values(48,7);
INSERT INTO tblGameGenre values(49,1);
INSERT INTO tblGameGenre values(50,6);
INSERT INTO tblGameGenre values(51,4);
INSERT INTO tblGameGenre values(52,2);
INSERT INTO tblGameGenre values(53,1);
INSERT INTO tblGameGenre values(54,1);
INSERT INTO tblGameGenre values(55,3);
INSERT INTO tblGameGenre values(56,7);
INSERT INTO tblGameGenre values(57,5);
INSERT INTO tblGameGenre values(58,7);
INSERT INTO tblGameGenre values(59,1);
INSERT INTO tblGameGenre values(60,6);
INSERT INTO tblGameGenre values(61,4);
INSERT INTO tblGameGenre values(62,2);
INSERT INTO tblGameGenre values(63,1);
INSERT INTO tblGameGenre values(64,1);
INSERT INTO tblGameGenre values(65,3);
INSERT INTO tblGameGenre values(66,7);
INSERT INTO tblGameGenre values(67,5);
INSERT INTO tblGameGenre values(68,7);
INSERT INTO tblGameGenre values(69,1);
INSERT INTO tblGameGenre values(70,6);
INSERT INTO tblGameGenre values(71,4);
INSERT INTO tblGameGenre values(72,2);
INSERT INTO tblGameGenre values(73,1);
INSERT INTO tblGameGenre values(74,1);
INSERT INTO tblGameGenre values(75,3);
INSERT INTO tblGameGenre values(76,7);
INSERT INTO tblGameGenre values(77,5);
INSERT INTO tblGameGenre values(78,7);
INSERT INTO tblGameGenre values(79,1);
INSERT INTO tblGameGenre values(80,6);
INSERT INTO tblGameGenre values(81,4);
INSERT INTO tblGameGenre values(82,2);
INSERT INTO tblGameGenre values(83,1);
INSERT INTO tblGameGenre values(84,1);
INSERT INTO tblGameGenre values(85,3);
INSERT INTO tblGameGenre values(86,7);
INSERT INTO tblGameGenre values(87,5);
INSERT INTO tblGameGenre values(88,7);

--List of Order statuses (e.g. Shipped/Processing/Awaiting Stock) (OrderStatusID, Description)
--Don't need to give the ID
delete from tblOrderStatus
INSERT INTO tblOrderStatus values('Order Recieved');
INSERT INTO tblOrderStatus values('Processing Order');
INSERT INTO tblOrderStatus values('Awaiting Stock');
INSERT INTO tblOrderStatus values('Shipped');

--Delivery types table  (DeliveryID, DeliveryType, ChargeAmount)
--Don't need to give ID
delete from tblDeliveryType
INSERT INTO tblDeliveryType values('Super',1.00);
INSERT INTO tblDeliveryType values('Express',0.90);
INSERT INTO tblDeliveryType values('Standard',0.75);
INSERT INTO tblDeliveryType values('Economy',0.50);
INSERT INTO tblDeliveryType values('Super Saver',0.30);

--Orders table (OrderID, CustomerID, OrderDate, Total, DeliveryTypeID, DeliveryTotal, DeliveryTotalCountry, GrandTotal, GrandTotalWithVAT, OrderStatusID)
--Don't need to give Order ID
--Orders table (OrderID, CustomerID, OrderDate, Total, DeliveryTypeID, DeliveryTotal, DeliveryTotalCountry, GrandTotal, GrandTotalWithVAT, OrderStatusID)
--Don't need to give Order ID
delete from tblOrder
INSERT INTO tblOrder values(1,'02/01/2013','169.99','1','1.00','3.00','173.99','173.99', 1);
INSERT INTO tblOrder values(2,'02/02/2013','159.99','1','1.00','3.00','163.99','163.99', 1);
INSERT INTO tblOrder values(3,'02/03/2013','149.99','2','0.90','3.00','153.89','153.89', 1);
INSERT INTO tblOrder values(4,'02/04/2013','139.99','2','0.90','3.00','143.89','143.89', 1);
INSERT INTO tblOrder values(5,'02/05/2013','129.99','3','0.75','3.00','133.74','133.74', 1);
INSERT INTO tblOrder values(6,'02/06/2013','109.99','3','0.75','3.00','113.74','113.74', 1);
INSERT INTO tblOrder values(5,'02/07/2013','100.00','4','0.50','3.00','103.50','103.50', 2);
INSERT INTO tblOrder values(4,'02/08/2013','90.00','5','0.30','3.00','93.30','93.30', 4);

--Order Lines for each other Table (OrderLineID, OrderID, ProductID, GiftOption, UnitPrice, Quantity, DiscountAmount, DiscountTotal, GrandTotal, UnitWeight, TotalWeight)
--Don't need to give OrderLine ID
delete from tblOrderLine
INSERT INTO tblOrderLine values(1, 1,'YES','169.99', 1,'0.00','0.00','169.99','1000.00','1000.00');
INSERT INTO tblOrderLine values(2, 2,'YES','189.00', 2,'0.00','0.00','378.00','1000.00','2000.00');
INSERT INTO tblOrderLine values(3, 3,'YES','219.00', 2,'0.00','0.00','438.00','1000.00','2000.00');
INSERT INTO tblOrderLine values(4, 4,'YES','239.99', 1,'0.00','0.00','239.99','1000.00','1000.00');
INSERT INTO tblOrderLine values(5, 5,'YES','269.99', 1,'0.00','0.00','269.99','1000.00','1000.00');
INSERT INTO tblOrderLine values(6, 6,'YES','299.99', 1,'0.00','0.00','299.99','1000.00','1000.00');
INSERT INTO tblOrderLine values(7, 7,'NO','139.99', 1,'0.00','0.00','139.99','600.00','600.00');
INSERT INTO tblOrderLine values(8, 8,'YES','149.00', 1,'0.00','0.00','149.00','600.00','600.00');
INSERT INTO tblOrderLine values(5, 8,'NO','269.99', 1,'0.00','0.00','269.99','1000.00','1000.00');




drop procedure spSearch;
drop procedure spGetXboxAll
drop procedure spGetXboxAccessories
drop procedure spGetXboxConsoles
drop procedure spGetXboxGames;
drop procedure spGetPS3All;
drop procedure spGetPS3Accessories;
drop procedure spGetPS3Consoles;
drop procedure spGetPS3Games;
drop procedure spGetWiiAll;
drop procedure spGetWiiAccessories;
drop procedure spGetWiiConsoles;
drop procedure spGetWiiGames;
drop procedure spGetHandheldAll;
drop procedure spGetPSPAccessories;
drop procedure spGetPSPConsoles;
drop procedure spGetPSPGames;
drop procedure spGetDSAccessories;
drop procedure spGetDSConsoles;
drop procedure spGetDSGames;
drop procedure spGetGenres;
drop procedure spGetGenresForProduct;
drop procedure spGetRatings;
drop procedure spGetRatingsForProduct
drop procedure spLogin;
drop procedure spGetID;
drop procedure spEmailExists;
drop procedure spSignUp
drop procedure spGetUserInfo
drop procedure spGetUserCountry
drop procedure spGetCountries
drop procedure spGetReviews
drop procedure spDeleteReview
drop procedure spUpdateUser
drop procedure spGetWishList
drop procedure spRemoveWishList
drop procedure spCountWishList
drop procedure spInsertWishList
drop procedure spGetProductInfo
drop procedure spGetProductReviews
drop procedure spSubmitReview
drop procedure spGetGameRating
drop procedure spGetGameGenre
GO
--
create procedure spSearch
@name NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct WHERE NAME LIKE @name AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetXboxAll
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (1 , 2, 3) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetXboxAccessories
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (3) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetXboxConsoles
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (2) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetXboxGames
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (1) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetPS3All
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (4, 5, 6) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetPS3Accessories
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (6) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetPS3Consoles
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (5) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetPS3Games
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (4) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetWiiAll
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (7, 8, 9) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetWiiAccessories
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (9) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetWiiConsoles
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (8) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetWiiGames
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (7) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetHandheldAll
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (10, 11, 12, 13, 14, 15) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetPSPAccessories
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (12) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetPSPConsoles
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (11) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetPSPGames
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (10) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetDSAccessories
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (15) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetDSConsoles
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (14) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetDSGames
@searchterm NVARCHAR(100),
@minprice INT,
@maxprice INT
as
BEGIN
select [ProductID], [Name], [QuickDescription], [Release_Date], [UnitPrice], [Image] from tblProduct where CategoryID IN (13) AND NAME LIKE @searchterm AND UnitPrice BETWEEN @minprice AND @maxPrice;
END
GO
CREATE PROCEDURE spGetGenres
AS
BEGIN
SELECT GenreID, GenreName FROM tblGenre ORDER BY GenreID;
END
GO
CREATE PROCEDURE spGetGenresForProduct
@searchterm NVARCHAR(100)
AS
BEGIN
SELECT GenreID from tblGameGenre WHERE ProductID = @searchterm;
END
GO
CREATE PROCEDURE spGetRatings
AS
BEGIN
SELECT RatingID, RatingName from tblRating ORDER BY RatingID;
END
GO
CREATE PROCEDURE spGetRatingsForProduct
@searchterm NVARCHAR(100)
AS
BEGIN
SELECT RatingID from tblGameRating WHERE ProductID = @searchterm;
END
GO
CREATE PROCEDURE spLogin
@email NVARCHAR(100),
@password NVARCHAR(100)
AS
BEGIN
SELECT Count(*) from tblCustomer where [Email]=@email AND [Password]=@password;
END
GO
CREATE PROCEDURE spGetID
@email NVARCHAR(100)
AS
BEGIN
SELECT CustomerID from tblCustomer where Email=@email;
END
GO
CREATE PROCEDURE spEmailExists
@email NVARCHAR(100)
AS
BEGIN
select Count(*) from tblCustomer where Email=@email;
END
GO
CREATE PROCEDURE spSignUp
@title NVARCHAR(10),
@fname NVARCHAR(100),
@sname NVARCHAR(100),
@email NVARCHAR(100),
@phone NVARCHAR(100),
@mobile NVARCHAR(100),
@dob NVARCHAR(100),
@country NVARCHAR(100),
@password NVARCHAR(100)
AS
BEGIN
SET DATEFORMAT dmy;
INSERT INTO tblCustomer VALUES (@title, @fname, @sname, @email, @phone, @mobile, @dob, @country, @password, 1);
END
GO
CREATE PROCEDURE spGetUserInfo
@ID NVARCHAR(50)
AS
BEGIN
select Title, FirstName, Surname, Email, Phone, Mobile, DateOfBirth, CountryID from tblCustomer where CustomerID = @ID;
END
GO
CREATE PROCEDURE spGetUserCountry
@CountryID NVARCHAR(50)
AS
BEGIN
select Country_Name from tblCountry where CountryID=@CountryID;
END
GO
CREATE PROCEDURE spGetCountries
AS
BEGIN
select CountryID, Country_Name from tblCountry;
END
GO
CREATE PROCEDURE spGetReviews
@ID NVARCHAR(50)
AS
BEGIN
select P.Name AS Name, R.Rating AS Rating, R.Review AS Review, R.ReviewID AS ReviewID from tblCustomer C, tblReview R, tblProduct P where C.CustomerID=@ID AND R.CustomerID = C.CustomerID AND R.ProductID = P.ProductID;
END
GO
CREATE PROCEDURE spDeleteReview
@ID NVARCHAR(50)
AS
BEGIN
DELETE from tblReview WHERE ReviewID = @ID;
END
GO
CREATE PROCEDURE spUpdateUser
@ID NVARCHAR(50),
@title NVARCHAR(10),
@fname NVARCHAR(100),
@sname NVARCHAR(100),
@email NVARCHAR(100),
@phone NVARCHAR(100),
@mobile NVARCHAR(100),
@dob NVARCHAR(100),
@country NVARCHAR(100)
AS
BEGIN
UPDATE tblCustomer SET Title = @title, FirstName = @fname, Surname = @sname, Email = @email, Phone = @phone, Mobile = @mobile, DateOfBirth = @dob, CountryID = @country WHERE CustomerID = @ID;
END
GO
CREATE PROCEDURE spGetWishList
@ID NVARCHAR(50)
AS
BEGIN
SELECT P.Name AS Name, P.ProductID AS ProductID, W.WishlistID AS WishlistID FROM tblProduct P, tblWishlist W where W.CustomerID = @ID AND P.ProductID = W.ProductID;
END
GO
CREATE PROCEDURE spRemoveWishList
@ID NVARCHAR(50)
AS
BEGIN
DELETE from tblWishlist WHERE WishlistID = @ID;
END
GO
CREATE PROCEDURE spCountWishList
@ProductID NVARCHAR(50),
@UserID NVARCHAR(50)
AS
BEGIN
select count(*) from tblWishlist where ProductID = @ProductID AND CustomerID = @UserID ;
END
GO
CREATE PROCEDURE spInsertWishList
@ProductID NVARCHAR(50),
@UserID NVARCHAR(50)
AS
BEGIN
INSERT INTO tblWishlist VALUES (@UserID, @ProductID);
END
GO
CREATE PROCEDURE spGetProductInfo
@ProductID NVARCHAR(50)
AS
BEGIN
select ProductID, Name, UnitPrice, Release_Date, Description, Quantity, Image from tblProduct where ProductID=@ProductID;
END
GO
CREATE PROCEDURE spGetProductReviews
@ProductID NVARCHAR(50)
AS
BEGIN
select Rating, Review from tblReview where ProductID =@ProductID;
END
GO
CREATE PROCEDURE spSubmitReview
@ProductID NVARCHAR(50),
@UserID NVARCHAR(50),
@Rating NVARCHAR(50),
@Review NVARCHAR(500)
AS
BEGIN
INSERT INTO tblReview VALUES (@ProductID, @UserID, @Rating, @Review);
END
GO
CREATE PROCEDURE spGetGameRating
@ProductID NVARCHAR(50)
AS
BEGIN
SELECT R.Image FROM tblRating R, tblGameRating G where R.RatingID = G.RatingID AND G.ProductID =@ProductID;
END
GO
CREATE PROCEDURE spGetGameGenre
@ProductID NVARCHAR(50)
AS
BEGIN
select G.GenreName AS GenreName from tblGameGenre X, tblGenre G where X.ProductID=@ProductID AND X.GenreID = G.GenreID;
END
GO
















