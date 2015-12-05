SET SESSION FOREIGN_KEY_CHECKS=0;
/*Drop User*/
DROP USER IF EXISTS Reciplan;

/*Create Table*/
CREATE USER Reciplan IDENTIFIED BY 'reciplan';

/* Drop Databases*/
DROP DATABASE IF EXISTS Users;
DROP DATABASE IF EXISTS Users_Geo;
DROP DATABASE IF EXISTS Neighbor;
DROP DATABASE IF EXISTS Foodstuff;
DROP DATABASE IF EXISTS Menu;
DROP DATABASE IF EXISTS User_Price_Log;

/* Create Databases*/
CREATE DATABASE Users;
CREATE DATABASE Neighbor;
CREATE DATABASE Foodstuff;
CREATE DATABASE Menu;
CREATE DATABASE User_Price_Log;
CREATE DATABASE Users_Geo;
GRANT CREATE ON Users_Geo.* TO Reciplan;

/* Drop Tables */ 
USE Foodstuff;

DROP TABLE IF EXISTS Big_Category_List;
DROP TABLE IF EXISTS Foodstuff_List;
DROP TABLE IF EXISTS Middle_Category_List;

USE Neighbor;

DROP TABLE IF EXISTS City_ID;
DROP TABLE IF EXISTS Neighbors;

Use Users_Geo;
DROP TABLE IF EXISTS User_Geo;

Use Menu;
DROP TABLE IF EXISTS Ganere_List;
DROP TABLE IF EXISTS Menu_List;
DROP TABLE IF EXISTS Method_List;


USE Users;
DROP TABLE IF EXISTS Users;




/* Food stuff Tables 1.0
USE Foodstuf;

CREATE TABLE Big_Category_List
(
	Big_Category_ID char(1) NOT NULL,
	BIg_Category_Name varchar(10) NOT NULL,
	PRIMARY KEY (Big_Category_ID),
	UNIQUE (Big_Category_ID)
);

CREATE TABLE Foodstuf_List
(
	Foodstuf_ID  char(9) NOT NULL,
	Foodstuf_Name  varchar(20) NOT NULL,
	PRIMARY KEY (Foodstuf_ID ),
	UNIQUE (Foodstuf_ID )
);


CREATE TABLE Middle_Category_List
(
	Middle_Method_ID char(2) NOT NULL,
	Middle_Method_Name varchar(10) NOT NULL,
	PRIMARY KEY (Middle_Method_ID),
	UNIQUE (Middle_Method_ID)
);
*/
/* Food stuff Tables */
USE Foodstuff;

CREATE TABLE Big_Category_List
(
	Big_Category_ID char(1) NOT NULL,
	Big_Category_Name varchar(10) NOT NULL,
	PRIMARY KEY (Big_Category_ID),
	UNIQUE (Big_Category_ID)
);

CREATE TABLE Foodstuff_List
(
	Foodstuff_ID  char(9) NOT NULL,
	Foodstuff_Name  varchar(20) NOT NULL,
	PRIMARY KEY (Foodstuff_ID ),
	UNIQUE (Foodstuff_ID )
);


CREATE TABLE Middle_Category_List
(
	Middle_Category_ID char(2) NOT NULL,
	Middle_Category_Name varchar(10) NOT NULL,
	PRIMARY KEY (Middle_Category_ID),
	UNIQUE (Middle_Category_ID)
);


/* Menu Database 1.0
USE Menu;

CREATE TABLE Ganre_List
(
	Ganre_ID char(1) NOT NULL,
	Ganre_Name varchar(15) NOT NULL,
	PRIMARY KEY (Ganre_ID),
	UNIQUE (Ganre_ID)
);


CREATE TABLE Menu_List
(
	Menu_ID char(12) NOT NULL,
	Menu_Name text NOT NULL,
	PRIMARY KEY (Menu_ID),
	UNIQUE (Menu_ID)
);


CREATE TABLE Method_List
(
	Method_ID char(1) NOT NULL,
	Method_Name varchar(5) NOT NULL,
	PRIMARY KEY (Method_ID),
	UNIQUE (Method_ID)
);
*/

/* Menu Database*/
USE Menu;

CREATE TABLE Ganre_List
(
	Ganre_ID char(1) NOT NULL,
	Ganre_Name varchar(15) NOT NULL,
	PRIMARY KEY (Ganre_ID),
	UNIQUE (Ganre_ID)
);


CREATE TABLE Menu_List
(
	Menu_ID char(12) NOT NULL,
	Menu_Name text NOT NULL,
	PRIMARY KEY (Menu_ID),
	UNIQUE (Menu_ID)
);


CREATE TABLE Method_List
(
	Method_ID char(1) NOT NULL,
	Method_Name varchar(5) NOT NULL,
	PRIMARY KEY (Method_ID),
	UNIQUE (Method_ID)
);





/*   Neighbor */
USE Neighbor;

CREATE TABLE Neighbors
(
	City int NOT NULL,
	Neighbor1  int,
	Neighbor2 int,
	Neighbor3 int,
	Neighbor4 int,
	Neighbor5 int,
	Neighbor6 int,
	Neighbor7 int,
	PRIMARY KEY (City),
	UNIQUE (City)
);



CREATE TABLE City_ID
(
	City_ID int NOT NULL,
	City_Name varchar(30) NOT NULL,
	PRIMARY KEY (City_ID, City_Name),
	UNIQUE (City_ID),
	UNIQUE (City_Name)
);
GRANT INSERT, DELETE ,SELECT ON Neighbor.City_ID TO Reciplan;

/*price Forecast */
USE Users_Geo;
CREATE TABLE User_Geo
(
	User_ID varchar(6) NOT NULL,
	City_ID int NOT NULL,
	Pos_X float NOT NULL,
	Pos_Y float NOT NULL,
	PRIMARY KEY (User_ID),
	UNIQUE (User_ID)
);
GRANT INSERT, DELETE ,SELECT ON Users_Geo.User_Geo TO Reciplan;


CREATE TABLE UXXXXXX
(
	ID char(9) NOT NULL,
	Price float NOT NULL,
	Mount float NOT NULL,
	Day date NOT NULL
);	

/*Users Database*/
USE Users;
CREATE TABLE Users
(
	-- ユーザID
	ID varchar(6) NOT NULL COMMENT 'ユーザID',
	-- パスワード
	Psssword varchar(255) NOT NULL COMMENT 'パスワード',
	-- メールアドレス
	Mail varchar(255) NOT NULL COMMENT 'メールアドレス',
	-- ユーザー名
	Users_Name varchar(100) NOT NULL COMMENT 'ユーザー名',
	-- ユーザ住所
	Address varchar(100)  COMMENT 'ユーザ住所',
	--価格上限
	Max_Pricw int NOT NULL COMMENT '価格上限',
	Reg_Day date NOT NULL,
	PRIMARY KEY (ID),
	UNIQUE (ID),
	UNIQUE (Mail)
);
GRANT INSERT, DELETE ,SELECT ON Users.Users TO Reciplan;




