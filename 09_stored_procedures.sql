-- =======================================
-- STORED PROCEDURES
-- =======================================

-- This is the first stored procedure to validate the inputs in the second stored procedure
CREATE OR REPLACE PROCEDURE public.validate_inputs(p_product_id integer, 
                                            p_customer_wallet_id integer, 
                                            p_outlet_wallet_id integer,
                                            p_staff_id integer)
LANGUAGE plpgsql
AS $$
DECLARE
    v_count integer;
BEGIN
    -- Check if product_id exists
    SELECT COUNT(*) INTO v_count FROM public.product WHERE product_id = p_product_id;
    IF v_count = 0 THEN
        RAISE EXCEPTION 'Product ID does not exist';
    END IF;

    -- Check if customer_wallet_id exists
    SELECT COUNT(*) INTO v_count FROM public.customer_wallet WHERE customer_wallet_id = p_customer_wallet_id;
    IF v_count = 0 THEN
        RAISE EXCEPTION 'Customer Wallet ID does not exist';
    END IF;

    -- Check if outlet_wallet_id exists
    SELECT COUNT(*) INTO v_count FROM public.sales_outlet_wallet WHERE outlet_wallet_id = p_outlet_wallet_id;
    IF v_count = 0 THEN
        RAISE EXCEPTION 'Outlet Wallet ID does not exist';
    END IF;

    -- Check if staff_id exists
    SELECT COUNT(*) INTO v_count FROM public.staff WHERE staff_id = p_staff_id;
    IF v_count = 0 THEN
        RAISE EXCEPTION 'Staff ID does not exist';
    END IF;
END;
$$;


-- This is the second stored procedure to process each new sale
-- This procedure requires the earlier validate_inputs procedure to be created first
CREATE OR REPLACE PROCEDURE public.process_sale(p_product_id integer, 
                                         p_quantity integer, 
                                         p_customer_wallet_id integer, 
                                         p_outlet_wallet_id integer,
                                         p_staff_id integer)
LANGUAGE plpgsql
AS $$
DECLARE
    v_product_price numeric(15,2);
    v_total_price numeric(15,2);
    v_new_transaction_id integer;
    v_new_sales_detail_id integer;
    v_customer_id integer;
    v_sales_outlet_id integer;
BEGIN
     -- Validate the inputs
    CALL validate_inputs(p_product_id, p_customer_wallet_id, p_outlet_wallet_id, p_staff_id);

    -- Fetch the product price for the given product_id
    SELECT p.product_price INTO v_product_price FROM public.product p WHERE p.product_id = p_product_id;

    -- Fetch the customer_id and sales_outlet_id
    SELECT c.customer_id INTO v_customer_id FROM public.customer_wallet c WHERE c.customer_wallet_id = p_customer_wallet_id;
    SELECT so.sales_outlet_id INTO v_sales_outlet_id FROM public.sales_outlet_wallet so WHERE so.outlet_wallet_id = p_outlet_wallet_id;

    -- Calculate the total price
    v_total_price := v_product_price * p_quantity;

    -- Check if the customer has sufficient balance to buy the product
    IF (SELECT c.balance FROM public.customer_wallet c WHERE c.customer_wallet_id = p_customer_wallet_id) < v_total_price THEN
        RAISE EXCEPTION 'Insufficient balance for the customer';
    END IF;

    -- Perform the transaction
    UPDATE public.customer_wallet
    SET balance = balance - v_total_price
    WHERE customer_wallet_id = p_customer_wallet_id;
    
    UPDATE public.sales_outlet_wallet
    SET balance = balance + v_total_price
    WHERE outlet_wallet_id = p_outlet_wallet_id;

    -- Insert a new transaction into sales_transaction
    SELECT MAX(transaction_id) + 1 INTO v_new_transaction_id FROM public.sales_transaction;
    INSERT INTO public.sales_transaction(transaction_id, transaction_date, transaction_time, sales_outlet_id, staff_id, customer_id)
    VALUES (v_new_transaction_id, CURRENT_DATE, CURRENT_TIME, v_sales_outlet_id, p_staff_id, v_customer_id);

    -- Insert a new sales detail into sales_detail
    SELECT MAX(sales_detail_id) + 1 INTO v_new_sales_detail_id FROM public.sales_detail;
    INSERT INTO public.sales_detail(sales_detail_id, transaction_id, product_id, quantity, price)
    VALUES (v_new_sales_detail_id, v_new_transaction_id, p_product_id, p_quantity, v_product_price);

-- Catch-all for any exceptions that are not explicitly handled
EXCEPTION
    WHEN OTHERS THEN
        RAISE;

END;
$$;

-- After you execute this script, you can test the stored procedures by using the following statement:
-- CALL public.process_sale(product_id, quantity, customer_wallet_id, outlet_wallet_id, staff_id);
-- note: replace the parameters with the existing numbers in the tables
