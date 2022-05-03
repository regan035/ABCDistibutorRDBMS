use ABCDistributorDB;
select * from address;
desc address;

INSERT INTO abcdistributordb.address ( address_1, address_city_id, address_zip_code)
VALUES ('1900 ABC St.',(select city_id from city_list where city_name like '%Dallas City%'),75023);

INSERT INTO abcdistributordb.address ( address_1, address_city_id, address_zip_code)
VALUES ('2000 Preston Rd.',(select city_id from city_list where city_name like '%Plano%'),75023);

SET FOREIGN_KEY_CHECKS = 0;
SET SQL_SAFE_UPDATES = 0; -- SAFE MODE 0 is OFF and SAFE MODE 1 is ON 

update address set address_zip_code = 75251 where address_id = 2;
update address set address_zip_code = 75002,address_1 = '834 Cape Dr.',address_city_id=8159 where address_id = 3;

INSERT INTO abcdistributordb.address ( address_1, address_city_id, address_zip_code)
VALUES ('1900 ABC St.',5985,75023);

INSERT INTO abcdistributordb.address ( address_1, address_city_id, address_zip_code)
VALUES ('702 Central Expway.',(select city_id from city_list where city_name like '%Dallas City%'),75251);
