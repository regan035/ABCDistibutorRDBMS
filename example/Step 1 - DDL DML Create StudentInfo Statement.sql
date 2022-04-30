-- How to Drop a Database?

-- Run the drop command if the studentDB
DROP DATABASE studentDB;

-- How to Create a Database?
create database studentDB;


-- how to select or make a DB active?
use studentDB;
-- use studentDB_new;

-- How to create a database table?
DROP TABLE IF  EXISTS studentInfo;
CREATE TABLE IF NOT EXISTS studentInfo (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  student_id	int8 not null,
  `first_name` varchar(80) not NULL,
  `last_name` varchar(80) not null,
  `middle_name` varchar(80) null,
  country varchar(30) null,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

select * from studentInfo;
-- ------------------------------------------------------------
desc studentinfo;
-- add a new column student_dob after middle_name, also adding a new column international_std
ALTER TABLE studentInfo
    ADD student_dob DATE DEFAULT NULL AFTER middle_name,
    ADD international_std char(10) default 'domestic' FIRST;

-- review the studentinfo table column structure
desc studentinfo; 

-- now we need to drop the country column     
ALTER TABLE studentInfo drop column country ;

-- review the studentinfo table column structure
desc studentinfo; 

-- add column country_code to studentinfo table        
-- ALTER TABLE studentInfo drop column country_code  ;
ALTER TABLE studentInfo add column country_code  varchar(10) default NULL;

-- review the studentinfo table column structure
desc studentinfo; 


-- Modify internaltional_std default value from 'domestic' to "NO'
ALTER TABLE studentInfo MODIFY international_std char(10) default 'NO';    

-- review the studentinfo table column structure
desc studentinfo; 

-- how to rename a column
ALTER TABLE studentInfo
    CHANGE COLUMN international_std foreign_student char(10) default 'NO' AFTER student_dob;


-- review the studentinfo table column structure
desc studentinfo; 
select * from studentinfo;
-- ------------------------------------------------------------

