/* 
1. Insert data to inventory, purchase_order and purchase_order_product
2. Write any 7 select statements and each select statement use at least 3 table joins. 
Each of these select statement you have to give a explaination of the purpose these SQL select statements.
3. If you have already crated your insert statements that is fine but that must be different from what is done in the class.alter
*/
INSERT INTO `abcdistributordb`.`inventory`
(`inv_sequence_id`,
`inv_product_id`,
`inv_vendor_product_id`,
`available_qty`,
`reorder_qty`)
VALUES
(<{inv_sequence_id: }>,
<{inv_product_id: }>,
<{inv_vendor_product_id: }>,
<{available_qty: }>,
<{reorder_qty: }>);


INSERT INTO `abcdistributordb`.`purchase_order`
(`po_id`,
`po_number`,
`po_total`,
`po_sales_tax`,
`po_vendor_id`)
VALUES
(<{po_id: }>,
<{po_number: }>,
<{po_total: }>,
<{po_sales_tax: }>,
<{po_vendor_id: }>);


INSERT INTO `abcdistributordb`.`purchase_order_product`
(`po_id_sequence`,
`po_id`,
`po_vendor_product_id`,
`po_product_price`,
`po_product_buy_uom_id`,
`po_quantity`)
VALUES
(<{po_id_sequence: }>,
<{po_id: }>,
<{po_vendor_product_id: }>,
<{po_product_price: }>,
<{po_product_buy_uom_id: }>,
<{po_quantity: }>);

