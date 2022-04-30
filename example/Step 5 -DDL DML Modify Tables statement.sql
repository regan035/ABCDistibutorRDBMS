use studentDB;

SET SQL_SAFE_UPDATES = 0; -- SAFE MODE 0 is OFF and SAFE MODE 1 is ON 
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  
-- To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec


-- alter table if iso3 is present and country_code is not present
ALTER TABLE COUNTRY_LIST 
	CHANGE COLUMN  iso3 country_code char(3) ;
    
desc COUNTRY_LIST;    
select * from country_list where country_code is not null;
update country_list set country_code = iso where country_code is null;


-- how to create table from another table in another database with selected columns (we are not bringing all columns. For all columns you can use *)
-- create student_country if this table is not present. You must run the sakila script before you run the below code.
-- CREATE TABLE student_country AS SELECT country,last_update FROM sakila.country;

desc student_country;
desc country_list;

-- ALTER TABLE student_country
-- 	ADD country_code varchar(10) default NULL FIRST;
    
    -- [FIRST | AFTER column_name];    
Desc studentInfo;
select * from studentInfo
    
    