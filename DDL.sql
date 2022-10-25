DROP TABLE IF EXISTS Heritage_Category_T;
DROP TABLE IF EXISTS Continent_T;
DROP TABLE IF EXISTS Country_T;
DROP TABLE IF EXISTS Themes_T;
DROP TABLE IF EXISTS Heritage_T;

CREATE TABLE Heritage_Category_T (
  Category_ID        CHAR( 3 ),
  Category     VARCHAR( 30 ) NOT NULL,
  CONSTRAINT Heritage_Category_PK PRIMARY KEY( Category_ID )
);

CREATE TABLE Continent_T (
  Continent_ID        CHAR( 3 ),
  Continent_Name    VARCHAR( 35 ) NOT NULL,
  CONSTRAINT Continent_PK PRIMARY KEY( Continent_ID )
);

CREATE TABLE Themes_T(
   Themes_ID    CHAR(3),
   Themes_Category    VARCHAR(30),
   CONSTRAINT Themes_PK PRIMARY KEY(Themes_ID)
);

CREATE TABLE Country_T (
  Region_ContinentID      CHAR( 3 ),
  Country_ID     CHAR( 3 ) NOT NULL,
  Country      VARCHAR(20) NOT NULL,
  CONSTRAINT Country_PK PRIMARY KEY( Country_ID ),
  CONSTRAINT Country_FK FOREIGN KEY(Region_ContinentID) REFERENCES Continent_T(Continent_ID)
);

CREATE TABLE Heritage_T(
  Heritage_Ref     INTEGER,
  Heritage_Name    VARCHAR(50),
  CountryID        CHAR(3),
  Property         FLOAT,
  ThemesID         CHAR (3),
  CategoryID       CHAR(3),
  CONSTRAINT Heritage_PK PRIMARY KEY(Heritage_Name),
  CONSTRAINT Heritage_FK1 FOREIGN KEY(CountryID) REFERENCES Country_T(Country_ID),
  CONSTRAINT Heritage_FK2 FOREIGN KEY(ThemesID) REFERENCES Themes_T(Themes_ID),
  CONSTRAINT Heritage_FK3 FOREIGN KEY(CategoryID) REFERENCES Heritage_Category_T(Category_ID)
	);

--- create dynamic view----
Drop view if exists Heritage_V;
Create view Heritage_V as select Heritage_name, Heritage_Ref, Property
from Heritage_T;
SELECT * FROM Heritage_V;

/*create materialized view*/
Drop materialized view if exists Country_V;
Create materialized view Country_V as select Country_ID, Country from Country_T;
select * from Country_V;


