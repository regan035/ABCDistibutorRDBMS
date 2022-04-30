
CREATE TABLE `courseInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  course_id	int8 not null,
  `course_name` varchar(80) DEFAULT NULL,
  course_fee decimal(8,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

insert studentDB.courseInfo (course_id,course_name) value(1,"Subject 1");
select * from studentDB.courseInfo;
delete  from studentDB.courseInfo where id = 4;

-- For dropping a table use the below statement (change the table name)
drop table studentDB.courseInfo;
