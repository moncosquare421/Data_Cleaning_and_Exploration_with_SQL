
-- From the data collected, my line manager wanted to know the following

-- Total numbers of stores in this region collected (mapped)
-- Total numbers of stores in Oredo and Ikpoba Okha (mapped)
-- Total numbers of stores per segments across Oredo ana Ikpoba Okha LGA
-- This project focuses majorly on cleaning and exploring data collected (Mapped) in Oredo and Ikpoba Okha part of benin city, by the 2nd week of November my line manager wanted to know the extent of the mapping.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------- -------------------  PREPARING THE DATA FOR EXPLORATION -----------------------------------------------------------------------------------------

-- STANDARDIZING THE DATE

ALTER TABLE benin.benin
CHANGE date date_fixed date

-- REMOVING SCORE COLUMN

ALTER TABLE benin.benin
DROP COLUMN Score

-- ADJUSTING COLUMNS NAMES TO HAVE A SHORTER AND CONSISTENT NAME

ALTER TABLE benin.benin
CHANGE Email_Address email varchar(255),
CHANGE Mappers_full_name mapper_name varchar(255),
CHANGE Mapping_Region region varchar(255),
CHANGE Local_Governtment_area lga varchar(255),
CHANGE Segment segment varchar(255),
CHANGE Outlet_Name outlet_name varchar(255),
CHANGE Outlet_Phone_Number contacts varchar(255),
CHANGE Outlet_Owner_Name owners_name varchar(255),
CHANGE Outlet_classification classification varchar(255),
CHANGE Outlet_Channel channel varchar(255),
CHANGE Outlet_type outlet_type varchar(255),
CHANGE Category category varchar(255),
CHANGE Outlet_Address address varchar(255),
CHANGE Outlet_Landmark landmark varchar(255),
CHANGE Outlet_GPS_Coordinates cordinates varchar(255),
CHANGE Hanger hanger varchar(255)

-- CHANGING THE CONTENTS OF COLUMNS TO UPPERCASE FOR CONSISTENCY

SELECT UPPER(segment) AS segment,
UPPER(outlet_name) AS outlet_name,
UPPER(owners_name) AS owners_name,
UPPER(landmark) AS landmark,
UPPER(address) AS address
FROM benin.benin


ALTER TABLE benin.benin
ADD segment_1 varchar(255)

UPDATE benin.benin
SET segment_1 = UPPER(segment)


ALTER TABLE benin.benin
ADD outlet_name_ varchar(255)

UPDATE benin.benin
SET outlet_name_ = UPPER(outlet_name)


ALTER TABLE benin.benin
ADD owners_name_1 varchar(255)

UPDATE benin.benin
SET owners_name_1 = UPPER(owners_name)


ALTER TABLE benin.benin
ADD land_mark varchar(255)

UPDATE benin.benin
SET land_mark = UPPER(landmark)


ALTER TABLE benin.benin
ADD address_1 varchar(255)

UPDATE benin.benin
SET address_1= UPPER(address)

-- REMOVING THE COLUMNS THAT WERE CONVERTED TO UPPER CASES

ALTER TABLE benin.benin
DROP COLUMN owners_name, 
DROP COLUMN outlet_name, 
DROP COLUMN segment,  
DROP COLUMN address, 
DROP COLUMN landmark

-- CATEGORY COLUMN IS NOT PROPERLY TRIMMED

SELECT TRIM(category)
FROM benin.benin;

ALTER TABLE benin.benin
ADD category_1 varchar(255)

UPDATE benin.benin
SET category_1= TRIM(category)

-- TO REMOVE THE OLD CATEGORY COLUMN

ALTER TABLE benin.benin
DROP COLUMN category

-- Total numbers of stores in this region collected (mapped)

SELECT count(outlet_name_)
FROM benin.benin

-- Total numbers of stores in Oredo and Ikpoba Okha (mapped)

SELECT lga, count(lga)
FROM benin.benin
GROUP BY lga

-- Total numbers of stores per segment across Oredo ana Ikpoba Okha LGA

SELECT lga, segment_1, count(segment_1)
FROM benin.benin
GROUP BY segment_1
ORDER BY lga


SELECT *
FROM benin.benin
