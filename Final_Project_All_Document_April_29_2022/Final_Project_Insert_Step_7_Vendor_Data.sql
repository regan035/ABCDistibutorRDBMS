use abcdistributordb;
---------------------------------------------------
desc `abcdistributordb`.`vendor`;
select * from vendor;
INSERT INTO `abcdistributordb`.`vendor`
(`vendor_name`,`vendor_contact_id`, `vendor_address_id`, `main_phone`,  `web_site`)
VALUES ('Joe Electrical Supplier',1,4,'2145552000','www.joeelectrical.com');

INSERT INTO `abcdistributordb`.`vendor`
(`vendor_name`,`vendor_contact_id`, `vendor_address_id`, `main_phone`,  `web_site`)
VALUES ('Garuda Plumbing Supplier',1,4,'9726661000','www.garudaplumb.com');

---------------------------------------------------
