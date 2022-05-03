use ABCDistributorDB;

select * from country_list;


select * from city_list where city_name like '%Allen%';

select * from city_list where city_name like '%Abbeville%';
select * from state_list where state_id in (1,11);
select city_name,city_state_id, count(*) from city_list group by city_name,city_state_id having count(*) > 1;

select * from city_list where city_name in (select city_name from city_list group by city_name having count(*) > 1) 
order by city_name, city_id;

select * from city_list where city_name in (select city_name from city_list group by city_name,city_state_id having count(*) > 1) 
order by city_name, city_id;


delete from city_list where city_id > 10000; 

select * from product;
select * from country_product;
select * from category;
select * from unit_of_measure;

select cl.name, p.* from product p 
inner join country_product cp on cp.c_product_id = p.product_id 
inner join country_list cl on cl.country_id = cp.country_product_id
inner join category c on p.product_category_id = c.category_id 
inner join unit_of_measure ub on ub.uom_id = p.product_buy_uom_id 
inner join unit_of_measure us on us.uom_id = p.product_sell_uom_id where p.product_id = 2; 

select cl.name,ub.uom_name,us.uom_name, p.* from product p 
inner join country_product cp on cp.c_product_id = p.product_id 
inner join country_list cl on cl.country_id = cp.c_country_id
inner join category c on p.product_category_id = c.category_id 
inner join unit_of_measure ub on ub.uom_id = p.product_buy_uom_id 
inner join unit_of_measure us on us.uom_id = p.product_sell_uom_id where p.product_id = 4; 

