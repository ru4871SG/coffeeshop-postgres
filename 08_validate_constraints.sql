-- =======================================
-- VALIDATE CONSTRAINTS
-- =======================================

-- Uncomment the following queries to check the constraint names
-- SELECT constraint_name
-- FROM information_schema.table_constraints
-- WHERE table_name = 'customer_wallet' AND constraint_type = 'FOREIGN KEY';

-- SELECT constraint_name
-- FROM information_schema.table_constraints
-- WHERE table_name = 'product' AND constraint_type = 'FOREIGN KEY';

-- SELECT constraint_name
-- FROM information_schema.table_constraints
-- WHERE table_name = 'sales_detail' AND constraint_type = 'FOREIGN KEY';

-- SELECT constraint_name
-- FROM information_schema.table_constraints
-- WHERE table_name = 'sales_outlet_wallet' AND constraint_type = 'FOREIGN KEY';

-- SELECT constraint_name
-- FROM information_schema.table_constraints
-- WHERE table_name = 'sales_transaction' AND constraint_type = 'FOREIGN KEY';


-- Validate constraints after checking the constraint names
ALTER TABLE public.customer_wallet
VALIDATE CONSTRAINT customer_wallet_customer_id_fkey;

ALTER TABLE public.product
VALIDATE CONSTRAINT product_product_type_id_fkey;

ALTER TABLE public.sales_detail
VALIDATE CONSTRAINT sales_detail_transaction_id_fkey;

ALTER TABLE public.sales_detail
VALIDATE CONSTRAINT sales_detail_product_id_fkey;

ALTER TABLE public.sales_outlet_wallet
VALIDATE CONSTRAINT sales_outlet_wallet_sales_outlet_id_fkey;

ALTER TABLE public.sales_transaction
VALIDATE CONSTRAINT sales_transaction_staff_id_fkey;

ALTER TABLE public.sales_transaction
VALIDATE CONSTRAINT sales_transaction_sales_outlet_id_fkey;

ALTER TABLE public.sales_transaction
VALIDATE CONSTRAINT sales_transaction_customer_id_fkey;
