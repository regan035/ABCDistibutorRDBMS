use abcdistributordb;
---------------------------------------------------
desc contact;
select * from contact;
alter table `abcdistributordb`.`contact` modify email_id varchar(70);

INSERT INTO `abcdistributordb`.`contact`
(`first_name`, `last_name`, `contact_address_id`, `mobile_phone`,`email_id`)
VALUES ('John','Smith', 1,'9722143384','john,smith@electricalvendor.com');

INSERT INTO `abcdistributordb`.`contact`
(`first_name`, `last_name`, `contact_address_id`, `mobile_phone`,`email_id`)
VALUES ('Agarwal','Patel', 1,'2142142133','agarwal.patel@electricalvendor.com');
-- -------------------------------------------------