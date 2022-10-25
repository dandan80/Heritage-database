---Minimum one range or check constraint --
alter table Heritage_T add constraint chk_heritage_ref 
check(Heritage_Ref between 1 and 100000);

 ---ADD DATA TO TABLE Heritage_Category_T---
 INSERT INTO Heritage_Category_T(Category_ID, Category)VALUES
 ('CS','Cultural Site');
  INSERT INTO Heritage_Category_T(Category_ID, Category)VALUES
 ('NS','Natural Site');
 INSERT INTO Heritage_Category_T(Category_ID, Category)VALUES
 ('MS','Mixed Site');
  INSERT INTO Heritage_Category_T(Category_ID, Category)VALUES
 ('DCS','Danger Cultural Site');
  INSERT INTO Heritage_Category_T(Category_ID, Category)VALUES
 ('DNS','Danger Natural Site');
  INSERT INTO Heritage_Category_T(Category_ID, Category)VALUES
 ('DMS','Danger Mixed Site');
 SELECT * FROM Heritage_Category_T;
 
 ----ADD DATA TO TABLE Continent_T---
 INSERT INTO Continent_T(Continent_ID, Continent_Name)VALUES
 ('AF','Africa');
  INSERT INTO Continent_T(Continent_ID, Continent_Name)VALUES
 ('AP','Asia and the Pacific');
  INSERT INTO Continent_T(Continent_ID, Continent_Name)VALUES
 ('ENA','Europe and North America');
  INSERT INTO Continent_T(Continent_ID, Continent_Name)VALUES
 ('LAC','Latin America and the Caribbean');
 INSERT INTO Continent_T(Continent_ID, Continent_Name)VALUES
 ('PR','Polar Region');
 select * from Continent_T;
 
 ---ADD DATA TO TABLE Themes_T---
 INSERT INTO Themes_T(Themes_ID, Themes_Category)VALUES
 ('CIT','Cities');
 INSERT INTO Themes_T(Themes_ID, Themes_Category)VALUES
 ('CUL','Cultural Landscape');
 INSERT INTO Themes_T(Themes_ID, Themes_Category)VALUES
 ('FOR','Forest');
 INSERT INTO Themes_T(Themes_ID, Themes_Category)VALUES
 ('MAR','Marine & Coastal');
 INSERT INTO Themes_T(Themes_ID, Themes_Category)VALUES
 ('EAR','Earthen Architecture');
 select * from Themes_T

 ---ADD DATA TO TABLE Country_T---
 INSERT INTO Country_T(Region_ContinentID,Country_ID, Country)VALUES
 ('ENA','CAN','Canada');
  INSERT INTO Country_T(Region_ContinentID,Country_ID, Country)VALUES
 ('AP','PHS','Philippines');
   INSERT INTO Country_T(Region_ContinentID,Country_ID, Country)VALUES
 ('AP','CHA','China');
  INSERT INTO Country_T(Region_ContinentID,Country_ID, Country)VALUES
 ('LAC','BRL','Brazil'); 
  INSERT INTO Country_T(Region_ContinentID,Country_ID, Country)VALUES
 ('AF','EPT','Egypt'); 
 select * from Country_T;

---ADD DATA TO TABLE Heritage_T---
INSERT INTO Heritage_T(Heritage_Ref, Heritage_Name,CountryID, 
					   Property, ThemesID, CategoryID)VALUES
(300, 'Historic District of Old Québec','CAN',135,'CIT','CS');
INSERT INTO Heritage_T(Heritage_Ref, Heritage_Name,CountryID, 
					   Property, ThemesID, CategoryID)VALUES
(1497, 'Mistaken Point','CAN',146,'MAR','NS');
INSERT INTO Heritage_T(Heritage_Ref, Heritage_Name,CountryID, 
					   Property, ThemesID, CategoryID)VALUES
(502, 'Historic City of Vigan','PHS',12.75,'CUL','CS');
INSERT INTO Heritage_T(Heritage_Ref, Heritage_Name,CountryID, 
					   Property, ThemesID, CategoryID)VALUES
(653, 'Tubbataha Reefs Natural Park','PHS',96828,'MAR','NS');
INSERT INTO Heritage_T(Heritage_Ref, Heritage_Name,CountryID, 
					   Property, ThemesID, CategoryID)VALUES
(1110, 'Historic Centre of Macao','CHA',16.1678,'CUL','CS');  
 INSERT INTO Heritage_T(Heritage_Ref, Heritage_Name,CountryID, 
					   Property, ThemesID, CategoryID)VALUES
(813, 'Classical Gardens of Suzhou','CHA',11.922,'EAR','CS'); 
 INSERT INTO Heritage_T(Heritage_Ref, Heritage_Name,CountryID, 
					   Property, ThemesID, CategoryID)VALUES
(445, 'Brasilia','BRL',11268.92,'EAR','CS'); 
 INSERT INTO Heritage_T(Heritage_Ref, Heritage_Name,CountryID, 
					   Property, ThemesID, CategoryID)VALUES
(1308, 'Paraty and Ilha Grande - Culture and Biodiversity','BRL',173164.18,'CUL','MS'); 
 INSERT INTO Heritage_T(Heritage_Ref, Heritage_Name,CountryID, 
					   Property, ThemesID, CategoryID)VALUES
(90, 'Abu Mena','EPT',182.72,'EAR','DCS'); 

select * from Heritage_T;

---select & where statements test---
select Heritage_name, CountryID, ThemesID, CategoryID from Heritage_T 
where CountryID= 'CAN';

select * from Country_T where Region_ContinentID ='AP';

select Category_ID, Category from Heritage_Category_T where category_id LIKE '%CS';

--- left outer joins: to list the heritage_category that not be used to identify any heritage---
select Heritage_Category_T.Category from Heritage_Category_T left join Heritage_T
ON(Heritage_Category_T.Category_ID = Heritage_T.CategoryID) where Heritage_T.CategoryID
is NULL;

--- right outer joins: to list the themes that not be used to identify any heritage---
select Themes_T.Themes_Category from Heritage_T right join Themes_T ON
(Heritage_T.ThemesID = Themes_T.Themes_ID) where Heritage_T.ThemesID is NULL;

--- Subqueries: to list the heritages property  greater than average property ---
select Heritage_Ref, Heritage_name, property from Heritage_T 
where property > (select AVG(Property) from Heritage_T );

--- Union Query ----
select Region_ContinentID from Country_T union select Continent_ID from Continent_T;


--Metadata created---
select column_name,data_type,character_maximum_length from INFORMATION_SCHEMA.COLUMNS WHERE
TABLE_NAME = 'heritage_category_t' OR
TABLE_NAME = 'continent_t' OR
TABLE_NAME = 'country_t' OR
TABLE_NAME = 'themes_t' OR
TABLE_NAME = 'heritage_t';


