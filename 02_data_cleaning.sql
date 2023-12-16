-- =======================================
-- DATA CLEANING
-- =======================================

-- Table: customer
-- Fix email column where some rows have customer_name value before the email address (separated by a comma and a space)
UPDATE public.customer
SET email = regexp_replace(email, '.*?, ', '')
WHERE email LIKE '%, %';

-- Uncomment the following line to check the pattern of semi-colons in the email column
-- SELECT DISTINCT(email) FROM public.customer WHERE email LIKE '%;%';

-- After checking the pattern, it seems that many rows use semi-colons instead of period before the domain extension. Let's fix it
UPDATE public.customer
SET email = 
    substring(email from 1 for position('@' in email) - 1) ||
    replace(substring(email from position('@' in email)), ';', '.')
WHERE email LIKE '%@%;%';

-- Fix email column where some rows have period at the end of the email address
UPDATE public.customer
SET email = regexp_replace(email, '\.$', '')
WHERE email LIKE '%.';

-- Fix gender column, "Male" should be written as "M" and "Female" should be written as "F" for consistency
UPDATE public.customer
SET gender = CASE
    WHEN gender = 'Male' THEN 'M'
    WHEN gender = 'Female' THEN 'F'
    ELSE gender
END;


-- Table: staff
-- Fix last_name column where some rows mistakenly have the staff_id numbers
UPDATE public.staff
SET last_name = regexp_replace(last_name, '[0-9]', '', 'g');


-- Table: sales_transaction
-- The values in transaction_time are not correct, recent dates are included. Let's fix it
ALTER TABLE public.sales_transaction ADD COLUMN new_transaction_time time;

UPDATE public.sales_transaction 
SET new_transaction_time = CAST(TO_CHAR(transaction_time, 'HH24:MI:SS') AS time);

ALTER TABLE public.sales_transaction DROP COLUMN transaction_time;
ALTER TABLE public.sales_transaction RENAME COLUMN new_transaction_time TO transaction_time;
