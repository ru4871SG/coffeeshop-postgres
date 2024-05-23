-- =======================================
-- INDEX
-- =======================================

-- This script is simple, it creates an index on the 'email' column of the 'customer' table
CREATE INDEX idx_customer_email ON customer(email);

-- To test the execution time difference, run the following statement before and after creating the index:
-- EXPLAIN ANALYZE
-- SELECT *
-- FROM customer
-- WHERE email = 'Victor@a.net';