-- =======================================
-- ALTER DATA TYPES AND ADD PRIMARY KEYS
-- =======================================

ALTER TABLE public.customer
    ALTER COLUMN customer_id TYPE integer USING customer_id::integer,
    ALTER COLUMN customer_name TYPE character varying(50) USING customer_name::character varying(50),
    ALTER COLUMN email TYPE character varying(50) USING email::character varying(50),
    ALTER COLUMN reg_date TYPE date USING reg_date::date,
    ALTER COLUMN card_number TYPE character varying(15) USING card_number::character varying(15),
    ALTER COLUMN date_of_birth TYPE date USING date_of_birth::date,
    ALTER COLUMN gender TYPE character(1) USING gender::character(1),
    ADD PRIMARY KEY (customer_id);


ALTER TABLE public.product
    ALTER COLUMN product_id TYPE integer USING product_id::integer,
    ALTER COLUMN product_name TYPE character varying(100) USING product_name::character varying(100),
    ALTER COLUMN description TYPE character varying(250) USING description::character varying(250),
    ALTER COLUMN product_price TYPE numeric(15,2) USING product_price::numeric(15,2),
    ALTER COLUMN product_type_id TYPE integer USING product_type_id::integer,
    ADD PRIMARY KEY (product_id);


ALTER TABLE public.product_type
    ALTER COLUMN product_type_id TYPE integer USING product_type_id::integer,
    ALTER COLUMN product_type TYPE character varying(50) USING product_type::character varying(50),
    ALTER COLUMN product_category TYPE character varying(50) USING product_category::character varying(50),
    ADD PRIMARY KEY (product_type_id);


ALTER TABLE public.sales_detail
    ALTER COLUMN sales_detail_id TYPE integer USING sales_detail_id::integer,
    ALTER COLUMN transaction_id TYPE integer USING transaction_id::integer,
    ALTER COLUMN product_id TYPE integer USING product_id::integer,
    ALTER COLUMN quantity TYPE integer USING quantity::integer,
    ALTER COLUMN price TYPE numeric(15,2) USING price::numeric(15,2),
    ADD PRIMARY KEY (sales_detail_id);


ALTER TABLE public.sales_outlet
    ALTER COLUMN sales_outlet_id TYPE integer USING sales_outlet_id::integer,
    ALTER COLUMN sales_outlet_type TYPE character varying(20) USING sales_outlet_type::character varying(20),
    ALTER COLUMN address TYPE character varying(50) USING address::character varying(50),
    ALTER COLUMN city TYPE character varying(40) USING city::character varying(40),
    ALTER COLUMN telephone TYPE character varying(15) USING telephone::character varying(15),
    ALTER COLUMN postal_code TYPE integer USING postal_code::integer,
    ALTER COLUMN manager TYPE integer USING manager::integer,
    ADD PRIMARY KEY (sales_outlet_id);


ALTER TABLE public.sales_transaction
    ALTER COLUMN transaction_id TYPE integer USING transaction_id::integer,
    ALTER COLUMN transaction_date TYPE date USING transaction_date::date,
    ALTER COLUMN transaction_time TYPE time without time zone USING transaction_time::time without time zone,
    ALTER COLUMN sales_outlet_id TYPE integer USING sales_outlet_id::integer,
    ALTER COLUMN staff_id TYPE integer USING staff_id::integer,
    ALTER COLUMN customer_id TYPE integer USING customer_id::integer,
    ADD PRIMARY KEY (transaction_id);


ALTER TABLE public.staff
    ALTER COLUMN staff_id TYPE integer USING staff_id::integer,
    ALTER COLUMN first_name TYPE character varying(50) USING first_name::character varying(50),
    ALTER COLUMN last_name TYPE character varying(50) USING last_name::character varying(50),
    ALTER COLUMN position TYPE character varying(50) USING position::character varying(50),
    ALTER COLUMN start_date TYPE date USING start_date::date,
    ALTER COLUMN location TYPE character varying(5) USING location::character varying(5),
    ADD PRIMARY KEY (staff_id);
