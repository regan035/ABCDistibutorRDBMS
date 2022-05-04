
DROP DATABASE IF EXISTS ABCDistributorDB;
CREATE DATABASE ABCDistributorDB;
USE ABCDistributorDB;

DROP TABLE IF EXISTS country;
CREATE TABLE country(
    country_id INT(11) AUTO_INCREMENT NOT NULL,
    country_name VARCHAR(50)NOT NULL,
    country_abbr VARCHAR(50)NOT NULL,
    PRIMARY KEY (country_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS state;
CREATE TABLE state(
    state_id INT(11) AUTO_INCREMENT NOT NULL,
    state_name VARCHAR(50)NOT NULL,
    state_abbr VARCHAR(50)NOT NULL,
    state_country_id INT(11)NOT NULL,
    PRIMARY KEY (state_id),
    FOREIGN KEY (state_country_id)REFERENCES country(country_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS city;
CREATE TABLE city(
    city_id INT(11) AUTO_INCREMENT NOT NULL,
    city_name VARCHAR (50) NOT NULL,
    city_state_id INT(11)NOT NULL,
    PRIMARY KEY (city_id),
    FOREIGN KEY (city_state_id)REFERENCES state(state_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS zip_code;
CREATE TABLE zip_code(
    zip_code_id INT(11) AUTO_INCREMENT NOT NULL,
    zip_code_num VARCHAR(11)NOT NULL,
    PRIMARY KEY (zip_code_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS address;
CREATE TABLE address(
    address_id INT(11) AUTO_INCREMENT NOT NULL,
    address_street VARCHAR(50)NOT NULL,
    address_city_id INT(11)NOT NULL,
    address_zip_code_id INT(11) NOT NULL,
    PRIMARY KEY (address_id),
    FOREIGN KEY (address_city_id)REFERENCES city(city_id),
    FOREIGN KEY (address_zip_code_id) REFERENCES zip_code(zip_code_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS contact;
CREATE TABLE contact(
    contact_id INT(11) AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(50)NOT NULL,
    last_name VARCHAR(50)NOT NULL,
    middle_name VARCHAR(50),
    orginazation_name VARCHAR(100),
    address_id INT(11),
    primary_phone VARCHAR(20),
    secondary_phone VARCHAR(20),
    fax VARCHAR(20),
    email VARCHAR(50),
    PRIMARY KEY (contact_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
    customer_id INT(11) AUTO_INCREMENT NOT NULL,
    customer_num VARCHAR(50)NOT NULL UNIQUE,
    customer_contact_id INT(11),
    PRIMARY KEY (customer_id),
    FOREIGN KEY (customer_contact_id) REFERENCES contact(contact_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS vendor;
CREATE TABLE vendor(
    vendor_id INT(11) AUTO_INCREMENT NOT NULL,
    vendor_num VARCHAR(50) NOT NULL UNIQUE,
    vendor_contact_id INT (11),
    PRIMARY KEY (vendor_id),
    FOREIGN KEY (vendor_contact_id) REFERENCES contact(contact_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS product_category;
CREATE TABLE product_category(
    product_category_id INT(11) NOT NULL,
    product_category_name VARCHAR(80) NOT NULL,
    PRIMARY KEY(product_category_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS unit;
CREATE TABLE unit(
    unit_id INT(11)NOT NULL,
    unit_name VARCHAR(80)NOT NULL,
    PRIMARY KEY (unit_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS product;
CREATE TABLE product(
    product_id INT(11) NOT NULL,
    product_sku VARCHAR(11)NOT NULL,
    product_name VARCHAR (80)NOT NULL,
    product_discription VARCHAR (80),
    product_category_id INT(11),
    product_unit_id INT(11),
    product_unit_price DECIMAL (10,2) NOT NULL,
    product_image_url_1 VARCHAR(100),
    PRIMARY KEY(product_id),
    FOREIGN KEY (product_category_id)REFERENCES product_category(product_category_id),
    FOREIGN KEY (product_unit_id)REFERENCES unit(unit_id)
        
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS vendor_product;
CREATE TABLE vendor_product(
    vendor_product_id INT(11)AUTO_INCREMENT NOT NULL,
    vendor_product_control_id INT(11),
    vendor_bulk_unit_id INT(11),
	vendor_bulk_price DECIMAL(10,2) NOT NULL,
    vendor_id INT(11)NOT NULL,
    PRIMARY KEY (vendor_product_id),
    FOREIGN KEY (vendor_product_control_id)REFERENCES product(product_id),
    FOREIGN KEY (vendor_bulk_unit_id)REFERENCES unit(unit_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor (vendor_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS purchase_order;
CREATE TABLE purchase_order(
    po_id INT(11) AUTO_INCREMENT NOT NULL,
    po_num VARCHAR(11)NOT NULL,
    po_puduct_id INT(11)NOT NULL,
    po_vendor_product_id INT(11) NOT NULL,
    po_qty DECIMAL(10,2)NOT NULL,
    po_discount DECIMAL(10.2),
    po_sales_tax DECIMAL(10,2)NOT NULL,
    po_total DECIMAL(10,2)NOT NULL,
	
    PRIMARY KEY(po_id),
    FOREIGN KEY (po_vendor_product_id)REFERENCES vendor_product(vendor_product_id),
    FOREIGN KEY (po_puduct_id)REFERENCES product(product_id)
    
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS inventory;
CREATE TABLE inventory(
    inv_id INT(11)AUTO_INCREMENT NOT NULL,
    -- inv_number VARCHAR(30) NOT NULL UNIQUE,
    inv_product_id INT(11) NOT NULL,
    storage_location VARCHAR(30)NOT NULL,
    oh_qty DECIMAL(10,1),
    reorder_qty DECIMAL(10,1),
    PRIMARY KEY(inv_id),
    FOREIGN KEY(inv_product_id)REFERENCES product(product_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS store_location;
CREATE TABLE store_location(
    store_id INT(11) NOT NULL UNIQUE,
    store_address_id INT(11),
    store_phone VARCHAR(11),
    PRIMARY KEY(store_id),
    FOREIGN KEY(store_address_id)REFERENCES address(address_id)
    
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS payment_received;
CREATE TABLE payment_received(
    payment_received_id INT (11)NOT NULL,
    payment_received VARCHAR(10),
    PRIMARY KEY(payment_received_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS account_transaction;
CREATE TABLE account_transaction(
    account_transaction_id INT(11),
    account_payment_mathod VARCHAR(50),
    account_payment_received_id INT(11),
    PRIMARY KEY(account_transaction_id),
    FOREIGN KEY(account_payment_received_id)REFERENCES payment_received(payment_received_id)
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS invoice;
CREATE TABLE invoice(
    invoice_id INT(11) NOT NULL,
    invoice_customer_id INT(11) NOT NULL,
    invoice_store_id INT(11) NOT NULL,
    invoice_po_id INT(11)NOT NULL,
    invoice_transaction_id INT(11) NOT NULL,
    PRIMARY KEY(invoice_id),
    FOREIGN KEY(invoice_customer_id)REFERENCES customer(customer_id),
    FOREIGN KEY(invoice_store_id)REFERENCES store_location(store_id),
    FOREIGN KEY(invoice_po_id)REFERENCES purchase_order(po_id),
    FOREIGN KEY(invoice_transaction_id)REFERENCES account_transaction(account_transaction_id)
    
    
) ENGINE = INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;





