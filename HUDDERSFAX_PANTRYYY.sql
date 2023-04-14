DROP TABLE USEER cascade constraints;
DROP TABLE SHOP cascade constraints;
DROP TABLE PRODUCT cascade constraints;
DROP TABLE PRODUCT_CATEGORY cascade constraints;
DROP TABLE REVIEW cascade constraints;
DROP TABLE WISHLIST cascade constraints;
DROP TABLE WISHLIST_ITEM cascade constraints;
DROP TABLE CART cascade constraints;
DROP TABLE CART_ITEM cascade constraints;
DROP TABLE OFFER cascade constraints;
DROP TABLE COLLECTION_SLOT cascade constraints;
DROP TABLE ORDERR cascade constraints;
DROP TABLE PAYMENT cascade constraints;
DROP TABLE REPORTT cascade constraints;
DROP TABLE ORDER_REPORT cascade constraints;
DROP TABLE PRODUCT_REPORT cascade constraints;
DROP TABLE PAYMENT_REPORT cascade constraints;
CREATE TABLE USEER(
	User_ID	INTEGER NOT NULL PRIMARY KEY,
	User_Full_Name	VARCHAR(225) NOT NULL,
	User_Address	VARCHAR(50) NOT NULL,
	User_Email	VARCHAR(50) NOT NULL,
	User_Phone_Number	INTEGER NOT NULL,
	User_Password	VARCHAR(8) NOT NULL,
	User_Role	VARCHAR(8) NOT NULL,
	DOB	DATE NOT NULL,
	Gender	VARCHAR(8) NOT NULL,
    VERIFYS VARCHAR(255) NOT NULL
  
);
CREATE TABLE SHOP(
	Shop_Number	INTEGER NOT NULL PRIMARY KEY,
	Shop_Name	VARCHAR(25) NOT NULL,
	Shop_Description	VARCHAR(255),
    User_ID INTEGER NOT NULL REFERENCES USEER(User_ID)
);
CREATE TABLE PRODUCT(
	Product_ID	INTEGER NOT NULL PRIMARY KEY,
	Product_Name	VARCHAR(25) NOT NULL,
	Product_Description	VARCHAR(255),
	Price	VARCHAR(15),
	Quantity_Per_Item	INTEGER,
	Stock_Available	INTEGER,
	Minimun_Order	INTEGER,
	Maximum_Order	INTEGER,
	Product_Image	VARCHAR(25),
	Allergy_Information	VARCHAR(255),
	Discount_Type	VARCHAR(8),
    Shop_Number INTEGER NOT NULL REFERENCES SHOP(Shop_Number)
);
CREATE TABLE PRODUCT_CATEGORY(
  Category_ID	INTEGER NOT NULL PRIMARY KEY,
  Category_Type	VARCHAR(25),
    Product_ID INTEGER NOT NULL REFERENCES PRODUCT(Product_ID)
    );
CREATE TABLE REVIEW(
	Review_ID	INTEGER NOT NULL PRIMARY KEY,
	Rating	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "REVIEW".
	-- This indicates which attribute(s) uniquely identify each row of data.
    Product_ID INTEGER NOT NULL REFERENCES PRODUCT(Product_ID),
    User_ID INTEGER NOT NULL REFERENCES USEER(User_ID)
);
CREATE TABLE WISHLIST(
	Wishlist_ID	INTEGER NOT NULL PRIMARY KEY,
	Number_Of_Product	INTEGER,
    User_ID INTEGER NOT NULL REFERENCES USEER(User_ID)
);
CREATE TABLE WISHLIST_ITEM (
    Wishlist_Item_ID INTEGER NOT NULL PRIMARY KEY,
    Wishlist_ID INTEGER NOT NULL REFERENCES WISHLIST(Wishlist_ID),
    Product_ID INTEGER NOT NULL REFERENCES PRODUCT(Product_ID),
    Quantity INTEGER,
    CONSTRAINT fk_WISHLIST_ITEM_WISHLIST FOREIGN KEY (Wishlist_ID) REFERENCES WISHLIST(Wishlist_ID),
    CONSTRAINT fk_WISHLIST_ITEM_PRODUCT FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID)
);
CREATE TABLE CART(
	Cart_ID	INTEGER NOT NULL PRIMARY KEY,
	Amount	VARCHAR(15) NOT NULL,
	Number_Of_Products	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "CART".
	-- This indicates which attribute(s) uniquely identify each row of data.
    User_ID INTEGER NOT NULL REFERENCES USEER(User_ID)
);
CREATE TABLE CART_ITEM (
    Cart_ID INTEGER NOT NULL REFERENCES CART(Cart_ID),
    Product_ID INTEGER NOT NULL REFERENCES PRODUCT(Product_ID),
    Quantity INTEGER,
   PRIMARY KEY(Cart_ID,Product_ID)
);
CREATE TABLE OFFER(
	Offer_ID	INTEGER NOT NULL PRIMARY KEY,
	Offer_End_Date	DATE,
	Offer_Description	VARCHAR(255),
    User_ID INTEGER NOT NULL REFERENCES USEER(User_ID),
    Product_ID INTEGER NOT NULL REFERENCES PRODUCT(Product_ID)	
);
CREATE TABLE COLLECTION_SLOT(
	Collection_ID	INTEGER NOT NULL PRIMARY KEY,
	Collection_Day	VARCHAR(15),
	Collection_Time	TIMESTAMP(0),
	Collection_Date	DATE,
    User_ID INTEGER NOT NULL REFERENCES USEER(User_ID)
    );

CREATE TABLE ORDERR(
	Order_Number INTEGER NOT NULL PRIMARY KEY,
	Order_Status VARCHAR(15),
	Order_Date DATE,
	Number_Of_Products INTEGER,
	Total_Amount FLOAT(15),
	Quantity_Per_Product INTEGER,
    Product_ID INTEGER NOT NULL REFERENCES PRODUCT(Product_ID),
    Collection_ID  INTEGER NOT NULL REFERENCES COLLECTION_SLOT(Collection_ID),
    User_ID INTEGER NOT NULL REFERENCES USEER(User_ID),
    Cart_ID INTEGER NOT NULL REFERENCES CART(Cart_ID)
);
CREATE TABLE PAYMENT(
	Payment_Number	INTEGER NOT NULL PRIMARY KEY, 
	Payment_Amount	FLOAT(15),
	Payment_Date	DATE,
	Payment_Time	TIMESTAMP(0),
    User_ID INTEGER NOT NULL REFERENCES USEER(User_ID),
    Order_Number INTEGER NOT NULL REFERENCES ORDERR(Order_Number),
    Product_ID INTEGER NOT NULL REFERENCES PRODUCT(Product_ID)
);
CREATE TABLE REPORTT(
	Report_ID	INTEGER NOT NULL PRIMARY KEY,
	Report_Description	VARCHAR(155),
	Report_Type	VARCHAR(25),
    User_ID INTEGER NOT NULL REFERENCES USEER(User_ID),
    Order_Number INTEGER NOT NULL REFERENCES ORDERR(Order_Number)
);
CREATE TABLE ORDER_REPORT (
    Report_ID INTEGER NOT NULL REFERENCES REPORTT(Report_ID),
    Order_Number INTEGER NOT NULL REFERENCES ORDERR(Order_Number),
    PRIMARY KEY(REPORT_ID,Order_Number)
    
);
CREATE TABLE PRODUCT_REPORT (
    Report_ID INTEGER NOT NULL REFERENCES REPORTT(Report_ID),
    Product_ID INTEGER NOT NULL REFERENCES PRODUCT(Product_ID),
    PRIMARY KEY(REPORT_ID,Product_ID)
);
CREATE TABLE PAYMENT_REPORT (
    Payment_Number INTEGER NOT NULL REFERENCES PAYMENT(Payment_Number),
    Report_ID INTEGER NOT NULL REFERENCES REPORTT(Report_ID),
    PRIMARY KEY (Payment_Number, Report_ID)
);

----------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------SEQUNCE FOR ALL PRIMARY KEYS--------------------------------------------------------------------------------------------------------------------------------
DROP SEQUENCE User_ID_seq;
DROP SEQUENCE Shop_Number_seq;
DROP SEQUENCE Product_ID_seq;
DROP SEQUENCE Category_ID_seq;
DROP SEQUENCE Review_ID_seq;
DROP SEQUENCE Wishlist_ID_seq;
DROP SEQUENCE Cart_ID_seq;
DROP SEQUENCE Offer_ID_seq;
DROP SEQUENCE Collection_ID_seq;
DROP SEQUENCE Order_Number_seq;
DROP SEQUENCE Payment_Number_seq;
DROP SEQUENCE Report_ID_seq;

CREATE SEQUENCE User_ID_seq
  MINVALUE 100
  MAXVALUE 99999999999
  START WITH 100
  INCREMENT BY 10;
  
  CREATE SEQUENCE Shop_Number_seq
  MINVALUE 200
  MAXVALUE 99999999999
  START WITH 200
  INCREMENT BY 10;
  
  CREATE SEQUENCE Product_ID_seq
  MINVALUE 300
  MAXVALUE 99999999999
  START WITH 300
  INCREMENT BY 10;
  
  CREATE SEQUENCE Category_ID_seq
  MINVALUE 400
  MAXVALUE 99999999999
  START WITH 400
  INCREMENT BY 10;
  
  CREATE SEQUENCE Review_ID_seq
  MINVALUE 500
  MAXVALUE 99999999999
  START WITH 500
  INCREMENT BY 10;
  
  CREATE SEQUENCE Wishlist_ID_seq
  MINVALUE 600
  MAXVALUE 99999999999
  START WITH 600
  INCREMENT BY 10;
  
  CREATE SEQUENCE Cart_ID_seq
  MINVALUE 700
  MAXVALUE 99999999999
  START WITH 700
  INCREMENT BY 10;
  
  CREATE SEQUENCE Offer_ID_seq
  MINVALUE 800
  MAXVALUE 99999999999
  START WITH 800
  INCREMENT BY 10;
  
  CREATE SEQUENCE Collection_ID_seq
  MINVALUE 900
  MAXVALUE 99999999999
  START WITH 900
  INCREMENT BY 10;
  
  CREATE SEQUENCE Order_Number_seq
  MINVALUE 1000
  MAXVALUE 99999999999
  START WITH 1000
  INCREMENT BY 10;
  
  CREATE SEQUENCE Payment_Number_seq
  MINVALUE 1100
  MAXVALUE 99999999999
  START WITH 1100
  INCREMENT BY 10;
  
  CREATE SEQUENCE Report_ID_seq
  MINVALUE 1200
  MAXVALUE 99999999999
  START WITH 1200
  INCREMENT BY 10;
  
 