{{ config(
    materialized = 'table',
    schema = 'analytics'
) }}

WITH source_customer AS (
    SELECT 
        customer_id,
        customer_name,
        email,
        reg_date,
        card_number,
        date_of_birth,
        gender
    FROM {{ source('public', 'customer') }}
),

-- Extract domain from email
email_domain AS (
    SELECT 
        *,
        SPLIT_PART(email, '@', 2) AS email_domain
    FROM source_customer
),

-- Calculate customer age and other derived fields
customer_enriched AS (
    SELECT 
        *,
        -- Calculate age in years
        DATE_PART('year', CURRENT_DATE) - DATE_PART('year', date_of_birth) AS customer_age,
        -- Customer tenure in days - fixed calculation
        (CURRENT_DATE - reg_date) AS days_since_registration,
        -- Registration quarter
        'Q' || EXTRACT(QUARTER FROM reg_date) || '-' || EXTRACT(YEAR FROM reg_date) AS registration_quarter,
        -- Masked card number for security
        '****-****-****-' || RIGHT(card_number, 4) AS masked_card_number,
        -- Email provider type
        CASE 
            WHEN email_domain LIKE '%.gov' THEN 'Government'
            WHEN email_domain LIKE '%.edu' THEN 'Education'
            WHEN email_domain LIKE '%.com' THEN 'Commercial'
            WHEN email_domain LIKE '%.net' THEN 'Network'
            WHEN email_domain LIKE '%.org' THEN 'Organization'
            ELSE 'Other'
        END AS email_provider_type,
        -- First name extraction
        SPLIT_PART(customer_name, ' ', 1) AS first_name,
        -- Last name extraction
        SPLIT_PART(customer_name, ' ', 2) AS last_name
    FROM email_domain
)

SELECT
    customer_id,
    customer_name,
    first_name,
    last_name,
    email,
    email_domain,
    email_provider_type,
    reg_date,
    registration_quarter,
    days_since_registration,
    -- Days until anniversary calculation
    (DATE_PART('year', CURRENT_DATE) - DATE_PART('year', reg_date) + 1) * 365 - 
        (CURRENT_DATE - reg_date) AS days_until_anniversary,
    masked_card_number,
    date_of_birth,
    customer_age,
    gender,
    -- Customer segment based on age
    CASE 
        WHEN customer_age < 30 THEN 'Young'
        WHEN customer_age BETWEEN 30 AND 50 THEN 'Middle-aged'
        WHEN customer_age > 50 THEN 'Senior'
        ELSE 'Unknown'
    END AS age_segment,
    -- Customer loyalty tier based on registration date
    CASE 
        WHEN days_since_registration > 1825 THEN 'Platinum' -- More than 5 years
        WHEN days_since_registration > 1095 THEN 'Gold'     -- 3-5 years
        WHEN days_since_registration > 365 THEN 'Silver'    -- 1-3 years
        ELSE 'Bronze'                                      -- Less than 1 year
    END AS loyalty_tier,
    CURRENT_DATE AS data_as_of
FROM customer_enriched