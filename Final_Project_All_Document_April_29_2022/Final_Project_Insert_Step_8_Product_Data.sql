use abcdistributordb;
-----------------------------------------------
-- Category
desc category;
select * from category;

INSERT INTO `abcdistributordb`.`category` (`category_name`, `category_status`) VALUES ('Home Funishing',1);
INSERT INTO `abcdistributordb`.`category` (`category_name`, `category_status`) VALUES ('Funiture',1);
INSERT INTO `abcdistributordb`.`category` (`category_name`, `category_status`) VALUES ('Plumbing',1);
INSERT INTO `abcdistributordb`.`category` (`category_name`, `category_status`) VALUES ('Electrical',1);

----------------------------------------------------
desc `abcdistributordb`.`unit_of_measure`;
select * from `abcdistributordb`.`unit_of_measure`;

INSERT INTO `abcdistributordb`.`unit_of_measure` (`uom_name`, `uom_status`) VALUES ('Pound',1);
INSERT INTO `abcdistributordb`.`unit_of_measure` (`uom_name`, `uom_status`) VALUES ('Ounce',1);
INSERT INTO `abcdistributordb`.`unit_of_measure` (`uom_name`, `uom_status`) VALUES ('Grams',1);
INSERT INTO `abcdistributordb`.`unit_of_measure` (`uom_name`, `uom_status`) VALUES ('Kilo',1);
INSERT INTO `abcdistributordb`.`unit_of_measure` (`uom_name`, `uom_status`) VALUES ('Each',1);
---------------------------------------------------
desc vendor_product;
select * from vendor_product;
delete from vendor_product where v_product_id = 5;

INSERT INTO `abcdistributordb`.`vendor_product`
(`v_product_name`, `v_product_description`, `v_product_status`, `v_product_buy_uom_id`, `v_product_buy_price`, `v_product_specification`,
`v_product_vendor_id`, `v_product_upc`, `v_product_gtin`, `v_product_main_image_url`,`v_product_main_image_url_1`, `v_product_main_image_url_2`)
VALUES ('Pipe 2"', 'Plastic Eco Friendly Pipe 2" diameter',1,5,12.99,'2 inch x 60 feet',1,0,1,
'http://myproduct.com/plumbing/pipe/pipe2inch_main.jpeg',
'http://myproduct.com/plumbing/pipe/pipe2inch_front.jpeg',
'http://myproduct.com/plumbing/pipe/pipe2inch_side.jpeg');

INSERT INTO `abcdistributordb`.`vendor_product`
(`v_product_name`, `v_product_description`, `v_product_status`, `v_product_buy_uom_id`, `v_product_buy_price`, `v_product_specification`,
`v_product_vendor_id`, `v_product_upc`, `v_product_gtin`, `v_product_main_image_url`,`v_product_main_image_url_1`, `v_product_main_image_url_2`)
VALUES ('Toilet Seat"', '16 Inch Toilet Seat with comfortable seating',1,5,28.50,'16 inch wide X 20 inch length',1,0,1,
'http://myproduct.com/plumbing/pipe/toilet16inchseat_main.jpeg',
'http://myproduct.com/plumbing/pipe/toilet16inchseat_front.jpeg',
'http://myproduct.com/plumbing/pipe/toilet16inchseat_side.jpeg');

INSERT INTO `abcdistributordb`.`vendor_product`
(`v_product_name`, `v_product_description`, `v_product_status`, `v_product_buy_uom_id`, `v_product_buy_price`, `v_product_specification`,
`v_product_vendor_id`, `v_product_upc`, `v_product_gtin`, `v_product_main_image_url`,`v_product_main_image_url_1`, `v_product_main_image_url_2`)
VALUES ('Toilet Seat Big"', '18 Inch Toilet Seat with comfortable seating',1,5,28.99,'18 inch wide X 22 inch length',1,0,1,
'http://myproduct.com/plumbing/pipe/toilet18inchseat_main.jpeg',
'http://myproduct.com/plumbing/pipe/toilet18inchseat_front.jpeg',
'http://myproduct.com/plumbing/pipe/toilet18inchseat_side.jpeg');


INSERT INTO `abcdistributordb`.`vendor_product`
(`v_product_name`, `v_product_description`, `v_product_status`, `v_product_buy_uom_id`, `v_product_buy_price`, `v_product_specification`,
`v_product_vendor_id`, `v_product_upc`, `v_product_gtin`, `v_product_main_image_url`,`v_product_main_image_url_1`, `v_product_main_image_url_2`)
VALUES ('Pipe 4"', 'Plastic Eco Friendly Pipe 4" diameter',1,5,14.99,'4 inch x 60 feet',1,0,1,
'http://myproduct.com/plumbing/pipe/pipe4inch_main.jpeg',
'http://myproduct.com/plumbing/pipe/pipe4inch_front.jpeg',
'http://myproduct.com/plumbing/pipe/pipe4inch_side.jpeg');

---------------------------------------------------

desc product;
select * from product;
INSERT INTO `abcdistributordb`.`product`
(`product_name`, `product_description`, `product_status`, `product_category_id`, `product_buy_uom_id`, `product_buy_price`,
`product_sell_uom_id`,`product_sell_price`, `product_ecomm_sell_price`, `product_specification`, `vendor_product_id`, `seasonal_flag`,
`product_rank`, `product_main_image_url`, `product_main_image_url_1`, `product_main_image_url_2`)
VALUES ('Pipe 2"', 'Plastic Eco Friendly Pipe 2" diameter',1,3,5,12.99,5,20.99,19.99,'2 inch x 60 feet',1,0,1,
'http://myproduct.com/plumbing/pipe/pipe2inch_main.jpeg',
'http://myproduct.com/plumbing/pipe/pipe2inch_front.jpeg',
'http://myproduct.com/plumbing/pipe/pipe2inch_side.jpeg');

update product set `product_name` = 'Pipe 4"', `product_description` = 'Plastic Eco Friendly Pipe 2" diameter', 
`product_buy_price`= 14.99, `product_sell_price` = 22.55, `product_ecomm_sell_price`=21.55, 
`product_specification` ='4 inch x 60 feet' , `vendor_product_id`=3
where product_id = 3;

INSERT INTO `abcdistributordb`.`product`
(`product_name`, `product_description`, `product_status`, `product_category_id`, `product_buy_uom_id`, `product_buy_price`,
`product_sell_uom_id`,`product_sell_price`, `product_ecomm_sell_price`, `product_specification`, `vendor_product_id`, `seasonal_flag`,
`product_rank`, `product_main_image_url`, `product_main_image_url_1`, `product_main_image_url_2`)
VALUES ('Toilet Seat"', '16 Inch Toilet Seat with comfortable seating',1,3,5,20.55,5,28.50,27.99,'16 inch wide X 20 inch length',1,0,1,
'http://myproduct.com/plumbing/pipe/toilet16inchseat_main.jpeg',
'http://myproduct.com/plumbing/pipe/toilet16inchseat_front.jpeg',
'http://myproduct.com/plumbing/pipe/toilet16inchseat_side.jpeg');

update product set `product_name` = 'Toilet Seat Big"', `product_description` = '18 Inch Toilet Seat with comfortable seating', 
`product_buy_price`= 28.99, `product_sell_price` = 35.55, `product_ecomm_sell_price`=34.55, 
`product_specification` ='18 inch x 22 Inch' , `vendor_product_id`=3
where product_id = 4;
select * from product;
select * from vendor_product;

---------------------------------------------------------
desc `abcdistributordb`.`country_product`;
select * from country_product;
INSERT INTO `abcdistributordb`.`country_product` (`c_product_id`,`c_country_id`, `c_product_status`) VALUES (2,226,1);
INSERT INTO `abcdistributordb`.`country_product` (`c_product_id`,`c_country_id`, `c_product_status`) VALUES (3,226,1);
INSERT INTO `abcdistributordb`.`country_product` (`c_product_id`,`c_country_id`, `c_product_status`) VALUES (4,226,1);
INSERT INTO `abcdistributordb`.`country_product` (`c_product_id`,`c_country_id`, `c_product_status`) VALUES (5,226,1);

