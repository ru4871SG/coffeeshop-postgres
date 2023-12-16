-- =======================================
-- CREATE WALLET TABLES
-- =======================================

-- This script creates two new wallet tables, customer_wallet and sales_outlet_wallet. 
-- These wallet tables will be utilized later to demonstrate stored procedures.

-- Table: customer_wallet
CREATE TABLE public.customer_wallet
(
    customer_wallet_id integer PRIMARY KEY,
    customer_id integer,
    balance numeric(15,2)
);

-- Table: sales_outlet_wallet
CREATE TABLE public.sales_outlet_wallet
(
    outlet_wallet_id integer PRIMARY KEY,
    sales_outlet_id integer,
    balance numeric(15,2)
);

-- Add relationship for customer_wallet table
ALTER TABLE public.customer_wallet
    ADD FOREIGN KEY (customer_id) 
    REFERENCES public.customer (customer_id)
    NOT VALID;

-- Add relationship for sales_outlet_wallet table
ALTER TABLE public.sales_outlet_wallet
    ADD FOREIGN KEY (sales_outlet_id) 
    REFERENCES public.sales_outlet (sales_outlet_id)
    NOT VALID;
