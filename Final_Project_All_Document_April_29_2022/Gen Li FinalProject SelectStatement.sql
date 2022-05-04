-- 1. Search all vendors addresses and primary phone numbers located in Mexico
SELECT  
vendor.vendor_num,
contact.orginazation_name,
address.address_street,
city.city_name,
state.state_name,
country.country_name,
zip_code.zip_code_num,
contact.primary_phone
FROM vendor 
INNER JOIN contact
ON contact.contact_id = vendor.vendor_contact_id
INNER JOIN address
ON address.address_id = contact.address_id
INNER JOIN city
ON city.city_id = address.address_city_id
INNER JOIN state
ON state.state_id = city.city_state_id
INNER JOIN country
ON country.country_id = state.state_country_id
INNER JOIN zip_code
ON zip_code.zip_code_id = address.address_zip_code_id
WHERE
country.country_id = 3
;


-- Display all Non-Autoreorder inventories with product information
SELECT 
product.product_sku, 
product.product_name,
product.product_discription,
vendor_product.vendor_bulk_price,
unit.unit_name,
inventory.inv_storage_location,
inventory.inv_oh_qty,
inventory.inv_auto_reorder,
vendor.vendor_num
FROM product
INNER JOIN vendor_product
ON vendor_product.vendor_product_control_id = product.product_id
INNER JOIN unit
ON unit.unit_id = vendor_product.vendor_bulk_unit_id
INNER JOIN inventory
ON inventory.inv_product_id = vendor_product.vendor_product_id
INNER JOIN vendor
on vendor.vendor_id = vendor_product.vendor_id
WHERE inventory.inv_auto_reorder = 'NO'




