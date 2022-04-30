-- --------------------------------------------------------------------
-- desc studentInfo_readData;
drop table  IF  EXISTS studentInfo_readData ;
CREATE TABLE studentInfo_readData AS SELECT * FROM studentInfo;
select * from studentInfo_readData;
select * from studentInfo;
desc studentInfo;
-- delete from studentInfo_readData;

ALTER TABLE studentInfo_readData
	ADD DML_Action varchar(30) default NULL FIRST,
    ADD Last_Modified_date datetime default NULL AFTER student_dob;

DROP TRIGGER IF  EXISTS trigger_after_insert_studentInfo;
CREATE TRIGGER trigger_after_insert_studentInfo
AFTER INSERT 
ON studentInfo FOR EACH ROW
Insert into studentDB.studentInfo_readData 
SET DML_Action = 'Insert', 
student_id=new.student_id,first_name=new.first_name,last_name =new.last_name,middle_name=new.middle_name,
student_dob=new.student_dob,foreign_student=new.foreign_student,country_code=new.country_code,Last_Modified_date = now() ;


DROP TRIGGER IF  EXISTS trigger_before_update_studentInfo;

CREATE TRIGGER trigger_before_update_studentInfo
BEFORE UPDATE 
ON studentInfo FOR EACH ROW
Insert into studentDB.studentInfo_readData 
SET DML_Action = 'BeforeUpdate', 
student_id=old.student_id,first_name=old.first_name,last_name =old.last_name,middle_name=old.middle_name,
student_dob=old.student_dob,foreign_student=old.foreign_student,country_code=old.country_code,Last_Modified_date = now() ;

DROP TRIGGER IF  EXISTS trigger_after_update_studentInfo;

CREATE TRIGGER trigger_after_update_studentInfo
AFTER UPDATE 
ON studentInfo FOR EACH ROW
Insert into studentDB.studentInfo_readData 
SET DML_Action = 'AfterUpdate',
student_id=new.student_id,first_name=new.first_name,last_name =new.last_name,middle_name=new.middle_name,
student_dob=new.student_dob,foreign_student=new.foreign_student,country_code=new.country_code,Last_Modified_date = now() ;


delete from studentInfo;
delete from studentInfo_readData;

-- The following lines are for validating triggers - Inser a row to studentInfo and check the audit data avaialble in studentInfo_readData.
insert studentDB.studentInfo (student_id,first_name,last_name,student_dob) value(15001,'Kyla','Rhoads', ADDDATE('2022-01-01', INTERVAL -30 YEAR));

update studentDB.studentInfo set foreign_student = 'Yes_test' where student_id = 15001;
update studentDB.studentInfo set foreign_student = 'Yes' where student_id = 15001;
update studentDB.studentInfo set foreign_student = 'No' where student_id = 15001;
select * from studentInfo;
select * from studentInfo_readData;
