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


-- 2.Display all Non-Autoreorder inventories with product information
SELECT 
product.product_sku, 
product.product_name,
product.product_discription,
product_category.product_category_name,
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
INNER JOIN product_category
ON product_category.product_category_id = product.product_category_id
INNER JOIN vendor
ON vendor.vendor_id = vendor_product.vendor_id
WHERE inventory.inv_auto_reorder = 'NO';

-- 3.Display all unpaid invoices
SELECT
invoice.invoice_num,
customer.customer_num,
contact.first_name,
contact.last_name,
purchase_order.po_num,
product.product_name,
product.product_sku,
product.product_unit_price,
purchase_order.po_qty,
purchase_order.po_discount,
purchase_order.po_sales_tax,
purchase_order.po_total,
account_transaction.account_payment_paid
FROM invoice
INNER JOIN purchase_order
ON purchase_order.po_id = invoice.invoice_po_id
INNER JOIN customer
ON customer.customer_id = invoice.invoice_customer_id
INNER JOIN contact
ON contact.contact_id = customer.customer_contact_id
INNER JOIN product
ON product.product_id = purchase_order.po_puduct_id
INNER JOIN account_transaction
ON account_transaction.account_transaction_id = invoice.invoice_transaction_id
WHERE account_transaction.account_payment_paid = '';

-- 4.List all stores locations
SELECT 
store_location.store_id,
address.address_street,
city.city_name,
state.state_name,
country.country_name,
zip_code.zip_code_num,
store_location.store_phone
FROM store_location
INNER JOIN address
ON address.address_id = store_location.store_address_id
INNER JOIN city
ON city.city_id = address.address_city_id
INNER JOIN state
ON state.state_id = city.city_state_id
INNER JOIN country
ON country.country_id = state.state_country_id
INNER JOIN zip_code
ON zip_code.zip_code_id = address.address_zip_code_id;

-- 5.List all customers located in the Califonioa USA.
SELECT
customer.customer_num,
contact.first_name,
contact.last_name,
contact.primary_phone,
contact.email,
address.address_street,
city.city_name,
state.state_name,
country.country_name,
zip_code.zip_code_num
FROM customer
INNER JOIN contact
ON contact.contact_id = customer.customer_contact_id
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
WHERE state.state_id = 001;

-- 6.List all grocery product stock status
SELECT
product.product_name,
product.product_sku,
product.product_discription,
inventory.inv_storage_location,
inventory.inv_oh_qty,
unit.unit_name,
vendor_product.vendor_bulk_price,
vendor.vendor_num,
contact.orginazation_name
FROM product
INNER JOIN vendor_product
ON vendor_product.vendor_product_control_id = product.product_id
INNER JOIN unit
ON unit.unit_id = vendor_product.vendor_bulk_unit_id
INNER JOIN inventory
ON inventory.inv_product_id = vendor_product.vendor_product_id
INNER JOIN vendor
ON vendor.vendor_id = vendor_product.vendor_id
INNER JOIN contact
ON contact.contact_id = vendor.vendor_contact_id
INNER JOIN product_category
ON product_category.product_category_id=product.product_category_id
WHERE product_category.product_category_name='Grocery';

-- 7.List the contact persons of all vendors on file order by vendor number
SELECT
vendor.vendor_num,
contact.first_name,
contact.last_name,
contact.orginazation_name,
contact.primary_phone,
contact.fax,
contact.email,
address.address_street,
city.city_name,
state.state_name,
country.country_name,
zip_code.zip_code_num
FROM contact
INNER JOIN vendor
ON vendor.vendor_contact_id = contact.contact_id
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
ORDER BY vendor_num


