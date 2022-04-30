use studentdb;
select * from studentInfo order by student_id;
-- select * from studentInfo_readData order by student_id;
-- select * from studentDB.studentInfo_readData ;
-- delete from studentDB.studentInfo_readData ;
-- select * from studentInfo_readData;
delete from studentinfo;
select * from studentInfo;

-- How to insert data to a table?
desc studentInfo;
insert studentDB.studentInfo (student_id,first_name,last_name,student_dob,middle_name) 
						value(101,'John','Smith',ADDDATE('2022-01-01', INTERVAL -30 YEAR),'M');

insert studentDB.studentInfo (student_id,first_name,last_name,student_dob) 
						value(103,'Shawn','Smith',ADDDATE('2022-01-01', INTERVAL -30 YEAR));


insert studentDB.studentInfo (student_id,first_name,last_name,student_dob) value(11001,'Kyla','Rhoads', ADDDATE('2022-01-01', INTERVAL -30 YEAR));
insert studentDB.studentInfo (student_id,first_name,last_name,student_dob) value(1002,'Maria','Josselyn',ADDDATE('2021-01-01', INTERVAL -31 YEAR));
insert studentDB.studentInfo (student_id,first_name,last_name,foreign_student,student_dob) value(1003,'Mauricio','Ayala','foreign',ADDDATE('2022-01-01', INTERVAL -30 YEAR));

insert studentDB.studentInfo (student_id,first_name,last_name,foreign_student,student_dob) value(2022,'Pavan','Patel','YES',ADDDATE('2022-01-01', INTERVAL -25 YEAR));
insert studentDB.studentInfo (student_id,first_name,last_name,student_dob) value(2002,'Robert','Sorto',ADDDATE('2022-01-01', INTERVAL -22 YEAR));
insert studentDB.studentInfo (student_id,first_name,last_name,foreign_student,student_dob) value(2001,'John','Soloman','foreign',ADDDATE('2022-01-01', INTERVAL -30 YEAR));


insert studentDB.studentInfo (student_id,first_name,last_name,student_dob) value(5006,'Kyla','Rhoads', ADDDATE('2022-01-01', INTERVAL -30 YEAR));
insert studentDB.studentInfo (student_id,first_name,last_name,student_dob) value(5007,'Maria','Josselyn',ADDDATE('2021-01-01', INTERVAL -31 YEAR));
insert studentDB.studentInfo (student_id,first_name,last_name,foreign_student,student_dob) value(5008,'Pavan','Patel','YES',ADDDATE('2022-01-01', INTERVAL -25 YEAR));
insert studentDB.studentInfo (student_id,first_name,last_name,student_dob) value(5009,'Robert','Sorto',ADDDATE('2022-01-01', INTERVAL -22 YEAR));
insert studentDB.studentInfo (student_id,first_name,last_name,foreign_student,student_dob) value(2014,'Mauricio','Ayala','foreign',ADDDATE('2022-01-01', INTERVAL -30 YEAR));


select * from studentInfo where student_id = 1003;
update studentDB.studentInfo set foreign_student = 'YEs' where student_id = 5006;
insert studentDB.studentInfo (student_id,first_name,last_name,student_dob) value(11011,'Kyla','Rhoads', ADDDATE('2022-01-01', INTERVAL -30 YEAR));


desc studentInfo;
-- How to drop a table?
DROP TABLE IF  EXISTS temp_studentInfo;

select * from studentInfo;
-- How to create a table out of another table select statement?
CREATE TABLE temp_studentInfo AS SELECT student_id,first_name,last_name,student_dob FROM studentInfo;
select * from temp_studentInfo;


-- how to retrieve data from a table?
select * from temp_studentInfo;
select * from temp_studentInfo;
select * from studentInfo;

-- How to update or modiy data in a table 
select id,student_id,student_dob from studentDB.studentInfo where foreign_student = 'Yes';
select * from studentDB.studentInfo where foreign_student = 'Yes';

select * from studentDB.studentInfo where last_name like 's%'; -- I want to fetch all rows which has last name start wiith s
select * from studentDB.studentInfo where last_name like 's%' and first_name like 'j%'; -- I want all rows last name start with s and first name start with j
select * from studentDB.studentInfo where student_id = 2014;
select * from studentDB.studentInfo;
select * from studentDB.studentInfo where last_name like '%a'; -- I want to fetch all rows which has last name ends wiith a

update studentDB.studentInfo set foreign_student = 'domestic' where foreign_student = 'NO';

update studentDB.studentInfo set foreign_student = 'foreign' where foreign_student = 'YES';

select count(*) from sakila.customer ;
select * from sakila.customer ;
select * from sakila.customer where first_name like 'Pat%';

SET SQL_SAFE_UPDATES = 0; -- SAFE MODE 0 is OFF and SAFE MODE 1 is ON 
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  
-- To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec
select * from studentdb.studentINfo where last_name = 'Soloman';
update studentDB.studentInfo set first_name = 'Jeena' where student_id = 2012;

desc studentInfo;

select * from studentinfo where last_name = 'Soloman';

delete from studentInfo where student_id in (2002);
select * from studentInfo where student_id in (2001,2002,5006);
update studentDB.studentInfo set foreign_student = 'YE' where student_id in (2001,2002);
update studentDB.studentInfo set foreign_student = 'YES' where foreign_student = 'YESSS';
update studentDB.studentInfo set foreign_student = 'NO' where foreign_student = 'NOO';
select * from studentInfo; 

select * from country_list where EXISTS (select * from country_list );

-- how to drop a table if the table exists?
drop table  IF  EXISTS `student_country` ;
SELECT count(*) FROM sakila.country;
SELECT * FROM sakila.country limit 5;
CREATE TABLE student_country AS SELECT country_id, country, last_update FROM sakila.country;
SELECT country,last_update FROM sakila.country;
select * from student_country;




-- How to add a column to a table?
-- ALTER TABLE student_country drop column country_code;
ALTER TABLE student_country ADD COLUMN  country_code char(3) ;

-- How to update a table from another table by joining using inner join 
update student_country sc inner join country_list cl on cl.name = sc.country  set sc.country_code =  cl.iso3 ;
select * from student_country;
select cl.name from country_list cl;
-- How to check the values are existing in the table column
select * from country_list where name like '%us%';
select * from student_country where country_code is null;




update studentinfo set country_code = 'US' where student_id in (1001,1002,1003);

-- list 
-- SELECT * FROM country_list where iso like 'us%';