-- =======================================
-- JOIN TABLES
-- =======================================

-- The tables product and product_description should be joined to minimize redundancy
CREATE TABLE public.new_product AS
SELECT 
    p.product_id,
    p.product_name,
    pd.description,
    p.product_price,
    p.product_type_id
FROM public.product AS p
JOIN public.product_description AS pd
    ON p.product_id = pd.product_id
ORDER BY p.product_id;

DROP TABLE public.product;
DROP TABLE public.product_description;

ALTER TABLE public.new_product RENAME TO product;
