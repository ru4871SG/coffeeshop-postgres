-- =======================================
-- SUBQUERY
-- =======================================

-- This script utilizes subquery to find the total sales amount made by each staff member, 
-- by joining the sales_transaction and sales_detail tables on the transaction_id column and grouping by staff_id
SELECT s.staff_id,
    s.first_name,
    s.last_name,
    s.position,
    COALESCE(sales_by_staff.total_amount, 0.00) AS total_sales_amount
FROM 
    public.staff s
LEFT JOIN (
    SELECT st.staff_id, SUM(sd.price * sd.quantity) as total_amount
    FROM public.sales_transaction st
    JOIN public.sales_detail sd ON st.transaction_id = sd.transaction_id
    GROUP BY st.staff_id
) sales_by_staff ON s.staff_id = sales_by_staff.staff_id
ORDER BY total_sales_amount DESC
